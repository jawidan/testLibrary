//
//  CircleImageView.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 15.11.23.
//

import SwiftUI

import SwiftUI

struct CircleImage: View {
    @Binding var image: Image? // Accept an optional Image
    
    var tapAction: () -> ()

    var body: some View {
        if let image = image {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4)
                )
                .shadow(radius: 7)
                .onTapGesture {
                    tapAction()
                }
        }
    }
    
    
}



//#Preview {
//    CircleImage(image: Image("turle"))
//}
