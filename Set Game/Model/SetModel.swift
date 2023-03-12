//
//  SetModel.swift
//  Set Game
//
//  Created by Roman on 2/13/23.
//

import Foundation



struct SetModel{
    
    enum Shapes: CaseIterable{
        case oval, squiggly, diamond
    }
    enum Colors: CaseIterable{
        case red, violet, green
    }
    enum Shadings: CaseIterable{
        case full, partial, transparent
    }
    enum Quantities: CaseIterable {
        case one, two, three
    }

    private (set) var cards: [Card]
    
    init(){
        cards = Array<Card>()
        var id = 1
        for color in SetModel.Colors.allCases{
            for shape in SetModel.Shapes.allCases{
                for shading in SetModel.Shadings.allCases{
                    for quantity in SetModel.Quantities.allCases{
                        cards.append(Card(id: id, isMached: false, color: color, shape: shape, shading: shading, quantity: quantity))
                        id += 1
                    }
                }
            }
        }
        //cards.shuffle()
    }
    
    
    struct Card: Identifiable, Hashable{
        let id: Int
        var isMached: Bool
        var isSelected: Bool = false
        let color: Colors
        let shape: Shapes
        let shading: Shadings
        let quantity: Quantities
        
        
    }
    
    func getCards() -> [Card]{
        return cards
    }
    
    
    mutating func choose(_ card: Card){
        let index = index(of: card)
        if let index{
            cards[index].isSelected.toggle()
        } else{
            fatalError("Could not find the card")
        }
        
        
        
        print("Card: \(card)")
        print()
       
    }
    func index(of card : Card) -> Int? {
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil // !bogus
    }
    
    
}
