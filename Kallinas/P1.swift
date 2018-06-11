//
//  P1.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class P1: UIViewController, DataHolderDelegate {
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        Top?.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        Top?.addGestureRecognizer(longGesture)
        //------
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(normalTap2(_:)))
        tapGesture.numberOfTapsRequired = 1
        Mid?.addGestureRecognizer(tapGesture)
        
        let longGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(longTap2(_:)))
        Mid?.addGestureRecognizer(longGesture)
        //----------
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(normalTap3(_:)))
        tapGesture.numberOfTapsRequired = 1
        Mid?.addGestureRecognizer(tapGesture)
        
        let longGesture3 = UILongPressGestureRecognizer(target: self, action: #selector(longTap3(_:)))
        Mid?.addGestureRecognizer(longGesture)
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func normalTap(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 1
        }
        else if(mode == 0 && atk1 != -1){
            atk1 = 1
        }
        else{
            atk = 1
        }
    }
    @IBAction func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            atk = 1
            atk1 = -1
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //------------------
    @IBAction func normalTap2(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 2
        }
        else if(mode == 0 && atk1 != -1){
            atk1 = 2
        }
        else{
            atk = 2
        }
    }
    
    @IBAction func longTap2(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            atk = 2
            atk1 = -1
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //--------------
    @IBAction func normalTap3(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 3
        }
        else if(mode == 0 && atk1 != -1){
            atk1 = 3
        }
        else{
            atk = 3
        }
    }
    
    @IBAction func longTap3(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            atk = 3
            atk1 = -1
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    var mode:Int = 0
    @IBAction func clickAttack(_ sender: Any) {
        mode = 0
    }
    
    @IBAction func clickDefence(_ sender: Any) {
        mode = 1
    }
    
    var atk:Int?
    var atk1:Int = -1
    var def:Int?
    
    @IBAction func clickTop(_ sender: Any){


    }
    @IBAction func clickMid(_ sender: Any){

    }
    @IBAction func clickBot(_ sender: Any){

    }
    
    @IBAction func end(_ sender: Any){
        if(def != nil || atk != nil){
            Dataholder.sharedInstance.guardarp1(atk: atk!, atk1: atk1, def: def!, delegate: self)
            self.performSegue(withIdentifier: "transitionp2", sender: self)
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
