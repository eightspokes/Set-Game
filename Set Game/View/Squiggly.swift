//
//  Squiggly.swift
//  Set Game
//
//  Created by Roman on 2/15/23.
//

import SwiftUI
import PureSwiftUI
struct SquigglyView: View {
    var body: some View {
        VStack(spacing: 50){
            ZStack{
                Image("squiggly")
                    .resizedToFit()
            }
        }
    }
}

struct Squiggly_Previews: PreviewProvider {
    static var previews: some View {
        SquigglyView()
    }
}
