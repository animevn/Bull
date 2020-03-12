import UIKit

func setupSlider(sdGuess:UISlider){
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

func alertReset(completion:@escaping()->Void)->UIAlertController{
    let alert = UIAlertController(title: Base.alertTitle,
                                  message: Base.alertMessage,
                                  preferredStyle: .alert)
    let actionOk = UIAlertAction(title: Base.okTitle, style: .default, handler: {_ in completion()})
    let actionCancel = UIAlertAction(title: Base.cancelTitle, style: .default, handler: nil)
    alert.addAction(actionOk)
    alert.addAction(actionCancel)
    return alert
}
