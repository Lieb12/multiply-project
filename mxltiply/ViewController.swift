import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var operationCtrl: UISegmentedControl!
    @IBOutlet weak var opLabel: UILabel!
    @IBOutlet weak var calcBtn: UIButton!
    @IBOutlet weak var weegeeIcon: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var parityLabel: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    
    var result: Double = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "GNU PTERRY";
        resultLabel.text = "";
        parityLabel.text = "";
        
        weegeeIcon.isHidden = true;
        calcBtn.layer.cornerRadius = 12;
        
        let segFont = UIFont.systemFont(ofSize: 16)
        operationCtrl.setTitleTextAttributes([NSAttributedString.Key.font: segFont],
                                                for: .normal)
    }
    
    @IBAction func calcPressed(_ sender: Any) {
        field1.resignFirstResponder()
        field2.resignFirstResponder()
        switch (operationCtrl.selectedSegmentIndex) {
        case 0:
            do {
                let firstFactor = Int(field1.text!)
                let secondFactor = Int(field2.text!)
                result = Double(firstFactor! + secondFactor!)
                resultLabel.text = String(result)
                
            }
            break
        case 1:
            do {
                let firstFactor = Int(field1.text!)
                let secondFactor = Int(field2.text!)
                result = Double(firstFactor! - secondFactor!)
                resultLabel.text = String(result)
                
            }
        case 2:
            do {
                let firstFactor = Int(field1.text!)
                let secondFactor = Int(field2.text!)
                result = Double(firstFactor! * secondFactor!)
                resultLabel.text = String(result)
                }
        case 3:
            do {
                let firstFactor = Int(field1.text!)
                let secondFactor = Int(field2.text!)
                result = Double(firstFactor! / secondFactor!)
                resultLabel.text = String(result)
            }
        case 4:
            do {
                let firstFactor = Int(field1.text!)
                let secondFactor = Int(field2.text!)
                result = pow(Double(firstFactor!), Double(secondFactor!))
                resultLabel.text = String(result)
            }
        case 5:
            do {
                let firstFactor = Int(field1.text!)
                let secondFactor = Int(field2.text!)
                result = Double(firstFactor! + secondFactor!)
                resultLabel.text = String(result)
                }
        default:
            do {
                resultLabel.text = "You broke it."
                parityLabel.text = "How?!"
            }
        }
        
        func weegeeDetector() {
            if result == 64 {
                weegeeIcon.isHidden = false
            } else {
                weegeeIcon.isHidden = true
            }
        }
        
        if result.truncatingRemainder(dividingBy: 2) == 0 {
            parityLabel.text = "EVEN"
            //add img view
        } else {
            parityLabel.text = "ODD"
            //add 2nd img
        }
        
        weegeeDetector();
    }
    
    
}
