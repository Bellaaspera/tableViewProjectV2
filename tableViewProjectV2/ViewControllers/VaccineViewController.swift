//
//  VaccineViewController.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 30.07.2022.
//

import UIKit

class VaccineViewController: UIViewController {
    
    private let vaccines = ["Vaccine 1", "Vaccine 2", "Vaccine 3"]
    var selectedVaccines: [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func saveButtonPressed() {
        
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension VaccineViewController: UITableViewDataSource, UITableViewDelegate, VaccineCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vaccines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "vaccineCell", for: indexPath)
            as? VaccineTableViewCell {
            cell.delegate = self
            cell.vaccineNameLabel.text = vaccines[indexPath.row]
            cell.vaccineSwitch.isOn = false
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func switchPressed(sender: UISwitch, cell: VaccineTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        if cell.vaccineSwitch.isOn  {
            selectedVaccines.append(cell.vaccineNameLabel.text!)
            print ("Switch changed on row \((indexPath).row)")
        } else {
            selectedVaccines.append("No selected options")
        }
    }
}

