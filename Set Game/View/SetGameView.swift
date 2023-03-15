//
//  SetGameView.swift
//  Set Game
//
//  Created by Roman on 2/21/23.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game : SetViewModel
    @State var cardsShown: Int = 12
    
    func dealThreeCards(){
        if cardsShown < 81{
            cardsShown += 3
        }
    }
    
    var body: some View {
       
        VStack(spacing: 0){
            
            Text("Set Game")
                .font(.largeTitle.bold())
                .padding(.vertical,30)
            Spacer()
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3 , cardsShown: self.cardsShown, content: { card in
                CardView(card: card)
                    .onTapGesture {
                        game.choose(card)
                    }
                
                
            })
            
            Spacer()
            HStack(){
                Button{
                    
                    game.restartGame()
                    
                }label: {
                    Image(sfSymbol: "play.circle")
                        .titleFont()
                }
                Spacer()
                Button{
                    dealThreeCards()
                }label: {
                    HStack(spacing: 0){
                        let remaining = 81 - cardsShown
                        
                        Text("3")
                        
                        .font(.footnote)
                        Image(sfSymbol: "square.and.arrow.up.on.square")
                            .titleFont()
                        
                    }
                    
                  
                    
                }
                
            }
            .padding()
            .padding(.horizontal, 20)
            
            
            
        }
        .padding()
        .ignoresSafeArea()
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        var game = SetViewModel()
        SetGameView(game: game)
    }
}
