//
//  InfoView.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 20.02.24.
//

import Foundation
import SwiftUI

struct InfoView :  View {
    
    var name: String
    var bio: String
    var location: String
    
    
    var body : some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title)
            HStack {
                Text(bio)
                Spacer()
                Text(location)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            Divider()
            
            Text("About \(name)")
                .font(.title2)
            Text("MSc of Computer Science student at University of Tartu. I am a skilled iOS engineer with 2 years of work experience. I love to play video games and solve the rubiks cube. ")
        }
        .padding()
    }
}
