//
//  Landmark.swift
//  Landmarks
//
//  Created by Mohammed Rokon Uddin on 7/5/24.
//

import Foundation

typealias Landmarks = [Landmark]

struct Landmark: Decodable, Identifiable {
  let id: Int
  let name: String
  let subtitle, imageName: String
}

extension Landmark {
  var imageURL: URL? {
    Bundle.main.url(forResource: imageName + "@2x", withExtension: "jpg")
  }
}

enum LandmaksResponse {
  case initial
  case success(Landmarks)
  case failure(String)
}

enum JSONError: Error {
  case urlNotFound
  case invalidCharacterFound
}

extension JSONError {
    var localizedDescription: String {
        switch self {
        case .urlNotFound: "Not a valid JSON path"
        case .invalidCharacterFound: "Could not decode the JSON file"
        }
    }
}
