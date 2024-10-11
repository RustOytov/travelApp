import Foundation
import UIKit
class MenuVC: UIViewController {
    
    let bgImage: UIImageView = {
        let image = UIImageView()
        image.image = .menuBg
        image.frame = UIScreen.main.bounds
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let nameUserText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let fullText = "Michel \nAlexander"
        label.font = .notoSans(fontType: .regular, size: 40)
        let attributedText = NSMutableAttributedString(string: fullText)
        
        let boldRange = (fullText as NSString).range(of: "Alexander")
        let boldFont = UIFont.notoSans(fontType: .bold, size: 40)
        attributedText.addAttribute(.font, value: boldFont, range: boldRange)
        
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mainText

        return label
    }()
    
    let secondText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "We focus a lot on helping the first time \nor inexperienced traveler head out"
        label.textColor = .secondText
        label.font = .notoSans(fontType: .light, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userIcon: UIImageView = {
        let image = UIImageView()
        image.image = .userIcon
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let ticketsContainer: UIView = {
        let cont = UIView()
        cont.backgroundColor = .tickets
        cont.layer.cornerRadius = 20
        cont.contentMode = .scaleAspectFill
        cont.translatesAutoresizingMaskIntoConstraints = false
        return cont
    }()
    
    let hotelsContainer: UIView = {
        let cont = UIView()
        cont.backgroundColor = .hotels
        cont.layer.cornerRadius = 20
        cont.contentMode = .scaleAspectFill
        cont.translatesAutoresizingMaskIntoConstraints = false
        return cont
    }()
    
    let adventureContainer: UIView = {
        let cont = UIView()
        cont.backgroundColor = .adventure
        cont.layer.cornerRadius = 20
        cont.contentMode = .scaleAspectFill
        cont.translatesAutoresizingMaskIntoConstraints = false
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapedAdventure))
//        cont.addGestureRecognizer(tapGesture)
//        cont.isUserInteractionEnabled = true
        return cont
    }()
    //tickets
    let ticketsImage: UIImageView = {
        let image = UIImageView()
        image.image = .tickets
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let ticketsHeadText: UILabel = {
        let label = UILabel()
        label.text = "Tickets"
        label.textColor = .mainText
        label.font = .notoSans(fontType: .regular, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ticketsSecondText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Make your booking \nwith Flexifly and \nenjoy "
        label.textColor = .mainText
        label.font = .notoSans(fontType: .light, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //hotels
    let hotelsImage: UIImageView = {
        let image = UIImageView()
        image.image = .hotels
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let hotelsHeadText: UILabel = {
        let label = UILabel()
        label.text = "Hotels"
        label.textColor = .mainText
        label.font = .notoSans(fontType: .regular, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let hotelsSecondText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "The Ideal Hotel at a \nGreat Price"
        label.textColor = .mainText
        label.font = .notoSans(fontType: .light, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //adventure
    let adventureImage: UIImageView = {
        let image = UIImageView()
        image.image = .adventure
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let adventureHeadText: UILabel = {
        let label = UILabel()
        label.text = "Adventure"
        label.textColor = .mainText
        label.font = .notoSans(fontType: .regular, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let adventureSecondText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Find & book tours, \nadventures, \nactivities"
        label.textColor = .mainText
        label.font = .notoSans(fontType: .light, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let buttonAdventure: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapedAdventure), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgMenu
        self.view.insertSubview(bgImage, at: 0)
        setSubviews()
        makeConstraints()
    }
    
    func setSubviews() {
        view.addSubview(nameUserText)
        view.addSubview(secondText)
        view.addSubview(userIcon)
        view.addSubview(ticketsContainer)
        view.addSubview(hotelsContainer)
        view.addSubview(adventureContainer)
        //tickets
        view.addSubview(ticketsImage)
        view.addSubview(ticketsHeadText)
        view.addSubview(ticketsSecondText)
        //hotels
        view.addSubview(hotelsImage)
        view.addSubview(hotelsHeadText)
        view.addSubview(hotelsSecondText)
        //adventure
        view.addSubview(adventureImage)
        view.addSubview(adventureHeadText)
        view.addSubview(adventureSecondText)
        
        view.addSubview(buttonAdventure)
        
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            nameUserText.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            nameUserText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
            secondText.topAnchor.constraint(equalTo: nameUserText.bottomAnchor, constant: 15),
            secondText.leadingAnchor.constraint(equalTo: nameUserText.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            userIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            userIcon.leadingAnchor.constraint(equalTo: nameUserText.trailingAnchor, constant: 50),
            userIcon.heightAnchor.constraint(equalToConstant: 80),
            userIcon.widthAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            ticketsContainer.topAnchor.constraint(equalTo: secondText.bottomAnchor, constant: 40),
            ticketsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ticketsContainer.heightAnchor.constraint(equalToConstant: 140),
            ticketsContainer.widthAnchor.constraint(equalToConstant: 320)
        ])
        NSLayoutConstraint.activate([
            hotelsContainer.topAnchor.constraint(equalTo: ticketsContainer.bottomAnchor, constant: 20),
            hotelsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hotelsContainer.heightAnchor.constraint(equalToConstant: 140),
            hotelsContainer.widthAnchor.constraint(equalToConstant: 320)
        ])
        NSLayoutConstraint.activate([
            adventureContainer.topAnchor.constraint(equalTo: hotelsContainer.bottomAnchor, constant: 20),
            adventureContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adventureContainer.heightAnchor.constraint(equalToConstant: 140),
            adventureContainer.widthAnchor.constraint(equalToConstant: 320)
        ])
        //tickets
        NSLayoutConstraint.activate([
            ticketsImage.topAnchor.constraint(equalTo: ticketsContainer.topAnchor, constant: 15),
            ticketsImage.leadingAnchor.constraint(equalTo: ticketsContainer.leadingAnchor, constant: 5),
            ticketsImage.heightAnchor.constraint(equalToConstant: 120),
            ticketsImage.widthAnchor.constraint(equalToConstant: 130)
        ])
        NSLayoutConstraint.activate([
            ticketsHeadText.topAnchor.constraint(equalTo: ticketsContainer.topAnchor, constant: 19),
            ticketsHeadText.leadingAnchor.constraint(equalTo: ticketsImage.trailingAnchor, constant: 5),
        ])
        NSLayoutConstraint.activate([
            ticketsSecondText.topAnchor.constraint(equalTo: ticketsHeadText.bottomAnchor, constant: 4),
            ticketsSecondText.leadingAnchor.constraint(equalTo: ticketsHeadText.leadingAnchor)
        ])
        
        //hotels
        NSLayoutConstraint.activate([
            hotelsImage.topAnchor.constraint(equalTo: hotelsContainer.topAnchor, constant: 27),
            hotelsImage.leadingAnchor.constraint(equalTo: hotelsContainer.leadingAnchor, constant: 15),
            hotelsImage.heightAnchor.constraint(equalToConstant: 86),
            hotelsImage.widthAnchor.constraint(equalToConstant: 112)
        ])
        NSLayoutConstraint.activate([
            hotelsHeadText.topAnchor.constraint(equalTo: hotelsContainer.topAnchor, constant: 27),
            hotelsHeadText.leadingAnchor.constraint(equalTo: ticketsHeadText.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            hotelsSecondText.topAnchor.constraint(equalTo: hotelsHeadText.bottomAnchor, constant: 4),
            hotelsSecondText.leadingAnchor.constraint(equalTo: hotelsHeadText.leadingAnchor)
        ])
        //adventure
        NSLayoutConstraint.activate([
            adventureImage.topAnchor.constraint(equalTo: adventureContainer.topAnchor, constant: 30),
            adventureImage.leadingAnchor.constraint(equalTo: adventureContainer.leadingAnchor, constant: 14),
            adventureImage.heightAnchor.constraint(equalToConstant: 85),
            adventureImage.widthAnchor.constraint(equalToConstant: 110)
        ])
        NSLayoutConstraint.activate([
            adventureHeadText.topAnchor.constraint(equalTo: adventureContainer.topAnchor, constant: 17),
            adventureHeadText.leadingAnchor.constraint(equalTo: ticketsHeadText.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            adventureSecondText.topAnchor.constraint(equalTo: adventureHeadText.bottomAnchor, constant: 4),
            adventureSecondText.leadingAnchor.constraint(equalTo: hotelsHeadText.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonAdventure.topAnchor.constraint(equalTo: hotelsContainer.bottomAnchor, constant: 20),
            buttonAdventure.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAdventure.heightAnchor.constraint(equalToConstant: 140),
            buttonAdventure.widthAnchor.constraint(equalToConstant: 320)
        ])
    }
    @objc private func tapedAdventure() {
        let placesVC = PlacesVC()
        let navController = UINavigationController(rootViewController: placesVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
}
