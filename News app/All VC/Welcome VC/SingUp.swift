//
//  SingUp.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 05/02/24.
//

import UIKit
import CoreData

class SingUp: UIViewController {

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
        
        let vc = SingIn(nibName: "SingIn", bundle: nil)
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
        if (usernameTF.text != "") && (emailTF.text != "") {
            
            let newUser = User(context: self.context!)
            newUser.userName = usernameTF.text!
            newUser.email = emailTF.text!
            
            print(newUser)
            appDelegate.saveContext()
            UserDefaults.standard.set(true, forKey: "isLogin")
            UserDefaults.standard.set(newUser.userName, forKey: "userName")
            
            let vc1 = TabbarVC()
            vc1.modalTransitionStyle = .coverVertical
            vc1.modalPresentationStyle = .fullScreen
            self.present(vc1, animated: true)
        }
    }
}
