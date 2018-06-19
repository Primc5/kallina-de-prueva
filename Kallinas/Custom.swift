//
//  Custom.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 11/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class  Custom: UIViewController , UITableViewDelegate, UITableViewDataSource, DataHolderDelegate{
    @IBOutlet var tbMiTabla:UITableView?
    @IBOutlet var accept:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        DataHolder.sharedInstance.descargarCapuchas(delegate: self)
        
        
       
    }
    
    @IBAction func aceptar(){
        var enlace:String
        enlace = capuchas[myIndex]
        DataHolder.sharedInstance.subirFoto(link: enlace)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaCapucha(blnFin: Bool){
        if blnFin == true{
            self.refreshUI()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arCapuchas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCCelula = tableView.dequeueReusableCell(withIdentifier: "micelda1")as! TVCCelula
        
        cell.lblNombre?.text = DataHolder.sharedInstance.arCapuchas[indexPath.row].sNombre
        cell.descargarImagenes(url: DataHolder.sharedInstance.arCapuchas[indexPath.row].sFoto!)
        
        return cell
    }
    
    let capuchas=["gs://kallinas-5b7a3.appspot.com/Personalización/Capucha/captura1.1.png",
               "gs://kallinas-5b7a3.appspot.com/Personalización/Capucha/captura1.2.png",
               "gs://kallinas-5b7a3.appspot.com/Personalización/Capucha/captura1.3.png"
    ]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCCelula", for: indexPath as IndexPath) as UITableViewCell
        
        cell.textLabel?.text=capuchas[indexPath.row]
        print(cell)
        print(capuchas[indexPath.row])
        return cell
    }
    
    var myIndex = 0

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex = indexPath.row
        print(myIndex)
    }
   
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.tbMiTabla?.reloadData()
        })
    }
    
}

