# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#Rules helper functions, Board modifying rules and helpers
#Prototypes & submits moves


tryShiftBoard = (dir) ->

shiftBoard = (dir) ->

tryMovePC = (dir) ->


movePC = (dir) ->
	path.append(pc)
	switch(dir)
		when "up" then pc.y -= 1
		when "down" then pc.y += 1
		when "left" then pc.x -= 1
		when "right" then pc.x += 1
		else false
	true

drawPC = (pc) -> 

validateMove = (move) ->

submitMove = (move) ->
