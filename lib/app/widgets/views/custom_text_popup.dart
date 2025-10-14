import 'package:flutter/material.dart';

class CustomTextPopup extends StatefulWidget {
  final String text;
  final Function(String)? onChanged;
  final Function(String)? value;

  const CustomTextPopup({
    super.key,
    required this.text,
    this.onChanged,
    this.value,
  });

  @override
  State<CustomTextPopup> createState() => _CustomTextPopupState();
}

class _CustomTextPopupState extends State<CustomTextPopup> {
  final RegExp _customFieldRegex = RegExp(r'\[([^\]]+)\]');
  late Map<String, String> _selectedOptions;

  @override
  void initState() {
    super.initState();
    _selectedOptions = {};
    _initializeSelectedOptions();
  }

  void _initializeSelectedOptions() {
    for (Match match in _customFieldRegex.allMatches(widget.text)) {
      String field = match.group(1)!;
      List<String> options = _getOptions(field);
      _selectedOptions[field] = options.first;
    }
    String resultText = _generateResultText();

    widget.value?.call(resultText);
  }

  List<String> _getOptions(String field) {
    return field.split(',').map((e) => e.trim()).toList();
  }

  String _generateResultText() {
    String result = widget.text;
    _selectedOptions.forEach((field, selection) {
      result = result.replaceFirst('[$field]', selection);
    });
    return result;
  }

  Widget _buildPopupMenu(String field) {
    List<String> options = _getOptions(field);

    return PopupMenuButton<String>(
      initialValue: _selectedOptions[field],
      onSelected: (String newValue) {
        setState(() {
          _selectedOptions[field] = newValue;
          String resultText = _generateResultText();
          widget.onChanged?.call(resultText);
          widget.value?.call(resultText);
        });
      },
      itemBuilder: (BuildContext context) {
        return options.map((String option) {
          return PopupMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList();
      },
      child: Text(
        _selectedOptions[field]!,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];
    int lastMatchEnd = 0;

    for (Match match in _customFieldRegex.allMatches(widget.text)) {
      if (match.start > lastMatchEnd) {
        textSpans.add(
            TextSpan(text: widget.text.substring(lastMatchEnd, match.start)));
      }
      String field = match.group(1)!;
      textSpans.add(WidgetSpan(child: _buildPopupMenu(field)));
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < widget.text.length) {
      textSpans.add(TextSpan(text: widget.text.substring(lastMatchEnd)));
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: textSpans,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String text;
  final Function(String) onResult;

  const CustomTextField({
    super.key,
    required this.text,
    required this.onResult,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final Map<String, TextEditingController> _controllers = {};
  final RegExp _textFieldPattern = RegExp(r'\[([^\]]*)\]');

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final matches = _textFieldPattern.allMatches(widget.text);
    for (final match in matches) {
      final key = match.group(1) ?? '';
      _controllers[key] = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    int lastIndex = 0;

    _textFieldPattern.allMatches(widget.text).forEach((match) {
      if (match.start > lastIndex) {
        widgets.add(Text(widget.text.substring(lastIndex, match.start)));
      }

      final key = match.group(1) ?? '';
      widgets.add(SizedBox(
        width: 100,
        child: TextField(
          controller: _controllers[key],
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          onChanged: (_) => _updateResult(),
        ),
      ));

      _controllers[key]!.text = key;

      lastIndex = match.end;
    });

    if (lastIndex < widget.text.length) {
      widgets.add(Text(widget.text.substring(lastIndex)));
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: widgets,
    );
  }

  void _updateResult() {
    String result = widget.text;
    for (final entry in _controllers.entries) {
      result = result.replaceAll('[${entry.key}]', entry.value.text);
    }
    widget.onResult(result);
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
