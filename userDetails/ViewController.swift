//
//  ViewController.swift
//  userDetails
//
//  Created by BS-236 on 19/8/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var userTableView: UITableView!
    
    var tableDataModel = [[DataModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTableView.dataSource = self
        userTableView.delegate = self
        
        userTableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        userTableView.register(UINib(nibName: "userDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "userDetailsTableViewCell")
        userTableView.register(UINib(nibName: "radioOptionTableViewCell", bundle: nil), forCellReuseIdentifier: "radioOptionTableViewCell")
        userTableView.register(UINib(nibName: "UserInputTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInputTableViewCell")
        userTableView.register(UINib(nibName: "RadioButtonTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "RadioButtonTitleTableViewCell")
        
        
        initTableData()
        userTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = tableDataModel[indexPath.section][indexPath.row]
        
        if model.cellType == .profileImageView {
            if let cell = userTableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as? ImageTableViewCell {
                cell.profileImageView.image = UIImage(named: model.fieldValue ?? "")
                return cell
            }
        }  else if model.cellType == .radioButtonTitle {
            if let cell = userTableView.dequeueReusableCell(withIdentifier: "RadioButtonTitleTableViewCell") as? RadioButtonTitleTableViewCell {
                
                cell.radioButtonTitleUpdated.text = model.fieldValue ?? ""
                
                return cell
            }
        } else if model.cellType == .radioOption {
            if let cell = userTableView.dequeueReusableCell(withIdentifier: "radioOptionTableViewCell") as? radioOptionTableViewCell {
                
                cell.optionLabel.text = model.fieldValue ?? ""
                
                if model.fieldValueCheck == false {
                    cell.radioButtonOutlet.setImage(UIImage(systemName: "circle"), for: .normal)
                    cell.radioButtonOutlet.tintColor = .black
                    
                    
                }
                else {
                    cell.radioButtonOutlet.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                    cell.radioButtonOutlet.tintColor = .black
                }
                
                
                
                return cell
                
            }
        }  else if model.cellType == .userInput {
            if let cell = userTableView.dequeueReusableCell(withIdentifier: "UserInputTableViewCell") as? UserInputTableViewCell {
                cell.infoTitleLabel.text = model.fieldName ?? ""
                cell.inputTextField.text = model.fieldValue ?? ""
                cell.inputTextField.placeholder = model.textFieldPlaceholderText ?? ""
                
                cell.inputTextField.delegate = self
                cell.inputTextField.tag = (indexPath.section*100) + indexPath.row
                return cell
            }
        }
        
        
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let model = tableDataModel[indexPath.section][indexPath.row]
        
        if model.cellType == .radioOption {
            let sectionNo = indexPath.section
            let rowNo = indexPath.row
            
            
            if model.fieldValueCheck == false {
                model.fieldValueCheck = true
            }
            else {
                model.fieldValueCheck = true
            }
            
            for (index, dataModel) in tableDataModel.enumerated() {
                if sectionNo == index {
                    for (rowIndex, itemModel) in dataModel.enumerated() {
                        
                        if  rowIndex != rowNo {
                            itemModel.fieldValueCheck = false
                        }
                        
                    }
                }
            }
        }
        
        userTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableDataModel[section].first?.sectionName ?? ""
    }
    
    func initTableData () {
        var inputData = [DataModel]()
        inputData.append(DataModel.initData(cellType: .profileImageView, sectionName: "User Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "profileImage"))
        inputData.append(DataModel.initData(cellType: .userInput, sectionName: "User Details", fieldName: "First Name: ", fieldValueCheck: false, textFieldPlaceholderText: "Enter First Name", fieldValue: ""))
        inputData.append(DataModel.initData(cellType: .userInput, sectionName: "User Details", fieldName: "Last Name: ", fieldValueCheck: false, textFieldPlaceholderText: "Enter Last Name", fieldValue: ""))
        inputData.append(DataModel.initData(cellType: .userInput, sectionName: "User Details", fieldName: "Email: ", fieldValueCheck: false, textFieldPlaceholderText: "Enter Email", fieldValue: ""))
        inputData.append(DataModel.initData(cellType: .userInput, sectionName: "User Details", fieldName: "Phone: ", fieldValueCheck: false, textFieldPlaceholderText: "Enter Phone", fieldValue: ""))
        inputData.append(DataModel.initData(cellType: .userInput, sectionName: "User Details", fieldName: "City: ", fieldValueCheck: false, textFieldPlaceholderText: "Enter City", fieldValue: ""))
        inputData.append(DataModel.initData(cellType: .userInput, sectionName: "User Details", fieldName: "Country: ", fieldValueCheck: false, textFieldPlaceholderText: "Enter Country", fieldValue: ""))
        
        inputData.append(DataModel.initData(cellType: .radioButtonTitle, sectionName: "User Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "Project Type"))
        
        inputData.append(DataModel.initData(cellType: .radioOption, sectionName: "User Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "Local"))
        inputData.append(DataModel.initData(cellType: .radioOption, sectionName: "User Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "Global"))
        
        tableDataModel.append(inputData)
        
        inputData = []
        
        inputData.append(DataModel.initData(cellType: .radioButtonTitle, sectionName: "More Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "Designation"))
        inputData.append(DataModel.initData(cellType: .radioOption, sectionName: "More Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "Junior Engineer"))
        inputData.append(DataModel.initData(cellType: .radioOption, sectionName: "More Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "Mid Engineer"))
        inputData.append(DataModel.initData(cellType: .radioOption, sectionName: "More Details", fieldName: "", fieldValueCheck: false, textFieldPlaceholderText: "", fieldValue: "Senior Engineer"))
        
        inputData.append(DataModel.initData(cellType: .userInput, sectionName: "More Details", fieldName: "About", fieldValueCheck: false, textFieldPlaceholderText: "Enter about you", fieldValue: ""))
        tableDataModel.append(inputData)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let sectionTag = textField.tag / 100
        let indexPathRowTag = textField.tag % 100
        tableDataModel[sectionTag][indexPathRowTag].fieldValue = textField.text
        userTableView.reloadData()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing")
        return true
    }
    
    
    
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField has been cleared")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("\(string)")
        return true
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

