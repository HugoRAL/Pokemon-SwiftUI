//
//  ContentView.swift
//  Pokemon
//
//  Created by Developer on 10/12/2021.
//

import SwiftUI

struct ChooseInitial : View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
               
                    
                    HStack{Spacer()}
                        Text("Escolha o seu Pokémon").font(.title).fontWeight(.black)
                    
                    NavigationLink(destination: MainMenu().navigationBarHidden(true)
                        .onAppear(perform: {
                            VM.PokeAdd(nome: "Charmander", lvl: 1, exp: 0, attack: 1, attack1: 4, attack2: 0, attack3: 0, PodexNumber: 1)
                        }),label: {
                            VStack{
                                Image("Charmander")
                                Text("Charmander")
                                    .fontWeight(.black).foregroundColor(Color.black)
                            }
                        })
    
                    NavigationLink(destination: MainMenu().navigationBarHidden(true)
                        .onAppear(perform: {
                            VM.PokeAdd(nome: "Bulbasaur", lvl: 1, exp: 0, attack: 1, attack1: 6, attack2: 0, attack3: 0, PodexNumber: 0)
                        }),label: {
                            VStack{
                                Image("Bulbasaur")
                                Text("Bulbasaur")
                                    .fontWeight(.black).foregroundColor(Color.black)
                            }
                        })
    
                    NavigationLink(destination: MainMenu().navigationBarHidden(true)
                        .onAppear(perform: {
                            VM.PokeAdd(nome: "Squirtle", lvl: 1, exp: 0, attack: 1, attack1: 2, attack2: 0, attack3: 0, PodexNumber: 2)
                        }),label: {
                            VStack{
                                Image("Squirtle")
                                Text("Squirtle")
                                    .fontWeight(.black).foregroundColor(Color.black)
                            }
                        })
                    
                    Spacer()
                }.background(Image("BackGround").resizable())
                .edgesIgnoringSafeArea([.top,.bottom])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseInitial()
    }
}
