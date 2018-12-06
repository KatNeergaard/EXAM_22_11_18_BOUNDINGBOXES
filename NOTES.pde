/*

GAME_STATES OVERVIEW
 //gamestate 0 = start menu
 //gamestate 1 = playing game
 //gamestate 2 = gameOver
 //gamestate 3 = endGame

TO-DO

CURRENT BUGS: 
- the exits don’t display in the later levels..
- it seems like the player is colliding with tiles and candies that are not being displayed… Don't know if it's due to size...

SPRITESHEETS
- Turning spreadsheets around so the player/monsters can face left 
- and using different parts of the sheets at different times - i.e. for attacking, dying etc
- Do what we did with the cat - find the right pixelsize - don’t use w for the frame*W 

RESETTING
- Remember to check if more than the player needs to be reset when a new level starts?
- Restart everything in gamestates 2 and 3 - make reset functions in all classes for starting the entire game over.

COLLISION DETECTION
- Collision detection - finish on all other classes that needs collision
- Make stuff happen on collision detection!
- IF 2-PLAYER: they both need to collide with the exit before the level changes. 
JESPERS suggestion: make an boolean array - when it is true that BOTH players have collided - then change + remember: use playercount when going through player array

ENEMY BEHAVIOR
- Chasing
- Shooting
- Attacking


OTHER THINGS
- Highscore list: load/save
- Life - changes upon shots or collision with enemy - SHOULD COUNT LIFE FOR BOTH PLAYERS
- Make description and code highlights
- Make comments in code
- Exercise 38
- Check we have everything
- Sound/extra features?


——————————

Collision detection notes
- monsters & skeletons - tiles
- players - candy, tiles, exits, monsters, skeletons
- shots - monsters, skeletons, players


See candy-example
- collision detection in candy - determines the outcome, eg the score
- calling the collision detection levels
- call the update level function in main programme
  
*/
