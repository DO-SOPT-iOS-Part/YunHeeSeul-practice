import UIKit

import SnapKit
import Then

class MVCPracticeVC: UIViewController {
    var soptModel: [SoptMember] = [SoptMember(name: "류희재", winning: false, age: 24),
                                   SoptMember(name: "강민수", winning: false, age: 24),
                                   SoptMember(name: "고아라", winning: false, age: 23),
                                   SoptMember(name: "곽성준", winning: false, age: 24),
                                   SoptMember(name: "신지원", winning: false, age: 24),
                                   SoptMember(name: "김가현", winning: false, age: 23),
                                   SoptMember(name: "김다예", winning: false, age: 24),
                                   SoptMember(name: "김민주", winning: false, age: 23),
                                   SoptMember(name: "김보연", winning: false, age: 23),
                                   SoptMember(name: "김선우", winning: false, age: 23),
                                   SoptMember(name: "김연수", winning: false, age: 25),
                                   SoptMember(name: "김태경", winning: false, age: 25),
                                   SoptMember(name: "박윤빈", winning: false, age: 22),
                                   SoptMember(name: "박준혁", winning: false, age: 27),
                                   SoptMember(name: "방민지", winning: false, age: 26),
                                   SoptMember(name: "변상우", winning: false, age: 25),
                                   SoptMember(name: "변희주", winning: false, age: 23),
                                   SoptMember(name: "윤영서", winning: false, age: 22),
                                   SoptMember(name: "윤희슬", winning: false, age: 24),
                                   SoptMember(name: "이민재", winning: false, age: 24),
                                   SoptMember(name: "이우제", winning: false, age: 24),
                                   SoptMember(name: "이윤학", winning: false, age: 25),
                                   SoptMember(name: "이자민", winning: false, age: 24),
                                   SoptMember(name: "이조은", winning: false, age: 23),
                                   SoptMember(name: "이지희", winning: false, age: 24),
                                   SoptMember(name: "전효원", winning: false, age: 23),
                                   SoptMember(name: "정채은", winning: false, age: 23),
                                   SoptMember(name: "최서연", winning: false, age: 23),
                                   SoptMember(name: "최효리", winning: false, age: 23)]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
    }
    
    private func setLayout() {
        [tableView, randomButton].forEach {
            self.view.addSubview($0)
        }
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        randomButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
    
    @objc private func randomButtonTap() {
        let randomIndex = Int.random(in: 0 ... self.soptModel.count - 1)
        self.soptModel[randomIndex].winning = true
        self.tableView.reloadData()
    }
    
    private lazy var randomButton = UIButton().then {
        $0.setTitle("두근두근 뽑기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self,
                     action: #selector(randomButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
    }
    private lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(CustomTVC.self, forCellReuseIdentifier: CustomTVC.identifier)
        $0.dataSource = self
        $0.delegate = self
    }
}
extension MVCPracticeVC: UITableViewDelegate{}
extension MVCPracticeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soptModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVC.identifier, for: indexPath) as? CustomTVC else {return UITableViewCell()}
        cell.setData(name: soptModel[indexPath.row].name,
                     isWinning: soptModel[indexPath.row].winning,
                     age: soptModel[indexPath.row].age)
        return cell
    }
}
