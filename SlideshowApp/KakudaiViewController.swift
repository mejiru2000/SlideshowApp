//
//  KakudaiViewController.swift
//  SlideshowApp
//
//  Created by 羽根田 久矢 on 2017/01/29.
//  Copyright © 2017年 hisaya.haneda. All rights reserved.
//

import UIKit

class KakudaiViewController: UIViewController {

    @IBOutlet weak var kakudaiImageView: UIImageView!
    
    var imageName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        kakudaiImageView.image = UIImage(named: imageName)
        kakudaiImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
