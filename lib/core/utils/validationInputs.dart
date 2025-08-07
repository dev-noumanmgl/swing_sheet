String? validateFirstName(String? value) {
  if (value == null || value.isEmpty) {
    return 'First name is required';
  }
  if (value.length < 2) {
    return 'First name should be at least 2 characters long';
  }
  return null;
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Last name is required';
  }
  if (value.length < 2) {
    return 'Last name should be at least 2 characters long';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Contact number is required';
  }
  String pattern = r'^[0-9]{10}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter a valid 10-digit phone number';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 6) {
    return 'Password should be at least 6 characters long';
  }
  return null;
}
