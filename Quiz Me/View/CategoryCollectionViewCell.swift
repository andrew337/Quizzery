//
//  CategoryCollectionViewCell.swift
//  Quiz Me
//
//  Created by Admin on 8/30/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    var imageView : UIImageView!
    
    var titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .label
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
       contentView.layer.shadowColor = UIColor.black.cgColor
       contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
       contentView.layer.shadowRadius = 5.0
       contentView.layer.shadowOpacity = 1
    }
    
    func setUp(name : String) {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        //imageView?.frame = contentView.bounds
        imageView?.image = UIImage(named: name)
        titleLabel.text = updateTitle(oldName: name)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    func updateTitle(oldName : String?) -> String {
        
        guard let oldName = oldName else {
            return ""
        }

        let newName = oldName.replacingOccurrences(of: "_", with: " ")
        let newNameUpper = newName.uppercased()
        return newNameUpper
    }
}
