//
//  ModelsAPI.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 10/02/21.
//

import UIKit
import Alamofire

class ModelsAPI: NSObject {
    
func recuperaMarcas(veiculos:Array<Veiculo>, sucesso:@escaping(_ dicionarioDeModels:Dictionary<String, Any>) -> Void, falha:@escaping(_ error:Error) -> Void) {
    
    guard let url = URL(string: "https://the-vehicles-api.herokuapp.com/brands/") else { return }
    var listaDeVeiculos:Array<Dictionary<String, Any>> = []
    var json:Dictionary<String, Any> = [:]
    
    for veiculo in veiculos {
        
        guard let brand = veiculo.brand else { break }
        guard let model = veiculo.model else { break }
        guard let vehicle = veiculo.vehicle else { break }
        guard let gasTank = veiculo.gasTank else { break }
        
        let dicionarioDeVeiculos = [
            "id": "\(veiculo.objectID)",
            "brand": brand,
            "model": model,
            "vehicle": vehicle,
            "gasTank": gasTank,
        ]
        listaDeVeiculos.append(dicionarioDeVeiculos as [String:Any])
    }
    
    json = [
        "list": [
            ["veiculo": listaDeVeiculos]
        ]
    ]
    
    do {
        var requisicao = URLRequest(url: url)
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        requisicao.httpBody = data
        requisicao.httpMethod = "POST"
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: requisicao, completionHandler: { (data, response, error) in
            if error == nil {
                do {
                    let dicionario = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any>
                    sucesso(dicionario)
                } catch {
                    falha(error)
                }
            }
        })
        task.resume()
        
    } catch {
        print(error.localizedDescription)
    }
    
}

}
