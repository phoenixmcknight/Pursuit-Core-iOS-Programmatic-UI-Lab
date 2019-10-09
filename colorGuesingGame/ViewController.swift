
import UIKit

class ViewController: UIViewController {
    let model: ColorModeling = ColorModel()
    
    @IBOutlet weak var redOutlet: UIButton!
    @IBOutlet weak var blueOutlet: UIButton!
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var greenOutlet: UIButton!
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var newGame: UIButton!
    
    @IBOutlet weak var gameOver: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    var emojiStruct = Emojis()
    var colorGenerated = RGBValue()
    var increment = incrementer()
    var colorModel = ColorModel()
    @IBOutlet weak var RGBColorView: UIView!
    
    
    
    var buttonArray: [UIButton]?
    
    
    func colorGenerator(){
        colorGenerated = RGBValue()
        RGBColorView.backgroundColor = colorGenerated.creatRGBColor()
    }
    
    func ifCaseIsTrue(){
        increment.incrementScore()
        increment.incrementHighScore()
        
        currentScore.text = "Curent Score: \(increment.score)"
        highScore.text = "High Score: \(increment.highestScore)"
        colorGenerator()
        emojiLabel.alpha = 1
        emojiStruct = Emojis()
        emojiLabel.text = emojiStruct.happy()
    }
    
    func ifCaseIsFalse(){
        increment.score = 0
        currentScore.text = "Curent Score: \(increment.score)"
        emojiStruct = Emojis()
        emojiLabel.text = emojiStruct.sad()
        gameOver.alpha = 1.0
        newGame.alpha = 1.0
    }
    
    @IBAction func red(_ sender: UIButton) {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.red):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            colorModel.disableButtons(buttons: buttonArray!)
            
        }
    }
    
    @IBAction func blue(_ sender: UIButton) {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.blue):
            ifCaseIsTrue()
        default:
           ifCaseIsFalse()
            colorModel.disableButtons(buttons: buttonArray!)
            
            
        }
    }
    
    @IBAction func green(_ sender: UIButton) {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.green):
           ifCaseIsTrue()
        default:
           ifCaseIsFalse()
            colorModel.disableButtons(buttons: buttonArray!)
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        colorGenerator()
         emojiLabel.alpha = 0
        gameOver.alpha = 0
        newGame.alpha = 0
        colorModel.enableButtons(buttons: buttonArray!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RGBColorView.backgroundColor = colorGenerated.creatRGBColor()
        configureButtonArray()
    }
    
    func configureButtonArray() {
        buttonArray = [redOutlet, blueOutlet, greenOutlet]
    }
}

