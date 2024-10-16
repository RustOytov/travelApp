import Foundation
import UIKit

class PlacesVC: UIViewController, UICollectionViewDelegateFlowLayout{
    let userIconCircle: UIImageView = {
        let image = UIImageView()
        image.image = .circle
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let userIconMan: UIImageView = {
        let image = UIImageView()
        image.image = .user
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let userName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .mainText

        let fullText = "Michel \nAlexander"
        label.font = .notoSans(fontType: .light, size: 24)
        let attributedString = NSMutableAttributedString(string: fullText)

        let boldRange = (fullText as NSString).range(of: "Alexander")
        let boldFont = UIFont.notoSans(fontType: .regular, size: 24)
        attributedString.addAttribute(.font, value: boldFont, range: boldRange)

        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let burgerMenu: UIImageView = {
        let image = UIImageView()
        image.image = .burger
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let secondTitle: UILabel = {
        let label = UILabel()
        label.textColor = .mainText

        let fullText = "Let’s travel now"
        label.font = .notoSans(fontType: .light, size: 35)
        let attributedString = NSMutableAttributedString(string: fullText)

        let boldRange = (fullText as NSString).range(of: "travel")
        let boldFont = UIFont.notoSans(fontType: .bold, size: 35)
        attributedString.addAttribute(.font, value: boldFont, range: boldRange)

        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelCollection: UILabel = {
        let label = UILabel()
        label.text = "Mountains"
        label.textColor = .mainText
        label.font = .notoSans(fontType: .regular, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionView: UICollectionView!
    let search = UISearchBar()
    var mount: [Mountain] = []
    var filteredItems: [Mountain] = []
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .adventure
        setSubviews()
        setupSearchBar()
        makeConstraints()

        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .mainText
        navigationItem.backBarButtonItem = backButton
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 260, left: 30, bottom: 30, right: 30)
        
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PlacesCell.self, forCellWithReuseIdentifier: "PlacesCell")
        collectionView.backgroundColor = .clear

        let api = MountApi()
        api.fetchMountains {
            DispatchQueue.main.async {
                self.mount = api.mountainsRes
                self.filteredItems = self.mount
                self.collectionView.reloadData()
            }
        }
        view.addSubview(collectionView)
        view.bringSubviewToFront(search)
    }
    //MARK: setSubviews and Constraints
    func setSubviews() {
        view.addSubview(userIconCircle)
        view.addSubview(userIconMan)
        view.addSubview(userName)
        view.addSubview(burgerMenu)
        view.addSubview(secondTitle)
        view.addSubview(search)
        view.addSubview(labelCollection)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            userIconCircle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            userIconCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userIconCircle.heightAnchor.constraint(equalToConstant: 65),
            userIconCircle.widthAnchor.constraint(equalToConstant: 65),
            
            userIconMan.topAnchor.constraint(equalTo: userIconCircle.topAnchor, constant: 5),
            userIconMan.leadingAnchor.constraint(equalTo: userIconCircle.leadingAnchor,constant: 15.7),
            userIconMan.trailingAnchor.constraint(equalTo: userIconCircle.trailingAnchor,constant: -15.6),
            userIconMan.bottomAnchor.constraint(equalTo: userIconCircle.bottomAnchor, constant: 1.5),
            
            userName.topAnchor.constraint(equalTo: userIconCircle.topAnchor, constant: 8),
            userName.leadingAnchor.constraint(equalTo: userIconCircle.trailingAnchor, constant: 20),
            
            burgerMenu.topAnchor.constraint(equalTo: userName.topAnchor, constant: 18),
            burgerMenu.leadingAnchor.constraint(equalTo: userName.trailingAnchor, constant: 100),
            burgerMenu.heightAnchor.constraint(equalToConstant: 25),
            burgerMenu.widthAnchor.constraint(equalToConstant: 34),
        ])
        NSLayoutConstraint.activate([
            secondTitle.topAnchor.constraint(equalTo: userIconCircle.bottomAnchor, constant: 30),
            secondTitle.leadingAnchor.constraint(equalTo: userIconCircle.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 15),
            search.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            search.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        NSLayoutConstraint.activate([
            labelCollection.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 21),
            labelCollection.leadingAnchor.constraint(equalTo: secondTitle.leadingAnchor)
        ])
    }
    //MARK: - setupSearchBar
    func setupSearchBar() {
        search.delegate = self
        search.placeholder = "Search"
        search.searchBarStyle = .minimal
        search.backgroundColor = .white
        search.layer.cornerRadius = 20
        search.searchTextField.textColor = .black
        search.searchTextField.backgroundColor = .white
        search.translatesAutoresizingMaskIntoConstraints = false
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let visibleCells = collectionView.visibleCells
            let disappearThreshold: CGFloat = 300

            for cell in visibleCells {
                if let indexPath = collectionView.indexPath(for: cell) {
                    let cellPosition = collectionView.convert(cell.frame, to: view).origin.y


                    if cellPosition < disappearThreshold {
                        let distance = disappearThreshold - cellPosition
                        let alpha = max(0, 1 - (distance / 100))
                        cell.alpha = alpha
                    } else {
                        cell.alpha = 1
                    }
                }
            }
        }
}
//MARK: - DataSource
extension PlacesVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCell", for: indexPath) as! PlacesCell
        let mountain = filteredItems[indexPath.row]
        cell.configure(with: mountain)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 215)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infoPlaceVC = InfoPlaceVC()
        infoPlaceVC.mountsInfo = mount[indexPath.row]
        self.navigationController?.pushViewController(infoPlaceVC, animated: true)
    }
}
extension PlacesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredItems = mount
        } else {
            filteredItems = mount.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        collectionView.reloadData()
    }
}

