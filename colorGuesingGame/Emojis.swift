

import Foundation

struct Emojis {
    let happyEmoji:[String] = ["😛","🍟","😸","😀","😁","🤗","😙","🐵","🙂","😇","😍","😃","😄","🥰","😎","🙃","👌","👌🏻","👌🏼","👌🏽","👌🏾","👌🏿","👏","👏🏻","👏🏼","👏🏽","👏🏾","👏🏿"]
    
    let sadEmoji:[String] = ["😢","😞","😥","😓","😰","🥺","😯","😭","🤥","😌","☹","😟"]
    
    
    func happy() -> String{
        return happyEmoji.randomElement()!
    }
    
    func sad()-> String{
        return sadEmoji.randomElement()!
    }
}
