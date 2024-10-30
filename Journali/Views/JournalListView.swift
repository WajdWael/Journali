//
//  JournalEmptyView.swift
//  Journali
//
//  Created by Wajd Wael on 26/04/1446 AH.
//

import SwiftUI

struct JournalListView: View {
    
    @Environment(\.modelContext) var modelContext
    let journal: JournalModel
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        Section {
            VStack() {
                HStack {
                    VStack {
                        Text(journal.journalTitle)
                            .foregroundStyle(Color("primaryColor"))
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.formatDate(journal.timestamp))")
                            .padding(.top, -6)
                            .foregroundStyle(Color("Gray"))
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    
                    Button {
                        withAnimation {
                            journal.isBookmarked.toggle()
                        }
                    } label: {
                        Image(systemName: viewModel.isBookedMarked(journal.isBookmarked))
                            .font(.system(size: 24))
                            .foregroundColor(Color("primaryColor"))
                    }
                }
                Text(journal.journalContent)
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 0)
            .cornerRadius(20)
            .listRowSeparator(.hidden)
        }
        .listSectionSpacing(16)
        .swipeActions(edge: .leading) {
            Button(role: .destructive) {
                viewModel.selectedJournal = journal
                viewModel.showSheet = true
            } label: {
                Label("", systemImage: "pencil")
            }
            .tint(Color("secondaryColor"))
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                withAnimation {
                    viewModel.deleteJournal(journal: journal, modelContext: modelContext)
                }
            } label: {
                Label("", systemImage: "trash")
            }
            .tint(Color("red"))
        }
        .sheet(isPresented: $viewModel.showSheet, content: {
            JournalSheetView(journal: journal)
        })
    }
}

#Preview {
    let sampleJournal = JournalModel(
        journalTitle: "Sample Journal",
        journalContent: "This is a sample entry for the journal.",
        timestamp: Date(),
        isBookmarked: false
    )
    JournalListView(journal: sampleJournal)
}
