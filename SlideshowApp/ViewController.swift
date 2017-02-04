//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 羽根田 久矢 on 2017/01/28.
//  Copyright © 2017年 hisaya.haneda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!

    var imageNumberCount:Int = 1
    let imageNumberCountMin:Int = 1
    let imageNumberCountMax:Int = 3
    var imageName:String!
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageName = imageNameSet(imageNumber: imageNumberCount)
        slideImageView.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if event?.touches(for: slideImageView) != nil {
           performSegue(withIdentifier: "toKakudaiViewController", sender:nil)
           if self.timer != nil{
              self.timer.invalidate()
              self.timer = nil
           }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let KakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
            KakudaiViewController.imageName = imageName
      }
    
    @IBAction func forwardButton(_ sender: Any) {
        imageNumberCount += 1
        if imageNumberCount > imageNumberCountMax {
           imageNumberCount = imageNumberCountMin
        }
        imageName = imageNameSet(imageNumber: imageNumberCount)
        slideImageView.image = UIImage(named: imageName)
    }
    
    @IBAction func backwardButton(_ sender: Any) {
        imageNumberCount -= 1
        if imageNumberCount < imageNumberCountMin {
            imageNumberCount = imageNumberCountMax
        }
        imageName = imageNameSet(imageNumber: imageNumberCount)
        slideImageView.image = UIImage(named: imageName)
    }
    
    @IBAction func playandstopButton(_ sender: Any) {
        if self.timer == nil{
           forwardButton.isEnabled = false
           backwardButton.isEnabled = false
           self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideStart), userInfo: nil, repeats: true)
        }  else {
           forwardButton.isEnabled = true
           backwardButton.isEnabled = true
           self.timer.invalidate()
           self.timer = nil
        }
    }
    
    func imageNameSet(imageNumber a:Int) -> String {
        let imageNumberString:String = String(format: "%03d", a)
        return "slideImage_" + imageNumberString + ".png"
    }
    
    func slideStart(timer: Timer) {
        imageNumberCount += 1
        if imageNumberCount > imageNumberCountMax {
           imageNumberCount = imageNumberCountMin
        }
        imageName = imageNameSet(imageNumber: imageNumberCount)
        slideImageView.image = UIImage(named: imageName)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if self.timer == nil{
           self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideStart), userInfo: nil, repeats: true)
        }
    }
}

