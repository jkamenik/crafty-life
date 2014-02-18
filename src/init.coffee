window.addEventListener('load',->
    Crafty.init()
    
    Game.width = Crafty.DOM.window.width
    Game.height = Crafty.DOM.window.height
    
    Crafty.scene('Loading')
)