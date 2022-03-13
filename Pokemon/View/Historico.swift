//
//  Historico.swift
//  Pokemon
//
//  Created by hugo on 28/01/2022.
//

import SwiftUI

struct Historico: View {
    @EnvironmentObject var VM:PokemonVM
    var Number = 0
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                Spacer()
                    HStack{Spacer()
                    }
                    Spacer()
                    ScrollView{
                        ForEach(0..<VM.NumberOfBattles()){ index in
                            HStack{
                                Image(VM.GetHistorico(Number: VM.NumberOfBattles()-index-1).0)
                                Spacer()
                                    Text("VS")
                                Spacer()
                                Image(VM.GetHistorico(Number: VM.NumberOfBattles()-index-1).1)
                            }.background(VM.GetHistorico(Number: VM.NumberOfBattles()-index-1).2)
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

struct Historico_Previews: PreviewProvider {
    static var previews: some View {
        Historico()
    }
}
