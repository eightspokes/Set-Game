//
//  SetViewModel.swift
//  Set Game
//
//  Created by Roman on 2/13/23.
//

import Foundation
import SwiftUI

class SetViewModel: ObservableObject{
    
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: SetModel.Card){
        model.choose(card)
    }
    
    public static func interpretColor(colors: SetModel.Colors) -> Color {
        switch colors {
            
        case SetModel.Colors.green:
            return Color.green
        case SetModel.Colors.red:
            return Color.red
        case SetModel.Colors.violet:
            return Color.purple
        
        }
    }
    
    public static func interpretQuantity(quantity: SetModel.Quantities) -> Int {
        switch quantity {
        case SetModel.Quantities.one:
            return 1
        case SetModel.Quantities.two:
            return 2
        case SetModel.Quantities.three:
            return 3
        
        }
    }
    
    public static func interpretShading(shading: SetModel.Shadings) -> Double {
        switch shading {
        case SetModel.Shadings.full:
            return 1
        case SetModel.Shadings.partial:
            return 0.3
        case SetModel.Shadings.transparent:
            return 0
        
        }
    }
    
    @Published private var model: SetModel = createSetGame()
    var cards: [SetModel.Card]{
        model.cards
    }

    private static func createSetGame() -> SetModel{
        return SetModel()
    }
}
