//
//  Figth_2P.swift
//  Pokemon
//
//  Created by hugo on 24/01/2022.
//

import SwiftUI

struct Figth_2P: View {
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
                //------------------------------ Butoes
                HStack{
                    if VM.BattleText == " " {
                    VStack(spacing:10){
                        Button(action:{
                            VM.AttackP2(NumeroAttack: 0)
                        }, label: {
                            Text(VM.GetInfo2P(Attack: true).2)
                                .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                 .overlay(RoundedRectangle(cornerRadius: 1)
                                 .stroke(Color.black, lineWidth: 2))
                                .foregroundColor(.black)
                        })
                       /*Button(action: {
                            VM.round+=1
                            VM.Player1.toggle()
                        }, label: {
                            Text(VM.GetInfo2P(Attack: true).3)
                            .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                            .overlay(RoundedRectangle(cornerRadius: 1)
                            .stroke(Color.black, lineWidth: 2))
                            .foregroundColor(.black)
                        })
                    }.padding()
                    VStack(spacing:10){
                        if VM.GetInfo2P(Attack: true).4 != ""{
                            Button(action: {
                                VM.round+=1
                                VM.Player1.toggle()
                            }, label: {
                                Text(VM.GetInfo2P(Attack: true).4)
                                    .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                    .overlay(RoundedRectangle(cornerRadius: 1)
                                    .stroke(Color.black, lineWidth: 2))
                                    .foregroundColor(.black)
                            })}
                        if VM.GetInfo2P(Attack: true).5 != ""{
                                    Button(action: {
                                        VM.round+=1
                                        VM.Player1.toggle()
                                    }, label: {
                                        Text(VM.GetInfo2P(Attack: true).5)
                                            .frame(width: UIScreen.main.bounds.size.width*0.30, height: UIScreen.main.bounds.size.height*0.05)
                                            .overlay(RoundedRectangle(cornerRadius: 1)
                                            .stroke(Color.black, lineWidth: 2))
                                            .foregroundColor(.black)
                                    })}*/}
                        
                        } else {
                            Text(VM.BattleText)
                            NavigationLink(destination: MainMenu() .navigationBarHidden(true)
              
                               ,label: {
                                       Text("Continuar").fontWeight(.black)
                                           .foregroundColor(Color.black)
                            })
                        }
                    }
                    Spacer()
                }
                Spacer()
                }.background(Image("BackGroundBattle").resizable())
            .edgesIgnoringSafeArea([.top,.bottom])
                }
            }
}

struct Figth_2P_Previews: PreviewProvider {
    static var previews: some View {
        Figth_2P()
    }
}
