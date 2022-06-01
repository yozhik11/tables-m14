//
//  CellWillLabelAndImage.swift
//  m14
//
//  Created by Natalia Shevaldina on 18.01.2022.
//

import UIKit

class CellNewsWithLocation: UITableViewCell {
  
  private lazy var labelTitle: UILabel = {
    let label = UILabel()
    label.font = Constants.Fonts.systemText
    label.textColor = Constants.Colors.greenSc
    label.textAlignment = .left
    return label
  }()

  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.spacing = 16
    stackView.addArrangedSubview(labelTitle)
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
  
  func configure(_ viewModel: CellNewsWithLocationModel) {
    labelTitle.text = viewModel.name
  }
  
  private func setupConstraints() {
    stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    stackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
  }
}
