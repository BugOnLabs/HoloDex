//
//  CardDetailsView.swift
//  HoloDex
//
//  Created by Adrien PEREA on 24/11/2024.
//

import SwiftUI

struct CardDetailsView: View {
    
    @ObservedObject var viewModel = CardDetailsViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                    let screenWidth = geometry.size.width

                AsyncImage(url: URL(string: viewModel.cardDetailsAPIModel?.images?.large ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: screenWidth)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth)
                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth)
                                .foregroundColor(.red)
                        @unknown default:
                            EmptyView()
                        }
                    }
                Text("Name: " + (viewModel.cardDetailsAPIModel?.name ?? "Loading..."))
                Text("ID: " + (viewModel.cardDetailsAPIModel?.id ?? "Loading..."))
            }
        }
        .onAppear {
            viewModel.fetchCardDetails(cardId: "xy10-119", select: ["name", "id", "images"])
        }
        .padding()
    }
}

#Preview {
    CardDetailsView()
}
