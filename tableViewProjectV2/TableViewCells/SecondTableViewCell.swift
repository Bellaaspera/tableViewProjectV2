//
//  SecondTableViewCell.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 30.07.2022.
//

import UIKit

protocol SecondTableViewCellDelegate {

}

class SecondTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    let pickerYears = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let pickerMonths = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var selectedYear: String?
    var selectedMonth: String?
    
    var delegate: SecondTableViewCellDelegate?
    
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondTF.delegate = self
        secondTF.inputView = pickerView
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .systemPink
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension SecondTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerYears.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if component == 0 {
                return "\(pickerYears[row]) years"
            } else {
                return "\(pickerMonths[row]) months"
            }
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0 {
                let year = pickerYears[row].formatted()
                selectedYear = year
            } else {
                let month = pickerMonths[row].formatted()
                selectedMonth = month
            }
            
            guard let year = selectedYear, let month = selectedMonth else { return }
            secondTF.text = "\(year) years \(month) months"
        }
}
