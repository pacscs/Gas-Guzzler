//
//  AbastecimentoViewController.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 08/02/21.
//

import UIKit
import CoreData


class AbastecimentoViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var textFieldHora: UITextField!
    @IBOutlet weak var textFieldOdometro: UITextField!
    @IBOutlet weak var textFieldTipo: UITextField!
    @IBOutlet weak var textFieldPrecoLitro: UITextField!
    @IBOutlet weak var textFieldPrecoTotal: UITextField!
    @IBOutlet weak var textFieldLitros: UITextField!
    @IBOutlet weak var textFieldPosto: UITextField!
    
    
    
      var contexto:NSManagedObjectContext {
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          return appDelegate.persistentContainer.viewContext
      }
    
    @IBAction func adiconarAbastecimento (_ sender: UIButton) {
        let abastecimento = Abastecimento(context: contexto)
        
        abastecimento.data = textFieldData.text
        abastecimento.hora = textFieldHora.text
        abastecimento.odometro = textFieldOdometro.text
        abastecimento.tipo = textFieldTipo.text
        abastecimento.precoLitro = textFieldPrecoLitro.text
        abastecimento.precoTotal = textFieldPrecoTotal.text
        abastecimento.litros = textFieldLitros.text
        abastecimento.posto = textFieldPosto.text
        
        
        
    }

    
}

