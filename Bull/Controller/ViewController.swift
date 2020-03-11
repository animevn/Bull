import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbTarget: UILabel!
    @IBOutlet weak var lbMin: UILabel!
    @IBOutlet weak var lbMax: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbRound: UILabel!
    @IBOutlet weak var sdGuess: UISlider!
    
    private func setupSlider(){
        sdGuess.setThumbImage(UIImage(named: Base.sliderThumbNormal), for: .normal)
        sdGuess.setThumbImage(UIImage(named: Base.sliderThumbHightlight), for: .highlighted)

        let inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 12)

        let leftTrack = UIImage(named: Base.sliderTrackLeft)
        let leftSize = leftTrack?.resizableImage(withCapInsets: inset)
        sdGuess.setMinimumTrackImage(leftSize, for: .normal)
        
        let rightTrack = UIImage(named: Base.sliderTrackRight)
        let rightSize = rightTrack?.resizableImage(withCapInsets: inset)
        sdGuess.setMaximumTrackImage(rightSize, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }
    

    @IBAction func bnReset(_ sender: UIButton) {
    }
    
    @IBAction func bnInfo(_ sender: UIButton) {
    }
    
    
}
