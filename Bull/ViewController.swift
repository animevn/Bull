import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbTarget: UILabel!
    @IBOutlet weak var sdSlider: UISlider!
    @IBOutlet weak var lbInfo: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbRound: UILabel!
    
    
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
        info = ""
        lbInfo.text = "\(info)"
    }
    
    private func refreshLabels(){
        sdSlider.value = 50
        target = Int(arc4random_uniform(101))
        lbTarget.text = "\(target)"
    }
    
    private func resfreshTotal(){
        round = 0
        lbRound.text = "\(round)"
        totalScore = 0
        lbScore.text = "\(totalScore)"
        
    }
    
    private func reset(){
        refreshLabels()
        refreshInfo()
        resfreshTotal()
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        guess = Int(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        reset()
       
    }
    
    @IBAction func onButtonOKClick(_ sender: UIButton) {
        
    }
    
    @IBAction func onButtonInfoClick(_ sender: UIButton) {
        
    }
    
    


}

