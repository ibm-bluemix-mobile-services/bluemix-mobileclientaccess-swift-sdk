//
//  MCAKituraMiddleware.swift
//  MobileClientAccessSDK
//
//  Created by Oded Betzalel on 03/05/2016.
//
//

import Foundation
import Kitura
import KituraNet
import Foundation
import Socket

public class MCAKituraMiddleware: RouterMiddleware {
    
//    var driver: SessionDriver
    
//    init(hash:Hash) {
//        driver = MemorySessionDriver(hash:hash)
//    }
    
    public func handle(request: RouterRequest, response: RouterResponse, next: () -> Void) {
        
        let headers =  request.headersAsArrays
        let authHeaders = headers["Authorization"]
        let authHeader = authHeaders?[0]
        let authContext = try? MobileClientAccessSDK.sharedInstance.authorizationContext(from: authHeader)
//        if false {
//            response.status(.OK)
//        } else {
             response.status(.UNAUTHORIZED)
//        }
//        guard authContext != nil else {
////            return RouterResponse(response: ServerResponse(socket:Socket()), router: self, request: ServerRequest(socket:Socket()))
//        return 
//        }
        
//        var request = request
//        if (request.session == nil){
//            request.session = Session(driver: driver)
//        }
//        
//        request.session?["MCAAuthContext"] = authContext?.json.rawString()
        next()
//        try chain.respond(to: request)

    }
}

