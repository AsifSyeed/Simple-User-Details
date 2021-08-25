//
//  SummaryViewController.swift
//  userDetails
//
//  Created by BS-236 on 24/8/21.
//

import UIKit

class SummaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var summaryTableView: UITableView!
    
    var showDataModel: [DataModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        summaryTableView.delegate = self
        summaryTableView.dataSource = self
        
        summaryTableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        summaryTableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableViewCell")
        summaryTableView.register(UINib(nibName: "RadioButtonTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "RadioButtonTitleTableViewCell")
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return showDataModel!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = showDataModel![indexPath.row]
        
        if model.cellType == .profileImageView {
            if let cell = summaryTableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as? ImageTableViewCell {
                cell.profileImageView.image = UIImage(named: model.fieldValue ?? "")
                return cell
            }
        } else if model.cellType == .normal {
            if let cell = summaryTableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell") as? UserInfoTableViewCell {
                cell.titleLabel.text = model.fieldName ?? ""
                cell.userInfoLabel.text = model.fieldValue ?? ""
                
                return cell
            }
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
