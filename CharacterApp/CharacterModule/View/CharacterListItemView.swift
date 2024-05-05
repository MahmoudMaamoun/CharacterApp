//
//  CharacterListItemView.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import SwiftUI

struct CharacterListItemView: View {
    
    //MARK:- PROPERTIES
    @State private var isTapped:Bool = false
    @ObservedObject var charItem: CharacterObservableObject
    
    //MARK:- BODY
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: charItem.viewModel.image), content: { image in
                    image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80,height: 80)
                    .clipShape (
                        RoundedRectangle(cornerRadius: 20)
                    )
                
            }, placeholder: {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80,height: 80)
                
            })
                
            
            VStack(alignment: .leading) {
                Text(charItem.viewModel.name)
                    .font(.title2)
                .fontWeight(.heavy)
                
                Text(charItem.viewModel.type)
                    .font(.footnote)
                    .fontWeight(.light)
            }
            
            Spacer()
                
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius:25).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .fill(
                    isTapped ? Color.blue.secondary :  Color.pink.secondary)
                .padding(8)
        )
        .onTapGesture {
            isTapped.toggle()
        }
        
    }
    
    init(charItem:CharacterObservableObject) {
        self.charItem = charItem
    }
    

    
}

//#Preview {
//    let presenter = CharList_Presenter(view: CharacterListVC(), interactor: Interactor(), router: CharacterRouter())
//    CharacterListItemView( presenter: presenter)
//}
