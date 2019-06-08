import 'dart:async';

mixin CardValidators {
  final validateHolderName = StreamTransformer<String, String>.fromHandlers(
      handleData: (holderName, sink) {
    RegExp('[a-zA-Z]').hasMatch(holderName)
        ? sink.add(holderName)
        : sink.addError('Enter a valid Name');
  });

  final validateNumber = StreamTransformer<String, String>.fromHandlers(
      handleData: (number, sink) {
    RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$')
            // 2nd Regular Expression to remove white spaces
            .hasMatch(number.replaceAll(RegExp(r'\s+\b|\b\s'), ''))
        ? sink.add(number)
        : sink.addError('Enter a valid  number');
  });

  final validateMonth =
      StreamTransformer<String, String>.fromHandlers(handleData: (month, sink) {
    if (month.isNotEmpty && int.parse(month) > 0 && int.parse(month) < 13) {
      sink.add(month);
    } else {
      sink.addError('Err month');
    }
  });

  final validateYear =
      StreamTransformer<String, String>.fromHandlers(handleData: (year, sink) {
    if (year.isNotEmpty && int.parse(year) > 2000 && int.parse(year) < 2028) {
      sink.add(year);
    } else {
      sink.addError('Invalid year');
    }
  });

  final validateVerificationValue =
      StreamTransformer<String, String>.fromHandlers(handleData: (cvv, sink) {
    if (cvv.length > 2) {
      sink.add(cvv);
    } else {
      sink.addError('Invalid cvv');
    }
  });
}
