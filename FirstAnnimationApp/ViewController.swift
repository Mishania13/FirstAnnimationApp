//
//  ViewController.swift
//  FirstAnnimationApp
//
//  Created by Mr. Bear on 27.04.2020.
//  Copyright © 2020 Mr. Bear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ImageOutlets
    @IBOutlet weak var mainCpuImg: UIView!
    @IBOutlet weak var leftLine: UIView!
    @IBOutlet weak var rightLine: UIView!
    @IBOutlet weak var leftDownTrans: UIView!
    @IBOutlet weak var centerDownTrans: UIView!
    @IBOutlet weak var rightDownTrans: UIView!
    @IBOutlet weak var detail1: UIView!
    @IBOutlet weak var detail2: UIView!
    @IBOutlet weak var detail3: UIView!

    
    //OtherOutlets
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    // Support view's
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup UI
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        
        userNameField.placeholder = "User Login"
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        
        activityIndicator.frame = CGRect(x: 20,
                                         y: loginButton.frame.size.height/2 - 10,
                                         width: 20,
                                         height: 20)
        activityIndicator.hidesWhenStopped = true
        loginButton.addSubview(activityIndicator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        titleLabel.center.x  -= view.bounds.width
        
        userNameField.center.x += view.bounds.width
        passwordField.center.x -= view.bounds.width
        
        detail1.center.x += view.bounds.width
        detail2.center.x -= view.bounds.width
        detail3.center.x -= view.bounds.width
        
        leftDownTrans.center.y += 40
        centerDownTrans.center.y += 40
        rightDownTrans.center.y += 40
    
        loginButton.center.x += 50
        loginButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1,
                       delay: 0.3,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: {
                        self.userNameField.center.x -= self.view.bounds.width
                        self.passwordField.center.x += self.view.bounds.width
        },
                       completion: nil)
        
        UIView.animate(withDuration: 1, delay: 1.8, options: [], animations: {

            self.centerDownTrans.center.y -= 40
            self.leftDownTrans.center.y -= 40
            self.rightDownTrans.center.y -= 40
           
        },
        completion: nil)
        
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.loginButton.center.x -= 50
                        self.loginButton.alpha = 1
        },
                       completion: nil)
    }
    
    @IBAction func loginButtonTapped () {
        
        UIView.animate(withDuration: 1.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: {
                        self.loginButton.bounds.size.width += 80
                        self.loginButton.center.y += 20

                        self.activityIndicator.startAnimating()
        },
                       completion: nil)
        
        UIView.animate(withDuration: 0.33,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: {
                        self.loginButton.backgroundColor = UIColor(
                            displayP3Red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0
                        )
        },
                       completion: nil)
//        performSegue(withIdentifier: "Logined", sender: nil)
    }
    //Delay func
    
    func delay(_ seconds: Double, completion: @escaping ()->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    }
}

