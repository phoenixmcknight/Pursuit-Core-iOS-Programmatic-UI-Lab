
import UIKit

class ViewController: UIViewController {
    let model: ColorModeling = ColorModel()
    
    
    
    var emojiStruct = Emojis()
    var colorGenerated = RGBValue()
    var increment = incrementer()
    var colorModel = ColorModel()
    
    
    lazy  var redOutletProgram: UIButton = {
        let redButton = UIButton(name: "Red", color: .red)
        redButton.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
        redButton.addTarget(self, action: #selector(redObjectButton), for: .touchUpInside)
        return redButton
    }()
    
    lazy  var greenOutletProgram: UIButton = {
        let greenButton = UIButton(name: "Green", color: .green)
        greenButton.addTarget(self, action: #selector(greenObjectButton), for: .touchUpInside)
        return greenButton
    }()
    lazy    var blueOutletProgram: UIButton = {
        let blueButton = UIButton(name: "Blue", color: .blue)
        blueButton.addTarget(self, action: #selector(blueObjectButton), for: .touchUpInside)
        
        return blueButton
    }()
    
    lazy   var emojiLabelProgram:UILabel = {
        let emoji = UILabel(name: "emoji")
        return emoji
    }()
    
    lazy var highScoreLabel:UILabel = {
        let highscore = UILabel(name: "High Score:")
        return highscore
    }()
    lazy var currentScoreLabel:UILabel = {
        let currentScore = UILabel(name: "Current Score:")
        return currentScore
    }()
    
    lazy var gameOverOutletProgram: UIButton = {
        let gameButton = UIButton(name: "Game Over", color: .blue)
     
        
        return gameButton
    }()
    
    lazy  var newGameOutletProgram: UIButton = {
        let newGame = UIButton(name: "New Game", color: .blue)
        newGame.addTarget(self, action: #selector(newGameButton), for: .touchUpInside)
        return newGame
    }()
    
    lazy var promptLabel:UILabel = {
        let prompt = UILabel(name: "Which color is the image above cloest to?")
        return prompt
    }()
    
    lazy var viewOutlet:UIView = {
        let imageview = UIView()
        
        return imageview
    }()
    
    lazy  var stackViewButtons:UIStackView = {
        
        return setUpStackViewButtons()
    }()
    
    lazy var stackViewScores: UIStackView = {
        return setUpStackViewScores()
    }()
    
    lazy var stackViewPromptAndView: UIStackView = {
        return setUpStackViewPromptAndView()
    }()
    
    lazy var stackViewsCombined:UIStackView = {
        return combineStackViews()
    }()
    
    lazy var stackViewsGameButton:UIStackView = {
        return setUpStackViewGameButtons()
    }()
    
    func setUpStackViewPromptAndView() -> UIStackView {
        let stacky = UIStackView(arrangedSubviews: [viewOutlet,promptLabel])
        stacky.axis = .vertical
        stacky.distribution = .fillEqually
        stacky.alignment = .fill
        stacky.spacing = 5
        stacky.translatesAutoresizingMaskIntoConstraints = false
        return stacky
    }
    
    @objc func redObjectButton() {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.red):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            colorModel.disableButtons(buttons: buttonArray!)
            
        }
    }
    @objc func greenObjectButton() {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.green):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            colorModel.disableButtons(buttons: buttonArray!)
        }
    }
    
    @objc func blueObjectButton() {
        switch colorGenerated.highestRGBvalue() {
        case CGFloat(colorGenerated.blue):
            ifCaseIsTrue()
        default:
            ifCaseIsFalse()
            colorModel.disableButtons(buttons: buttonArray!)
        }
    }
    func setUpStackViewScores() -> UIStackView {
        let stacky = UIStackView(arrangedSubviews: [highScoreLabel,currentScoreLabel])
        stacky.axis = .vertical
        stacky.distribution = .fillEqually
        //stacky.alignment = .fill
        stacky.spacing = 10
        stacky.translatesAutoresizingMaskIntoConstraints = false
        return stacky
    }
    
    func setUpStackViewGameButtons() -> UIStackView {
        let stacky = UIStackView(arrangedSubviews: [gameOverOutletProgram,newGameOutletProgram])
              stacky.axis = .vertical
              stacky.distribution = .fillEqually
              //stacky.alignment = .fill
              stacky.spacing = 10
              stacky.translatesAutoresizingMaskIntoConstraints = false
              return stacky
    }
    func setUpStackViewButtons() -> UIStackView {
        let stacky = UIStackView(arrangedSubviews: [redOutletProgram,blueOutletProgram,greenOutletProgram])
        
        stacky.axis = .horizontal
        stacky.distribution = .fillEqually
        stacky.alignment = .fill
        stacky.spacing = 10
        stacky.translatesAutoresizingMaskIntoConstraints = false
        return stacky
    }
    
    func combineStackViews() -> UIStackView {
        let stacky = UIStackView(arrangedSubviews: [stackViewScores,stackViewPromptAndView,stackViewButtons,stackViewsGameButton])
        stacky.axis = .vertical
        stacky.distribution = .fillEqually
        stacky.alignment = .fill
        stacky.spacing = 10
        stacky.translatesAutoresizingMaskIntoConstraints = false
        return stacky
    }
    
    func setUpConstaints() {
        gameOverOutletProgram.alpha = 0
        
        stackViewsCombined.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        stackViewsCombined.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        stackViewsCombined.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackViewsCombined.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        
    }
    
    var buttonArray: [UIButton]?
    
    
    func colorGenerator(){
        colorGenerated = RGBValue()
        viewOutlet.backgroundColor = colorGenerated.creatRGBColor()
    }
    
    func ifCaseIsTrue(){
        increment.incrementScore()
        increment.incrementHighScore()
        
        currentScoreLabel.text = "Curent Score: \(increment.score)"
        highScoreLabel.text = "High Score: \(increment.highestScore)"
        colorGenerator()
        emojiLabelProgram.alpha = 1
        emojiStruct = Emojis()
        emojiLabelProgram.text = emojiStruct.happy()
    }
    
    func ifCaseIsFalse(){
        increment.score = 0
        currentScoreLabel.text = "Curent Score: \(increment.score)"
        emojiStruct = Emojis()
        emojiLabelProgram.text = emojiStruct.sad()
        gameOverOutletProgram.alpha = 1.0
        newGameOutletProgram.alpha = 1.0
    }
    
    @objc func newGameButton() {
        colorGenerator()
        emojiLabelProgram.alpha = 0
        gameOverOutletProgram.alpha = 0
        newGameOutletProgram.alpha = 0
        colorModel.enableButtons(buttons: buttonArray!)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOutlet.backgroundColor = colorGenerated.creatRGBColor()
        configureButtonArray()
        self.view.addSubview(stackViewsCombined)
        self.view.backgroundColor = .white
        setUpConstaints()
        
    }
    
    func configureButtonArray() {
        buttonArray = [redOutletProgram, blueOutletProgram, greenOutletProgram]
        
    }
}

extension UIButton {
    public convenience init(name:String, color:UIColor){
        self.init()
        self.setTitle(name, for: .normal)
        self.setTitleColor(color, for: .normal)
        
    }
}
extension UILabel {
    public convenience init(name:String){
        self.init()
        self.text = name
        
    }
}
