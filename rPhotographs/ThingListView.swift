//
//  APODListVIew.swift
//  APOD
//
//  Created by Alumno on 21/08/25.
//

import SwiftUI

struct ThingListView: View {
    let thing : Thing
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: thing.data.preview[0].source.url)) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Color.black
            }
                .overlay(Color.black.opacity(0.5))
                .frame(height: 150.0)
            
            Text(thing.data.title).foregroundStyle(.white)
                .fontWeight(.black)
                .fontWidth(.compressed)
                .font(.title)
                .padding()
        }
    }
}
