//
//  File.swift
//  Journali
//
//  Created by Wajd Wael on 26/04/1446 AH.
//

import Foundation
import SwiftData
import SwiftUI

class JournalViewModel: ObservableObject {
    @Published var showSheet = false
    @Published var showAlert = false
    @Published var searchText = ""
    @Published var selectedJournal = JournalModel()
    @Published var isEditing: Bool
    @Published var filterOption: FilterOption = .all
    @Published var initialJournal: JournalModel?

    func formatDate(_ date: Date) -> String {
        return date.formatted(Date.FormatStyle(date: .numeric))
    }
    
    func isBookedMarked(_ isBookmarked: Bool) -> String {
        return isBookmarked ? "bookmark.fill" : "bookmark"
    }
    
    func deleteJournal(journal: JournalModel, modelContext: ModelContext) {
        modelContext.delete(journal)
        try? modelContext.save()
    }
        
    init(journal: JournalModel? = nil) {
        self.selectedJournal = journal ?? JournalModel()
        self.isEditing = journal != nil
        if isEditing {
            initialJournal = JournalModel(journalTitle: selectedJournal.journalTitle, journalContent: selectedJournal.journalContent)
        }
    }
    
    func createEditJournal(modelContext: ModelContext, dismiss: DismissAction) {
        if selectedJournal.journalTitle.isEmpty || selectedJournal.journalContent.isEmpty {
            showAlert = true
        } else {
            if !isEditing {
                modelContext.insert(selectedJournal)
            }
            
            try? modelContext.save()
            dismiss()
        }
    }
    
    func cancelEditing(dismiss: DismissAction) {
        if isEditing {
            if let initialJournal = initialJournal {
                selectedJournal.journalContent = initialJournal.journalContent
                selectedJournal.journalTitle = initialJournal.journalTitle
            }
        }
        dismiss()
    }
    
    enum FilterOption {
        case all
        case bookmarked
        case date
    }

    func filteredJournals(_ journals: [JournalModel]) -> [JournalModel] {
        var filtered = journals
        switch filterOption {
            case .all:
                filtered = journals
            case .bookmarked:
                filtered = journals.filter { $0.isBookmarked }
            case .date:
                filtered = journals.sorted { $0.timestamp > $1.timestamp }
        }
        if !searchText.isEmpty {
            filtered = filtered.filter { journal in
                journal.journalTitle.localizedCaseInsensitiveContains(searchText) ||
                journal.journalContent.localizedCaseInsensitiveContains(searchText)
            }
        }
        return filtered
    }
}
