import PackageDescription

let package = Package(
    name: "MobileClientAccess",
    dependencies:[
		.Package(url: "https://github.com/ibm-bluemix-mobile-services/bluemix-simple-logger-swift.git", majorVersion: 0, minor: 5),
		.Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 15)
	]
)
