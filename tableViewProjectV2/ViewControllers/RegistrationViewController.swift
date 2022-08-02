//
//  RegistrationViewController.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 30.07.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
//    MARK: IBOutlet + properties

    @IBOutlet weak var tableView: UITableView!
    
    private var animalName: [String] = []
    private var animalAge: [String] = []
    private var animalBreed: [String] = []
    private var animalVaccines: [String] = []
    
//    MARK: Override class functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
 
//    MARK: IBActions
    
    @IBAction func saveButtonPressed() {
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
//    MARK: Private funtions
    
    private func getPetData() -> Pet {
        
        var currentPet = Pet(animalType: .dog)
        currentPet.name = animalName[0]
        currentPet.age = animalAge[0]
        currentPet.breed = animalBreed[0]
        currentPet.vaccinations = animalVaccines
        
        return currentPet
        
    }
    
//    MARK: - PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vaccineCV = segue.destination as? VaccineViewController {
            vaccineCV.title = "Vaccine Selection"
        } else if let resultVC = segue.destination as? ResultViewController {
            resultVC.title = "Your Pet Data"
            resultVC.pet = getPetData()
        }
    }
    
    @IBAction func unwindTo(_ unwindSegue: UIStoryboardSegue) {
        guard let vaccineVC = unwindSegue.source as? VaccineViewController else { return }
        animalVaccines = vaccineVC.selectedVaccines
        print(animalVaccines)
        
    }
    
    @IBAction func vaccineButtonPressed() {
        performSegue(withIdentifier: "showVaccine", sender: nil)
    }
}

// MARK: - UITableViewDataSource + UITextFieldDelegate + Custon protocols

extension RegistrationViewController: UITableViewDataSource, FirstTableViewCellDelegate, UITextFieldDelegate, SecondTableViewCellDelegate, ThirdTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Animal data"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AllCell.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstTableViewCell {
                cell.firstTF.delegate = self
                cell.firstTF.tag = indexPath.row
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? SecondTableViewCell {
                cell.secondTF.delegate = self
                cell.secondTF.tag = indexPath.row
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? ThirdTableViewCell {
                cell.thirdTF.delegate = self
                cell.thirdTF.tag = indexPath.row
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "forthCell", for: indexPath) as? ForthTableViewCell {
                cell.tag = indexPath.row
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            animalName.append(textField.text ?? "No value")
        case 1:
            animalAge.append(textField.text ?? "No value")
        default:
            animalBreed.append(textField.text ?? "No value")
        }
        print(animalName, animalAge, animalBreed)
    }
    
}

// MARK: - ENUM

extension RegistrationViewController {
    
    enum AllCell: CaseIterable {
        case name, age, type, vaccine
    }
    
}


