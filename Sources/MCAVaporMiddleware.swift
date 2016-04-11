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
	public func respond(request: Request, chain: Responder) throws -> Response {

		let headers = request.headers.headers
		let authHeaders = headers["Authorization"]
		let authHeader = authHeaders?[0]
		let authContext = try? MobileClientAccessSDK.sharedInstance.authorizationContext(from: authHeader)

		guard authContext != nil else {
			return Response(status: .unauthorized, text: MCAError.Unauthorized.rawValue)
		}

		let chainResponse = try? chain.respond(request)

		if let chainResponse = chainResponse{
			return chainResponse
		} else {
			return Response(status: .serviceUnavailable)
		}
	}
}
