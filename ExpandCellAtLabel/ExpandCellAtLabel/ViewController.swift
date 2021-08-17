//
//  ViewController.swift
//  ExpandCellAtLabel
//
//  Created by KKANG on 2021/08/17.
//

import UIKit

class ExpandCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dscrLabel: UILabel!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels = [ExpandDataModel]()
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandCell", for: indexPath) as! ExpandCell
        let dataRowAt = dataModels[indexPath.row]
        cell.dscrLabel.text = dataRowAt.description
        
        if dataRowAt.isExpand {
            // text 줄 수만큼 전부 표현
            cell.dscrLabel.numberOfLines = 0
        }
        else {
            cell.dscrLabel.numberOfLines = 1
        }
        
        return cell
    }
    
    // 높이에 따른 UI적 퍼포먼스 해결방법
    // heightForRowAt 정확한 높이 지정
    // tableView.reloadData
    // tableView.estimatedSelectionHeaderHeight = 0
    // tableView.estimatedSelectionHeaderHeight = 0
    // 애니메이션 효과를 없애기
    // UIView.setAnimationsEnabled(false)
    // 사용 후 다시 true로 돌려줘야함
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        print(dataModels[indexPath.row].isExpand)
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataModels.append(ExpandDataModel.init(description: "짧은 글", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 글 엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 긴 글", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "짧은 글", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 글 엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 긴 글", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 글 엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 긴 글", isExpand: false))
        tableView.dataSource = self
        tableView.delegate = self
    }
    

}

