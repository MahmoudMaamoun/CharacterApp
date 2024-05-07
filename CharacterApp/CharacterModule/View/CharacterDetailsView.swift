//
//  CharacterDetailsVC.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 06/05/2024.
//

import SwiftUI

struct CharacterDetailsView: View, DetailsScreenViewProtocol {
    //MARK: - PROPERTIES
    @State var item:CharacterViewModel!
    let backAction:(()->())?
    
    //MARK: - BODY
    var body: some View {
    
        VStack {
            ZStack {
                Image("lion-2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width,height: 400)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 25)
                    ).ignoresSafeArea()
                
                HStack {
                    Button(action: {
                        backAction?()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black.opacity(0.5))
                            .frame(width: 40,height: 40)
                        //                                .padding()
                    })
                    .background(.white)
                    .clipShape(Circle())
                    .padding(8)
                    Spacer()
                    
                }  .padding()
                    .offset(y:-120)
            }.ignoresSafeArea()
//            Spacer()
            HStack {
                VStack(alignment: .leading,spacing: 4) {
                    Text(item.name)
                        .fontWeight(.heavy)
                        .font(.title2)
                    HStack {
                        Text("status")
                            .font(.title3)
                            .foregroundStyle(.black.opacity(0.8))
                        Circle()
                            .fill(.gray)
                            .frame(width: 6)
                        Text("Male")
                            .font(.title3)
                            .foregroundStyle(.black.opacity(0.5))
                        
                    }
                    
                }
                Spacer()
                VStack {
                    Text("Status")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(.blue.tertiary)
                    )
                   
                }
            }
            .padding(24)
            HStack(){
                Text("Location :")
                    .font(.title3)
                    .foregroundStyle(.black.opacity(0.8))
                Text("Earth")
                    .font(.title3)
                    .foregroundStyle(.black.opacity(0.5))
                Spacer()
            }
            .padding(24)
            Spacer()
        }.ignoresSafeArea()
        
        
    }
    
    //MARK: - DETAILS VIEW DELEGATE
    func displayItemDetails(item: CharacterViewModel) {
        self.item = item
    }
}

#Preview {
    CharacterDetailsView(backAction: {
        print("back")
    })
}
