//
//  SingIn.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 05/02/24.
//

import UIKit
import CoreData

class SingIn: UIViewController {
    
    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = appDelegate.persistentContainer.viewContext
        nextBtn.layer.cornerRadius = 15
        conteneirView.layer.cornerRadius = 15
       
    }

    @IBAction func singUpBtn(_ sender: UIButton) {
        
        let login = SingUp(nibName: "SingUp", bundle: nil)
        login.modalTransitionStyle = .coverVertical
        login.modalPresentationStyle = .fullScreen
        
        self.present(login, animated: true)
        
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        
        if (usernameTF.text != "") && (emailTF.text != "" ) {
            
            let request: NSFetchRequest<User> = User.fetchRequest()
            
            let predicate = NSPredicate(format: "userName MATCHES %@", usernameTF.text!)
            request.predicate = predicate
            
            if let user = try? context?.fetch(request).first {
                
               
                if user.email == emailTF.text {
                        
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        UserDefaults.standard.set(user.userName, forKey: "userName")
                        
                        let vc1 = TabbarVC()
                        
                        vc1.modalTransitionStyle = .coverVertical
                        vc1.modalPresentationStyle = .fullScreen
                        self.present(vc1, animated: true)
                        return
                    }
                    print("parol xato")
                } else {
                    print("userName xato")
                }
            }
       
    }
    
}
