//
//  ContentView.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 15.11.23.
//

import SwiftUI
import MapKit
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @State private var image: Image? = Image("turtlerock")
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        
        var name : String = "Javidan Ibrahimov"
        var bio : String = "iOS Developer and Gamer"
        var locationString : String = "Tartu, Estonia"
        
        VStack {
            ScrollView{
                MapView()
                    .frame(height: 300)
                
                CircleImage(image: $image, tapAction: {
                    showingImagePicker = true
                })
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: $image)
                    }
                    .offset(y: -130)
                    .padding(.bottom, -130)
                    .onChange(of: inputImage) { oldValue, newValue in
                        loadImage()
                    }

                
                InfoView(name: name, bio: bio, location: locationString)
                
                Spacer()
                
                WorkHistoryView()
                
                Spacer()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            loadImageFromCoreData()
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func loadImageFromCoreData() {
        if let savedImage = ImagesController.shared.fetchSavedImage(context: viewContext) {
            self.image = Image(uiImage: savedImage)
        }
    }
    
    
}


