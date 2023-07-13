
import 'dart:io';

void main() {
  // final directoryPath = ;
  final directory = Directory.current;

  if (directory.existsSync()) {
    printDirectoryContents(directory);
  } else {
    print('Directory not found!');
  }
}

void printDirectoryContents(Directory directory, [String parentPath = '']) {
  final files = directory.listSync();

  for (var file in files) {
    if (file is File) {
      // final fileName = file.path.split('/').last;
      final fileName = file.parent;
      final fullPath = parentPath.isNotEmpty ? '$fileName' : fileName;
      print('File: $fullPath');
    } else if (file is Directory) {
      final folderName = file.path.split('-').last;
      final fullPath = parentPath.isNotEmpty ? '$folderName' : folderName;
      print('Folder: $fullPath');
      printDirectoryContents(file, fullPath);
    }
  }
}
