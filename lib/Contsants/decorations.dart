import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppTextField extends StatefulWidget {
  static const enable = true;
  static const disable = false;
  final TextEditingController? controller;
  final String hintText;
  final TextStyle textStyle;
  final bool isPassword;

  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool form;
  final ToolbarOptions? toolbarOptions;
  AppTextField({
    this.controller,
    required this.hintText,
    this.toolbarOptions = const ToolbarOptions(
        copy: true, paste: true, selectAll: true, cut: true),
    this.isPassword = false,
    this.onChange,
    this.keyboardType = TextInputType.text,
    this.form = AppTextField.disable,
    this.validator,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  var enter = 'Enter ';
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 0),
      child: widget.form
          ? TextFormField(
        toolbarOptions: widget.toolbarOptions,
        obscureText: widget.isPassword ? isObscure : false,

        style: widget.textStyle,
        decoration: _inputDecoration(),

        /// The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some data into field';
          } else {
            var callback = widget.validator;
            if (callback != null) {
              return callback(value);
            }
          }
          return null;
        },
        onChanged: (a) {
          var callback = widget.onChange;
          if (callback != null) {
            callback(a);
          }
        },
      )
          : TextField(
              obscureText: !isObscure,
              onChanged: (a) {
                var callback = widget.onChange;
                if (callback != null) {
                  callback(a);
                }
              },
              keyboardType: widget.keyboardType,
              style: widget.textStyle,
              decoration: _inputDecoration(),
              controller: widget.controller,
            ),
    );
  }



  InputDecoration _inputDecoration() {
    return InputDecoration(
      suffixIcon: widget.isPassword
          ? IconButton(
              icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              })
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      filled: true,
      hintStyle: new TextStyle(
        color: NeumorphicTheme.currentTheme(context).textTheme.bodyText1!.color,
      ),
      labelStyle: new TextStyle(
        color: NeumorphicTheme.currentTheme(context).textTheme.bodyText1!.color,
      ),
      hintText: '$enter ${widget.hintText}...',
      labelText: "${widget.hintText}",
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      fillColor: NeumorphicTheme.baseColor(context),
    );
  }
}
