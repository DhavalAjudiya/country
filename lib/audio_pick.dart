import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudiyoPick extends StatefulWidget {
  const AudiyoPick({Key? key}) : super(key: key);

  @override
  State<AudiyoPick> createState() => _AudiyoPickState();
}

class _AudiyoPickState extends State<AudiyoPick> {
  // final _player = AudioPlayer();
  late final AudioCache _audioCache;
  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'audio/',
    );
    _audioCache.fixedPlayer?.notificationService.startHeadlessService();
  }
  // playAudio() async {
  //   try {
  //     // await _player.setFilePath(widget.audioPath);
  //   } catch (e) {
  //     log("Error loading audio source: $e");
  //   }
  //   _player.play();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.audio,
                );
                print("result == ${result!.files}");

                // try {
                //   await _player.setFilePath("${result.files}");
                // } catch (e) {
                //   log("Error loading audio source: $e");
                // }
                // _player.play();
                // if (result != null) {
                //   File file = File(result);
                // } else {
                //   // User canceled the picker
                // }
              },
              child: Text("Pick File"),
            ),
            ElevatedButton(
              onPressed: () => _audioCache.play('my_audio.mp3'),
              child: Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
