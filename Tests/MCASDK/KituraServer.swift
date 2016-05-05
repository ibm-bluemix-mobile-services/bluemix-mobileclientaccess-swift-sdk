//
//import Foundation
//import Kitura
//import KituraNet
//import KituraSys
//import SwiftyJSON
//@testable import MobileClientAccessSDK
//import SimpleLogger
//
//
//private let logger = Logger(forName:"KituraServer")
//private var router = Router()
//private var server:HttpServer?
//var users = ["oded" : "123", "rotem" : "321"]
//logger.info("Staring on port " + String(3001))
//router.all(middleware: [BodyParser(), MCAKituraMiddleware()])
//
//router.get("/protectedResource/:appId", handler: { (request, response, next) in
//    print("protected Resource")
//    response.status(.OK)
//    next()
//})
//
//router.post("/apps/:appId/customAuthRealm_1/startAuthorization", handler: { (request, response, next) in
//    var json:[String:AnyObject] = [String:String]()
//    json["status"] = "challenge"
//    json["challenge"] = ["message" : "wrong_credentials", "stateId" : "teststateid"]
//    response.status(.OK)
//    response.send(json: JSON(json))
//    next()
//});
//
//
//router.post("/apps/:appId/customAuthRealm_1/handleChallengeAnswer", handler: { (request, response, next) in
//    var responseJson:[String:AnyObject] = [:]
//    if case let ParsedBody.Json(JSON) = request.body! {
//        let userName = JSON["challengeAnswer"]["userName"].stringValue
//        let password = JSON["challengeAnswer"]["password"].stringValue
//        if users[userName] == password {
//            responseJson = ["status" : "success", "userIdentity" : ["userName": userName , "displayName" : userName]]
//        } else {
//            responseJson = ["status" : "challenge", "challenge" : ["message": "wrong_credentials"]]
//        }
//    }
//    response.status(.OK)
//    response.send(json: JSON(responseJson))
//    next()
//});
//
//server = HttpServer.listen(port: 3001, delegate: router)
//Server.run()
