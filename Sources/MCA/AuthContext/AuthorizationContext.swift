//
//  AuthorizationData.swift
//  MobileClientAccessSDK
//
//  Created by Anton Aleksandrov on 4/10/16.
//
//

import Foundation
import SwiftyJSON

public class AuthorizationContext {
	
	public var deviceIdentity:DeviceIdentity{
		get {
			return DeviceIdentity(json: json["imf.device"])
		}
	}

	public var appIdentity:AppIdentity{
		get {
			return AppIdentity(json: json["imf.application"])
		}
	}

	public var userIdentity:UserIdentity?{
		get {
			return nil
		}
	}

	public var expirationDate: Double{
		get {
			return json["exp"].doubleValue
		}
	}

	public var issuer: String{
		get {
			return json["iss"].stringValue
		}
	}

	public var audience: String{
		get {
			return json["aud"].stringValue
		}
	}

	public var subject: String{
		get {
			return json["sub"].stringValue
		}
	}

	public var issuedAt: Double{
		get {
			return json["iat"].doubleValue
		}
	}

	internal let json:JSON
	
	private init(idTokenPayload: JSON){
		self.json = idTokenPayload
	}
	
	public static func from(jsonString jsonString:String) throws -> AuthorizationContext?{
		if let jsonData = jsonString.data(usingEncoding: NSUTF8StringEncoding, allowLossyConversion: false) {
			let json = JSON(data: jsonData)
			return AuthorizationContext(idTokenPayload: json)
		} else {
			throw MCAError.FailedParsingAuthContext
		}
	}

	internal static func from(idTokenPayload idTokenPayload: JSON) -> AuthorizationContext?{
		return AuthorizationContext(idTokenPayload: idTokenPayload)
	}
}