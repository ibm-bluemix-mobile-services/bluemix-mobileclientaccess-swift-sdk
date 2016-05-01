import PackageDescription

let package = Package(
    name: "MobileClientAccessSDK",
    dependencies:[
		.Package(url: "https://github.com/IBM-Swift/Swift-cfenv.git", majorVersion: 0),
		//.Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 5),
		.Package(url:"https://github.com/qutheory/vapor.git", majorVersion:0),
		.Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 0, minor:11)
    ]
)
