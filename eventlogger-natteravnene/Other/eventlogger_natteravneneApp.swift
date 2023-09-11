//
//  eventlogger_natteravneneApp.swift
//  eventlogger-natteravnene
//
//  Created by Lotte Stubdal on 11/09/2023.
//

import SwiftUI
import FirebaseCore

// firebase configuration
// source code from Firebase config setup
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}

