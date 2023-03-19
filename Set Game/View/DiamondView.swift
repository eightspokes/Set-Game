//
//  DiamondShape.swift
//  Set Game
//
//  Created by Roman on 3/6/23.
//

import SwiftUI

struct Diamond: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to:CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY * 0.2))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY ))
        path.addLine(to: CGPoint(x:rect.midX, y: rect.maxY * 0.8))
        path.addLine(to: CGPoint(x:rect.minX, y: rect.midY))
        return path
    }
}

