
//  ContentView.swift
//  Journali
//
//  Created by Wajd Wael on 23/04/1446 AH.
//

import SwiftUI
import SwiftData

struct JournalView: View {
    
    @Query private var journals: [JournalModel]
    @Environment(\.modelContext) var modelContext
    @StateObject private var viewModel = JournalViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if journals.isEmpty {
                    JournalEmptyView()
                } else {
                    List {
                        ForEach(viewModel.filteredJournals(journals)) { journal in
                            JournalListView(journal: journal)
                        }
                    }
                    .padding(.top, 10)
                    .searchable(text: $viewModel.searchText, prompt: "Search")
                }
            }
            .toolbar {
                ToolbarItem {
                    HStack(spacing: 5) {
                        Button(action: {
                            viewModel.showSheet.toggle()
                        }) {
                            Image(systemName: "plus")
                                .padding()
                                .background(Color("darkGrayColor"))
                                .foregroundStyle(Color("primaryColor"))
                                .font(.system(size: 18))
                                .frame(width: 35, height: 35)
                                .cornerRadius(50)
                        }
                        
                        Menu {
                            Button(action: {
                                viewModel.filterOption = viewModel.filterOption == .bookmarked ? .all : .bookmarked
                            }) {
                                Label("Bookmark", systemImage: viewModel.filterOption == .bookmarked ? "checkmark" : "")
                            }
                            Button(action: {
                                viewModel.filterOption = viewModel.filterOption == .date ? .all : .date
                            }) {
                                Label("Journal Date", systemImage: viewModel.filterOption == .date ? "checkmark" : "")
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
            .sheet(isPresented: $viewModel.showSheet, content: {
                JournalFormView()
            })
            .navigationTitle("Journali")
        }
    }
}

#Preview {
    JournalView()
}
