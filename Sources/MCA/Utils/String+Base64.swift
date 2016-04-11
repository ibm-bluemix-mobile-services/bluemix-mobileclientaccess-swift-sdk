//
//  String+Base64.swift
//  MobileClientAccessSDK
//
//  Created by Anton Aleksandrov on 4/10/16.
//
//

import Foundation

extension String{
	func base64decodedString() -> String?{
		if let data = self.base64decodedData(){
			return String(data: data, encoding:NSUTF8StringEncoding)
		} else {
			return nil;
		}
	}
	
	func base64decodedData() -> NSData? {
		let missing = self.characters.count % 4
		
		var ending = ""
		if missing > 0 {
			let amount = 4 - missing
			ending = String(repeating: Character("="), count: amount)
		}
		let base64 = self.replacingOccurrences(of: "-", with: "+", options: NSStringCompareOptions(rawValue:0), range: nil)
			.replacingOccurrences(of: "_", with: "/", options: NSStringCompareOptions(rawValue: 0), range: nil) + ending
		return NSData(base64EncodedString: base64, options: NSDataBase64DecodingOptions(rawValue: 0))
	}
}