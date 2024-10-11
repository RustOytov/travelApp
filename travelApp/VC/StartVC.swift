import UIKit

class StartVC: UIViewController {
    let bgImage: UIImageView = {
        let image = UIImageView()
        image.image = .startBg
        image.frame = UIScreen.main.bounds
        image.contentMode = .scaleAspectFill
        return image
    }()
    let headerText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0

        let fullText = "Let’s enjoy the \nBeautiful \nWorld"
        label.font = .notoSans(fontType: .light, size: 40)
        let attributedString = NSMutableAttributedString(string: fullText)

        let boldRange = (fullText as NSString).range(of: "Beautiful \nWorld")
        let boldFont = UIFont.notoSans(fontType: .bold, size: 40)
        attributedString.addAttribute(.font, value: boldFont, range: boldRange)

        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let downMountain: UIImageView = {
        let image = UIImageView()
        image.image = .dowmMountain
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let signButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        let title = "Sign in"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.notoSans(fontType: .bold, size: 20),
            .foregroundColor: UIColor.white
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = .bg
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let createButton: UIButton = {
        let button = UIButton()
        let title = "Create an account"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.notoSans(fontType: .bold, size: 20),
            .foregroundColor: UIColor.white
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = .button
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        let title = "Skip"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.notoSans(fontType: .bold, size: 20),
            .foregroundColor: UIColor.white
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .bg
        self.view.insertSubview(bgImage, at: 0)
        setSubviews()
        makeContstraints()
    }
    
    func setSubviews() {
        view.addSubview(headerText)
        view.addSubview(downMountain)
        view.addSubview(signButton)
        view.addSubview(createButton)
        view.addSubview(skipButton)
    }
    func makeContstraints() {
        NSLayoutConstraint.activate([
            headerText.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            headerText.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30)
        ])
        NSLayoutConstraint.activate([
            downMountain.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 200),
            downMountain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            downMountain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            downMountain.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            signButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.heightAnchor.constraint(equalToConstant: 54),
            signButton.widthAnchor.constraint(equalToConstant: 315)
        ])
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 20),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.heightAnchor.constraint(equalToConstant: 54),
            createButton.widthAnchor.constraint(equalToConstant: 315)
        ])
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 20),
            skipButton.centerXAnchor.constraint(equalTo: createButton.centerXAnchor)
        ])
    }
    @objc private func buttonAction() {
        let menuVC = MenuVC()
        let navController = UINavigationController(rootViewController: menuVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
}

