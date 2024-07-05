//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mohammed Rokon Uddin on 7/5/24.
//

import SwiftUI

@main
struct LandmarksApp: App {

  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().barTintColor = UIColor.black
  }

  var body: some Scene {
    WindowGroup {
      HomeView()
    }
  }
}
