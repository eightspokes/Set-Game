//
//  SetGameView.swift
//  Set Game
//
//  Created by Roman on 2/21/23.
//
import SwiftUI

struct ItsASet: View{
    var body: some View{
        Text("It's a set!!!")
            .font(.title).bold()
            .foregroundColor(.green)
    }
}
struct ItsNotASet: View{
    var body: some View{
        Text("It's NOT a set!!!")
            .font(.title).bold()
            .foregroundColor(.red)
    }
}
struct SetGameView: View {
    @ObservedObject var game : SetViewModel
    @State var showSet = false
    @State var showNoSet = false

    var body: some View {
        
       
        VStack(spacing: 0){
            
            Text("Set Game")
                .font(.largeTitle.bold())
                .padding(.vertical,30)
            if showSet{
                ItsASet()
            }
            if showNoSet{
                ItsNotASet()
            }
            Spacer()
            
            AspectVGrid(items: game.cardsInPlay, aspectRatio: 2/3, content: { card in
                CardView(card: card)
                    .onTapGesture {
                        
                        let isSet: Bool = game.choose(card)
                        print("Chosen Card Num \(game.cardsSelected)")
                        if(game.cardsSelected == 3  ){
                            if isSet{
                                print("It's a set")
                                showSet = true
                            }else{
                                showNoSet = true
                                print("It's not a set!")
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                game.replaceSetCards()
                                showSet = false
                                showNoSet = false
                            }
                            
                        }
                        
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
                    game.dealThreeCards()
                }label: {
                    HStack(spacing: 0){
                        
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
