//
//  ViewController.swift
//  tableView
//
//  Created by Bennard brune Parker on 02/03/2020.
//  Copyright © 2020 Solirize. All rights reserved.
//

import UIKit

//class ViewController: UITableViewController {
//
//    let cellId = "CellID"
//
//    let names = [
//        ["John", "Steve", "Peter"],
//        ["Karl", "Pipito", "Degustator"],
//        ["Freddy", "Alex", "Julia", "Megan"],
//        ["Pepegan!"]
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        navigationItem.title = "Contacts"
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return names.count
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        label.text = String(section)
//        label.backgroundColor = .red
//        return label
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return names[section].count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//
//
//        cell.textLabel?.text = self.names[indexPath.section][indexPath.row]
//        cell.backgroundColor = .orange
//        return cell
//    }
//}

class SecondViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "CellID"
    let supViewId = "SupId"
    
    let names = [
        ["plane_forest", "Steve", "John"],
        ["Karl", "Pepegan"],
        ["Freddy", "Alex", "plane_forest", "Megan", "Steve", "Megan", "plane_forest", "Steve"],
        ["Pepegan!"],
        ["Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve", "Steve"]
    ]
    
    override func loadView() {
        super.loadView()
        
//        navigationItem.title = "Contact!"
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView?.register(MyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(SupCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: supViewId)
        collectionView?.backgroundColor = .lightGray
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return names.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCell

    cell.imageView.image = UIImage(named: names[indexPath.section][indexPath.row])
        cell.backgroundColor = .orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.view.bounds.width / 3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: supViewId, for: indexPath) as! SupCell
        
        
        headerView.titleView.text = String(indexPath.section)
        return headerView
    }
}

class SupCell: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.backgroundColor = .lightGray
    }
    
    let titleView: UILabel = {
        let textView = UILabel()
        textView.backgroundColor = .darkGray
        textView.textColor = .white
        return textView
    }()
    
    func setupViews() {
        addSubview(titleView)
        titleView.textAlignment = .center
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = .blue
        //        imageView.image = UIImage(named: "someName")
        return iV
    }()
    
    func setupViews() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
