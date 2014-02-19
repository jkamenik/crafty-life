Crafty.scene('Loading',->
    Crafty.background('#FFF')
    Crafty.e('CenterText').text('Loading...')
    Crafty.scene('GenerateBoard')
)

Crafty.scene('GenerateBoard',->
    for x in [0...Game.cellColumns()]
        for y in [0...Game.cellRows()]
            Game.register x, y, Crafty.e('Cell').at(x,y)
            
    Crafty.timer.FPS(1)
            
    Crafty.bind('EnterFrame',Game.advance)
    Crafty.bind('RenderScene',Game.reDraw)
    
    count = 0;
    Crafty.bind('EnterFrame',->
        count += 1
        
        Crafty.pause() if count > 100
    )
)