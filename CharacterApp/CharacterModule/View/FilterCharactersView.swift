//
//  FilterCharactersView.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import SwiftUI
struct FilterOption:View {
    let text:String
    let isSelected:Bool
    let action:() -> Void
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle( isSelected ? Color.white:Color.secondary)
                .padding(12)
                .background(
                   RoundedRectangle(cornerRadius: 20)
                    .fill( isSelected ? Color.blue.secondary:Color.clear.secondary)
                    .stroke(isSelected ? Color.white.secondary:Color.gray.secondary,
                                lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
            
        })
    }
}
struct FilterCharactersView: View {
    
    @State var selectedOption:Status?
    var presenter:CharacterPresenterProtocol!
    
    var body: some View {
       
        HStack {
            FilterOption(text: "Alive", isSelected: selectedOption == .alive, action: {
                selectedOption =  selectedOption == .alive ? nil : .alive
                presenter.filterList(by: selectedOption)
            })
            .padding(.leading)
            
            FilterOption(text: "Dead", isSelected: selectedOption == .dead) {
                selectedOption = selectedOption == .dead ? nil : .dead
                presenter.filterList(by: selectedOption)
            }
            
            FilterOption(text: "Unknown", isSelected: selectedOption == .unknown) {
                selectedOption = selectedOption == .unknown ? nil : .unknown
                presenter.filterList(by: selectedOption)
            }
            Spacer()
        }
       
            
    }
}

#Preview {
    FilterCharactersView(selectedOption: .alive)
}
