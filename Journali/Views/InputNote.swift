//
//  InputNote.swift
//  Journali
//
//  Created by Wajd Wael on 25/04/1446 AH.
//

import SwiftUI

struct InputNote: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var noteItem = NoteItemModel()
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("Cancel") {
                    withAnimation {
                        dismiss()
                    }
                }
                .font(.system(size: 16))
                .fontWeight(.light)
                .foregroundColor(Color("buttonTextAccent"))
                
                Spacer()
                
                Button(action: {
                    if noteItem.journalTitle.isEmpty || noteItem.journalContent.isEmpty {
                        showingAlert = true
                    } else {
                        context.insert(noteItem)
                        dismiss()
                    }
                }) {
                    Text("Save")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color("buttonTextAccent"))
                }
                
                .alert("Try again!", isPresented: $showingAlert) {
                    Button("OK", role: .destructive) { }
                } message: {
                    Text("Please fill in both title and content.")
                        .foregroundColor(Color("red"))
                }
               
            }
            .padding(.bottom, 20)

            TextField("Title", text: $noteItem.journalTitle)
                .foregroundColor(.white)
                .font(.system(size: 34))
                .fontWeight(.bold)
                .accentColor(Color("primaryColor"))

            Text("\(noteItem.timestamp, format: Date.FormatStyle(date: .numeric))")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("lightSecondaryText"))
                .font(.system(size: 16))

            ZStack(alignment: .topLeading) {
                TextEditor(text: $noteItem.journalContent)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .accentColor(Color("primaryColor"))
                    .padding(.top, -4)
                    .background(Color.clear)
                
                if noteItem.journalContent.isEmpty {
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
    InputNote()
        .modelContainer(for: NoteItemModel.self)
}
