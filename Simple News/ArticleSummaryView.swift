//
//  ArticleSummaryView.swift
//  Simple News
//
//  Created by Colin Grenfell on 02/07/2022.
//

import SwiftUI

struct ArticleSummaryView: View {
    let article: ArticleData.Response.Article
    
    var body: some View {
        NavigationLink {
            FullArticleView(article: article)
        } label: {
            VStack {
                if (article.fields.thumbnail != nil) {
                    AsyncImage(url: article.fields.thumbnail!) { phase in
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
                Text(article.webTitle)
                    .font(.body.weight(.bold))
                Text(article.fields.trailText)
                    .font(.caption)
                    .padding(.horizontal)
            }
        }
    }
}

