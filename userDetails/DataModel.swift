//
//  DataModel.swift
//  userDetails
//
//  Created by BS-236 on 19/8/21.
//

import Foundation

enum DataInputCellType {
    case normal, profileImageView, radioOption, userInput, radioButtonTitle
}

class DataModel {
    var cellType: DataInputCellType?
    var sectionName: String?
    var fieldName: String?
    var fieldValueCheck: Bool?
    var fieldValue: String?
    
    static func initData (cellType: DataInputCellType?, sectionName: String?, fieldName: String?, fieldValueCheck: Bool?, fieldValue: String?) -> DataModel {
        let model = DataModel()
        
        model.cellType = cellType ?? .normal
        model.sectionName = sectionName ?? ""
        model.fieldName = fieldName ?? ""
        model.fieldValueCheck = fieldValueCheck
        model.fieldValue = fieldValue ?? ""
        
        
        return model
    }
}
