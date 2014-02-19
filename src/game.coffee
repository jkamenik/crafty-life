Game = {
    cellSize: 100
    cells:    []
    
    cellRows: ->
        Math.floor this.height / this.cellSize
        
    cellColumns: ->
        Math.floor this.width / this.cellSize
        
    register: (x,y,cell)->
        this.cells[x]   ||= []
        this.cells[x][y] = cell
        
    cellAt: (x,y)->
        this.cells[x][y]
        
    advance: ->
        for container in Game.cells
            for cell in container
                cell.calcNextState()
    
    reDraw: ->
        for container in Game.cells
            for cell in container
                cell.reRender()
                
    neighborsOf: (x,y)->
        neighbors   = []
        topIndex    = y - 1
        leftIndex   = x - 1
        rightIndex  = x + 1
        bottomIndex = y + 1
        
        topIndex    = null if topIndex < 0
        leftIndex   = null if leftIndex < 0
        rightIndex  = null if rightIndex >= this.cellColumns()
        bottomIndex = null if bottomIndex >= this.cellRows()
        
        # top row
        unless topIndex == null
            # left
            unless leftIndex == null
                neighbors.push this.cellAt(leftIndex, topIndex)
            
            # middle
            neighbors.push this.cellAt(x,topIndex)
            
            # right
            unless rightIndex == null
                neighbors.push this.cellAt(rightIndex, topIndex)

        # middle row
        # left
        unless leftIndex == null
            neighbors.push this.cellAt(leftIndex, y)
        
        # skip self
        
        # right
        unless rightIndex == null
            neighbors.push this.cellAt(rightIndex, y)
        
        # bottom row
        unless bottomIndex == null
            # left
            unless leftIndex == null
                neighbors.push this.cellAt(leftIndex, bottomIndex)
            
            # middle
            neighbors.push this.cellAt(x,bottomIndex)
            
            # right
            unless rightIndex == null
                neighbors.push this.cellAt(rightIndex, bottomIndex)
            
        neighbors
}