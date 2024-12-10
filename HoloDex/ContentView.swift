//
//  ContentView.swift
//  HoloDex
//
//  Created by Nathan Stéphant on 21/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CardsView(viewModel: CardsViewModel(getCardsUseCase: DefaultGetCardsUseCase(cardsRepository: DefaultCardsRepository())))
    }
}

#Preview {
    ContentView()
}
