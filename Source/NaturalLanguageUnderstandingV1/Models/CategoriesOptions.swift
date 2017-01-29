/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import RestKit

public struct CategoriesOptions: JSONDecodable,JSONEncodable {
    public let dummy: Int?

    /**
     Initialize a `CategoriesOptions` with required member variables.

     - returns: An initialized `CategoriesOptions`.
    */
    public init() {
        self.dummy = nil
    }

    /**
    Initialize a `CategoriesOptions` with all member variables.

     - parameter dummy: 

    - returns: An initialized `CategoriesOptions`.
    */
    public init(dummy: Int) {
        self.dummy = dummy
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `CategoriesOptions` model from JSON.
    public init(json: JSON) throws {
        dummy = try? json.getInt(at: "dummy")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `CategoriesOptions` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let dummy = dummy { json["dummy"] = dummy }
        return json
    }
}
