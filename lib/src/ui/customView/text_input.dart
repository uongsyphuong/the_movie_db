import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextInputWidget extends StatefulWidget {
  String title;
  TextInputType textInputType;
  bool hasTitle, isPassword;
  FormFieldValidator formFieldValidator;

  TextInputWidget(
      {this.title,
      this.hasTitle = true,
      this.isPassword = false,
      this.formFieldValidator,
      this.textInputType});

  final _TextInputWidgetState state = _TextInputWidgetState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

class _TextInputWidgetState extends State<TextInputWidget> {
  bool _showPassword = false;
  FocusNode _focusNode;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.hasTitle
            ? Text(widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF9E9E9E)))
            : Container(width: 0, height: 0),
        widget.hasTitle
            ? SizedBox(
                height: 8,
              )
            : Container(width: 0, height: 0),
        Container(
          height: 48,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: _focusNode.hasFocus ? Colors.white : Color(0x0D019E84),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: widget.isPassword
              ? TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_showPassword,
                  focusNode: _focusNode,
                  autovalidateMode: AutovalidateMode.always,
                  cursorColor: Color(0xFF019E84),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF019E84)),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      isDense: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        iconSize: 24,
                        icon: _showPassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      )),
                )
              : TextFormField(
                  keyboardType: widget.textInputType,
                  focusNode: _focusNode,
                  cursorColor: Color(0xFF019E84),
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF019E84)),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
        ),
      ],
    );
  }
}
