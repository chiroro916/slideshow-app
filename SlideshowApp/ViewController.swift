//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Chihiro Murakami on 2017/04/17.
//  Copyright © 2017年 chihiro.murakami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // タイマー用の時間のための変数
    var timer: Timer!
    var timer_sec: Float = 0
    
    
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

    
    // タイマーの作成、始動
    self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    
    
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


    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、2秒毎に呼び出され続ける
    func updateTimer(timer: Timer) {
        timer_sec += 2
        timerLabel.text = String(format: "%.1f", timer_sec)
    }
    
    @IBAction func saisei(_ sender: Any) {
        
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
        
    }

    
  

}
