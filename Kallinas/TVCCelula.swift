//
//  TVCCelula.swift
//  Kallinas
//
//  Created by PABLO CRUZ MENDEZ on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit
import Firebase
class TVCCelula: UITableViewCell, DataHolderDelegate {

    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgCelda1:UIImageView?
    var ImagenDescargada:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func descargarImagenes(url:String){
        self.imgCelda1?.image = nil
        Dataholder.sharedInstance.executeimagen(clave: url, delegate: self)

    }
    func imagen(imagen: UIImage) {
        self.imgCelda1?.image = imagen
    }

    
}
