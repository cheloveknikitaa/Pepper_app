//
//  ViewController.swift
//  Papper_app
//
//  Created by Comedian Augusta on 9/18/21.
//  Copyright © 2021 Cheloveknikitaa. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    //    @IBOutlet let imgview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updatePicture()
    }
    @IBAction func tapOnDisplay(_ sender: UIButton) {
        self.updatePicture()
    }
    
    func updatePicture()
    {
        ApiManager.shared.getRandom { root in
        let taskPic = URLSession.shared.dataTask(with: root.urls.full) { (data, response, error) in
            let img = UIImage(data: data!)!
            DispatchQueue.main.async {
                self.imageView.contentMode = UIView.ContentMode.scaleToFill
                self.imageView.contentMode = UIView.ContentMode.scaleAspectFit
                self.imageView.contentMode = UIView.ContentMode.scaleAspectFill
                self.imageView.image = img
            }
        }
            taskPic.resume()
        }
    }
}
