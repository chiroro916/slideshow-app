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

//    func tapImage(sender: UITapGestureRecognizer) {
//        print("OK")
      func tapImage(sender: UITapGestureRecognizer) {
            print("OK")
            let next = storyboard!.instantiateViewController(withIdentifier: "nextView")
            self.present(next,animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     segueから遷移先のResultViewControllerを取得する
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let resultViewController = storyboard!.instantiateViewController(withIdentifier: //"ResultViewController")
    resultViewController.imageView = self.myImageView // ←ここで次の画面のUIImageViewインスタンスに対し、myImageViewをコピーしてあげる
    
    self.present(next,animated: true, completion: nil)
    }

}
