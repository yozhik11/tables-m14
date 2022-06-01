//
//  CellNewsRecordModel.swift
//  m14
//
//  Created by Natalia Shevaldina on 02.02.2022.
//

import UIKit

struct CellNewsRecordModel {
  let title: String
  let publishedAt: String
  
  
  //Возвращает элемент новой модели с датой и текстом новости
  func forNewStruct (_ value: CellNewsRecordModel) -> NewStruct {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
    return NewStruct(title: value.title, publishedAt: dateWithoutTime(dateFormatter.date(from: value.publishedAt)!))
  }
  
  //Преобразует дату через компоненты календаря в дату с одинаковым временем
  func dateWithoutTime (_ value: Date) -> Date {
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.year, .month, .day], from: value)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter.date(from: "\(components.day!)-\(components.month!)-\(components.year!)")!
  }
}

struct NewStruct {
  var title: String
  var publishedAt: Date
}

struct SectionStruct {
  var dateTitle: Date
  var section: [NewStruct]
}


