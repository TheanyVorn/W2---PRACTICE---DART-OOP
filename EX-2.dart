class BankAccount {
  int _accId;
  String _accOwner;
  double _balance = 0.0;

  BankAccount(this._accId, this._accOwner);

  String get accOwner => _accOwner;

  double getBalance() {
    return _balance;
  }

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception('No Money remained');
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  String _bankName;
  List<BankAccount> _accounts = [];

  Bank(this._bankName);

  BankAccount createAccount(int accId, String accOwner) {
    for (int i = 0; i < _accounts.length; i++) {
      if (_accounts[i]._accId == accId) {
        throw Exception('ID is already used');
      }
    }

    BankAccount newOne = BankAccount(accId, accOwner);
    _accounts.add(newOne);
    return newOne;
  }
}

void main() {
  Bank myBank = Bank("CADT Bank");
  print('Welcome to ${myBank._bankName}');
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount._balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount._balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount._balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Hongly'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
