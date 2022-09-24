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

%%%%% ATOMIC: cost
% Add the atomic propositions for cost in this section
cost(bread,2.00).
cost(lettuce,2.95).
cost(apple,5.99).
cost(chocolate_bar,2.49).
cost(ginger_ale,2.17).

%%%%%  ATOMIC: twoForOneSale
% Add the atomic propositions for twoForOneSale in this section
twoForOneSale(bread).
twoForOneSale(chocolate_bar).

%%%%% ATOMIC: taxable
% Add the atomic propositions for taxable in this section
taxable(chocolate_bar).
taxable(ginger_ale).


%%%%% ATOMIC: numPurchased
% Add the atomic propositions for numPurchased in this section
numPurchased(bread,3).
numPurchased(lettuce,2).
numPurchased(apple,1).
numPurchased(chocolate_bar,5).
numPurchased(ginger_ale,2).


%%%%% ATOMIC: taxRate
% Add the atomic propositions for taxRate in this section
taxRate(0.13).

%%%%% RULE: costAfterTax
% Add the rule(s) for costAfterTax in this section
costAfterTax(Item, AfterTax) :- cost(Item,P), \+ taxable(Item), AfterTax is P.
costAfterTax(Item, AfterTax) :- cost(Item,P), taxable(Item), taxRate(Rate), AfterTax is P*(1+Rate).

%%%%% RULE: costAfterTaxAndSale NOT DONE YET
% Add the rule(s) for costAfterTaxAndSale in this section
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), numPurchased(Item,N), \+ taxable(Item), \+twoForOneSale(Item), AfterSaleAndTax is P*N. 
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), \+ taxable(Item), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, E is N1 mod 2, E =:= 0, AfterSaleAndTax is P*(N/2).
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), \+ taxable(Item), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, O is N1 mod 2, O =:= 1, AfterSaleAndTax is P*((N+1)/2).
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), taxable(Item), taxRate(Rate), \+ twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, AfterSaleAndTax is ((P*N)*(1+Rate)).
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), \+ taxable(Item), taxRate(Rate), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, E is N1 mod 2, E =:= 0, AfterSaleAndTax is ((P*(N/2))*(1+Rate)).
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), \+ taxable(Item), taxRate(Rate), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, O is N1 mod 2, O =:= 1, AfterSaleAndTax is ((P*((N+1)/2))*(1+Rate)).


%%%%% RULE: totalCost
%  Add the rule(s) for totalCost in this section


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
