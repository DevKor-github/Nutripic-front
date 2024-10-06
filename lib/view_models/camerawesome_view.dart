import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:nutripic/components/custom_app_bar.dart';

class CameraAwesome extends StatefulWidget {
  const CameraAwesome({super.key});

  @override
  State<CameraAwesome> createState() => _CameraAwesomeState();
}

class _CameraAwesomeState extends State<CameraAwesome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(title: "Camera"),
        body: Container(
          color: Colors.white,
          child: CameraAwesomeBuilder.awesome(
            saveConfig: SaveConfig.photo(),
            sensorConfig: SensorConfig.single(
              aspectRatio: CameraAspectRatios.ratio_4_3,
              flashMode: FlashMode.auto,
              sensor: Sensor.position(SensorPosition.back),
              zoom: 0.0,
            ),
            previewAlignment: Alignment.bottomLeft,
            previewPadding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}

final camera = CameraAwesomeBuilder.awesome(
  saveConfig: SaveConfig.photo(),
  sensorConfig: SensorConfig.single(
    aspectRatio: CameraAspectRatios.ratio_4_3,
    flashMode: FlashMode.auto,
    sensor: Sensor.position(SensorPosition.back),
    zoom: 0.0,
  ),
  previewAlignment: Alignment.bottomLeft,
  previewPadding: const EdgeInsets.all(10),
);
/*

import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class CustomCameraScreen extends StatefulWidget {
  final int left;

  const CustomCameraScreen({super.key, required this.left});

  @override
  State<CustomCameraScreen> createState() => _CustomCameraScreenState();
}

class _CustomCameraScreenState extends State<CustomCameraScreen> {
  double opacityLevel = 0.0;
  bool showFlashEffect = false;

  List<File> takenFiles = [];

  void triggerFlashEffect() {
    setState(() {
      showFlashEffect = true;
      opacityLevel = 0.5; // Start with 50% opacity for fade-in
    });
  }

  Future<String> createFile() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getApplicationDocumentsDirectory()
        : await getApplicationSupportDirectory();

    String path =
        "${documentDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";

    return path;
  }

  Future<void> saveFile(String path) async {
    await ImageGallerySaver.saveFile(path);
    setState(() {
      takenFiles.add(File(path));
    });

    setState(() {
      showFlashEffect = false;
      opacityLevel = 0.0; // Set back to 0% for fade-out
    });
  }

  void onCaptureSuccess(String path) async {
    await saveFile(path);
    setState(() {
      showFlashEffect = false;
    });
  }

  void onSubmit(List<File> files) {
    Navigator.of(context).pop(files);
  }

  void onPressCamera() {
    triggerFlashEffect();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              camera,
              if (showFlashEffect)
                Positioned.fill(
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: opacityLevel),
                    duration: const Duration(milliseconds: 100),
                    // Quick fade in
                    onEnd: () {},
                    builder: (context, double anim, child) {
                      return Opacity(
                        opacity: anim,
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: double.infinity,
                          child: child,
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCameraButton extends StatefulWidget {
  final CameraState state;
  final Function(String) onCaptureSuccess;
  final VoidCallback onPressed;

  const CustomCameraButton({
    super.key,
    required this.state,
    required this.onPressed,
    required this.onCaptureSuccess,
  });

  @override
  _CustomCameraButtonState createState() => _CustomCameraButtonState();
}

class _CustomCameraButtonState extends State<CustomCameraButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double _scale;
  final Duration _duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is AnalysisController) {
      return Container();
    }
    _scale = 1 - _animationController.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AspectRatio(
        aspectRatio: 1,
        child: SizedBox(
          key: const ValueKey('cameraButton'),
          height: 80,
          width: 80,
          child: Transform.scale(
            scale: _scale,
            child: CustomPaint(
              painter: widget.state.when(
                onPhotoMode: (_) => CameraButtonPainter(),
                onPreparingCamera: (_) => CameraButtonPainter(),
                onVideoMode: (_) => VideoButtonPainter(),
                onVideoRecordingMode: (_) =>
                    VideoButtonPainter(isRecording: true),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  _onTapUp(TapUpDetails details) {
    Future.delayed(_duration, () {
      _animationController.reverse();
    });

    widget.onPressed();
    onTap.call();
  }

  _onTapCancel() {
    _animationController.reverse();
  }

  get onTap => () {
        widget.state.when(
          onPhotoMode: (photoState) => photoState.takePhoto().then((value) {}),
          onVideoMode: (videoState) => videoState.startRecording(),
          onVideoRecordingMode: (videoState) => videoState.stopRecording(),
        );
      };
}

class CameraButtonPainter extends CustomPainter {
  CameraButtonPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    var radius = size.width / 2;
    var center = Offset(size.width / 2, size.height / 2);
    bgPainter.color = Colors.transparent;
    canvas.drawCircle(center, radius, bgPainter);

    bgPainter.color = Colors.white.withOpacity(0.9);
    canvas.drawCircle(center, radius - 8, bgPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VideoButtonPainter extends CustomPainter {
  final bool isRecording;

  VideoButtonPainter({
    this.isRecording = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    var radius = size.width / 2;
    var center = Offset(size.width / 2, size.height / 2);
    bgPainter.color = Colors.white.withOpacity(.5);
    canvas.drawCircle(center, radius, bgPainter);

    if (isRecording) {
      bgPainter.color = Colors.red;
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(
                17,
                17,
                size.width - (17 * 2),
                size.height - (17 * 2),
              ),
              const Radius.circular(12.0)),
          bgPainter);
    } else {
      bgPainter.color = Colors.red;
      canvas.drawCircle(center, radius - 8, bgPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
*/