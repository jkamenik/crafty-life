Crafty.c 'CenterText',{
    init: ->
        this.requires('2D, DOM, Text')
        this.attr({x: Game.width / 2, y: Game.height / 2})
}

Crafty.c 'Cell', {
    aliveColor: 'purple'
    deadColor:  'pink'
    currAlive:  false
    lastAlive:  false
    cellX:      0
    cellY:      0
    
    init: ->
        this.requires('2D, Canvas, Color')
        this.attr {
            w: Game.cellSize,
            h: Game.cellSize
        }
        this.cell Crafty.math.randomInt(0,1)
    
    cell: (state)->
        this.currAlive = !!state
        this.reRender()
        this
        
    cellColor: ->
        if this.currAlive
            this.aliveColor
        else
            this.deadColor
        
    at: (x,y)->
        this.cellX = x
        this.cellY = y
        
        this.attr {
            x: x * Game.cellSize,
            y: y * Game.cellSize
        }
        
    calcNextState: ->
        neighbors = Game.neighborsOf(this.cellX,this.cellY)
        alive     = 0
        for neighbor in neighbors
            alive += 1 if neighbor.lastAlive
            
        if this.currAlive
            if alive == 2 || alive == 3
                this.currAlive = true
            else
                this.currAlive = false
        else if alive == 3
            this.currAlive = true
        
    reRender: ->
        this.lastAlive = this.currAlive
        this.color this.cellColor()
}