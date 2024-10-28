
//  ContentView.swift
//  Journali
//
//  Created by Wajd Wael on 23/04/1446 AH.
//

import SwiftUI
struct ContentView: View {
    @State private var searchText = ""
    var body: some View {
        
        NavigationStack {
            List {
                VStack {
                    HStack {
                        VStack {
                            Text("Journali Title")
                                .foregroundStyle(Color("LightPurple"))
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("02/09/2024")
                                .padding(.top, -6)
                                .foregroundStyle(Color("Gray"))
                                .font(.system(size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Spacer()
                        
                        Button(action: {
                            print("Set up alarm")
                        }) {
                            Image(systemName: "bookmark")
                                .font(.system(size: 24))
                                .foregroundStyle(Color("LightPurple"))
                        }
                    }
                    Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh viverra non semper suscipit posuere a pede.")
                        .padding(.top, 26)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                .cornerRadius(14)
                .listRowSeparator(.hidden)
                .swipeActions(edge: .leading) {
                    Button {
                        print("Edit button tapped")
                    } label: {
                        Label("", systemImage: "pencil")
                    }
                    .tint(Color("PurpleEditBtn"))
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        print("Delete button tapped")
                    } label: {
                        Label("", systemImage: "trash")
                    }
                    .tint(Color("Red"))
                }
            }
                        
//            IF THERE IS NO NOTES
            
            /*VStack(spacing: 20) {
                Image("Journal")
                
                Text("Begin Your Journal")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color("LightPurple"))
                
                Text("Craft your personal diary, tap the \n plus icon to begin.")
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }*/

            
            .navigationTitle("Journali")
            .padding(.top, 10)

            .toolbar {
                ToolbarItem(){
                    HStack(spacing: 5) {
                        Button(action: {
                            print("Set add new note function")
                        }){
                            Image(systemName: "plus")
                                .padding()
                                .background(Color("DarkGray"))
                                .foregroundStyle(Color("LightPurple"))
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
                                .background(Color("DarkGray"))
                                .foregroundStyle(Color("LightPurple"))
                                .font(.system(size: 18))
                                .frame(width: 35, height: 35)
                                .cornerRadius(50)
                        }
                    }
                }
            }
        }
        .padding(.top)
        
        // add functiontily to hide it when there are no notes
        .searchable(text: $searchText, prompt: "Search Followers")
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
    }
}

#Preview {
    ContentView()
}
