//
//  HomeView.swift
//  Landmarks
//
//  Created by Mohammed Rokon Uddin on 7/5/24.
//

import SwiftUI

struct HomeView: View {

  private let model = LandmarksViewModel()

  var body: some View {
    NavigationStack {
      switch model.landmarksResponse {
      case .initial: ProgressView()
      case .success(let landmarks): LandmaksListView(landmarks: landmarks)
      case .failure(let error): ErrorView(error: error)
      }
    }
    .onAppear {
      model.fetchLandmarks()
    }
  }
}

#Preview {
  HomeView()
}

private struct LandmaksListView: View {
  let landmarks: Landmarks
  var columns: [GridItem] = [
    GridItem(.adaptive(minimum: 128))
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: self.columns) {
        ForEach(landmarks) { landmark in
          LandmarkGridItem(item: landmark)
        }
      }
    }
    .scrollIndicators(.hidden)
    .background(.black)
    .navigationTitle("Landmaks")
    .foregroundColor(.indigo)
  }
}

private struct ErrorView: View {
  let error: String

  var body: some View {
    ContentUnavailableView(
      "Error",
      systemImage: "exclamationmark.circle",
      description: Text(error)
    )
  }
}

private struct LandmarkGridItem: View {
  let item: Landmark

  var body: some View {
    ZStack(alignment: .bottom) {
      AsyncImage(
        url: item.imageURL
      ) { image in
        image
          .resizable()
          .scaledToFit()
      } placeholder: {
        ProgressView()
      }
      CaptionView()
    }
  }
}

extension LandmarkGridItem {

  private func CaptionView() -> some View {
    return VStack(alignment: .leading) {
      HStack {
        Text(item.name)
          .foregroundStyle(.white)
        Spacer()
      }
      .padding(.leading, 8)

      HStack {
        Text("\(item.subtitle)")
          .minimumScaleFactor(0.5)
          .lineLimit(2)
          .font(.subheadline)
          .foregroundStyle(.gray)
        Spacer()
      }
      .padding([.leading, .trailing], 8)
    }
    .frame(maxWidth: .infinity, maxHeight: 64)
    .background(
      LinearGradient(
        gradient: Gradient(colors: [.black.opacity(0.4), .black]),
        startPoint: .top, endPoint: .bottom)
    )
  }
}
