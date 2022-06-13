//
//  DetailViewController.swift
//  Storm-viewer
//
//  Created by Marc Moxey on 5/15/22.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedPictureNumber = 0
    var totalPictures = 0

    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        title = "This \(selectedPictureNumber) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareApp))
        

        // Do any additional setup after loading the view.
        
        
        if let imageToLoad = selectedImage { //checks and unwrap  optional in selected image
            imageView.image = UIImage(named: imageToLoad) // place in ImageToload then pass to UIImage then loads
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    @objc func shareApp() {
        let link = "https://github.com/twostraws/HackingWithSwift/tree/main/Classic/project1"
        let vc = UIActivityViewController(activityItems: [link], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
   

}
