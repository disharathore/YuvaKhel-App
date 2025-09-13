import 'package:flutter/material.dart';

class RulerPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final String unit;
  final int majorTick; // e.g., 5 => show numbers every 5 units
  final ValueChanged<int> onValueChanged;

  const RulerPicker({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.unit,
    required this.onValueChanged,
    this.majorTick = 5,
  });

  @override
  State<RulerPicker> createState() => _RulerPickerState();
}

class _RulerPickerState extends State<RulerPicker> {
  late final ScrollController _controller;
  late int _currentValue;

  final double _tickSpacing = 12.0;
  late final int _count;
  late final double _maxScrollOffset;

  @override
  void initState() {
    super.initState();

    _currentValue = widget.initialValue.clamp(widget.minValue, widget.maxValue);
    _count = widget.maxValue - widget.minValue + 1;
    _maxScrollOffset = (widget.maxValue - widget.minValue) * _tickSpacing;

    _controller = ScrollController(); // ✅ This must be here

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialOffset =
          (widget.initialValue - widget.minValue) * _tickSpacing;
      final bounded = initialOffset.clamp(0.0, _maxScrollOffset);
      _controller.jumpTo(bounded);
      widget.onValueChanged(_currentValue);
    });

    _controller.addListener(() {
      final offset = _controller.offset.clamp(0.0, _maxScrollOffset);
      final computed = widget.minValue + (offset / _tickSpacing).round();
      final clamped = computed.clamp(widget.minValue, widget.maxValue);
      if (clamped != _currentValue) {
        setState(() {
          _currentValue = clamped;
        });
        widget.onValueChanged(_currentValue);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Snap to the nearest tick when the user stops scrolling.
  bool _onScrollEnd(ScrollEndNotification n) {
    final offset = _controller.offset.clamp(0.0, _maxScrollOffset);
    final nearest = (offset / _tickSpacing).round() * _tickSpacing;
    _controller.animateTo(
      nearest,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // padding so the tick can be centered beneath the middle indicator even at edges
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = (screenWidth / 2) - (_tickSpacing / 2);

    return GestureDetector(
      // allow user to drag the indicator to move the ruler
      onHorizontalDragUpdate: (details) {
        final newOffset = (_controller.offset - details.delta.dx)
            .clamp(0.0, _maxScrollOffset);
        _controller.jumpTo(newOffset);
      },
      child: SizedBox(
        height: 150, // keep it a bit compact so it sits slightly upper
        child: Stack(
          alignment: Alignment.center,
          children: [
            // The scrollable ruler
            NotificationListener<ScrollEndNotification>(
              onNotification: _onScrollEnd,
              child: ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                itemCount: _count,
                itemBuilder: (context, index) {
                  final value = widget.minValue + index;
                  final isMajor = (value % widget.majorTick == 0);
                  return SizedBox(
                    width: _tickSpacing,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // tick line
                        Container(
                          height: isMajor ? 42 : 20,
                          width: 2,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 6),
                        // label for major ticks
                        if (isMajor)
                          Text(
                            "$value",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // central indicator (slightly upper within the ruler box)
            Positioned(
              top: 20, // moves it slightly upper / visually centered
              child: Column(
                children: [
                  Container(
                    width: 3,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // small triangle/arrow to hint center
                  Transform.translate(
                    offset: const Offset(0, -8),
                    child: Icon(Icons.arrow_drop_down,
                        color: Colors.white70, size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
