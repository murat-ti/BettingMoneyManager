class DropdownItem {
  int id;
  String value;

  DropdownItem({required this.id, required this.value});

  @override
  String toString() {
    return '$id => $value';
  }
}