//
//  Battle_2P.swift
//  Pokemon
//
//  Created by hugo on 28/01/2022.
//

import SwiftUI

struct Battle_2P: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
            NavigationView{
            ZStack{
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text(VM.GetInfo2P(Attack: false).0)
                        Text("Vida : \(VM.GetInfo2P(Attack: false).1)")
                        Image(VM.GetInfo2P(Attack: false).0)
                        }
                    }
                Spacer()
                HStack{
                    VStack{
                        Text(VM.GetInfo2P(Attack: true).0)
                        Text("Vida : \(VM.GetInfo2P(Attack: true).1)")
                        Image(VM.GetInfo2P(Attack: true).0)
                        }
                    Spacer()
                    }
                HStack{
                    if VM.FinishP2().0==false && VM.FinishP2().1==false {
                        VStack(spacing:10){
                            Button(action:{
                                VM.round+=1
                                VM.AttackP2(NumeroAttack: 0)
                            }, label: {
                                Text(VM.GetInfo2P(Attack: true).2)
                                    .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black, lineWidth: 2))
                                    .foregroundColor(.black)
                            })
                            Button(action: {
                                VM.round+=1
                                VM.AttackP2(NumeroAttack: 1)
                            }, label: {
                                Text(VM.GetInfo2P(Attack: true).3)
                                    .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black, lineWidth: 2))
                                    .foregroundColor(.black)
                            })}.padding()
                        
                        VStack(spacing:10){
                        if VM.GetPokemonForBattle().4 != ""{
                            Button(action: {
                                VM.round+=1
                                VM.AttackP2(NumeroAttack: 2)
                            }, label: {
                                Text(VM.GetInfo2P(Attack: true).4)
                                    .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black, lineWidth: 2))
                                    .foregroundColor(.black)
                            })}
                            
                        if VM.GetPokemonForBattle().5 != ""{
                            Button(action: {
                                VM.round+=1
                                VM.AttackP2(NumeroAttack: 0)
                            }, label: {
                                Text(VM.GetInfo2P(Attack: true).5)
                                    .frame(width: UIScreen.main.bounds.size.width*0.30, height: UIScreen.main.bounds.size.height*0.05)
                                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black, lineWidth: 2))
                                    .foregroundColor(.black)
                            })}}

                        }else if !VM.FinishP2().0 && VM.FinishP2().1{
                            Text("Player 1 Ganhou")
                            NavigationLink(destination: MainMenu() .navigationBarHidden(true)
                                           ,label: {
                                            Text("Continuar").fontWeight(.black)
                                                .foregroundColor(Color.black)
                                })
                            
                        }else if VM.FinishP2().0 && !VM.FinishP2().1{
                            Text("Player 2 Ganhou")
                            NavigationLink(destination: MainMenu() .navigationBarHidden(true)
                                           ,label: {
                                            Text("Continuar").fontWeight(.black)
                                                .foregroundColor(Color.black)
                            })
                        }
                    }
                    Spacer()
                }.background(Image("BackGroundBattle").resizable().scaledToFill())
                .edgesIgnoringSafeArea([.top,.bottom])
            }
        }
    }
}

struct Battle_2P_Previews: PreviewProvider {
    static var previews: some View {
        Battle_2P()
    }
}
