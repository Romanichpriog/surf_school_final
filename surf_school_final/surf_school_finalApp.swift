//
//  surf_school_finalApp.swift
//  surf_school_final
//
//  Created by Roman on 18.07.2024.
//

import SwiftUI

@main
struct surf_school_finalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            CharacterListView(characterManager: CharactersManager())
        }
    }
}
