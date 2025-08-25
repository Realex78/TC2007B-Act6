//
//  APODDetailView.swift
//  APOD
//
//  Created by Alumno on 21/08/25.
//

import SwiftUI

//struct APODDetailView: View {
//    let photo : APOD
//    var body: some View {
//        ZStack {
//            AsyncImage(url: URL(string: photo.url)) { image in
//                image.resizable()
//                    .ignoresSafeArea()
//            } placeholder: {
//                Color.black.ignoresSafeArea()
//            }
//                .overlay(Color.black.opacity(0.5))
//                .blur(radius: 40.0)
//            
//            VStack {
//                AsyncImage(url: URL(string: photo.url)) { image in
//                    image.resizable().scaledToFit()
//                } placeholder: {
//                    Color.black
//                }
//                    .cornerRadius(10.0)
//                
//                Text(photo.title).font(.title).fontWeight(.bold).foregroundStyle(.white).padding(.bottom)
//                Text(photo.explanation).foregroundStyle(.white)
////                Text("Top 3 recipes").font(.title2)
////                VStack {
////                    ForEach(cuisine.recipies, id: \.self) { item in
////                        Text("• " + item).frame(maxWidth: .infinity, alignment: .leading)
////                    }
////                }
//                Spacer()
//            }.padding()
//        }
//    }
//}
