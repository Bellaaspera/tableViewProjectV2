//
//  FirstTableViewCell.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 30.07.2022.
//

import UIKit

protocol FirstTableViewCellDelegate {

}

class FirstTableViewCell: UITableViewCell {
    
    var delegete: FirstTableViewCellDelegate?

    @IBOutlet weak var firstTF: UITextField!
    
    
}
