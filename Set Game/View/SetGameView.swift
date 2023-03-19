//
//  SetGameView.swift
//  Set Game
//
//  Created by Roman on 2/21/23.
//
import SwiftUI


struct IsSetMessage : View{
    var message: String
    var color: Color
    var body: some View{
        Text(message)
            .font(.title).bold()
            .foregroundColor(color)
    }
}
struct SetGameView: View {
    @ObservedObject var game : SetViewModel
    @State var showSet = false
    @State var showNoSet = false
    private let delayTime: Float = 3
    
    var body: some View {
        
        
        VStack(spacing: 0){
            
            Text("Set Game")
                .font(.largeTitle.bold())
                .padding(.vertical,30)
            if showSet{
                IsSetMessage(message: "It is a Set!", color: .green)
            }
            if showNoSet{
                IsSetMessage(message: "It is NOT a Set!", color: .red)
            }
            Spacer()
            
            AspectVGrid(items: game.cardsInPlay, aspectRatio: 2/3, content: { card in
                CardView(card: card, showSet: showSet, showNoSet: showNoSet)
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
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
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
        let game = SetViewModel()
        SetGameView(game: game)
    }
}
