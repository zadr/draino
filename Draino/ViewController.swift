import UIKit

class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        glitch()

        UIApplication.shared.isIdleTimerDisabled = true
    }

    @objc func glitch() {
        view.subviews.forEach { $0.removeFromSuperview() }

        for _ in 0 ..< arc4random_uniform(256 * 256) {
            let v = UIView(frame: CGRect(x: Int(arc4random_uniform(UInt32(view.frame.size.width))),
                                         y: Int(arc4random_uniform(UInt32(view.frame.size.height))),
                                         width: Int(arc4random_uniform(UInt32(view.frame.size.width))),
                                         height: Int(arc4random_uniform(UInt32(view.frame.size.height)))))
            v.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)) / CGFloat(255),
                                        green: CGFloat(arc4random_uniform(255)) / CGFloat(255),
                                        blue: CGFloat(arc4random_uniform(255)) / CGFloat(255),
                                        alpha: CGFloat(arc4random_uniform(255)) / CGFloat(255))
            v.layer.cornerRadius = CGFloat(arc4random_uniform(UInt32(max(v.frame.size.width, v.frame.size.height))))
            view.addSubview(v)
        }

        perform(#selector(glitch), with: nil, afterDelay: 1.0)
    }
}
