module Money

import Money.Currency

data Money : Currency -> Type where
    MkMoney : Double -> (currency : Currency) -> Money currency

%name Money money1, money2
total

Prelude.Interfaces.Eq (Money c) where
  (==) (MkMoney x c) (MkMoney y c) = x == y

Ord (Money c) where 
  compare (MkMoney x c) (MkMoney y c) = compare x y 

interface Monetary ty where
  (+) : ty -> ty -> ty
  (*) : ty -> ty -> ty
  negate : ty -> ty
  (-) : ty -> ty -> ty
  abs : ty -> ty
  (/) : ty -> ty -> ty

Monetary (Money c) where
  (+) (MkMoney x c) (MkMoney y c) = let val = x + y in
                                        MkMoney val c
  (*) (MkMoney x c) (MkMoney y c) = let val = x * y in
                                        MkMoney val c
  negate (MkMoney x c) = let val = negate x in
                             (MkMoney val c)
  (-) (MkMoney x c) (MkMoney y c) = let val = x - y in
                                        MkMoney val c
  abs (MkMoney x c) = let val = abs x in
                          MkMoney val c
  (/) (MkMoney x c) (MkMoney y c) = let val = x / y in
                                        MkMoney val c
