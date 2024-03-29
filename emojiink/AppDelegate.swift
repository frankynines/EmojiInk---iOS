//
//  AppDelegate.swift
//  emojiinktest
//
//  Created by Vince McKelvie on 3/11/15.
//  Copyright (c) 2015 BetterMagic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

//USED FOR DYNAMICALLY LOOKIG THROUGH FOLDER CONTENTS
class AssetManager:NSObject {
    
    func getAssetsForDir(_ dir:String) -> [String]{
        
        
        var fileListArray = [String]()

        let resourcePath = Bundle.main.resourcePath
        let path = "\(resourcePath! + dir)"

        let fileMGR = FileManager.default

        do {
            let contents = try fileMGR.contentsOfDirectory(at: URL(string: path)!,
                                            includingPropertiesForKeys: nil,
                                            options: .skipsHiddenFiles)
            for file in contents {
                let fileName = file.absoluteString
                fileListArray.append(fileName.replacingOccurrences(of: "file://" + path, with: ""))
            }
        } catch {
            print(error)
        }
        
        let sortedArray = fileListArray.sorted()
        
        return sortedArray
        
//        //
//
//        var fileListArray = [String]()
//
//        let resourcePath = Bundle.main.resourcePath
//        let fileMGR = FileManager.default
//
//        let path = "\(resourcePath! + dir)"
//        //print("PATH: \(path)")
//
//        do {
//
//            let fileList = try fileMGR.contentsOfDirectory(atPath: path)
//            fileListArray = fileList
//            print(fileListArray)
//
//        } catch {
//            print(error)
//        }
//
//
//
//        return fileListArray
    }
    
    //Adds full path to asset in array
    func getFullAsset(_ file:String, dir:String) -> String{
        
        
        let resourcePath = Bundle.main.resourcePath
        
        let newName = "\(resourcePath! + dir + file)"
        
        return newName
        
        
    }
    
    func ResourcePath()-> String {
        
        return Bundle.main.resourcePath!
        
    }
    
}

