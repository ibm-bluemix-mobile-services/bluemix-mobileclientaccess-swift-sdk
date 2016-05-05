#Server side Swift SDK for Mobile Client Access Service

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg
[platform-url]: https://swift.org

## Installation
```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/ibm-bluemix-mobile-services/bms-serversdk-swift-mca.git", majorVersion: 0, minor: 0)
    ]
)
```
0.0.x releases are tested on OSX and Linux with DEVELOPMENT-SNAPSHOT-2016-04-25-a

## Usage

```Swift
let authorizationHeader = // get the Authorization header from request

MobileClientAccessSDK.sharedInstance.authorizationContext(from: authorizationHeader) { (error, authContext) in
	if let error = error {
		print("An error has occured \(error.rawValue)")
	}
	else {
		let userIdentity = authContext.userIdentity
		let deviceIdentity = authContext.deviceIdentity
		let appIdentity = authContext.appIdentity
		
		print ("user id :: \(userIdentity?.id)")
		print ("device id :: \(deviceIdentity.id)")
		print ("appIdentity id :: \(appIdentity.id)")
	}
}
```

## License

This project is released under the Apache-2.0 license

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg
[platform-url]: https://swift.org
