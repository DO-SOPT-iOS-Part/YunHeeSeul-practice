import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(blueView)
        
        blueView.snp.makeConstraints{
//            $0.top.leading.trailing.bottom.equalToSuperview().inset(100)
//            $0.edges.equalToSuperview().offset(100)
            $0.size.equalTo(100)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    let blueView = UIView().then {
        $0.backgroundColor = .systemBlue
        
    }

}

