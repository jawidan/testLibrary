//
//  CircleImageView.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 15.11.23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .resizable() // Add this to allow the image to be resized
            .aspectRatio(contentMode: .fill) // Preserve the aspect ratio while filling the frame
            .frame(width: 250, height: 250) // Set the fixed frame size for the image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 7)
    }
}


#Preview {
    CircleImage()
}
