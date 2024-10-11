import UIKit

class PlacesCell: UICollectionViewCell {
    
    let cellContainer: UIView = {
        let cont = UIView()
        cont.backgroundColor = .white
        cont.layer.cornerRadius = 20
        cont.clipsToBounds = true
        cont.translatesAutoresizingMaskIntoConstraints = false
        return cont
    }()
    let cellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let textTypeCell: UILabel = {
        let label = UILabel()
        label.font = .notoSans(fontType: .regular, size: 20)
        label.textColor = .mainText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let textLocCell: UILabel = {
        let label = UILabel()
        label.font = .notoSans(fontType: .thin, size: 18)
        label.textColor = .secondText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
    }
    func setSubviews() {
        contentView.addSubview(cellContainer)
        contentView.addSubview(cellImage)
        contentView.addSubview(textTypeCell)
        contentView.addSubview(textLocCell)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            cellContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContainer.heightAnchor.constraint(equalToConstant: 213),
            cellContainer.widthAnchor.constraint(equalToConstant: 157)
        ])
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: cellContainer.topAnchor, constant: 12),
            cellImage.leadingAnchor.constraint(equalTo: cellContainer.leadingAnchor, constant: 12),
            cellImage.heightAnchor.constraint(equalToConstant: 138),
            cellImage.widthAnchor.constraint(equalToConstant: 134)
        ])
        NSLayoutConstraint.activate([
            textTypeCell.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 6),
            textTypeCell.leadingAnchor.constraint(equalTo: cellContainer.leadingAnchor, constant: 13),
            textTypeCell.trailingAnchor.constraint(equalTo: cellContainer.trailingAnchor, constant: -13)
        ])
        NSLayoutConstraint.activate([
            textLocCell.topAnchor.constraint(equalTo: textTypeCell.bottomAnchor),
            textLocCell.leadingAnchor.constraint(equalTo: textTypeCell.leadingAnchor),
            textLocCell.trailingAnchor.constraint(equalTo: textTypeCell.trailingAnchor),
            
        ])
    }
    func configure(with mount: Mountain){
        textTypeCell.text = mount.name
        textLocCell.text = mount.location
        if let url = URL(string: mount.mountain_img) {
            loadImage(from: url)
        }
    }
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error with img\(error.localizedDescription)")
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("eror with data img")
                return
            }
            
            DispatchQueue.main.async {
                self.cellImage.image = image
            }
        }.resume()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
