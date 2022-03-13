//
//  XpBar.swift
//  Pokemon
//
//  Created by hugo on 29/01/2022.
//

import SwiftUI

struct XpBar: View {
    var XP:CGFloat = 100
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 100, height: 20)
                .foregroundColor(Color.black.opacity(0.7))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: XP, height: 20)
        }
    }
}

struct XpBar_Previews: PreviewProvider {
    static var previews: some View {
        XpBar()
    }
}
