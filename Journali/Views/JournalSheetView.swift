//
//  JournalSheetView.swift
//  Journali
//
//  Created by Wajd Wael on 26/04/1446 AH.
//

import SwiftUI
import SwiftData


struct JournalSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @StateObject private var viewModel: JournalViewModel
    
    
    init(journal: JournalModel? = nil) {
        _viewModel = StateObject(wrappedValue: JournalViewModel(journal: journal))
    }

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("Cancel") {
                    viewModel.cancelEditing(dismiss: dismiss)
                }
                .font(.system(size: 16))
                .fontWeight(.light)
                .foregroundColor(Color("buttonTextAccent"))
                Spacer()
                Button(action: {
                    viewModel.createEditJournal(modelContext: context, dismiss: dismiss)
                }) {
                    Text("Save")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color("secondaryColor"))
                }
                
                
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Please, Try again!"),
                        message: Text("Please fill in both title and content."),
                        dismissButton: .default(Text("OK").foregroundColor(.red))
                    )
                }
            }
            .padding(.bottom, 20)

            TextField("Title", text: $viewModel.selectedJournal.journalTitle)
                .foregroundColor(.white)
                .font(.system(size: 34))
                .fontWeight(.bold)
                .accentColor(Color("primaryColor"))

            Text("\(viewModel.formatDate(viewModel.selectedJournal.timestamp))")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("lightSecondaryText"))
                .font(.system(size: 16))

            ZStack(alignment: .topLeading) {
                TextEditor(text: $viewModel.selectedJournal.journalContent)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .accentColor(Color("primaryColor"))
                    .padding(.top, -4)
                    .background(Color.clear)
                
                if viewModel.selectedJournal.journalContent.isEmpty {
                    Text("Type your Journal…")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("darkSecondaryText"))
                        .font(.system(size: 20))
                }
            }
            .padding(.top, 15)
        }
        .padding()
    }
}

#Preview {
    JournalSheetView()
        .modelContainer(for: JournalModel.self)
}
