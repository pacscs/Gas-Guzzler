//
//  AlcoolGasolinaViewController.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 08/02/21.
//

import UIKit
import CoreData

class AlcoolGasolinaViewController: UIViewController{

    
    @IBOutlet weak var textFieldGasolina: UITextField!
    @IBOutlet weak var textFieldAlcool: UITextField!

    @IBAction func buttonCalcular (_ sender: UIButton) {
       
        let gasolina = (textFieldGasolina.text! as NSString).doubleValue
        let alcool = (textFieldAlcool.text! as NSString).doubleValue
        
        if (alcool / gasolina < 0.7) {
            let alert = UIAlertController(title: "Atenção", message: "Recomendamos o uso de Alcool", preferredStyle: UIAlertController.Style.alert)
        } else { (alcool / gasolina >= 0.7)
            let alert = UIAlertController(title: "Atenção", message: "Recomendamos o uso de Gasolina", preferredStyle: UIAlertController.Style.alert)
        
            alert.addAction(UIAlertAction(title: "Boa Viagem!!!", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        }
        
    }

}
