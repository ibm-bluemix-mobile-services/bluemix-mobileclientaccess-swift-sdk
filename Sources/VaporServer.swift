//
//  VaporServer.swift
//  MobileClientAccessSDK
//
//  Created by Anton Aleksandrov on 4/10/16.
//
//

import Foundation
import Vapor

public class VaporServer {
	private let logger = Logger(forName:"VaporServer")

	public func start(){
		logger.info("Starting")
		let app = Application()

		app.middleware.append(MCAVaporMiddleware())

		app.get("/public") { request in
			return "Hello from a public resource!"
		}
		app.get("/protected") { request in
			return "Hello from a protected resource!"
		}

		let environmentVars = NSProcessInfo.processInfo().environment
		let portString: String = environmentVars["PORT"] ?? environmentVars["CF_INSTANCE_PORT"] ?? environmentVars["VCAP_APP_PORT"] ?? "8090";

		logger.info("Staring on port " + portString)
		app.start(port: Int(portString))
	}
}
