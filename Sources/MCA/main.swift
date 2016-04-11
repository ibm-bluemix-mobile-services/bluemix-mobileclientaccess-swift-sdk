import Foundation
import CFEnvironment

let appEnv = try CFEnvironment.getAppEnv()

VaporServer().start(onPort: appEnv.port)
