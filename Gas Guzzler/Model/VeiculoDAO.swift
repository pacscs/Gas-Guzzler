//
//  VeiculosDAO.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 17/02/21.
//

import UIKit
import CoreData

class VeiculoDAO: NSObject {
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    func salvaCadastro(dicionarioDeVeiculo:Dictionary<String, String>){
        let veiculo = Veiculo(context: contexto)
        
        veiculo.brand = dicionarioDeVeiculo["brand"]
        veiculo.model = dicionarioDeVeiculo["model"]
        veiculo.vehicle = dicionarioDeVeiculo["vehicle"]
        veiculo.gasTank = dicionarioDeVeiculo["gasTank"]
        
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
      
        atualizaContexto()
    }
    
    func atualizaContexto() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }




}
