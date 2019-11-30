import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ExpandedEventItem extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double height;
  final bool isVisible;
  final double borderRadius;
  final String title;
  final String date;

  final Duration duration = Duration(milliseconds: 200);

  ExpandedEventItem({
    this.topMargin,
    this.height,
    this.isVisible,
    this.borderRadius,
    this.title,
    this.date,
    this.leftMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: duration,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: height).add(EdgeInsets.all(8)),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        AutoSizeText(
          title,
          style: TextStyle(fontSize: 16),
          maxLines: 2,
        ),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Text(
              '1 ticket',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(width: 8),
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Icon(
              Icons.place,
              color: Colors.grey.shade400,
              size: 16,
            ),
            Flexible(
              child: AutoSizeText(
                'Science Park 10 25A',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  // fontSize: 13,
                ),
                maxLines: 1,
              ),
            )
          ],
        ),
      ],
    );
  }
}
