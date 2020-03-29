class Connection {
  final int id;
  final String connection_name;
  final int connection_pin;
  final bool is_high;

  Connection(this.id, this.connection_name, this.connection_pin, this.is_high);
}

class States {
  final bool is_high;

  States(this.is_high);
}
