//
//  DetalhesAbastecimentoTableViewController.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 25/02/21.
//

import UIKit
import CoreData

class DetalhesAbastecimentoTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var gerenciadorAbastecimento:NSFetchedResultsController<Abastecimento>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recuperaAbastecimento()
    }
    
    
    func recuperaAbastecimento() {
        
        
        let pesquisaAbastecimento:NSFetchRequest<Abastecimento> = Abastecimento.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "data", ascending: true)
        pesquisaAbastecimento.sortDescriptors = [ordenaPorNome]
        
        gerenciadorAbastecimento = NSFetchedResultsController(fetchRequest: pesquisaAbastecimento, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        gerenciadorAbastecimento?.delegate = self
        do {
            try gerenciadorAbastecimento?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let contadorListaDeAbastecimentos  = gerenciadorAbastecimento?.fetchedObjects?.count else { return 0 }
        return contadorListaDeAbastecimentos
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as! DetalhesAbastecimentoTableViewCell
        
        guard let abastecimento = gerenciadorAbastecimento?.fetchedObjects![indexPath.row] else { return celula }
        celula.configuraCelulaAbastecimento(abastecimento)
        return celula
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let veiculoSelecionado = gerenciadorAbastecimento?.fetchedObjects![indexPath.row] else { return }
            contexto.delete(veiculoSelecionado)
            
            do {
                try contexto.save()
            } catch {
                print(error.localizedDescription)
            }
        } else if editingStyle == .insert {
            
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .fade)
            break
        default:
            tableView.reloadData()
        }
    }
    
    @IBAction func buttonSair(_ sender: UIButton) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
}
