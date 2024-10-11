import Foundation
import UIKit
class InfoPlaceVC: UIViewController {
    var mountsInfo: Mountain?
    
    let headerText: UILabel = {
        let label = UILabel()
        label.textColor = .mainText
        label.font = .notoSans(fontType: .light, size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let infoContainer: UIView = {
        let cont = UIView()
        cont.backgroundColor = .white
        cont.layer.cornerRadius = 20
        cont.clipsToBounds = true
        cont.translatesAutoresizingMaskIntoConstraints = false
        return cont
    }()
    let mountImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let nameMount: UILabel = {
        let label = UILabel()
        label.textColor = .mainText
        label.font = .notoSans(fontType: .regular, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let locMount: UILabel = {
        let label = UILabel()
        label.textColor = .mainText
        label.font = .notoSans(fontType: .light, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let altitudeMount: UILabel = {
        let label = UILabel()
        label.textColor = .mainText
        label.font = .notoSans(fontType: .bold, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let flag: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let scrollText: UIScrollView = {
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    let labelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .mainText
        label.font = .notoSans(fontType: .light, size: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgMenu
//        print(mountsInfo!)
        headerText.text = "This is a \(mountsInfo?.name ?? "None")"
        nameMount.text = mountsInfo?.name ?? "None"
        locMount.text = mountsInfo?.location ?? "Hz gde"
        altitudeMount.text = mountsInfo?.altitude ?? "None"
        labelDescription.text = mountsInfo?.description ?? "None"
        if let imageUrlString = mountsInfo?.mountain_img, let url = URL(string: imageUrlString) {
            loadImage(from: url, imageView: mountImage)
        }
        if let imageUrlString = mountsInfo?.country_flag_img, let url = URL(string: imageUrlString) {
            loadImage(from: url, imageView: flag)
        }
        setSubviews()
        makeConstraints()
    }
    func setSubviews(){
        view.addSubview(headerText)
        view.addSubview(infoContainer)
        view.addSubview(mountImage)
        view.addSubview(nameMount)
        view.addSubview(locMount)
        view.addSubview(altitudeMount)
        view.addSubview(flag)
        infoContainer.addSubview(scrollText)
        scrollText.addSubview(labelDescription)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            headerText.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headerText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23)
        ])
        NSLayoutConstraint.activate([
            infoContainer.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 20),
            infoContainer.leadingAnchor.constraint(equalTo: headerText.leadingAnchor),
            infoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            infoContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            mountImage.topAnchor.constraint(equalTo: infoContainer.topAnchor, constant: 11),
            mountImage.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 17),
            mountImage.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor, constant: -17),
            mountImage.heightAnchor.constraint(equalToConstant: 286),
        ])
        NSLayoutConstraint.activate([
            nameMount.topAnchor.constraint(equalTo: mountImage.bottomAnchor, constant: 11),
            nameMount.leadingAnchor.constraint(equalTo: mountImage.leadingAnchor, constant: 6),
            
            locMount.topAnchor.constraint(equalTo: nameMount.bottomAnchor, constant: 2),
            locMount.leadingAnchor.constraint(equalTo: nameMount.leadingAnchor),
            
            altitudeMount.topAnchor.constraint(equalTo: locMount.bottomAnchor, constant: 4),
            altitudeMount.leadingAnchor.constraint(equalTo: nameMount.leadingAnchor),
            
            flag.topAnchor.constraint(equalTo: nameMount.topAnchor),
            flag.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor, constant: 216),
            flag.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor, constant: -34),
            flag.heightAnchor.constraint(equalToConstant: 62)
        ])
        NSLayoutConstraint.activate([
            scrollText.topAnchor.constraint(equalTo: altitudeMount.bottomAnchor, constant: 10),
            scrollText.leadingAnchor.constraint(equalTo: nameMount.leadingAnchor),
            scrollText.trailingAnchor.constraint(equalTo: mountImage.trailingAnchor),
            scrollText.bottomAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: 10),
            
            labelDescription.topAnchor.constraint(equalTo: scrollText.topAnchor),
            labelDescription.leadingAnchor.constraint(equalTo: scrollText.leadingAnchor),
            labelDescription.trailingAnchor.constraint(equalTo: scrollText.trailingAnchor),
            labelDescription.bottomAnchor.constraint(equalTo: scrollText.bottomAnchor, constant: -10),
            labelDescription.widthAnchor.constraint(equalTo: scrollText.widthAnchor),
            
        ])
    }
    func loadImage(from url: URL, imageView: UIImageView) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                    return
                }
                guard let data = data, let image = UIImage(data: data) else {
                    print("Error loading image data")
                    return
                }
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }.resume()
        }
}
