import PackageDescription

let package = Package(
    name: "MobileClientAccessSDK",
    dependencies:[
		.Package(url: "https://github.com/IBM-Swift/Swift-cfenv.git", majorVersion: 0),
//		.Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 0, minor:13),
		.Package(url: "https://github.com/ibm-bluemix-mobile-services/bluemix-simple-logger-swift.git", majorVersion: 0, minor: 2)
]
)
