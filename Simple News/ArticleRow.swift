//
//  ArticleRow.swift
//  Simple News
//
//  Created by Colin Grenfell on 01/07/2022.
//

import SwiftUI

struct ArticleRow: View {
    
    let article: Article
    
    var body: some View {
        NavigationLink {
            ReadingView(article: article)
        } label: {
            HStack {
                AsyncImage(url: article.thumbnail) { phase in
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
                .frame(width: 80, height: 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(article.section)
                        .font(.caption.weight(.heavy))
                    Text(article.title)
                }
            }
        }
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(article: Article.example)
    }
}
