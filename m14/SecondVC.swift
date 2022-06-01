//
//  SecondVC.swift
//  m14
//
//  Created by Natalia Shevaldina on 18.01.2022.
//

import UIKit

class SecondVC: UIViewController {
  
  let cellNewsRecordModel = "CellNewsRecordModel"
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.separatorStyle = .singleLine
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.register(CellNewsRecord.self, forCellReuseIdentifier: cellNewsRecordModel)
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
    tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    tableView.rowHeight = 80
  }
}

func makingNewSectionModel () -> [SectionStruct] {
  //Собираем новую модель из новости и даты без времени
  let onlyDate: [NewStruct] = models2.map{$0.forNewStruct($0)}

  //Группируем новости по дате в словаре
  let groupNews = Dictionary(grouping: onlyDate) {$0.publishedAt}
  
  //Собираем новую модель с массивом секций и сортируем по дате
  var sectionArr: [SectionStruct] = []
  for (publishedAt, title) in groupNews{
    sectionArr.append(SectionStruct(dateTitle: publishedAt, section: title))
  }
  sectionArr.sort{$0.dateTitle > $1.dateTitle}
  return sectionArr
}

let finalArray = makingNewSectionModel()

extension SecondVC: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
      return finalArray.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let section = finalArray[section]
    let date = section.dateTitle
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy"
    return dateFormatter.string(from: date)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let section = finalArray[section]
    return section.section.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellNewsRecordModel) as? CellNewsRecord
    let viewModel = finalArray[indexPath.section].section[indexPath.row]
    cell?.configure(viewModel)
    return cell ?? UITableViewCell()
  }
}

extension SecondVC: UITableViewDelegate { }

