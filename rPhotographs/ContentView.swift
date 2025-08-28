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
            if RedditListingVM.requestError {
                VStack {
                    Spacer()
                    Image(systemName: "network.slash").font(.largeTitle)
                    Text("Error loading posts :(").font(.headline)
                    Spacer()
                }
            } else
            if let listing = RedditListingVM.listing {
                List {
                    ForEach (listing.data.children) { item in
                        ZStack {
                            ThingListView(thing: item)
                            NavigationLink {
                                ThingDetailView(thing: item)
                            } label: {
                                EmptyView()
                            }.opacity(0.0)
                        }
                    }
                }.navigationTitle(Text("r/Photographs"))
            } else {
                ProgressView("Loading posts...")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
