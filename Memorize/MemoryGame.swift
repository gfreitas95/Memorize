//
//  MemoryGame.swift
//  Memorize
//
//  Created by Gustavo on 13/07/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import SwiftUI

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card choosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(content: content, id: pairIndex * 2))
            cards.append(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
