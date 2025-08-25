//
//  APODViewModel.swift
//  APOD
//
//  Created by Alumno on 21/08/25.
//

import Foundation

@Observable
@MainActor
class RedditListingViewModel {
    
    var listing : RedditListing?
    
    init() {
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
            return
        }
        
        let results = try JSONDecoder().decode(RedditListing.self, from: data)
        
        DispatchQueue.main.async {
            self.listing = results
        }
    }
}
