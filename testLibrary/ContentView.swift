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

    @State private var image: Image? = Image("turtlerock") // Default image
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            ScrollView{
                MapView()
                    .frame(height: 300)
                
                CircleImage(image: $image )
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: $image)
                    }
                    .offset(y: -130)
                    .padding(.bottom, -130)
                    .onChange(of: inputImage) { oldValue, newValue in
                        loadImage()
                    }

                
                
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


