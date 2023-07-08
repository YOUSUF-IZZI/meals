import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';



// ----------- Holding the Forms in the 'Login page'  ----------------------------------
final loginPageFormGroupProvider = Provider.autoDispose((ref) => FormGroup({
  'email': FormControl<String>(validators: [Validators.required, Validators.email]),
  'password': FormControl<String>(validators: [Validators.required, ]),
}),);


// ----------- Holding the Forms in the 'Register page'  ----------------------------------
final registerPageFormGroupProvider = Provider((ref) => FormGroup({
  'name': FormControl<String>(validators: [Validators.required, ]),
  'surname': FormControl<String>(validators: [Validators.required, ]),
  'email': FormControl<String>(validators: [Validators.required, Validators.email]),
  'birthday': FormControl<String>(validators: [Validators.required, ]),
  'city': FormControl<String>(validators: [Validators.required, ]),
  'district': FormControl<String>(validators: [Validators.required, ]),
  'verificationCode': FormControl<String>(validators: [Validators.required, ]),
  'password': FormControl<String>(validators: [Validators.required, ]),
  'passwordConformation': FormControl<String>(validators: [Validators.required, ]),
}),);


// ----------- Holding the gender type  -----------
final genderTypeProvider = StateProvider<String>((ref) {
  return 'male';
});


// ----------- Holding the index of the selected shopping card from ShoppingFrequencyPage  -----------
final shoppingCardIndexProvider = StateProvider<int>((ref) {
  return 0;
});


// ----------- Holding the number of days to alert user before expiration  -----------
final alertProvider = StateProvider<int>((ref) {
  return 1;
});