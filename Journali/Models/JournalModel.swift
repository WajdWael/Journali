//
//  NoteItemModel.swift
//  Journali
//
//  Created by Wajd Wael on 25/04/1446 AH.
//

import Foundation
import SwiftData

@Model
final class JournalModel:Identifiable {
    var journalTitle: String
    var journalContent: String
    var timestamp: Date
    var isBookmarked: Bool
    
    init(
            journalTitle: String = "",
            journalContent: String = "",
            timestamp: Date = .now,
            isBookmarked: Bool = false
    ) {
        self.journalTitle = journalTitle
        self.journalContent = journalContent
        self.timestamp = timestamp
        self.isBookmarked = isBookmarked
    }
}
