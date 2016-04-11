//
//  MCAError.swift
//  MobileClientAccessSDK
//
//  Created by Anton Aleksandrov on 4/10/16.
//
//

import Foundation

public enum MCAError: String, ErrorProtocol{
	case Unauthorized = "Unauthorized"
	case FailedParsingAuthContext = "Failed to parse authorization context"
}

internal enum MCAErrorInternal: String, ErrorProtocol {
	case AuthorizationHeaderNotFound = "Authorization header not found"
	case InvalidAuthHeaderFormat = "Invalid authorization header format. Expected format 'Bearer accessToken idToken'"
	case InvalidAccessToken = "Invalid access token"
	case InvalidAccessTokenFormat = "Invalid access token format"
}