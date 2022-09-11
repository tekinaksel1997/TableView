//
//  ViewController.swift
//  TableView
//
//  Created by Tekin Aksel Demir on 11.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkName = [String]()
    var landmarkImage = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkName.append("Topkapı Sarayı")
        landmarkName.append("Ayasofya")
        landmarkName.append("Galata Kulesi")
        landmarkName.append("Miniatürk")
        landmarkName.append("Dolmabahçe Sarayı")
        landmarkName.append("Yerebatan Sarnıcı")
        landmarkName.append("Kız Kulesi")
        landmarkName.append("Havacılık Müzesi")
        
        landmarkImage.append(UIImage(named: "Topkapı")!)
        landmarkImage.append(UIImage(named: "Ayasofya")!)
        landmarkImage.append(UIImage(named: "Galata")!)
        landmarkImage.append(UIImage(named: "miniaturk")!)
        landmarkImage.append(UIImage(named: "Dolmabahçe")!)
        landmarkImage.append(UIImage(named: "YereBatan")!)
        landmarkImage.append(UIImage(named: "kızkulesi")!)
        landmarkImage.append(UIImage(named: "HavacılıkMüzesi")!)
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkName[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkName[indexPath.row]
        chosenLandmarkImage = landmarkImage[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkName.remove(at: indexPath.row)
            self.landmarkImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
