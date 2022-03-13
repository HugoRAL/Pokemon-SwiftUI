//
//  ChoosePokemon_2P.swift
//  Pokemon
//
//  Created by hugo on 23/01/2022.
//

import SwiftUI

struct ChoosePokemon_2P: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                Spacer()
                    HStack{Spacer()}
                    Spacer()
                    ScrollView{
                        
                        if !VM.Player1Escolhido {
                            Text("Choose your pokemon P1")
                        }else{
                            Text("Choose your pokemon P2`")
                        }
                        ForEach(0..<VM.NumberOfPokemons){ index in
                            
                            if (index != VM.P1Pokemon && VM.Player1Escolhido  ){
                                Button(action:{
                                    VM.P2Pokemon = index
                                    VM.UpdatePokedex(Number: index)
                                }, label: {
                                    Image(VM.GetPokedex(Number: index).0)
                                    Spacer()
                                    
                                    VStack{
                        
                        Text(VM.GetPokedex(Number: index).0).font(.title).fontWeight(.black).foregroundColor(.white)
                        Spacer()
                        Text("LVL:\(VM.GetPokedex(Number: index).1)").fontWeight(.black).foregroundColor(.black)
                        Text("EXP:\(VM.GetPokedex(Number: index).2)").fontWeight(.black).foregroundColor(.black)
                        
                        }
                                    }).background(VM.GetPokedex(Number: index).3)
               
                            }else if (VM.Player1Escolhido  == false ){
                                Button(action:{
                                    VM.P1Pokemon = index
                                    VM.UpdatePokedex(Number: index)
                                }, label: {
                                    Image(VM.GetPokedex(Number: index).0)
                                    Spacer()
                                    
                    VStack{
                            
                        Text(VM.GetPokedex(Number: index).0).font(.title).fontWeight(.black).foregroundColor(.white)
                        Spacer()
                        Text("LVL:\(VM.GetPokedex(Number: index).1)").fontWeight(.black).foregroundColor(.black)
                        Text("EXP:\(VM.GetPokedex(Number: index).2)").fontWeight(.black).foregroundColor(.black)
                        
                        }
                                }).background(VM.GetPokedex(Number: index).3)
                            }
                            Spacer()
                        }
                    }
                    
                    if !VM.Player1Escolhido {
                        Button(action:{
                            VM.UpdatePokedex(Number: 0)
                            VM.Player1Escolhido = true
                            VM.P2Pokemon = 0
                        }, label: {
                            Text("Continue")
                        })
                    }else{
                
                        NavigationLink(destination:Battle_2P().navigationBarHidden(true).onAppear(perform:{VM.InicioBatalha2P()})
                        ,label: {
                            VStack{
                                Text("Continuar").fontWeight(.black)
                               .foregroundColor(Color.black)
                            }
                        })
                    }
                    Spacer()
                }
            }.background(Image("BackGround2").resizable().scaledToFill())
            .edgesIgnoringSafeArea([.top,.bottom])
        }
    }
}

struct ChoosePokemon_2P_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePokemon_2P()
    }
}
/*.onAppear(perform: {
VM.Player1=true
VM.UpdateEnemy(Number: VM.P2Pokemon)
VM.UpdatePokedex(Number: VM.P1Pokemon)
VM.BattleText = " "
}*/
