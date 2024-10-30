//
//  JournalEmptyView.swift
//  Journali
//
//  Created by Wajd Wael on 26/04/1446 AH.
//

import SwiftUI

struct JournalEmptyView: View {
    var body: some View {
        NavigationStack{
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
        }
    }
}

#Preview {
    JournalEmptyView()
}
