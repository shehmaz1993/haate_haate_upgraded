
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';



import 'fileItem.dart';
class FileAddNotifier extends ChangeNotifier{

  List<FileItem> filelist=[];
  addFile( Future<Uint8List> fileitem)async{
    FileItem scannedfile=FileItem(fileitem);
    filelist.add(scannedfile);
    notifyListeners();
  }

}