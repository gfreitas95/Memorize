//
//  EmojiMemory.swift
//  Memorize
//
//  Created by Gustavo on 13/07/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
class EmojiMemory: ObservableObject {
    
    @Published private var game: MemoryGame<String> = EmojiMemory.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        
        let emojis: Array<String> = ["👻","🎃","🕷"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Acces to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        game.choose(card: card)
    }
}
