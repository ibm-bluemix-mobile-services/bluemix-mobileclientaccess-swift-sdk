import Foundation
import CFEnvironment

let appEnv = try CFEnvironment.getAppEnv()
KituraServer().start(onPort: appEnv.port)