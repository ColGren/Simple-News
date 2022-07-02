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
    
    let apiKey: String = "YOUR GUARDIAN DEV API KEY HERE"
    

    @State private var loadState = LoadState.loading
    @State private var searchText = ""
    @State private var articles = [ArticleData.Response.Article]()
    
    var body: some View {
        Group {
            switch loadState {
            
            case .loading:
                VStack {
                    Text("Downloading...")
                    ProgressView()
                }
                
            case .success:
                List(filtered, rowContent: ArticleSummaryView.init)
                        .refreshable(action: downloadArticles)
                        .searchable(text: $searchText)
                   
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
    
    var filtered: [ArticleData.Response.Article] {
        if searchText.isEmpty { return articles } else {
            return articles.filter{ $0.webTitle.localizedCaseInsensitiveContains(searchText) }
        }
    }

    @Sendable func downloadArticles() async {
        do {
            let url = URL(string: "https://content.guardianapis.com/search?show-fields=all&page-size=30&api-key=\(apiKey)")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let articleData = try decoder.decode(ArticleData.self, from: data)
            articles.removeAll()
            for article in articleData.response.results {
                self.articles.append(article)
            }
            loadState = .success
            print("Download / decode success!")
            print(String(describing: articles.count))
      
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
