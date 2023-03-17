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
    
    var cardsInPlay: [Card]
    var cardsInDeck: [Card]
    var chosenCards: [Card]
    init(){
        var cards = Array<Card>()
        cardsInPlay = Array<Card>()
        cardsInDeck = Array<Card>()
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
        cards.shuffle()
        
        for i in 0 ..< cards.count{
            if i < 12{
                cardsInPlay.append(cards[i])
            }else{
                cardsInDeck.append(cards[i])
            }
        }
        
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
  
    mutating func choose(_ card: Card) -> Bool {
        let indexInCards = index(of: card, arrayOfCards: cardsInPlay)
        let indexInChosenCards = index(of: card, arrayOfCards: chosenCards)
        if let indexInCards{
            // if we click on a selected card, deselect it if we have less than three cards
            if cardsInPlay[indexInCards].isSelected && chosenCards.count < 3{
                if let indexInChosenCards{
                    chosenCards.remove(at: indexInChosenCards)
                }
                cardsInPlay[indexInCards].isSelected = false
                // if we select a new card
            }else{
                if chosenCards.count < 3{
                    if indexInChosenCards == nil {
                        chosenCards.append(card)
                        cardsInPlay[indexInCards].isSelected = true
                    }
                }
            }
        }else{
            fatalError("Could not find the card")
        }
        // if we have exactly 3 cards, check if it's a set
        return isSet()
    }
    
    mutating func replaceSetCards(){
        if chosenCards.count == 3{
            if isSet(){
                for card in chosenCards{
                    let index = index(of: card, arrayOfCards: cardsInPlay)
                    if let index{
                        print("Removing card")
                        if cardsInDeck.count > 0 {
                            cardsInPlay[index] = cardsInDeck.removeLast()
                        }else{
                            cardsInPlay.remove(at: index)
                        }
                    }
                }
            }
        }
        print("Deselecting chosen cards ")
        deselectChosenCards()
        chosenCards.removeAll()
    }
    
    
    mutating func dealThreeCars(){
        if(cardsInDeck.count >= 3){
            for i in 0...2 {
                cardsInPlay.append(cardsInDeck[i])
                cardsInDeck.remove(at: i)
            }
        }
    }
    
    
    mutating func  deselectChosenCards(){
        for i in 0 ..< chosenCards.count{
            let indexInCards = index(of: chosenCards[i], arrayOfCards: cardsInPlay)
            if let indexInCards{
                cardsInPlay[indexInCards].isSelected = false
            }
            
        }
    }
    
    private func isSet() -> Bool{
        if chosenCards.count < 3{
            return false
        }
        var colorMatch = 1
        var shapeMatch = 1
        var shadingMatch = 1
        var numberMatch = 1
        
        let cardColor = chosenCards[0].color
        let cardShape = chosenCards[0].shape
        let cardShading = chosenCards[0].shading
        let cardNumer = chosenCards[0].quantity
        //Check color
        for i in 1...2{
            if chosenCards[i].color == cardColor{
                colorMatch += 1
            }
            if chosenCards[i].shape == cardShape{
                shapeMatch += 1
            }
            if chosenCards[i].shading == cardShading{
                shadingMatch += 1
            }
            if chosenCards[i].quantity == cardNumer{
                numberMatch += 1
            }
        }
        
        if  colorMatch == 2  || shapeMatch == 2 || shadingMatch == 2 || numberMatch == 2 {
            return false
        }else{
            return true
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
