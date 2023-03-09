//
//  GeometryReaderUI.swift
//  Set Game
//
//  Created by Roman on 3/5/23.
//

import SwiftUI


struct OuterView: View {
    var body: some View{
        VStack{
            Text("top")
            InnerView()
                .background(.gree)
            Text("Bottom")
        }
        
    }
}
struct InnerView: View{
    var body: some View{
        HStack{
            Text("Left")
            GeometryReader{
                geo in
                
            }
            Text("Right")
        }
    }
}


struct GeometryReaderUI: View {
    

    
    
    var body: some View {
        VStack{
            GeometryReader { geo in
                
                Text("Hello world")
                    .frame(width: geo.size.width * 0.3)
                    .background(.red)
                
                
                
            }
            .background(.green)
            Text("More text")
                .background(.blue)
        }
        
    }
}

struct GeometryReaderUI_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderUI()
    }
}
