import 'package:financial_wellness/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ResultBar extends StatelessWidget {
  const ResultBar({super.key, required this.score});

  final String score;

  Color get _getColor {
    switch (score) {
      case 'Healthy':
        return AppColors.green;
      case 'Average':
        return AppColors.yellow;
      default:
        return AppColors.red;
    }
  }

  Color _getColorForIndex(int index) {
    switch (index) {
      case 0:
        return _getColor;
      case 1:
        return (score == 'Healthy' || score == 'Average')
            ? _getColor
            : AppColors.lightWhite;
      case 2:
        return score == 'Healthy' ? _getColor : AppColors.lightWhite;
      default:
        return AppColors.lightWhite;
    }
  }

  Widget _buildContainer(int index) {
    return Expanded(
      child: Container(
        height: 16,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: index < 2
              ? const Border(
                  right: BorderSide(color: Colors.white, width: 4),
                )
              : null,
          color: _getColorForIndex(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) => _buildContainer(index)),
      ),
    );
  }
}
