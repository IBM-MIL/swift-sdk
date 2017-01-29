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

/** The detected anger, disgust, fear, joy, or sadness that is conveyed by the content. Emotion information can be returned for detected entities, keywords, or user-specified target phrases found in the text */
public struct EmotionResult: JSONDecodable,JSONEncodable {
    /// The returned emotion results across the document
    public let document: DocumentEmotionResults?
    /// The returned emotion results per specified target
    public let targets: [TargetedEmotionResults]?

    /**
     Initialize a `EmotionResult` with required member variables.

     - returns: An initialized `EmotionResult`.
    */
    public init() {
        self.document = nil
        self.targets = nil
    }

    /**
    Initialize a `EmotionResult` with all member variables.

     - parameter document: The returned emotion results across the document
     - parameter targets: The returned emotion results per specified target

    - returns: An initialized `EmotionResult`.
    */
    public init(document: DocumentEmotionResults, targets: [TargetedEmotionResults]) {
        self.document = document
        self.targets = targets
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `EmotionResult` model from JSON.
    public init(json: JSON) throws {
        document = try? json.decode(at: "document", type: DocumentEmotionResults.self)
        targets = try? json.decodedArray(at: "targets", type: TargetedEmotionResults.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `EmotionResult` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let document = document { json["document"] = document }
        if let targets = targets {
            json["targets"] = targets.map { targetsElem in targetsElem.toJSONObject() }
        }
        return json
    }
}
