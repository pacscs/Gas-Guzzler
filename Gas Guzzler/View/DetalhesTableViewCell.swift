//
//  DetalhesTableViewCell.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 08/02/21.
//

import UIKit

class DetalhesTableViewCell: UITableViewCell {

    @IBOutlet weak var labelVeiculo: UILabel!
    
    func configuraCelula(_ veiculo:Veiculo) {
        labelVeiculo.text = veiculo.vehicle
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
