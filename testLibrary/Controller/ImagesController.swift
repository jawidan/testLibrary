//
//  ImagesController.swift
//  testLibrary
//
//  Created by Javidan Ibrahimov on 20.02.24.
//

import Foundation
import SwiftUI
import CoreData


class ImagesController {
    static var shared = ImagesController()
    
    
    func saveImage(image: UIImage, context: NSManagedObjectContext) {
        let photoEntity = PhotoEntity(context: context)
        photoEntity.imageData = image.jpegData(compressionQuality: 1.0) // Adjust compression quality as needed
        do {
            try context.save()
        } catch {
            print("Failed to save image: \(error.localizedDescription)")
        }
    }
    
    func fetchSavedImage(context: NSManagedObjectContext) -> UIImage? {
        let fetchRequest = NSFetchRequest<PhotoEntity>(entityName: "PhotoEntity")

        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)] // Assuming you have a creationDate attribute
        fetchRequest.fetchLimit = 1
        
        do {
            let result = try context.fetch(fetchRequest)
            if let firstImage = result.first, let imageData = firstImage.imageData {
                return UIImage(data: imageData)
            }
        } catch {
            print("Failed to fetch image: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    
    
}
