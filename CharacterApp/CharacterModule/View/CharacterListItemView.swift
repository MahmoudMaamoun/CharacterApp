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
    @State var charname:String = ""
    @State var imageURL:String = ""
    @State var type:String = ""
    
    let presenter:CharacterPresenterProtocol!
    let indexPath:IndexPath!
    //MARK:- BODY
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageURL), content: { image in
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
                Text(charname)
                    .font(.title2)
                .fontWeight(.heavy)
                
                Text(type)
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
    init( presenter: CharacterPresenterProtocol!,indexPath:IndexPath) {
        self.presenter = presenter
        self.indexPath = indexPath
        self.setupCell(presenter: self.presenter, indexPath: self.indexPath)
    }
    //MARK: - FUNCTIONS
  
    // Presenter Delegate Operation Call to get data from Seperated Data Layer
    func setupCell(presenter:CharacterPresenterProtocol,indexPath:IndexPath) {
       let dataModel = presenter.configureCell(indexPath: indexPath)
        charname = dataModel.name
        imageURL = dataModel.image
        type = dataModel.type
      
    }
    
    // That function is getting call back with row data from configure cell presenter method we just called above
//    func configureView(with viewModel:CharacterViewModel) {
//        charname = viewModel.name
//        imageURL = viewModel.image
//        type = viewModel.type
//    }
    
}

//#Preview {
//    let presenter = CharList_Presenter(view: CharacterListVC(), interactor: Interactor(), router: CharacterRouter())
//    CharacterListItemView( presenter: presenter)
//}
