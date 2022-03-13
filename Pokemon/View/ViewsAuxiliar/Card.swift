//
//  Card.swift
//  Pokemon
//
//  Created by hugo on 03/02/2022.
//

import SwiftUI

struct Card: View {
    @EnvironmentObject var VM:PokemonVM
    var Number = 0
    
    var body: some View {
     HStack{
     Button(action:{
        VM.UpdatePokedex(Number: Number)
     }, label: {
        Image(VM.GetPokedex(Number: Number).0)
         Spacer()
         VStack{
            Text(VM.GetPokedex(Number: Number).0).font(.title).fontWeight(.black).foregroundColor(.white)
            Spacer()
            Text("LVL:\(VM.GetPokedex(Number: Number).1)").fontWeight(.black).foregroundColor(.black)
            Text("EXP:").fontWeight(.black).foregroundColor(.black)
            XpBar(XP: CGFloat((VM.GetPokedex(Number: Number).2 * 100) / VM.GetPokedex(Number: Number).1))
         }
     })
                    
     if Number != 0 {
      
        Button(action:{
            VM.PokemonEliminado(Number: Number)
        }, label: {
            Image("lixo").resizable().frame(width: 30.0, height: 30.0)
        })
        
     }
     Spacer()
     }.background(VM.GetPokedex(Number: Number).3)

    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
