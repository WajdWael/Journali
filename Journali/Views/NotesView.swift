
//  ContentView.swift
//  Journali
//
//  Created by Wajd Wael on 23/04/1446 AH.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    @State private var searchText = ""
    @Query private var notes: [NoteItemModel]
    
    @Environment(\.modelContext) var context
    @State private var showSheet = false
    
    @State private var selectedNote: NoteItemModel?

    var body: some View {
        NavigationStack {
            
            if notes.isEmpty {
                VStack(spacing: 20) {
                    Image("Journal")
                    
                    Text("Begin Your Journal")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color("primaryColor"))
                    
                    Text("Craft your personal diary, tap the \n plus icon to begin.")
                        .font(.system(size: 18, weight: .light))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
                .navigationTitle("Journali")
                .sheet(isPresented: $showSheet, content:{
                    InputNote()
                })
            }
            
            List {
                ForEach(notes) { note in
                    Section {
                        VStack() {
                            HStack {
                                VStack {
                                    Text(note.journalTitle)
                                        .foregroundStyle(Color("primaryColor"))
                                        .font(.system(size: 24))
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("\(note.timestamp, format: Date.FormatStyle(date: .numeric))")
                                        .padding(.top, -6)
                                        .foregroundStyle(Color("Gray"))
                                        .font(.system(size: 14))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                Spacer()
                                
                                Button {
                                    withAnimation {
                                        note.isBookmarked.toggle()
                                    }
                                } label: {
                                    Image(systemName: note.isBookmarked ? "bookmark.fill" : "bookmark")
                                        .font(.system(size: 24))
                                        .foregroundColor(Color("primaryColor"))
                                }
                            }
                            Text(note.journalContent)
                                .padding(.top, 26)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .cornerRadius(14)
                        .listRowSeparator(.hidden)
                    }
                    .swipeActions(edge: .leading) {
                        Button(role: .destructive) {
                        } label: {
                            Label("", systemImage: "pencil")
                        }
                        .tint(Color("secondaryColor"))
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(note)
                                do {
                                    try context.save()
                                } catch {
                                    print("Failed to save context after deletion: \(error)")
                                }
                            }
                        } label: {
                            Label("", systemImage: "trash")
                        }
                        .tint(Color("red"))
                    }
                }
            }
            .padding(.top, 10)
            .toolbar {
                ToolbarItem(){
                    HStack(spacing: 5) {
                        Button(action: {
                            showSheet.toggle()
                        }){
                            Image(systemName: "plus")
                                .padding()
                                .background(Color("darkGrayColor"))
                                .foregroundStyle(Color("primaryColor"))
                                .font(.system(size: 18))
                                .frame(width: 35, height: 35)
                                .cornerRadius(50)
                        }
                        
                        Menu {
                            Button("Bookmark") {
                                print("Order Now tapped")
                            }
                            Button("Journal Date") {
                                print("Adjust Order tapped")
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                                .padding()
                                .background(Color("darkGrayColor"))
                                .foregroundStyle(Color("primaryColor"))
                                .font(.system(size: 18))
                                .frame(width: 35, height: 35)
                                .cornerRadius(50)
                        }
                    }
                }
            }
            .sheet(isPresented: $showSheet, content: {
                InputNote()
            })
            .navigationTitle("Journali")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    NotesView()
}

