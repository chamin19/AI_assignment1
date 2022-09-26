% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Camillia Amin 
%%%%% NAME: Rudaba Syed
%%%%% NAME: Mayra Mussarrat
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC: clockwise
% Add the atomic propositions for clockwise (part a) in this section
clockwise(east, north). 
clockwise(west, south).
clockwise(south, east). 
clockwise(north, west).

%%%%% ATOMIC: counterclockwise
% Add the atomic propositions for counterclockwise (part a) in this section
counterclockwise(north, east). 
counterclockwise(south, west).
counterclockwise(east, south). 
counterclockwise(west, north).

%%%%% ATOMIC: reverseDirection
% Add the atomic propositions for reverseDirection (part a) in this section
reverseDirection(north, south). 
reverseDirection(south, north).
reverseDirection(west, east). 
reverseDirection(east, west).

%%%%% ATOMIC: facing
% Add the atomic propositions for facing (part b) in this section
facing(toyota, south).
facing(nissan, north).
facing(chevrolet, east).

%%%%% ATOMIC: lightColour
% Add the atomic propositions for lightColour (part b) in this section
lightColour(north, green).
lightColour(south, green).
lightColour(east, red).
lightColour(west, red).

%%%%% ATOMIC: clockwise
% Add the atomic propositions for clockwise (part a) in this section

%%%%% RULE: canGo
% Add the rules for canGo in this section

% A car can go straight through an intersection or turn right on a green light.
canGo(Car,Direction) :- lightColour(Direction,green), facing(Car, Direction).
canGo(Car,Direction) :- lightColour(Direction2,green), facing(Car,Direction2), clockwise(Direction,Direction2).

% A car can turn left on a green light if there is no car that is coming in the opposite direction.
canGo(Car,Direction) :- lightColour(Direction2,green), clockwise(Direction2,Direction), reverseDirection(Direction2,OppositeDirection), not(facing(Car2,OppositeDirection)), not(canGo(Car2,OppositeDirection)).

% A car can turn right on a yellow light.
canGo(Car, Direction) :- lightColour(Direction2,yellow), facing(Car,Direction2), reverseDirection(Direction3,Direction2), clockwise(Direction3,Direction), not(Direction=Direction2). 

% A car can turn left on a yellow light. Note, that we are assuming traffic coming in the opposite
% direction has stopped when the light is yellow.
canGo(Car,Direction) :- lightColour(Direction2,yellow), clockwise(Direction2,Direction), reverseDirection(Direction2,OppositeDirection), not(facing(Car2,OppositeDirection)), not(canGo(Car2,OppositeDirection)).

% A car can turn right on a red light, if there is no car coming in on the left that can travel straight (ie. you must yield to oncoming traffic).
canGo(Car, Direction) :- facing(Car,Direction), lightColour(Direction,red), clockwise(DirectionOfRightTurn,Direction), not(facing(Car2, DirectionOfRightTurn)), not(canGo(Car2,Direction)).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW