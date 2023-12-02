import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/app/core/utils/keys.dart';
class StorageService extends GetxService{
  //intillize the local storage
  late GetStorage _box;
  Future<StorageService> init() async{
    _box = GetStorage();
    await _box.writeIfNull(taskKey,[]);
    return this;
  }

  //Reading from local storage as generic type
  T read<T>(String key){
    return _box.read(key);
  }

  void write(String key , dynamic value) async{
    await _box.write(key, value);
  }
}