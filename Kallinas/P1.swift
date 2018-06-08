//
//  P1.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class P1: UIViewController {
    @IBOutlet var btnAttack:UIButton?
    @IBOutlet var btnDefence:UIButton?
    @IBOutlet var btnEnd:UIButton?
    
    @IBOutlet var Top:UIButton?
    @IBOutlet var Mid:UIButton?
    @IBOutlet var Bot:UIButton?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       // btnEnd?.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var mode:Int = 0
    @IBAction func clickAttack(_ sender: Any) {
        mode = 0
    }
    
    @IBAction func clickDefence(_ sender: Any) {
        mode = 1
    }
    
    var atk:Int?
    var def:Int?
    
    @IBAction func clickTop(_ sender: Any){
        if(mode == 1){
            def = 1
        }
        else if(mode == 0){
            atk = 1
        }
    }
    @IBAction func clickMid(_ sender: Any){
        if(mode == 1){
            def = 2
        }
        else if(mode == 0){
            atk = 2
        }
    }
    @IBAction func clickBot(_ sender: Any){
        if(mode == 1){
            def = 3
        }
        else if(mode == 0){
            atk = 3
        }
    }
    
    @IBAction func end(_ sender: Any){
        if(def != nil || atk != nil){
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
