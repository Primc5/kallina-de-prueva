//
//  ViewController.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 29/5/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataHolderDelegate {
    
    @IBOutlet var LOGIN:UIButton?
    
    @IBOutlet var user: UITextField?
    @IBOutlet var pass: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cliclogevent(){
        Dataholder.sharedInstance.Login(delegate: self, sEmail: (user?.text)!, sContrasena: (pass?.text)!)
        
    }

    func dataHolderLogin(blfin: Bool) {
        if blfin==true{
            print(open)
            
        }
    }
    var open:Int = 0
    @IBAction func entrar(){
        if(Dataholder.sharedInstance.user != ""){
            open = 1
        }
        if(open > 0){
            self.performSegue(withIdentifier: "transitionLogin", sender: self)
        }
    }
}

