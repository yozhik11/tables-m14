//
//  CellNewsRecord.swift
//  m14
//
//  Created by Natalia Shevaldina on 02.02.2022.
//

import UIKit

class CellNewsRecord: UITableViewCell {
  
  private lazy var news: UILabel = {
    let label = UILabel()
    label.font = Constants.Fonts.systemText
    label.textColor = Constants.Colors.greenSc
    label.textAlignment = .left
    return label
  }()

  private lazy var dateAd: UILabel = {
    let label = UILabel()
    label.font = Constants.Fonts.systemTextData
    label.textColor = Constants.Colors.greenSc
    label.textAlignment = .right
    return label
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.addArrangedSubview(dateAd)
    stackView.addArrangedSubview(news)
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
  
  func configure(_ viewModel: NewStruct) {
    let date = viewModel.publishedAt
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy"
    dateAd.text = dateFormatter.string(from: date)
    news.text = viewModel.title
  }
  
  private func setupConstraints() {
    stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    stackView.widthAnchor.constraint(equalToConstant: 370).isActive = true
  }
}
