import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbTarget: UILabel!
    @IBOutlet weak var sdSlider: UISlider!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbRound: UILabel!
    @IBOutlet weak var lbInfo: UILabel!
    
    
    private var target = 0
    private var guess = 0
    private var score = 0
    private var totalScore = 0
    private var round = 0
    private var info = ""
    
    private func setupSlider(){
        sdSlider.setThumbImage(UIImage(named: "sliderThumbNormal"), for: .normal)
        sdSlider.setThumbImage(UIImage(named: "sliderThumbHighlight"), for: .highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        let leftTrack = UIImage(named: "sliderTrackerLeft")
        let leftSize = leftTrack!.resizableImage(withCapInsets: inset)
        sdSlider.setMinimumTrackImage(leftSize, for: .normal)
        
        let rightTrack = UIImage(named: "sliderTrackerRight")
        let rightSize = rightTrack!.resizableImage(withCapInsets: inset)
        sdSlider.setMaximumTrackImage(rightSize, for: .normal)
        
        sdSlider.value = 50
    }
    
    private func refreshInfo(){
        info = "Waiting ..."
        lbInfo.text = "\(info)"
    }
    
    private func refreshTargetAndSlider(){
        sdSlider.value = 50
        target = Int(arc4random_uniform(101))
        lbTarget.text = "\(target)"
    }
    
    private func resfreshTotal(){
        round = 1
        lbRound.text = "\(round)"
        totalScore = 0
        lbScore.text = "\(totalScore)"
        
    }
    
    private func reset(){
        refreshTargetAndSlider()
        refreshInfo()
        resfreshTotal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        reset()
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        guess = Int(sender.value)
    }
    
    private func updateScore(){
        if abs(guess - target) == 0{
            score = 200
        }else if abs(guess - target) == 1{
            score = 90
        }else if abs(guess - target) == 2{
            score = 80
        }else if abs(guess - target) == 3{
            score = 70
        }else if abs(guess - target) == 4{
            score = 60
        }else if abs(guess - target) == 5{
            score = 50
        }else if abs(guess - target) == 6{
            score = 30
        }else {
            score = 0
        }
    }
    
    private func updateLabels(){
        refreshTargetAndSlider()
        totalScore += score
        lbScore.text = "\(totalScore)"
        round += 1
        lbRound.text = "\(round)"
        lbInfo.text = "You chose: \(guess), and your score is: \(score)"
    }
    
    @IBAction func onButtonOKClick(_ sender: UIButton) {
        updateScore()
        updateLabels()
    }
    
    
    @IBAction func onRefreshClick(_ sender: UIButton) {
        reset()
    }
    

}

