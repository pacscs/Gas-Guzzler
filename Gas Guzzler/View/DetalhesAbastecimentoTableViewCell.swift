




import UIKit

class DetalhesAbastecimentoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelData: UILabel!
    
    func configuraCelulaAbastecimento(_ abastecimento: Abastecimento) {
        labelData.text = abastecimento.data
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
