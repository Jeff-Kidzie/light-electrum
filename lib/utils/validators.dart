class Validators {
  // Email validation
  static String? validateEmail(String email) {
    final trimmedEmail = email.trim();

    if (trimmedEmail.isEmpty) {
      return 'Email address is required';
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(trimmedEmail)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  // Full name validation (for register)
  static String? validateFullName(String fullName) {
    final trimmedName = fullName.trim();

    if (trimmedName.isEmpty) {
      return 'Full name is required';
    } else if (trimmedName.length < 3) {
      return 'Full name must be at least 3 characters';
    } else if (trimmedName.contains(RegExp(r'[0-9]'))) {
      return 'Full name cannot contain numbers';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmedName)) {
      return 'Full name can only contain letters and spaces';
    }
    return null;
  }
}
