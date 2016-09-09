/*
* Copyright 2015 IBM Corp.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* http://www.apache.org/licenses/LICENSE-2.0
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation
import SimpleLogger
import SwiftyJSON

public class MobileClientAccessSDK{
	private let logger = Logger(forName:"MobileClientAccess")
	private static let HEADER_AUTHORIZATION = "Authorization"
	private static let BEARER = "Bearer"

	public static let sharedInstance = MobileClientAccessSDK()

	private init(){}

	public func authorizationContext(from authorizationHeader:String?, completionHandler: (_ error: MobileClientAccessError?, _ authContext: AuthorizationContext?) -> Void) {
		logger.debug("authorizationContext:from:completionHandler:")

		guard authorizationHeader != nil else {
			logger.error(MCAErrorInternal.AuthorizationHeaderNotFound.rawValue)
			return completionHandler(MCAError.Unauthorized, nil)
		}

		let authHeaderComponents:[String]! = authorizationHeader?.components(separatedBy: " ")


		// authHeader format :: "Bearer accessToken idToken"
		guard (authHeaderComponents?.count == 3 || authHeaderComponents?.count == 2) && authHeaderComponents[0] == MobileClientAccessSDK.BEARER else {
			logger.error(MCAErrorInternal.InvalidAuthHeaderFormat.rawValue)
			return completionHandler(MCAError.Unauthorized, nil)
		}

		let accessToken:String! = authHeaderComponents[1]
		let idToken:String? = authHeaderComponents.count == 3 ? authHeaderComponents[2] : nil

		guard isAccessTokenValid(accessToken: accessToken) else {
			return completionHandler(MCAError.Unauthorized, nil)
		}
		
		if let idToken = idToken, let authContext = try? getAuthorizedIdentities(from: idToken){
			// idToken is present and successfully parsed
			return completionHandler(nil, authContext)
		} else if idToken == nil {
			// idToken is not present
			return completionHandler(nil, nil)
		} else {
			// idToken parsing failed
			return completionHandler(MCAError.Unauthorized, nil)
		}
	}

	private func isAccessTokenValid(accessToken:String) -> Bool{
		logger.debug("isAccessTokenValid:")

		if let jwt = try? parseToken(from: accessToken) {
			let jwtPayload = jwt["payload"]
			let jwtExpirationTimestamp = jwtPayload["exp"].doubleValue
			return jwtExpirationTimestamp > NSDate().timeIntervalSince1970
		} else {
			return false
		}
	}

	private func getAuthorizedIdentities(from idToken:String) throws -> AuthorizationContext{
		logger.debug("getAuthorizedIdentities:from:")

		if let jwt = try? parseToken(from: idToken) {
			return AuthorizationContext(idTokenPayload: jwt["payload"])
		} else {
			throw MCAError.Unauthorized
		}

	}

	private func parseToken(from tokenString:String) throws -> JSON {
		logger.debug("parseToken:from:")

		let accessTokenComponents = tokenString.components(separatedBy: ".")

		guard accessTokenComponents.count == 3 else {
			logger.error(MCAErrorInternal.InvalidAccessTokenFormat.rawValue)
			throw MCAErrorInternal.InvalidAccessTokenFormat
		}

		let jwtHeaderData = accessTokenComponents[0].base64decodedData()
		let jwtPayloadData = accessTokenComponents[1].base64decodedData()
		let jwtSignature = accessTokenComponents[2]

		guard jwtHeaderData != nil && jwtPayloadData != nil else {
			logger.error(MCAErrorInternal.InvalidAccessTokenFormat.rawValue)
			throw MCAErrorInternal.InvalidAccessTokenFormat
		}

		let jwtHeader = JSON(data: jwtHeaderData!)
		let jwtPayload = JSON(data: jwtPayloadData!)

		var json = JSON([:])
		json["header"] = jwtHeader
		json["payload"] = jwtPayload
		json["signature"] = JSON(jwtSignature)
		return json
	}
}
