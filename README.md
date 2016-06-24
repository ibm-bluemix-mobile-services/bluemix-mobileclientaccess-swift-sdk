#Server side Swift SDK for Mobile Client Access Service

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg
[platform-url]: https://swift.org

## Known limitations

The SDK is still in development phase and should not be used for production. At this point digital signatures of access and identity tokens are not validated, which makes it easier to fake these tokens by a malicious party.

## Installation

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/ibm-bluemix-mobile-services/bms-mca-serversdk-swift.git", majorVersion: 0, minor: 3)
    ]
)
```

* 0.3.x releases were tested on OSX and Linux with DEVELOPMENT-SNAPSHOT-2016-06-06-a
* 0.2.x releases were tested on OSX and Linux with DEVELOPMENT-SNAPSHOT-2016-05-03-a

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

Copyright 2016 IBM Corp.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg
[platform-url]: https://swift.org
