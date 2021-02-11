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
    
    
    let arrayForModels = ["Abarth", "Aixam", "AJP", "AlfaRomeo", "AstonMartin", "Audi", "Austin", "Benelli", "Bentley", "BMW", "Bombardier", "Cadillac", "Caterham", "Chevrolet", "Chrysler", "Citroen", "Dacia", "Daewoo", "Daihatsu", "Datsun", "Dodge", "DS", "Ducati", "Famel", "Ferrari", "Fiat", "Ford", "HarleyDavidson", "Honda", "Hummer", "Husqvarna", "Hyundai", "i-Moto", "Infiniti", "Jaguar", "JDM", "Jeep", "Joint", "Kawasaki", "Keeway", "Kia", "KTM", "Kymco", "Lamborghini", "Lancia", "LandRover", "Lexus", "Lifan", "Ligier", "Lincoln", "LML", "Lotus", "Maserati", "Maybach", "Mazda", "Mercedes-Benz", "MG", "Microcar", "MINI", "Mitsubishi", "Monster", "MotoGuzzi", "MvAgusta", "Nissan", "Opel", "Peugeot", "Piaggio", "Porsche", "Renault", "RollsRoyce", "Rover", "RoyalEinfield", "Saab", "Sachs", "Seat", "Sherco", "Skoda", "Smart", "SsangYong", "Subaru", "Suzuki", "Sym", "Tata", "Tesla", "Toyota", "Triumph", "UMM", "Vespa", "Volkswagen", "Volvo", "Yamaha", "Zongshen", "Zündapp"]
    
        
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

