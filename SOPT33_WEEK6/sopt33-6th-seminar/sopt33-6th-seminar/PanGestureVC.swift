import UIKit
import SnapKit
import Then
import Lottie

class PanGestureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(lottieView)
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        lottieView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
    }
    
    private func isDraging(state: Bool) {
        if state {
            self.lottieView.isHidden = false
            self.lottieView.play()
        } else {
            self.lottieView.isHidden = true
            self.lottieView.pause()
        }
    }
    
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: imageView)
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        self.imageView.center = .init(x: changedX,
                                     y: changedY)
        self.lottieView.center = .init(x: changedX,
                                       y: changedY)
        sender.setTranslation(.zero, in: imageView)
        
        if sender.state == .began {
            self.isDraging(state: true)
        }
        else if sender.state == .ended {
            self.isDraging(state: false)
        }
    }
    
    private let lottieView = LottieAnimationView(name: "dragAnimation").then {
        $0.loopMode = .loop
    }
    private lazy var imageView = UIImageView(image: UIImage(named: "Image")).then {
        $0.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
    }

}
