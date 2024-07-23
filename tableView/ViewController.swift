//
//  ViewController.swift
//  tableView
//
//  Created by admin on 23/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        
        myTableView.register(
          UINib(nibName: "AcademyTableViewCell", bundle: nil),
          forCellReuseIdentifier: "HeroCell"
        )
    }
}


// MARK: Mengimplementasikan UITableViewDataSource ke dalam ViewController.
extension ViewController: UITableViewDataSource {

  // MARK: Mengetahui berapa banyak item yang akan muncul.
    func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
 
    // MARK: Mendapatkan jumlah item dari dummyAcademyData.
    return dummyAcademyData.count
  }
 
  // MARK: Mengatur bagaimana tampilan dari setiap TableViewCell.
    func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
 
    // MARK: Mencari AcademyTableViewCell berdasarkan Identifier.
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: "HeroCell",
      for: indexPath
    ) as? AcademyTableViewCell {
 
      // MARK: Menetapkan nilai gambar dan nama untuk setiap cell/item.
      let academy = dummyAcademyData[indexPath.row]
      cell.myLabel.text = academy.name
      cell.myImage.image = academy.image
 
      // MARK: Mengembalikan cell agar bisa ditampilkan dalam TableView.
      return cell
    } else {
 
      // MARK: Mengembalikan UITableViewCell ketika cell bernilai nil/null.
      return UITableViewCell()
    }
  }
 
}
