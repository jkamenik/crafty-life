Game = {
    cellSize: 100
    
    cellRows: ->
        Math.floor this.height / this.cellSize
        
    cellColumns: ->
        Math.floor this.width / this.cellSize
}