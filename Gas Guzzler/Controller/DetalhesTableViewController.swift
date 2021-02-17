//
//  detailsViewController.swift
//  Gas Guzzler
//
//  Created by Paulo Alfredo Coraini de Souza on 05/02/21.
//

import UIKit
import CoreData

class DetalhesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var gerenciador:NSFetchedResultsController<Veiculo>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recuperaVeiculo()
    }
    
    
    func recuperaVeiculo() {
        
        VeiculoAPI().recuperaVeiculo()
        
        let pesquisaVeiculo:NSFetchRequest<Veiculo> = Veiculo.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "vehicle", ascending: true)
        pesquisaVeiculo.sortDescriptors = [ordenaPorNome]
        
        gerenciador = NSFetchedResultsController(fetchRequest: pesquisaVeiculo, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        gerenciador?.delegate = self
        do {
            try gerenciador?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let contadorListaDeVeiculos  = gerenciador?.fetchedObjects?.count else { return 0 }
        return contadorListaDeVeiculos
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaVeiculo", for: indexPath) as! DetalhesTableViewCell
      
        guard let veiculo = gerenciador?.fetchedObjects![indexPath.row] else { return celula }
        celula.configuraCelula(veiculo)
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let veiculoSelecionado = gerenciador?.fetchedObjects![indexPath.row] else { return }
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

}
