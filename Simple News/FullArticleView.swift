//
//  FullArticleView.swift
//  Simple News
//
//  Created by Colin Grenfell on 02/07/2022.
//

import SwiftUI

struct FullArticleView: View {
    let article: ArticleData.Response.Article
    var body: some View {
        VStack {
            Text(article.fields.headline)
                .font(.largeTitle.weight(.bold))
                .padding(.vertical)
            ScrollView {
            Text(article.fields.bodyText)
                    .padding([.horizontal, .bottom])
            }
        }
    }
}


