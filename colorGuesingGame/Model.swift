import UIKit

protocol ColorModeling {
    func enableButtons(buttons: [UIButton])
    func disableButtons(buttons: [UIButton])
}

class ColorModel: ColorModeling {
    
    func enableButtons(buttons: [UIButton]) {
        for button in buttons {
            button.isEnabled = true
            button.alpha = 1
            buttons[0].setTitleColor(UIColor.red, for: UIControl.State.normal)
            buttons[1].setTitleColor(UIColor.blue, for: UIControl.State.normal)
            buttons[2].setTitleColor(UIColor.green, for: UIControl.State.normal)
        }
    }
    
    func disableButtons(buttons: [UIButton]) {
        for button in buttons {
            button.isEnabled = false
            button.alpha = 0.5
            button.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        }
    }
}
