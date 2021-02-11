//
//  ModelsAPI.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 10/02/21.
//

import UIKit
import Alamofire

class ModelsAPI: NSObject {
    
    func recuperaMarcas() {
        Alamofire.request("https://parallelum.com.br/fipe/api/v1/carros/marcas", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                
                break
            case .failure:
                print(response.error!)
                break
            }
        }
    }
    

}
