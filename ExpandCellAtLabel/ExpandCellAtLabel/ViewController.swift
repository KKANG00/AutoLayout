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
        cell.titleLabel.text = "기사\(indexPath.row+1)"
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
        
        dataModels.append(ExpandDataModel.init(description: "울산 코로나 6명 확진…모두 기존 확진자 접촉자", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "한국은행이 올해 실질 국내총생산(GDP) 성장률 전망치를 4.0%로 유지했다. 코로나19 4차 대유행 속에서도 수출 호조와 온라인 소비 증가, 정부의 재난지원금 등 재정 정책 효과를 고려한 것으로 해석된다. 하지만 소비자물가 상승률의 경우 원유·원자재 가격 상승, 소비 회복 등을 반영해 2.1%로 올려 잡았다. 한은은 26일 발표한 수정 경제전망을 통해 올해 실질 GDP 성장률은 4.0%로, 지난 5월 전망치와 동일하게 유지했다. 7월 초 이후 약 두 달 가까이 코로나19 4차 유행과 강화된 거리두기가 이어지고 있지만, 경제 회복세에 큰 타격이 없을 것으로 판단했다는 뜻이다.", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "지역 바이오산업 육성과 고부가가치 창출을 위한 '마이크로바이옴 웰에이징 사업단이 첫발을 내디뎠다.", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "2020 도쿄올림픽에서 한국이 몇 개의 메달을 땄는지 기억하십니까? 아니 금메달은 몇 개 땄는지 기억하시나요? 아마 기억을 하지 못하는 분들이 기억하는 분들보다 더 많을 겁니다. 우리가 알던 그 올림픽이 끝나가고 있습니다. ‘태극전사’가 불굴의 투혼을 발휘해 ‘조국에 계신 국민 여러분’을 위해 메달 사냥을 나서던 그 올림픽 말입니다. 도쿄올림픽에서도 한국 대표팀은 수많은 스타를 배출했습니다. 이들은 메달을 딴 선수들에게만 국한되지 않았습니다. 남자 높이뛰기의 우상혁, 여자배구팀, 다이빙 우하람, 여자역도 이선미, 남자 25m 속사권총 한대윤 등은 시민들의 박수갈채를 받은 당당한 4위였습니다. 이들도 과거처럼 “메달을 못 따서 미안하다”며 고개를 숙이지 않았습니다. 대신 “최선을 다했다” “상대가 더 잘했다” “또 도전하겠다”며 상대의 손을 들어주었습니다.", isExpand: false))
        dataModels.append(ExpandDataModel.init(description: "엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 글 엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청엄청 긴 긴 글", isExpand: false))
        tableView.dataSource = self
        tableView.delegate = self
    }
    

}

