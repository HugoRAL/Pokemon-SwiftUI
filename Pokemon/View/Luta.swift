//
//  Luta.swift
//  Pokemon
//
//  Created by Bruno Rodrigues on 07/01/2022.
//

import SwiftUI

struct Luta: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                Spacer()
                    HStack{
                    Spacer()
                        
                        VStack{
                            Text(VM.GetInimigo().0)
                            Text("Vida : \(VM.GetInimigo().1)")
                            Image(VM.GetInimigo().0)
                        }
                    }
                    
                    Spacer()
                    HStack{
                        VStack{
                            Text(VM.GetPokemonForBattle().0)
                            Text("Vida : \(VM.GetPokemonForBattle().1 )")
                            Image(VM.GetPokemonForBattle().0)
                        }
                        Spacer()
                    }

                    HStack{
                        if VM.BattleText == " " {
                            VStack(spacing:10){
                                Button(action:{
                                    VM.round+=1
                                    VM.AttackButton(ButtonNumber: 5)
                                }, label: {
                                    Image("Pokebola2").resizable().frame(width: 30, height: 30)
                                })
                        
                                Button(action:{
                                    VM.round+=1
                                    VM.AttackButton(ButtonNumber: 6)
                                }, label: {
                                    Image("Run").resizable().frame(width: 30, height: 30)
                                })
                            }

                            VStack(spacing:10){
                                Button(action:{
                                    VM.round+=1
                                    VM.AttackButton(ButtonNumber: 0)
                                }, label: {
                                    Text(VM.GetPokemonForBattle().2)
                                        .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                        .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black, lineWidth: 2))
                                        .foregroundColor(.black)
                                })
                                
                                Button(action: {
                                    VM.round+=1
                                    VM.AttackButton(ButtonNumber: 1)
                                }, label: {
                                    Text(VM.GetPokemonForBattle().3)
                                        .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                        .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black, lineWidth: 2))
                                        .foregroundColor(.black)
                                })}.padding()
                            
                            VStack(spacing:10){
                                if VM.GetPokemonForBattle().4 != ""{
                                Button(action: {
                                    VM.round+=1
                                    VM.AttackButton(ButtonNumber: 2)
                                }, label: {
                                    Text(VM.GetPokemonForBattle().4)
                                        .frame(width: UIScreen.main.bounds.size.width*0.22, height: UIScreen.main.bounds.size.height*0.05)
                                        .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black, lineWidth: 2))
                                        .foregroundColor(.black)
                                })}
                                
                                if VM.GetPokemonForBattle().5 != ""{
                                Button(action: {
                                    VM.AttackButton(ButtonNumber: 3)
                                }, label: {
                                    Text(VM.GetPokemonForBattle().5)
                                        .frame(width: UIScreen.main.bounds.size.width*0.30, height: UIScreen.main.bounds.size.height*0.05)
                                        .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.black,  lineWidth: 2))
                                        .foregroundColor(.black)
                                })}}
                    
                                }else{
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

struct Luta_Previews: PreviewProvider {
    static var previews: some View {
        Luta()
    }
}
