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
        myTableView.delegate = self
        
        myTableView.register(
          UINib(nibName: "AcademyTableViewCell", bundle: nil),
          forCellReuseIdentifier: "HeroCell"
        )
    }
    
    @IBAction func goToWebsite(_ sender: Any) {
        let urlWeb = "https://developer.apple.com/"
          if let url = URL(string: urlWeb), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
          }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row])
  }
    
  override func prepare(
    for segue: UIStoryboardSegue,
    sender: Any?
  ) {
    if segue.identifier == "moveToDetail" {
      if let detaiViewController = segue.destination as? DetailViewController {
        detaiViewController.academy = sender as? AcademyModel
      }
    }
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
