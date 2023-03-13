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
    private var chosenCards: [Card]
    
    init(){
        cards = Array<Card>()
        chosenCards = Array<Card>()
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
        let indexInCards = index(of: card, arrayOfCards: cards)
        let indexInChosenCards = index(of: card, arrayOfCards: chosenCards)
        if let indexInCards{
                    
            if cards[indexInCards].isSelected && chosenCards.count < 3{
                if let indexInChosenCards{
                    chosenCards.remove(at: indexInChosenCards)
                }
                cards[indexInCards].isSelected = false
            }else{
                if chosenCards.count < 3{
                    if indexInChosenCards == nil {
                        chosenCards.append(card)
                        cards[indexInCards].isSelected = true
                        print("true")
                    }
                }
            }
        }else{
            fatalError("Could not find the card")
        }
        
        
       
       
    }
    func index(of card : Card, arrayOfCards: [Card]) -> Int? {
        for index in 0..<arrayOfCards.count{
            if arrayOfCards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    
}
