import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../models/wallpaper.dart';
import '../../../routes/app_pages.dart';
import '../controllers/view_image_controller.dart';

class ViewImageView extends GetView<ViewImageController> {
  const ViewImageView({super.key});
  @override
  Widget build(BuildContext context) {
    final item = Get.arguments as Wallpaper;
    final data = item.imageData;
    final image = Uint8List.fromList(data!);
    final prompt = item.prompt;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          // image
          Image.memory(
            image,
            fit: BoxFit.fitHeight,
          ),
          // toolbar
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // prompt
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$prompt'),
                  ),
                  // buttons
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FilledButton.tonalIcon(
                        onPressed: () async {
                          // save to image gallery
                          await Get.find<AppController>()
                              .share(imageBytes: image);
                        },
                        label: const Text('Share'),
                        icon: const Icon(Icons.share),
                      ),
                      const Gap(4.0),
                      FilledButton.tonalIcon(
                        onPressed: () async {
                          // save to image gallery
                          await Get.find<AppController>()
                              .saveToImageGallery(imageBytes: image)
                              .then((_) {
                            Get.snackbar('Info', 'Saved to Image Gallery');
                          });
                        },
                        label: const Text('Save'),
                        icon: const Icon(Icons.download),
                      ),
                      const Gap(4.0),
                      FilledButton.tonalIcon(
                        onPressed: () {
                          Get.toNamed(
                            Routes.GENERATE,
                            parameters: {
                              "prompt": '${item.prompt}',
                              "template": '${item.template}',
                              "popup": 'n',
                            },
                          );
                        },
                        label: const Text('Generate'),
                        icon: const Icon(Icons.replay),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
