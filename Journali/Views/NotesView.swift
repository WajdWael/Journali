//
//  ContentView.swift
//  Journali
//
//  Created by Wajd Wael on 23/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    let purpleBlackColor = "#141420"
    var body: some View {
        ZStack {
            // icons
            HStack {
                Spacer()
                
                Button(action: {
                    print("Set up alarm")
                }){
                    Image(systemName: "line.3.horizontal.decrease")
                        .padding()
                        .background(Color("DarkGray"))
                        .foregroundStyle(Color("LightPurple"))
                        .font(.system(size: 22))
                        .frame(width: 30, height: 30)
                        .cornerRadius(50)
                }
                
                Button(action: {
                    print("Set up alarm")
                }){
                    Image(systemName: "plus")
                        .padding()
                        .background(Color("DarkGray"))
                        .foregroundStyle(Color("LightPurple"))
                        .font(.system(size: 22))
                        .frame(width: 30, height: 30)
                        .cornerRadius(50)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            // header
            HStack {
                Text("Journali")
                    .font(.system(size: 34, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.top, 50)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            VStack(spacing: 20) {
                
                Image("Journal")
                Text("Begin Your Journal")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color("LightPurple"))
                
                Text("Craft your personal diary, tap the \n plus icon to begin.")
                    .font(.system(size: 18, weight: .light))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
            }
        }
        // styles for the MAIN VIEW
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
//        .background(
//            LinearGradient(
//                gradient: Gradient(colors: [
//                    Color("DarkBlue"),
//                    .black
//                ]),
//              startPoint: .top,
//              endPoint: .bottom
//            )
//            .edgesIgnoringSafeArea(.all)
//        )
    }
}

#Preview {
    ContentView()
}
