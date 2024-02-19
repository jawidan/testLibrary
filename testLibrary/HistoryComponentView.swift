//
//  HistoryComponentView.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 15.01.24.
//

import Foundation
import SwiftUI

struct WorkHistoryView: View {
    
    static let brWorkExperience = """
- Used Xcode and developed the bank app in Swift
- Built a new app while supporting the old version
- Used Auto Layout with NSLayoutConstraints
- Had experience in parsing, serializing, and deserializing JSON
- Fluently developed Table and Collection Views
- Had the opportunity to install and update Pods
- Worked with Core Data, User Defaults, and NSCache
- Worked closely with project managers and designers to
- illustrate rich app experience
- Created root view components to avoid code repetition
- Implemented MVC and MVVM design patterns
- Familiar with Notifications, Delegate Pattern
- Familiar with animations using Lottie
"""
    
    var workHistoryData : [WorkHistoryItem] = [
//        WorkHistoryItem(title: "SEB | Baltic", subtitle: "2024 - present", content: "iOS Engineer", imageName: "seb"),
        WorkHistoryItem(title: "Bank Respublika OJSC", subtitle: "2021 - 2023", content: brWorkExperience, imageName: "br")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(workHistoryData) { item in
                    HStack(alignment: .top) {
                        TimelineView()
                        WorkHistoryEntryView(item: item)
                    }
                }
            }
            .padding()
        }
    }
}

struct TimelineView: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: 10, height: 10)
            Rectangle()
                .frame(width: 2, height: 50) // Adjust height as needed
        }
    }
}

struct WorkHistoryEntryView: View {
    var item: WorkHistoryItem
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text(item.title)
                    .font(.headline)
                Spacer()
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .border(.clear, width: 2)
                
            }
            Text(item.subtitle)
                .font(.subheadline.italic())
                .fontWeight(.light)
            Text(item.content)
                .font(.body)
            
        }
        
    }
}

struct WorkHistoryItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let content: String
    let imageName: String
}


