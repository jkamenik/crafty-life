Crafty.scene('Loading',->
    Crafty.background('#FFF')
    Crafty.e('CenterText').text('Loading...')
    Crafty.scene('GenerateBoard')
)

Crafty.scene('GenerateBoard',->
    for x in [0..Game.cellColumns()]
        for y in [0..Game.cellRows()]
            Crafty.e('Cell').at(x,y)
            
    for x in [0..Game.cellColumns()]
        for y in [0..Game.cellRows()]
            
    
)