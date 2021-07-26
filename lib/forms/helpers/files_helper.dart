import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FilesHelper {
  FilesHelper._();
  static FilesHelper filesHelper =   FilesHelper._();
  writeInFile(String fileName)async{
   // 1. get Application directory
    Directory directory =await getApplicationDocumentsDirectory();
    // 2. get that file path
    String filePath = join(directory.path, fileName+ '.text');
    String filePath2 = directory.path + '/$fileName.text';
    // 3. create the file
    File file = File(filePath);
    // 4. write in the file
    file.writeAsString('how are you');
  }
  Future<String> readFromFile(String fileName)async{
// 1. get Application directory
    Directory directory =await getApplicationDocumentsDirectory();
    // 2. get that file path
    String filePath = join(directory.path, fileName+ '.text');
    String filePath2 = directory.path + '/$fileName.text';
    // 3. get the file
    File file = File(filePath);
    // 4. read from the file
    String fileContent = await file.readAsString();
    print(fileContent);
    return fileContent;
  }

}