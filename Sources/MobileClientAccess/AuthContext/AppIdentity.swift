/*
* Copyright 2015 IBM Corp.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* http://www.apache.org/licenses/LICENSE-2.0
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

/// This class represents the base app identity class, with default methods and keys

import SwiftyJSON
public class AppIdentity{
	public var id:String {
		get {
			return json["id"].stringValue
		}
	}
	public var version:String {
		get {
			return json["version"].stringValue
		}
	}
	internal let json:JSON

	internal init(json:JSON) {
		self.json = json
	}
}
