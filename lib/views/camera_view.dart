import 'package:flutter/material.dart';
import 'package:nutripic/view_models/camera_view_model.dart';
import 'package:nutripic/view_models/camerawesome_view.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CameraAwesome(),
    );
  }
}
