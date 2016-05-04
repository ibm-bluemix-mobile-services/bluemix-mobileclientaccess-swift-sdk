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
import Kitura
import Foundation

public class MCAKituraMiddleware: RouterMiddleware {
	
	public init(){}

	public func handle(request: RouterRequest, response: RouterResponse, next: () -> Void) {
        
        let headers =  request.headersAsArrays
        let authHeaders = headers["Authorization"]
        let authHeader = authHeaders?[0]
		MobileClientAccessSDK.sharedInstance.authorizationContext(from: authHeader) { error, authContext in
			if error != nil{
				response.status(.UNAUTHORIZED)
				_ = try? response.end("Unauthorized")
			} else {
				request.userInfo["mcaAuthContext"] = authContext
				next()
			}
		}
    }
}

