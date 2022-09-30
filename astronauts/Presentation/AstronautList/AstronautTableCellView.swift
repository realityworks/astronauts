//
//  AstronautTableCellView.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import UIKit
import TinyConstraints

class AstronautTableViewCell: UITableViewCell {
    static let identifier = "AstronautTableViewCell"

    private let nameLabel = UILabel()
    private let nationalityLabel = UILabel()
    private let thumbnailImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Configure Thumbnail view
        let imageContainer = UIView()
        contentView.addSubview(imageContainer)

        imageContainer.leftToSuperview()
        imageContainer.topToSuperview()
        imageContainer.bottomToSuperview()
        imageContainer.width(100)
        imageContainer.aspectRatio(1)

        imageContainer.addSubview(thumbnailImageView)
        thumbnailImageView.centerYToSuperview()
        thumbnailImageView.centerXToSuperview()
        thumbnailImageView.width(90)
        thumbnailImageView.aspectRatio(1)
        thumbnailImageView.contentMode = .scaleAspectFit

        // Configure nameLabel view
        contentView.addSubview(nameLabel)

        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.numberOfLines = 0

        nameLabel.leftToRight(of: imageContainer, offset: 8)
        nameLabel.rightToSuperview()
        nameLabel.topToSuperview(offset: 16)

        // Configure nationalityLabel
        contentView.addSubview(nationalityLabel)

        nationalityLabel.font = .systemFont(ofSize: 14)
        nationalityLabel.numberOfLines = 0
        nationalityLabel.lineBreakMode = .byWordWrapping

        nationalityLabel.leftToRight(of: imageContainer, offset: 8)
        nationalityLabel.topToBottom(of: nameLabel, offset: 16)
        nationalityLabel.rightToSuperview()
        nationalityLabel.bottomToSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        thumbnailImageView.image = nil
        nameLabel.text = ""
        nationalityLabel.text = ""
    }

    func update(with astronaut: Astronaut) {
        nameLabel.text = astronaut.name
        nationalityLabel.text = astronaut.nationality

        thumbnailImageView.load(
            from: URL(string: astronaut.profile_image_thumbnail)
        )
    }
}
