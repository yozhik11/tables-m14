//
//  ViewController.swift
//  m14
//
//  Created by Natalia Shevaldina on 18.01.2022.
//

import UIKit

class FirstVC: UIViewController {
  
  let cellWithLabelAndImage = "CellWithLabelAndImage"

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.tableHeaderView = headerView
    tableView.separatorStyle = .singleLine
    return tableView
  }()
  
  private lazy var headerView: UILabel = {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    label.text = "Задание 1"
    return label
  }()
    
  let dataWithImages: [CellWillLabelAndImageViewModel] = [
    CellWillLabelAndImageViewModel (text: "Austria", image: Constants.Image.austria),
    CellWillLabelAndImageViewModel (text: "Belgium", image: Constants.Image.belgium),
    CellWillLabelAndImageViewModel (text: "France", image: Constants.Image.france),
    CellWillLabelAndImageViewModel (text: "Germany", image: Constants.Image.germany),
    CellWillLabelAndImageViewModel (text: "Greece", image: Constants.Image.greece)
  ]
  
  override func viewDidLoad() {    
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.register(CellWillLabelAndImage.self, forCellReuseIdentifier: cellWithLabelAndImage)
    tableView.dataSource = self
    tableView.delegate = self
    setupViews()
    setupConstraints()
  }
  
  private func setupViews () {
    view.addSubview(tableView)
  }
  
  private func setupConstraints () {
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    tableView.rowHeight = 80
  }
}

extension FirstVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    dataWithImages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellWithLabelAndImage) as? CellWillLabelAndImage
    let viewModel = dataWithImages[indexPath.row]
    cell?.configure(viewModel)
    return cell ?? UITableViewCell()
  }
}

extension FirstVC: UITableViewDelegate {}
