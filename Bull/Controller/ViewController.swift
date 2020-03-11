import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbTarget: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbRound: UILabel!
    @IBOutlet weak var sdGuess: UISlider!
    @IBOutlet weak var lbInfo: UILabel!
    
    var model = Model()
    
    private func setupSlider(){
        sdGuess.setThumbImage(UIImage(named: Base.sliderThumbNormal), for: .normal)
        sdGuess.setThumbImage(UIImage(named: Base.sliderThumbHightlight), for: .highlighted)

        let inset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

        let leftTrack = UIImage(named: Base.sliderTrackLeft)
        let leftSize = leftTrack?.resizableImage(withCapInsets: inset)
        sdGuess.setMinimumTrackImage(leftSize, for: .normal)
        
        let rightTrack = UIImage(named: Base.sliderTrackRight)
        let rightSize = rightTrack?.resizableImage(withCapInsets: inset)
        sdGuess.setMaximumTrackImage(rightSize, for: .normal)
    }
    
    @IBAction func onSliderChange(_ sender: UISlider) {
        model.updateGuess(guess: Int(sender.value))
    }
    
    private func updateViews(){
        lbInfo.text = model.info
        lbScore.text = "\(model.totalScore)"
        lbRound.text = "\(model.round)"
        sdGuess.value = 50
    }
    
    private func updateTarget(){
        model.updateTarget()
        lbTarget.text = "\(model.target)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        updateTarget()
        updateViews()
    }
    
    @IBAction func onButtonOKPressed(_ sender: UIButton) {
        model.runGame()
        updateViews()
        updateTarget()
    }
    
    private func showAlertWhenClickResetButton(){
        let alert = UIAlertController(title: "Reset game",
                                      message: "Your game data will be reset",
                                      preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: {_ in
                                        self.model.reset()
                                        self.updateTarget()
                                        self.updateViews()
        })
        let actionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func bnReset(_ sender: UIButton) {
        showAlertWhenClickResetButton()
    }
    
}
