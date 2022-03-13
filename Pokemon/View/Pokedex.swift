//
//  Pokedex.swift
//  Pokemon
//
//  Created by Hugo Lopes on 27/12/2021.
//

import SwiftUI

struct Pokedex: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                Spacer()
                    HStack{Spacer()}
                    
                    
                    ScrollView{
                
                        ForEach(0..<VM.NumberOfPokemons){ index in
                            if VM.GetPokedex(Number: index).0 != ""{
                            Card(Number: index)
                            }
                            
                        }
                    }
                    Spacer()
                    Footer()
                }
            }.background(Image("BackGround2").resizable().scaledToFill())
            .edgesIgnoringSafeArea([.top,.bottom])
        }
    }
}





struct Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Pokedex()
    }
}
