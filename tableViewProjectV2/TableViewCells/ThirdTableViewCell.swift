//
//  ThirdTableViewCell.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 30.07.2022.
//

import UIKit

protocol ThirdTableViewCellDelegate {

}

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var thirdTF: UITextField!
    
    var delegate: ThirdTableViewCellDelegate?
    

}
