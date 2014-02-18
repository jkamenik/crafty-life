Crafty.c 'CenterText',{
    init: ->
        this.requires('2D, DOM, Text')
        this.attr({x: Game.width / 2, y: Game.height / 2})
}

Crafty.c 'Cell', {
    aliveColor: '#666',
    deadColor:  '#123',
    currAlive:  false,
    lastAlive:  false,
    
    init: ->
        this.requires('2D, Canvas, Color')
        this.attr {
            w: Game.cellSize,
            h: Game.cellSize
        }
        this.cell Crafty.math.randomInt(0,1)
    
    cell: (state)->
        this.currAlive = !!state
        this.lastAlive = !!state
        this.color this.cellColor()
        this
        
    cellColor: ->
        if this.currAlive
            this.aliveColor
        else
            this.deadColor
        
    at: (x,y)->
        this.attr {
            x: x * Game.cellSize,
            y: y * Game.cellSize
        }
}