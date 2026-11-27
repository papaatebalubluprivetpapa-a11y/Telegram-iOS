import UIKit
import TelegramUI
import AccountContext

public final class AorusSettingsController: ViewController {
    private let context: AccountContext
    private var ghostMode = true
    private var stars: Int64 = 999999999
    
    public init(context: AccountContext) {
        self.context = context
        super.init(navigationBarPresentationData: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Aorus"
        self.view.backgroundColor = .systemBackground
        
        let titleLabel = UILabel()
        titleLabel.text = "Aorus"
        titleLabel.font = .systemFont(ofSize: 34, weight: .bold)
        
        let ghostLabel = UILabel()
        ghostLabel.text = "Ghost Mode"
        
        let ghostSwitch = UISwitch()
        ghostSwitch.isOn = ghostMode
        ghostSwitch.addTarget(self, action: #selector(ghostChanged), for: .valueChanged)
        
        let starsLabel = UILabel()
        starsLabel.text = "Stars: \(stars)"
        starsLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        starsLabel.tag = 100
        
        let addButton = UIButton(type: .system)
        addButton.setTitle("+10000 Stars", for: .normal)
        addButton.addTarget(self, action: #selector(addStars), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, ghostLabel, ghostSwitch, starsLabel, addButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func ghostChanged(_ sender: UISwitch) {
        ghostMode = sender.isOn
    }
    
    @objc private func addStars() {
        stars += 10000
        if let label = self.view.viewWithTag(100) as? UILabel {
            label.text = "Stars: \(stars)"
        }
    }
}
