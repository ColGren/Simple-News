//
//  SelectSomething.swift
//  Simple News
//
//  Created by Colin Grenfell on 01/07/2022.
//

import SwiftUI

struct SelectSomethingView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "newspaper")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
            
            Text("Welcome to Col News!")
                .font(.title)
            
            Text("Please select an item to view.")
        }
    }
}

struct SelectSomethingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSomethingView()
    }
}
