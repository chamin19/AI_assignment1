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
clockwise(east,north). 
clockwise(west,south).
clockwise(south,east). 
clockwise(north,west).

%%%%% ATOMIC: counterclockwise
% Add the atomic propositions for counterclockwise (part a) in this section
counterclockwise(north,east). 
counterclockwise(south,west).
counterclockwise(east,south). 
counterclockwise(west,north).

%%%%% ATOMIC: reverseDirection
% Add the atomic propositions for reverseDirection (part a) in this section
reverseDirection(north,south). 
reverseDirection(south,north).
reverseDirection(west,east). 
reverseDirection(east,west).

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
canGo(Car,Direction) :- lightColour(Direction,green), facing(Car,Direction).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW

