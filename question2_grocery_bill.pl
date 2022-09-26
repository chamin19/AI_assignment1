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
cost(bread,2.25).
cost(lettuce,2.50).
cost(apple,5.50).
cost(chocolate_bar,1.50).
cost(ginger_ale,2.00).

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
numPurchased(bread,4).
numPurchased(lettuce,3).
numPurchased(apple,2).
numPurchased(chocolate_bar,5).
numPurchased(ginger_ale,2).


%%%%% ATOMIC: taxRate
% Add the atomic propositions for taxRate in this section
taxRate(0.10).

%%%%% RULE: costAfterTax
% Add the rule(s) for costAfterTax in this section
costAfterTax(Item, AfterTax) :- cost(Item,P), not(taxable(Item)), AfterTax is P.
costAfterTax(Item, AfterTax) :- cost(Item,P), taxable(Item), taxRate(Rate), AfterTax is P*(1+Rate).

%%%%% RULE: costAfterTaxAndSale NOT DONE YET
% Add the rule(s) for costAfterTaxAndSale in this section
% calculates cost for non taxable and non sale items
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), numPurchased(Item,N), not(taxable(Item)), not(twoForOneSale(Item)), AfterSaleAndTax is P*N. 
% calculates cost for non taxable, on sale and even quantity items
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), not(taxable(Item)), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, E is N1 mod 2, E =:= 0, AfterSaleAndTax is P*(N/2).
% calculates cost for non taxable, on sale and odd quantity items
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), not(taxable(Item)), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, O is N1 mod 2, O =:= 1, AfterSaleAndTax is P*((N+1)/2).
% calculates cost for taxable, non sale items
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), taxable(Item), taxRate(Rate), not(twoForOneSale(Item)), numPurchased(Item,N), N1 is N, N1>1, AfterSaleAndTax is ((P*N)*(1+Rate)).
% calculates cost for taxable, on sale and even quantity items
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), taxable(Item), taxRate(Rate), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, E is N1 mod 2, E =:= 0, AfterSaleAndTax is ((P*(N/2))*(1+Rate)).
% calculates cost for taxable, on sale and odd quantity items
costAfterTaxAndSale(Item, AfterSaleAndTax) :- cost(Item,P), taxable(Item), taxRate(Rate), twoForOneSale(Item), numPurchased(Item,N), N1 is N, N1>1, O is N1 mod 2, O =:= 1, AfterSaleAndTax is ((P*((N+1)/2))*(1+Rate)).


%%%%% RULE: totalCost
%  Add the rule(s) for totalCost in this section
totalCost(Cost) :- costAfterTaxAndSale(bread, AST1), costAfterTaxAndSale(lettuce, AST2), costAfterTaxAndSale(apple, AST3), costAfterTaxAndSale(chocolate_bar, AST4), costAfterTaxAndSale(ginger_ale, AST5), Cost is (AST1+AST2+AST3+AST4+AST5).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
