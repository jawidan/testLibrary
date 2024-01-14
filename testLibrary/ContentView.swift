//
//  ContentView.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 15.11.23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView{
                MapView()
                    .frame(height: 300)
                
                CircleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                
                VStack(alignment: .leading) {
                    Text("Javidan Ibrahimov")
                        .font(.title)
                    HStack {
                        Text("iOS Engineer, MSc Computer Science")
                        Spacer()
                        Text("Tartu, Estonia")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("About Javidan")
                        .font(.title2)
                    Text("MSc of Computer Science student at University of Tartu. I am a skilled iOS engineer with 2 years of work experience. I love to play video games and solve the rubiks cube. ")
                }
                .padding()
                
                
                Spacer()
                
                
                WorkHistoryView()
                
                
                Spacer()
            }
        }
    }
}


