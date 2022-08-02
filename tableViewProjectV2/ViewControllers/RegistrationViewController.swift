//
//  RegistrationViewController.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 30.07.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let user = User(username: "login", password: "password")
    
    private var animal: String = ""
    private var animalName: [String] = []
    private var animalVaccines: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func saveButtonPressed() {
        
    }
    
    
//    MARK: - PrepareForSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vaccineCV = segue.destination as? VaccineViewController else { return }
        vaccineCV.title = "Vaccine Selection"
    }
    
    @IBAction func unwindTo(_ unwindSegue: UIStoryboardSegue) {
        guard let vaciineVC = unwindSegue.source as? VaccineViewController else { return }
        animalVaccines = vaciineVC.selectedVaccines
        print(animalVaccines)
        
    }
    
    @IBAction func vaccineButtonPressed() {
        performSegue(withIdentifier: "showVaccine", sender: nil)
    }
}

// MARK: - UITableViewDataSource

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
            animalName.append(textField.text ?? "No value")
        default:
            animalName.append(textField.text ?? "No value")
        }
        print(animalName)
    }
    
}

// MARK: - ENUM

extension RegistrationViewController {
    
    enum AllCell: CaseIterable {
        case name, age, type, vaccine
    }
    
}


