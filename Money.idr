module Money

data Currency = 
  PLN | 
  USD | 
  GBP

data Money : Currency -> Type where
    MkMoney : Double -> (currency : Currency) -> Money currency

%name Money money1, money2
total

Prelude.Interfaces.Eq (Money c) where
  (==) (MkMoney x c) (MkMoney y c) = x == y

Ord (Money c) where 
  compare (MkMoney x c) (MkMoney y c) = compare x y 

addMoney : Money c -> Money c -> Money c
addMoney (MkMoney x c) (MkMoney y c) = let val = x + y in
                                           MkMoney val c

multiMoney : Money c -> Money c -> Money c
multiMoney (MkMoney x c) (MkMoney y c) = let val = x * y in
                                             MkMoney val c

subsMoney : Money c -> Money c -> Money c
subsMoney (MkMoney x c) (MkMoney y c) = let val = x - y in
                                            MkMoney val c

divMoney : Money c -> Money c -> Money c
divMoney (MkMoney x c) (MkMoney y c) = let val = x / y in
                                           MkMoney val c
