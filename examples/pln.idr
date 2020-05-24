module pln

import Money

data Account : Currency -> Type where
  MkAccount : (currency : Currency) -> Money currency -> Account currency

topup_account : Account currency -> Money currency -> Account currency
topup_account (MkAccount currency money2) money1 = 
  let newVal = money1 + money2 in
      MkAccount currency newVal

pln_account : Account PLN
pln_account = MkAccount PLN (MkMoney 0 PLN)

some_pln_money : Money PLN
some_pln_money = MkMoney 100 PLN

topup_account_test : Account PLN
topup_account_test = topup_account pln_account some_pln_money

