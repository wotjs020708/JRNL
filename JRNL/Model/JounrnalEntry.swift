//
//  JounrnalEntry.swift
//  JRNL
//
//  Created by 어재선 on 5/10/24.
//

import UIKit
import MapKit
import SwiftData

@Model
class JournalEntry {
    // MARK: - Properties
    var key = UUID().uuidString
    let dateString: String
    let rating: Int
    let entryTitle: String
    let entrybody: String
    @Attribute(.externalStorage) let photoData: Data?
    let latitude: Double?
    let longitude: Double?
    
    // MARK: - Initializetion
    init?(rating: Int, title: String, body: String, photo: UIImage? = nil, latitude: Double? = nil, longitude: Double? = nil) {
        if title.isEmpty || body.isEmpty || rating < 0 || rating > 5 { return nil }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        self.dateString = formatter.string(from: Date())
        self.rating = rating
        self.entryTitle = title
        self.entrybody = body
        self.photoData = photo?.jpegData(compressionQuality: 1.0)
        self.latitude = latitude
        self.longitude = longitude
    }
    
//    var coordinate: CLLocationCoordinate2D {
//        guard let lat = latitude, let long = longitude else {
//            return CLLocationCoordinate2D()
//        }
//        return CLLocationCoordinate2D(latitude: lat, longitude: long)
//    }
//    
//    var title: String? {
//        dateString
//    }
//    
//    var subtitle: String? {
//        entryTitle
//    }
    
}

//// MARK: - Smple data
//struct SampleJournalEntryData {
//    var journalEntries: [JournalEntry] = []
//    
//    mutating func createSampleJounrnalEntryData() {
//        let photo1 = UIImage(systemName: "sun.max")
//        let photo2 = UIImage(systemName: "cloud")
//        let photo3 = UIImage(systemName: "cloud.sun")
//        guard let journalEntry1 = JournalEntry(rating: 5, title: "Good", body: "Today is good day", photo: photo1) else {
//            fatalError("Unble to instantiate journalEntry1")
//        }
//        guard let journalEntry2 = JournalEntry(rating: 0, title: "Bad", body: "Today is bad day",photo: photo2, latitude: 37.56661, longitude: 126.978388) else {
//            fatalError("Unble to instantiate journalEntry2")
//        }
//        guard let journalEntry3 = JournalEntry(rating: 3, title: "Ok", body: "Today is ok day", photo: photo3) else {
//            fatalError("Unble to instantiate journalEntry3")
//        }
//        
//        journalEntries += [journalEntry1, journalEntry2, journalEntry3]
//        
//    }
//}
//
