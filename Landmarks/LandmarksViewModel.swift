//
//  LandmarksViewModel.swift
//  Landmarks
//
//  Created by Mohammed Rokon Uddin on 7/5/24.
//

import Foundation

@Observable
class LandmarksViewModel {
  private let client = LandmarksClient()
  var landmarksResponse: LandmaksResponse = .initial

  func fetchLandmarks() {
    do {
      let landmarks = try client.fetchLandmarks()
      landmarksResponse = .success(landmarks)
    } catch let error as JSONError {
        landmarksResponse = .failure(error.localizedDescription)
    } catch let error {
      landmarksResponse = .failure(error.localizedDescription)
    }
  }
}
