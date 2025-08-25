//
//  ContentView.swift
//  rPhotographs
//
//  Created by Alumno on 25/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var RedditListingVM = RedditListingViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach (RedditListingVM.listing.data.children) { item in
                    ZStack {
                        ThingListView(thing: item)
//                        NavigationLink {
//                            APODDetailView(photo: item)
//                        } label: {
//                            EmptyView()
//                        }.opacity(0.0)
                    }.listRowInsets(EdgeInsets())
                }
            }.navigationTitle(Text("rPhotographs"))
        }
    }
}

#Preview {
    ContentView()
}
