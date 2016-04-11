//
//  VaporServer.swift
//  MobileClientAccessSDK
//
//  Created by Anton Aleksandrov on 4/10/16.
//
//

import Foundation
import Vapor
import JSON

public class VaporServer {
	private let logger = Logger(forName:"VaporServer")

	public func start(onPort port:Int){
		logger.info("Staring on port " + String(port))
		let app = Application()
		
		app.middleware.removeLast()
		app.middleware.append(MCAVaporMiddleware(hash: app.hash))

		app.get("/public") { request in
			return "Hello from a public resource!"
		}
		
		app.get("/protected") { request in
			if let mcaAuthContext = request.session?["MCAAuthContext"]{
				print(mcaAuthContext)
			}
			
			return "Hello from a protected resource!"
		}

		app.start(port: port)
	}
}


