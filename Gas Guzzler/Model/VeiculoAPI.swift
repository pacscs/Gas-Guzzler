//
//  VeiculoAPI.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 17/02/21.
//

import UIKit
import Alamofire

class VeiculoAPI: NSObject {

    func recuperaVeiculo() {
        Alamofire.request("https://the-vehicles-api.herokuapp.com/brands", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value as? Dictionary<String, String> {
                    guard let listaDeMarcas = resposta ["brand"] as? Array<Dictionary<String, String>> else { return }
                    
                    for dicionarioDeVeiculo in listaDeMarcas {
                        VeiculoDAO().salvaCadastro(dicionarioDeVeiculo: dicionarioDeVeiculo)
                    }
                    
                }
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
}
