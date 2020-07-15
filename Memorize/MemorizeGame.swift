//
//  ContentView.swift
//  Memorize
//
//  Created by Gustavo on 06/07/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import SwiftUI

struct MemorizeGame: View {
    @ObservedObject var gameView: EmojiMemory
    var body: some View {
        HStack {
            ForEach(gameView.cards) { card in
                CardView(card: card).onTapGesture {
                    self.gameView.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
        
        func body(for size: CGSize) -> some View {
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(self.card.content)
                } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: fontSize(for: size)))
        }
    
    // MARK: - Drawing Constants

    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
         min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeGame(gameView: EmojiMemory())
    }
}
