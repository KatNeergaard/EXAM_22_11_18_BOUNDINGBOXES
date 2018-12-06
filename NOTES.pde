/*

TO-DO

SPRITESHEETS AND IMAGES
- Turning spreadsheets around so the player/monsters can face left 
- using different parts of the sheets at different times - i.e. for attacking, dying etc
- Do what we did with the cat - find the right pixelsize - don’t use w for the frame*W 
- Use another image for the exit!

RESETTING
- ALMOST DONE - aka the game is re-playable!
- Doublecheck if everything stops by println or something
- Resetting the player requires some extra thought - look at notes in comments in the class

COLLISION DETECTION
- BUG: it seems like the player is colliding with tiles and candies that are not being displayed… Don't know if it's due to size or the code in the collision functions...
- Collision detection - finish on all other classes that needs collisions
- Make stuff happen on collision detection!
- IF 2-PLAYER: they both need to collide with the exit before the level changes. 
JESPERS suggestion: make an boolean array - when it is true that BOTH players have collided - then change + remember: use playercount when going through player array

ENEMY BEHAVIOR
- Chasing
- Shooting
- Attacking

OTHER THINGS
- HIGHSCORE LIST: load/save
- Life - changes upon shots or collision with enemy - SHOULD COUNT LIFE FOR BOTH PLAYERS
- Make description and code highlights
- Make comments in code
- Exercise 38
- Check that we have everything
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
