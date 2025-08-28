import SwiftUI

struct ThingListView: View {
    let thing : Thing
    var body: some View {
        VStack (alignment:.leading) {
            Text(thing.data.title)
                .fontWeight(.bold)
            Text("by u/" + thing.data.author)
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
            
            // Use 1080p image if possible, else use source image
            if let bestResolution = thing.data.preview.images[0].resolutions.last {
                AsyncImage(url: URL(string: bestResolution.url)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }.cornerRadius(10.0)
            } else {
                AsyncImage(url: URL(string: thing.data.preview.images[0].source.url)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
        }
    }
}
