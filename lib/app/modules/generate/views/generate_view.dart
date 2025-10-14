import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../controllers/app_controller.dart';
import '../../../models/wallpaper.dart';
import '../../../widgets/views/custom_text_popup.dart';
import '../../../widgets/views/loading_shimmer_view.dart';
import '../controllers/generate_controller.dart';

class GenerateView extends GetView<GenerateController> {
  const GenerateView({super.key});
  @override
  Widget build(BuildContext context) {
    final appcontroller = Get.find<AppController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Generate'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (controller.showPopup.value)
                            ? CustomTextPopup(
                                text: controller.template,
                                value: (value) {
                                  controller.prompt = value;
                                },
                              )
                            : TextFormField(
                                controller: controller.promptTextController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your prompt here...',
                                ),
                                maxLines: null,
                                maxLength: 1000,
                                onChanged: (value) {
                                  controller.prompt = value;
                                },
                              ),

                        // if template not null show button
                        (controller.template != '')
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  icon: const Icon(Icons.edit_note),
                                  label: (controller.showPopup.value)
                                      ? const Text('Edit entire prompt')
                                      : const Text('Edit with template'),
                                  onPressed: () {
                                    controller.showPopup.value =
                                        !controller.showPopup.value;
                                  },
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),

              // button
              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FilledButton(
                  onPressed: () {
                    // if use text field get prompt from text field
                    if (controller.showPopup.value == false) {
                      controller.prompt = controller.promptTextController.text;
                    }
                    log(controller.prompt);
                    controller.isSubmit.value = true;
                    controller.update(['build']);
                  },
                  child: const Text('Generate'),
                ),
              ),
              const Gap(8.0),
              // generate image
              GetBuilder<GenerateController>(
                id: 'build',
                builder: (controller) {
                  if (controller.isSubmit.value) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 16,
                      ),
                      itemBuilder: (context, index) {
                        log('generate image > $index');
                        controller.isSubmit.value = false;
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: FutureBuilder(
                            future: appcontroller.generateTextToImage(
                                prompt: controller.prompt),
                            builder: (BuildContext context,
                                AsyncSnapshot<Uint8List> snapshot) {
                              if (snapshot.hasData) {
                                final image = snapshot.data;
                                appcontroller.saveToImageGallery(
                                    imageBytes: image!);
                                appcontroller
                                    .saveWallpaper(
                                      image: image,
                                      prompt: controller.prompt,
                                      template: controller.template,
                                      type: WallpaperType.generated,
                                    )
                                    .then((v) =>
                                        appcontroller.loadGeneratedWallpaper());

                                return Image.memory(
                                  image,
                                  fit: BoxFit.cover,
                                );
                              }

                              return const LoadingShimmerView();
                            },
                          ),
                        );
                      },
                    );
                  }

                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
