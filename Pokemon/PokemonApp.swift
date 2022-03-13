//
//  PokemonApp.swift
//  Pokemon
//
//  Created by Developer on 10/12/2021.
//

import SwiftUI

@main
struct PokemonApp: App {
    var body: some Scene {
        WindowGroup {
            StartMenu().environmentObject(PokemonVM())
        }
    }
}

