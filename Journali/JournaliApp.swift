//
//  JournaliApp.swift
//  Journali
//
//  Created by Wajd Wael on 23/04/1446 AH.
//

import SwiftUI
import SwiftData

@main
struct JournaliApp: App {
    var body: some Scene {
        WindowGroup {
            NotesView()
                .modelContainer(for: NoteItemModel.self)
        }
    }
}
