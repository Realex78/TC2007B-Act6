import Foundation

@Observable
@MainActor
class RedditListingViewModel {
    
    var listing : RedditListing?
    var requestError : Bool
    
    init() {
        requestError = false
        Task {
            try await loadAPI()
        }
    }

    func loadAPI() async throws {
        guard let URL = URL(string: "https://www.reddit.com/r/photographs/.json?raw_json=1") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: URL)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            requestError = true
            return
        }

        let results = try JSONDecoder().decode(RedditListing.self, from: data)
        self.listing = results
    }
}
