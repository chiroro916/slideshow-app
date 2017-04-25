//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Chihiro Murakami on 2017/04/17.
//  Copyright © 2017年 chihiro.murakami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    
    //ボタンを押した際の動作はOutlet接続する
    @IBOutlet weak var modoru: UIButton!
    
    @IBOutlet weak var saiseiteishi: UIButton!
    
    @IBOutlet weak var susumu: UIButton!
    
    
    var counter = 0
    @IBAction func susumu(_ sender: Any) {
        
        counter = counter + 1
        
        if ( counter > 2 ) {   //2以上になると、0になる
            counter = 0
        }
        
        if ( counter == 0 ) {
            myImageView.image = UIImage(named:"1.jpg")
        }
        else if ( counter == 1 ) {
            myImageView.image = UIImage(named:"2.jpg")
        }
        else if ( counter == 2 ) {
            myImageView.image = UIImage(named:"3.jpg")
        }
    }
    
    @IBAction func modoru(_ sender: Any) {
        
        counter = counter - 1
        
        if ( counter < 0 ) {
            counter = 2
        }
        
        if ( counter == 0 ) {
            myImageView.image = UIImage(named:"1.jpg")
        }
        else if ( counter == 1 ) {
            myImageView.image = UIImage(named:"2.jpg")
        }
        else if ( counter == 2 ) {
            myImageView.image = UIImage(named:"3.jpg")
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        //UIImageViewをタップしたら、画面遷移
        myImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target:self, action: #selector(ViewController.tapImage(sender:)))
        myImageView.addGestureRecognizer(gesture)

    }


      func tapImage(sender: UITapGestureRecognizer) {
//      let next = storyboard!.instantiateViewController(withIdentifier: "nextView")
        let resultViewController = storyboard!.instantiateViewController(withIdentifier:"ResultViewController") as! ResultViewController
        resultViewController.myImageView = self.myImageView
        self.present(resultViewController, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
  

}
