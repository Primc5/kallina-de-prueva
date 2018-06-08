//
//  P2.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class P2: UIViewController, DataHolderDelegate {
    @IBOutlet var btnAttack2:UIButton?
    @IBOutlet var btnDefence2:UIButton?
    @IBOutlet var btnEnd2:UIButton?
    
    @IBOutlet var btnTop2:UIButton?
    @IBOutlet var btnMid2:UIButton?
    @IBOutlet var btnBot2:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var mode2:Int = 0
    @IBAction func clickAttack2(_sender : Any){
        mode2 = 0
    }
    @IBAction func clickDefence2(_sender : Any){
        mode2 = 1
    }
    var atk2: Int?
    var def2: Int?
    
    @IBAction func clickTop2(_sender:Any){
        if (mode2 == 1){
            def2 = 1
        }
        else if(mode2 == 0){
            atk2 = 1
        }
    }
    @IBAction func clickMid2(_sender:Any){
        if (mode2 == 1){
            def2 = 2
        }
        else if(mode2 == 0){
            atk2 = 2
        }
    }
    
    @IBAction func clickBot2(_sender:Any){
        if (mode2 == 1){
            def2 = 3
        }
        else if(mode2 == 0){
            atk2 = 3
        }
    }
    
    @IBAction func end(_ sender: Any){
        if(def2 != nil || atk2 != nil){
            Dataholder.sharedInstance.guardarp2(atk2: atk2!, def2: def2!, delegate: self)
            self.performSegue(withIdentifier: "trbatalla", sender: self)
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
