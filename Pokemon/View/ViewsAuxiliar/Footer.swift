//
//  Footer.swift
//  Pokemon
//
//  Created by hugo on 03/02/2022.
//

import SwiftUI

struct Footer: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        HStack{
            
            NavigationLink(destination: Luta().navigationBarHidden(true).onAppear(perform: VM.InicioBatalha)){
               Image("Luta").resizable()
                    .frame(width: 75.0, height: 75.0)
            }.padding([.bottom, .trailing])
                
            Spacer()
            
            NavigationLink(destination: MainMenu().navigationBarHidden(true)){
               Image("MainMenu").resizable()
                    .frame(width: 75.0, height: 75.0)
            }.padding([.bottom, .trailing])
            
            Spacer()
            
            NavigationLink(destination: Pokedex().navigationBarHidden(true).onAppear(perform: {VM.NumberOfPokemon()
             
                VM.Pokedex()
            }
            )){
               Image("PokeBola").resizable()
                    .frame(width: 75.0, height: 75.0)
            }.padding([.bottom, .trailing])
        }
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
