//
//  ContentView.swift
//  HoloDex
//
//  Created by Nathan Stéphant on 21/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardDetails: CardDetailsAPIResponse? = nil
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cardDetails?.cardDetailsAPIModel?.images?.large ?? "")) { image in
                image.image?.resizable()
            }
            Text(cardDetails?.cardDetailsAPIModel?.name ?? "Loading...")
        }
        .onAppear {
            CardDetailsNetworkServiceImpl().fetchCardDetails(cardId: "mcd19-2", select: ["name", "id", "images"]) { result in
                switch result {
                case .success(let cardDetails):
                    self.cardDetails = cardDetails
                    print(cardDetails)
                case .failure(let error):
                    print(error)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
