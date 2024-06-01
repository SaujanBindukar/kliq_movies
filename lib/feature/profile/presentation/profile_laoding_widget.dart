import 'package:flutter/material.dart';
import 'package:kliq_movies/core/widgets/custom_shimmer.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: const CustomShimmer(
                widget: SizedBox(
                  width: double.infinity,
                  height: 80,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(
                  widget: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: double.infinity,
                    height: 20,
                  ),
                ),
                const SizedBox(height: 10),
                CustomShimmer(
                  widget: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: 200,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
