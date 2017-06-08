//
//  ViewController.swift
//  Iris
//
//  Created by Gavi Narra on 6/8/17.
//  Copyright © 2017 ObjectGraph LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mSepalLength: UITextField!
    @IBOutlet weak var mSepalWidth: UITextField!
    @IBOutlet weak var mPetalLength: UITextField!
    @IBOutlet weak var mPetalWidth: UITextField!
    @IBOutlet weak var mOutput: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func determineSpeciesTapped(_ sender: Any)  {
        let obj=iris()
        if let sepalLength=mSepalLength.text, let sepalWidth=mSepalWidth.text, let petalLength=mPetalLength.text, let petalWidth=mPetalWidth.text{
            if let output=try? obj.prediction(input: irisInput(Sepal_Length: Double(sepalLength)!, Sepal_Width:Double(sepalWidth)!, Petal_Length: Double(petalLength)!, Petal_Width:Double(petalWidth)!)){
                mOutput.text=output.Species
            }else{
                mOutput.text="Error"
            }
            
            
        }
        
    }
    
}

