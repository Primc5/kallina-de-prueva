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
    @IBOutlet var PLAY:UIButton?
    @IBOutlet var Custom:UIButton?
    
    @IBOutlet var user: UITextField?
    @IBOutlet var pass: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Custom?.isEnabled = false
        if(Dataholder.sharedInstance.comprobarlogueado() == 1){
            Custom?.isEnabled = true
        }
        Dataholder.sharedInstance.reseteo()
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
            Custom?.isEnabled = true
        }
    }
    

    
    
    @IBAction func entrar(){
        self.performSegue(withIdentifier: "transitionLogin", sender: self)
        
    }
}

