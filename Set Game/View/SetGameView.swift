//
//  SetGameView.swift
//  Set Game
//
//  Created by Roman on 2/21/23.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game : SetViewModel
    var body: some View {
        
        VStack(spacing: 0){
            Text("Set Game")
                .font(.largeTitle.bold())
                .padding(.vertical,30)
                
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20){
                    ForEach(game.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                        
                    }
                }
            }
            
            HStack(){
                Button{
                    
                }label: {
                    Image(sfSymbol: "plus")
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(sfSymbol: "square.and.arrow.up.on.square")
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
