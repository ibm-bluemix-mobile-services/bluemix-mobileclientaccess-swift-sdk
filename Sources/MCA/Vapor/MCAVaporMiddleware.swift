//
//  MCAVaporMiddleware.swift
//  MobileClientAccessSDK
//
//  Created by Anton Aleksandrov on 4/10/16.
//
//

import Foundation
import Vapor

public class MCAVaporMiddleware: Middleware {
	
    var driver: SessionDriver

	init(hash:Hash) {
		driver = MemorySessionDriver(hash:hash)
    }

	public func respond(to request: Request, chainingTo chain: Responder) throws -> Response {
		let headers = request.headers.headers
		let authHeaders = headers["Authorization"]
		let authHeader = authHeaders?[0]
		let authContext = try? MobileClientAccessSDK.sharedInstance.authorizationContext(from: authHeader)

		guard authContext != nil else {
			return Response(status: .unauthorized, text: MCAError.Unauthorized.rawValue)
		}
		
		var request = request
		if (request.session == nil){
			request.session = Session(driver: driver)
		}

		request.session?["MCAAuthContext"] = authContext?.json.rawString()
		return try chain.respond(to: request)
	}
}

