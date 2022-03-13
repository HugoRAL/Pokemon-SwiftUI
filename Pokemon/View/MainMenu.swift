//
//  MainMenu.swift
//  Pokemon
//
//  Created by Hugo Lopes on 27/12/2021.
//

import SwiftUI

struct MainMenu: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
        ZStack{
        VStack{
            Spacer()
        HStack{
            NavigationLink(destination: Historico().navigationBarHidden(true)){
                Image("Historico").resizable()
                    .frame(width: 75.0, height: 75.0)
            }
            Spacer()
                    
            if VM.NumberOfPokemons > 1{
                NavigationLink(destination: ChoosePokemon_2P().navigationBarHidden(true)
                    .onAppear(perform: VM.InicioP2 )
                ,label: {
                    VStack{
                        Image("P2").resizable()
                            .frame(width: 75.0, height: 75.0)
                        Text("2P").fontWeight(.black)
                            .foregroundColor(Color.black)
                    }
                })
             }
         }
         Spacer()
         Text("A ser Pokémon usado :").font(.title).fontWeight(.black)
         VStack{
            Image(VM.GetPokemonForBattle().0)
            Text(VM.GetPokemonForBattle().0).fontWeight(.black)
                .foregroundColor(Color.black)
         }
         Spacer()
         Footer()
         }
         }.background(Image("BackGround2").resizable().scaledToFill())
        .edgesIgnoringSafeArea([.top,.bottom])
        }
    }
}
    


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
