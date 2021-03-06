//
//  AppDelegate.swift
//  Hey-Guys
//
//  Created by Arash on 11/20/1398 AP.
//  Copyright © 1398 Arash. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{
   
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
     
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = "900253734343-qgum92h0o203dk5uc43ha60l8li60r7a.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
 
        return true
    }
    
    //MARK: - Implementation Google Login Delegate
  
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as? URL, sourceApplication:options [UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation:           options[UIApplication.OpenURLOptionsKey.annotation])
    }
    
     func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
               withError error: Error!) {
       if let error = error {
         if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
           print("The user has not signed in before or they have since signed out.")
         } else {
           print("\(error.localizedDescription)")
         }
         return
       }
       // Perform any operations on signed in user here.
       let userId = user.userID                  // For client-side use only!
       let idToken = user.authentication.idToken // Safe to send to the server
       let fullName = user.profile.name
       let givenName = user.profile.givenName
       let familyName = user.profile.familyName
       let email = user.profile.email
       print(fullName)
     }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,withError error: Error!) {
      // Perform any operations when the user disconnects from app here.
      print("User has disconnected")
    }
      
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

