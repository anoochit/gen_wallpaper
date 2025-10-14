import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerView extends GetView {
  const LoadingShimmerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceBright,
      highlightColor: Theme.of(context).colorScheme.primary,
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.preview_outlined),
            Text('Please wait'),
          ],
        ),
      ),
    );
  }
}
