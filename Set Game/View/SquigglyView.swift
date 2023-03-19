//
//  FigureViews.swift
//  Set Game
//
//  Created by Roman on 2/21/23.
//

import SwiftUI
import PureSwiftUI

struct Squiggly: Shape{
    private let squigglyLayoutConfig = LayoutGuideConfig.grid(columns: 40, rows: 40)
    private typealias Curve = (p: CGPoint, cp1: CGPoint, cp2: CGPoint)
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let g = squigglyLayoutConfig.layout(in: rect)
        let p1 = g[0,20]
        let p2 = g[18,14]
        let p3 = g[37,11]
        let p4 = g[26,28]
        let p5 = g[18,25]
        let p6 = g[4,29]
        
        var curves = [Curve]()
        curves.append(
            Curve(p2, g[0,13], g[8,9])
        )
        curves.append(
            Curve(p3, g[25,17], g[33,14])
        )
        curves.append(
            Curve(p4, g[41,9], g[43,28])
        )
        curves.append(
            Curve(p5, g[22,28], g[18,25])
        )
        curves.append(
            Curve(p6, g[11,21], g[7,29])
        )
        curves.append(
            Curve(p1, g[1,29], g[0,24])
        )
        path.move(p1)
        for curve in curves{
            path.curve(curve.p, cp1: curve.cp1, cp2: curve.cp2, showControlPoints: false)
            
        }
        return path
        
    }
}

struct FigureViews_Previews: PreviewProvider {
    static var previews: some View {
        Squiggly()
    }
}
