enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);

  String get FullAddress {
    return '$street, $city, $zipCode';
  }
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  int _yearsOfExperience;
  Address _address;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._yearsOfExperience,
    this._address,
  );

  Employee.WebDev(
    String name,
    double salary,
    Skill skill,
    int experient,
    Address address,
  ) : _name = name,
      _baseSalary = salary,
      _skills = [Skill.FLUTTER, Skill.DART],
      _yearsOfExperience = experient,
      _address = address;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skill => _skills;
  int get yearsOfExperience => _yearsOfExperience;
  Address get address => _address;

  double get totalSalary {
    double total = _baseSalary;
    total += _yearsOfExperience * 2000.0;
    for (var s in _skills) {
      if (s == Skill.FLUTTER) {
        total += 5000;
      } else if (s == Skill.DART) {
        total += 3000;
      } else {
        total += 1000;
      }
    }
    return total;
  }

  void printDetails() {
    print(
      'Employee: $_name, Base Salary: \$${_baseSalary}, Total pay: \$${totalSalary.toStringAsFixed(0)}, Skills: ${_skills.map((s) => s.name).toList()}, YearsOfExperient: $_yearsOfExperience, Address: ${_address.FullAddress}',
    );
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.FLUTTER, Skill.DART],
    3,
    Address('Street 12, 407A', 'Phnom Penh', '12000'),
  );
  emp1.printDetails();

  var emp2 = Employee(
    'Ronan',
    45000,
    [Skill.DART],
    2,
    Address('Kompong Plok', 'Siem Reap', '13000'),
  );
  emp2.printDetails();
}
