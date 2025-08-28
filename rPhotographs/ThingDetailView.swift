import SwiftUI

struct ThingDetailView: View {
    let thing : Thing
    var body: some View {
        VStack (alignment: .leading) {
            Text(thing.data.title).font(.title).fontWeight(.bold)
            HStack {
                Text("by u/" + thing.data.author)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(Date.init(timeIntervalSince1970: thing.data.created_utc).formatted(Date.RelativeFormatStyle()))
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
            }
            
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
            
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                Text("\(thing.data.score)")
                Image(systemName: "bubble.fill")
                Text("\(thing.data.num_comments)")
            }
            Spacer()
        }.padding()
    }
}
