//
//  ContentView.swift
//  Simple News
//
//  Created by Colin Grenfell on 01/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    enum LoadState {
        case loading
        case success
        case failed
    }
    
    let apiKey: String = "YOUR API KEY HERE"
    

    @State private var loadState = LoadState.loading
    @State private var searchText = ""
//    @State private var results = [Result]()
    @State private var articleData: ArticleData?
    
    var body: some View {
        Group {
            switch loadState {
            case .loading:
                VStack {
                    Text("Downloading...")
                    ProgressView()
                }
            case .success:
                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {
                            ForEach(articleData!.response.results) { result in
                                VStack {
                                    if (result.fields.thumbnail != nil) {
                                        AsyncImage(url: result.fields.thumbnail!) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                            default:
                                                Image(systemName: "newspaper")
                                            }
                                        }
                                    }
                                    Text(result.webTitle)
                                    Text(result.fields.trailText)
                                        .font(.caption.weight(.bold))
                                        .padding(.horizontal)
                                    Divider()
                                }
                        }
                            .refreshable(action: downloadArticles)
                    }
                }
                   
            case .failed:
                VStack {
                    Text("Failed to download articles")
                    
                    Button("Retry") {
                        loadState = .loading
                        
                        Task {
                            try await Task.sleep(nanoseconds: 500_000_000)
                            await downloadArticles()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .navigationTitle("Col's News")
        .task(downloadArticles)
        
    }
    
    @Sendable func downloadArticles() async {
        do {
            let url = URL(string: "https://content.guardianapis.com/search?show-fields=all&page-size=30&api-key=\(apiKey)")!
            
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            articleData = try decoder.decode(ArticleData.self, from: data)
            loadState = .success
      
        } catch {
            loadState = .failed
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
