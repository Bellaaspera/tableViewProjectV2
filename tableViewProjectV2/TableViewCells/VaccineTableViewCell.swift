//
//  VaccineTableViewCell.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 30.07.2022.
//

import UIKit

protocol VaccineCellDelegate {
    func switchPressed(sender: UISwitch, cell: VaccineTableViewCell)
}

class VaccineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vaccineNameLabel: UILabel!
    @IBOutlet weak var vaccineSwitch: UISwitch!
    
    var delegate: VaccineCellDelegate?

    @IBAction func switchPressed(_ sender: UISwitch) {
        self.delegate?.switchPressed(sender: sender, cell: self)
        }
    
}
