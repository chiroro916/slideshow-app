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
    
    var counter = 0
    
    // myImageViewに設定する画像を配列に格納します。
    var imageArray: Array = ["1.jpg", "2.jpg", "3.jpg"]
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    //ボタンを押した際の動作はOutlet接続する
    @IBOutlet weak var modoru: UIButton!
    
    @IBOutlet weak var saiseiteishi: UIButton!
    
    @IBOutlet weak var susumu: UIButton!
    
    
 
    @IBAction func susumu(_ sender: Any) {
        // counterを1増やします。
        counter = counter + 1
        
        // counter（imageArrayの添え字）は0〜2の値を取ります。
        // 一方、imageArray.countはimageArrayの要素数を返却しますので、この場合は3が返却されます。
        // そこで、counterをimageArray.count - 1（=2）と比較して、おおきい場合は0を設定します。
        if ( counter > imageArray.count - 1 ) {
            counter = 0
        }
        myImageView.image = UIImage(named:imageArray[counter])


/*
        if ( counter == 0 ) {
            myImageView.image = UIImage(named:"1.jpg")
        }
        else if ( counter == 1 ) {
            myImageView.image = UIImage(named:"2.jpg")
        }
        else if ( counter == 2 ) {
            myImageView.image = UIImage(named:"3.jpg")
        }
 */
    }
    
    @IBAction func modoru(_ sender: Any) {
     
       counter = counter - 1
        
        if ( counter < 0 ) {
            counter = imageArray.count - 1
//            counter = 2
        }

        myImageView.image = UIImage(named:imageArray[counter])
        
        
/*               if ( counter == 0 ) {
            myImageView.image = UIImage(named:"1.jpg")
        }
        else if ( counter == 1 ) {
            myImageView.image = UIImage(named:"2.jpg")
        }
        else if ( counter == 2 ) {
            myImageView.image = UIImage(named:"3.jpg")
        }
 */
    }

    
    // タイマーの作成、始動
    // 関数の外で処理を書かない様にしてください。
//    self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        //UIImageViewをタップしたら、画面遷移
        myImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target:self, action: #selector(ViewController.tapImage(sender:)))
        myImageView.addGestureRecognizer(gesture)

        // ここでcounterを配列の最初の添え字である0に初期化して、その画像をmyImageViewに設定します。
        counter = 0;
        myImageView.image = UIImage(named:imageArray[counter])
        
    }


      func tapImage(sender: UITapGestureRecognizer) {
//      let next = storyboard!.instantiateViewController(withIdentifier: "nextView")
        let resultViewController = storyboard!.instantiateViewController(withIdentifier:"nextView") as! ResultViewController
//        resultViewController.myImageView = self.myImageView
          resultViewController.imageName = imageArray[counter]
        self.present(resultViewController, animated: true, completion: nil)
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、2秒毎に呼び出され続ける
    func updateTimer(timer: Timer) {

        // この時は、画像を次々と切り換えて行きます.
        counter += 1
        if(counter > imageArray.count - 1) {
            counter = 0
        }
        myImageView.image = UIImage(named:imageArray[counter])
    }
        
        
    @IBAction func saisei(_ sender: Any) {
        
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            // カウンターの作動は2秒毎なので、timeInntervalの値が違います。
            //self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            // 戻るボタンと進むボタンをタップ不可に。
            modoru.isEnabled = false;
            susumu.isEnabled = false;
            // 再生停止ボタンのタイトルを「停止」に
            saiseiteishi.setTitle("停止", for: UIControlState.normal)
        } else { // タイマー作動中に「停止」をタップされたらこちらの処理をします。
            // タイマー停止
            self.timer.invalidate()
            // 次回「再生」がタップされた時の為にtimerをnilに。
            self.timer = nil
            // 戻るボタンと進むボタンをタップ可に。
            modoru.isEnabled = true;
            susumu.isEnabled = true;
            // 再生停止ボタンのタイトルを「再生」に
            saiseiteishi.setTitle("再生", for: UIControlState.normal)
        }
        
        
    }

    
  

}
