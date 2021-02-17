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
                print(response.result.value!)
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    
}
