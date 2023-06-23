import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';



// ---------- Holding BottonNavigationBar index number ----------
final bnbIndexControllerProvider = StateNotifierProvider.autoDispose<BnbIndexController, int>((ref) {
  return BnbIndexController(0);
});

class BnbIndexController extends StateNotifier<int>{
  BnbIndexController(super.state);

  void setPosition(int value){
    state = value;
  }
}


// ----------- state notifier provider for picked image file -----------
final imageFileProvider = StateNotifierProvider.autoDispose<ImageFileNotifier, File?>((ref) => ImageFileNotifier());
// state notifier class for my image file:
class ImageFileNotifier extends StateNotifier<File?> {
  ImageFileNotifier() : super(null);

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      state = File(pickedFile.path);
    }
  }
}