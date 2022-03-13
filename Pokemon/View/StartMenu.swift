//
//  PressToStart.swift
//  Pokemon
//
//  Created by Bruno Rodrigues on 12/01/2022.
//

import SwiftUI

struct StartMenu: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        ZStack{
            VStack{
                NavigationView{
                    HStack{
                        NavigationLink(destination: ChooseInitial().navigationBarHidden(true)){
                            Image("Inicial")
                                .resizable().edgesIgnoringSafeArea([.top,.bottom])
                        }
                    }
                }
            }
        }
    }
}

struct PressToStart_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}

