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
        VStack (alignment:.leading) {
            Text(thing.data.title)
                .fontWeight(.bold)
            Text("by " + thing.data.author)
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
            
            AsyncImage(url: URL(string: thing.data.preview.images[0].source.url)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }.cornerRadius(10.0)
            
        }
    }
}
