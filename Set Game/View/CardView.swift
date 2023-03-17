//
//  CardView.swift
//  Set Game
//
//  Created by Roman on 2/21/23.
//

import SwiftUI

struct CardView: View {
    
    let card: SetModel.Card
    
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 10
        static let strokeBorderWidth: CGFloat = 3
        static let pictureScalingFactor: CGFloat = 0.7
        
    }
    let shape: RoundedRectangle = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
    var verticalScale: Float{
        let isOval = card.shape == SetModel.Shapes.oval
        if isOval == true{
            return 0.1
        }else{
            return 0.3
        }
        
    }
    var spacing: Float{
        let isOval = card.shape == SetModel.Shapes.oval
        if isOval == true{
            return 13
        }else{
            return -7
        }
    }
    var body: some View {
        let color = SetViewModel.interpretColor(colors: card.color)
        let numberOfshapes: Int = SetViewModel.interpretQuantity(quantity: card.quantity)

        GeometryReader{ geo in
            ZStack{
                shape
                    
                    .strokeBorder(lineWidth: DrawingConstants.strokeBorderWidth)
                    .foregroundColor(.black)
                    
                    
                    
                
                GeometryReader{ geo in
                    VStack(spacing: CGFloat(spacing)){
                        ForEach(0 ..< numberOfshapes ){_ in
                            cardShape()
                                .foregroundColor(color)
                                .frame(width: geo.size.width * 0.5,height: geo.height * CGFloat(verticalScale) ,alignment: .center)
                                
                        }
                    }
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                }
                if(card.isSelected){
                    Color.blue.opacity(0.2)
                        .cornerRadius(DrawingConstants.cornerRadius)
                }
                
                
                
            }
        }
    }
    @ViewBuilder
        private func cardShape() -> some View {
            switch card.shape {
            case .oval: fillShading(shape: Capsule())
                case .squiggly: fillShading(shape: Squiggly())
                case .diamond: fillShading(shape: Diamond())
            }
        }
    @ViewBuilder
       private func fillShading<setShape>(shape: setShape) -> some View where setShape: Shape {
           let color = SetViewModel.interpretColor(colors: card.color)
           switch card.shading {
           case .full: shape.solid(color: color)
           case .partial: shape.striped(color: color)
           case .transparent: shape.open(color: color)
           }
       }
      
   
}


extension Shape {
    func solid(color: Color) -> some View {
        self.fill().foregroundColor(color)
    }
    
    func open(color: Color) -> some View {
        ZStack{
            self.stroke(color, lineWidth: 3)
        }
    }

    func striped(color: Color) -> some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(0..<6, id: \.self) { number in
                    Spacer(minLength: 0)
                    color.frame(width: 2)
                }
            }.mask(self)
            self.stroke(color, lineWidth: 3)
        }
    }
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let card: SetModel.Card = SetModel.Card(id: 1, isMached: false, color: SetModel.Colors.green, shape: SetModel.Shapes.squiggly, shading: SetModel.Shadings.partial, quantity: SetModel.Quantities.three)
        CardView(card: card)
            
    }
}
