//
//  ViewController.swift
//  Storm-viewer
//
//  Created by Marc Moxey on 5/15/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]() //exist as long as our screen exist

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default // works with file system
        let path = Bundle.main.resourcePath! //set resource path of the app bundle
        
        let items = try! fm.contentsOfDirectory(atPath: path) //set the contents of the directory at path
        
        
        //loop for every item found in app bundle
        for item in items {
            if item.description.hasPrefix("nssl") {
                // this a picture load
                pictures.append(item)
                pictures.sort()
            }
        }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    //re use cell from table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //check if there a text label if not return row number
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController { //if fail code wont execute
            vc.selectedImage = pictures[indexPath.row] 
            navigationController?.pushViewController(vc, animated: true)
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
           
       

        }
    }
  
    
}

