//
//  FilterCharactersView.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import SwiftUI

struct FilterCharactersView: View {
    var body: some View {
       
        HStack {
            Button(action: {}, label: {
                Text("Alive")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray.secondary,
                                    lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
            })
            .padding(.leading)
            
            Button(action: {}, label: {
                Text("Alive")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray.secondary,
                                    lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
            })
            
            Button(action: {}, label: {
                Text("Alive")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray.secondary,
                                    lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
            })
            Spacer()
        }
       
            
    }
}

#Preview {
    FilterCharactersView()
}
