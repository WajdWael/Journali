//
//  InputNote.swift
//  Journali
//
//  Created by Wajd Wael on 25/04/1446 AH.
//

import SwiftUI

struct InputNote: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .foregroundColor(Color("buttonTextAccent"))
                }

                Spacer()

                Button(action: {
                    print("Save tapped")
                }) {
                    Text("Save")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color("buttonTextAccent"))
                }
            }
            .padding(.bottom, 20)

            TextField("Title", text: $title)
                .foregroundColor(.white)
                .font(.system(size: 34))
                .fontWeight(.bold)
                .accentColor(Color("primaryColor"))

            Text("02/09/2024")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("lightSecondaryText"))
                .font(.system(size: 16))

            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .accentColor(Color("primaryColor"))
                    .padding(.top, -4)
                    .background(Color.clear)
                
                if text.isEmpty {
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
}
