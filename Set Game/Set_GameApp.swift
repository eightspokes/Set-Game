//
//  Set_GameApp.swift
//  Set Game
//
//  Created by Roman on 2/13/23.
//

import SwiftUI

@main
struct Set_GameApp: App {
    let game = SetViewModel()
    var body: some Scene {
        WindowGroup {
            SetGameView(game: game)
        }
    }
}
