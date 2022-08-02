//
//  ResultViewController.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 02.08.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var pet = Pet(animalType: .dog)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(pet.name): \n\(pet.animalType) \n\(pet.age) \n\(pet.breed) \n\(pet.vaccinations.joined(separator: ", "))"
    }
    
    private func getData() {
        
        
    }

 

}
