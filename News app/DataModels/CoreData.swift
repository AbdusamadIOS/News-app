//
//  CoreData.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 05/02/24.
//

import Foundation
import UIKit
import CoreData

//struct CoreDataManager {
//    
//    var appDelegate = UIApplication.shared.delegate as! AppDelegate
//    var context: NSManagedObjectContext? = nil
//    
//    init() {
//        context = appDelegate.persistentContainer.viewContext
//    }
//    
//    func getUser(userName: String) -> User? {
//        
//        let request = User.fetchRequest()
//        
//        let predicate = NSPredicate(format: "userName MATCHES %@", userName)
//        request.predicate = predicate
//        
//        if let user = try? context?.fetch(request).first {
//            return user
//        }else {
//            return nil
//        }
//    }
//    func createUser(userName: String, email: String) {
//        
//        if let _ = getUser(userName: userName) {
//            print("user is exit")
//        } else {
//            let newUser = User(context: self.context!)
//            newUser.userName = userName
//            email.email = email
//            
//            appDelegate.saveContext()
//        }
//    }
//}
