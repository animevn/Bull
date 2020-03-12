import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbTarget: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbRound: UILabel!
    @IBOutlet weak var sdGuess: UISlider!
    @IBOutlet weak var lbInfo: UILabel!
    
    var model = Model()
    
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
    
    private func update(){
        model.reset()
        updateTarget()
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider(sdGuess: sdGuess)
        update()
    }
    
    private func handleButtonOKPressed(){
        model.runGame()
        updateViews()
        updateTarget()
    }
    
    @IBAction func onButtonOKPressed(_ sender: UIButton) {
        handleButtonOKPressed()
    }
    
    @IBAction func bnReset(_ sender: UIButton) {
        present(alertReset(completion: update), animated: true)
    }
    
}
