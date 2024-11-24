//
//  CardDetailsView.swift
//  HoloDex
//
//  Created by Adrien PEREA on 24/11/2024.
//

import SwiftUI

struct CardDetailsView: View {
    
    @State var cardDetailsAPIModel: CardDetailsAPIModel? = nil
    let networkService: NetworkService = CardDetailsNetworkServiceImpl()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 10) {
                    let screenWidth = geometry.size.width
                    let imageHeight = screenWidth * 1.395

                    AsyncImage(url: URL(string: cardDetailsAPIModel?.images?.large ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: screenWidth, height: imageHeight)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth, height: imageHeight)
                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth, height: imageHeight)
                                .foregroundColor(.red)
                        @unknown default:
                            EmptyView()
                        }
                    }
                Text(cardDetailsAPIModel?.name ?? "Loading...")
            }
        }
        .onAppear {
            CardDetailsNetworkServiceImpl().fetchCardDetails(cardId: "mcd19-2", select: ["name", "id", "images"]) { result in
                switch result {
                case .success(let cardDetails):
                    self.cardDetailsAPIModel = cardDetails.cardDetailsAPIModel
                    print(cardDetailsAPIModel?.name ?? "No name")
                case .failure(let error):
                    print(error)
                }
            }
        }
        .padding()
    }
}

#Preview {
    CardDetailsView()
}
