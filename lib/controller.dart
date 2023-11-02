import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController extends GetxController{

  RxString imagepath = ''.obs;

  Future getImage() async{
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if(image != null){
      imagepath.value = image.path.toString();
    }
  }


}