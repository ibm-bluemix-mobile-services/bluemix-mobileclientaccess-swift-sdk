/*
*     Copyright 2015 IBM Corp.
*     Licensed under the Apache License, Version 2.0 (the "License");
*     you may not use this file except in compliance with the License.
*     You may obtain a copy of the License at
*     http://www.apache.org/licenses/LICENSE-2.0
*     Unless required by applicable law or agreed to in writing, software
*     distributed under the License is distributed on an "AS IS" BASIS,
*     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*     See the License for the specific language governing permissions and
*     limitations under the License.
*/

/// This class represents the base user identity class, with default methods and keys
import SwiftyJSON

public class UserIdentity {
	
	public let id: String?
	public let authBy: String?
	public let displayName: String?
	public let attributes: Dictionary<String, AnyObject?>?
	
	internal init(id: String, authBy: String, displayName: String, attributes: Dictionary<String, AnyObject?>?) {
		self.id = id
		self.authBy = authBy
		self.displayName = displayName
		self.attributes = attributes
	}
}