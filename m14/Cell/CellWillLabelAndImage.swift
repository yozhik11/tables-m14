//
//  CellWillLabelAndImage.swift
//  m14
//
//  Created by Natalia Shevaldina on 18.01.2022.
//

import UIKit

class CellWillLabelAndImage: UITableViewCell {
  
  private lazy var labelText: UILabel = {
    let label = UILabel()
    label.font = Constants.Fonts.systemText
    label.textColor = Constants.Colors.greenSc
    label.textAlignment = .left
    return label
  }()
  
  private lazy var image: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    return image
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.spacing = 16
    stackView.addArrangedSubview(image)
    stackView.addArrangedSubview(labelText)
    return stackView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(stackView)
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("error")
  }
  
  func configure(_ viewModel: CellWillLabelAndImageViewModel) {
    image.image = viewModel.image
    labelText.text = viewModel.text
  }
  
  private func setupConstraints() {
    stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    stackView.widthAnchor.constraint(equalToConstant: 320).isActive = true
    image.widthAnchor.constraint(equalToConstant: 100).isActive = true
    image.heightAnchor.constraint(equalToConstant: 70).isActive = true
  }
}
