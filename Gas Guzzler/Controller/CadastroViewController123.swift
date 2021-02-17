//
//  ViewController.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 08/01/21.
//

import UIKit
import CoreData


class CadastroViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var brandTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var vehicleTextField: UITextField!
    @IBOutlet var gasTankTextField: UITextField!
    
    @IBOutlet weak var modelPickerView: UIPickerView!
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func buttonNextStep(_ sender: UIButton) {
        let veiculo = Veiculo(context: contexto)
        veiculo.brand = brandTextField.text
        veiculo.model = modelTextField.text
        veiculo.vehicle = vehicleTextField.text
        veiculo.gasTank = gasTankTextField.text
        veiculo.model = modelPickerView
        
        do {
            try contexto.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
        
    }

    @IBAction func buttonSair(_ sender: UIButton) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    

    
    
    
}

