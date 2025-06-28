//
//  ContentView.swift
//  MileTask
//
//  Created by asani on 26/06/25.
//

import SwiftUI
import MileTaskComponent

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .typographyStyle(.Custom(size: 24, .bold))
                .foregroundColor(.primary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
