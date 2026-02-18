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
    final RegExp passwordRegex = RegExp(r'\s');
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (value.length > 20) {
      return 'Password must be less than 20 characters';
    }else if (passwordRegex.hasMatch(value)) {
      return 'Password should not contain spaces';
    }
    return null;
  }

  static String? vaildatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone';
    } else if (value.length < 7 || value.length > 15) {
      return "Phone number shouldn't be less than 7 digits";
    } 
    return null;
  }
  
  static String? validateConfirmPassword(String? value, String? password) {
    final RegExp passwordRegex = RegExp(r'\s');
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != password) {
      return 'Passwords do not match';
    }else if (passwordRegex.hasMatch(value)) {
      return 'Password should not contain spaces';
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
