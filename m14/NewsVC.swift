//
//  NewsVC.swift
//  m14
//
//  Created by Natalia Shevaldina on 31.01.2022.
//

import UIKit

class NewsVC: UIViewController {
  
  private lazy var labelDescription: UITextView = {
    let label = UITextView()
    label.font = Constants.Fonts.systemText
    label.textColor = Constants.Colors.greenSc
    label.textAlignment = .left
    return label
  }()
  
  private lazy var labelLocation: UILabel = {
    let label = UILabel()
    label.font = Constants.Fonts.systemText
    label.textColor = Constants.Colors.greenSc
    label.textAlignment = .left
    return label
  }()
  
  func configureNews(_ viewModel: CellNewsWithLocationModel) {
    labelDescription.text = viewModel.description
    labelLocation.text = viewModel.location
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
  
  private func setupViews () {
    view.addSubview(labelDescription)
    view.addSubview(labelLocation)
    view.backgroundColor = .white
  }
  
  private func setupConstraints () {
    labelDescription.translatesAutoresizingMaskIntoConstraints = false
    labelDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    labelDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    labelDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    labelDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    labelLocation.translatesAutoresizingMaskIntoConstraints = false
    labelLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    labelLocation.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    labelLocation.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    labelLocation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
  
}
