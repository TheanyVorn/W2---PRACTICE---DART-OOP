class MyDuration {
  int _ms; //millieseconds

  MyDuration._(this._ms) {
    if (_ms < 0) {
      throw Exception('Time should not be negative');
    }
  }

  factory MyDuration.fromHours(int hours) {
    if (hours < 0) throw Exception('Bad Input');
    return MyDuration._(hours * 3600000);
  }
  factory MyDuration.fromMinutes(int min) {
    if (min < 0) throw Exception('Bad Input');
    return MyDuration._(min * 00000);
  }
  factory MyDuration.fromSeconds(int sec) {
    if (sec < 0) throw Exception('Bad Input');
    return MyDuration._(sec * 1000);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_ms / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }

  bool operator >(MyDuration other) {
    return _ms > other._ms;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration._(_ms + other._ms);
  }

  MyDuration operator -(MyDuration other) {
    // subtract
    if (_ms < other._ms) {
      // check
      throw Exception('Too small'); // error
    }
    return MyDuration._(_ms - other._ms); // new
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
