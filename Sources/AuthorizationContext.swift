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
	
	public let deviceIdentity:DeviceIdentity
	public let appIdentity:AppIdentity
	public let userIdentity:UserIdentity?
	public let expirationDate: Double
	public let issuer: String
	public let audience: String
	public let subject: String
	public let issuedAt: Double
	
	
	internal init(idToken: JSON){
		let jwtPayload = idToken["payload"]
		
		self.issuedAt = jwtPayload["iat"].doubleValue
		self.subject = jwtPayload["sub"].stringValue
		self.expirationDate = jwtPayload["exp"].doubleValue
		self.issuer = jwtPayload["iss"].stringValue
		self.audience = jwtPayload["aud"].stringValue

		self.deviceIdentity = DeviceIdentity(json: jwtPayload["imf.device"])
		self.appIdentity = AppIdentity(json: jwtPayload["imf.application"])
		self.userIdentity = nil
	}
}