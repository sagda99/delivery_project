class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final RegExp emailRegex = RegExp(r'\s');
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email';
    } else if (!value.endsWith('.com')) {
      return 'Please enter a valid email';
    } else if (emailRegex.hasMatch(value)) {
      return 'Emails should not contain spaces';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (value.length > 20) {
      return 'Password must be less than 20 characters';
    }
    return null;
  }

  static String? vaildatePhone(String? value) {
    final RegExp phoneRegex = RegExp(r'^\+\d+$');
    if (value == null || value.isEmpty) {
      return 'Please enter your phone';
    } else if (value.length < 7 || value.length > 15) {
      return 'Please enter a valid phone';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Phone number must start with + and contain oonly digits';
    }
    return null;
  }
  
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your OTP';
    }
    return null;
  }
}
