import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../../Contsants/app.dart';
import 'GoogleSignIn.dart';
import 'mailTemplates.dart';
const GMAIL_SCHEMA = 'com.google.android.gm';
class EmailSender extends StatefulWidget {
  final String? recipient;
  final dynamic body;
  final String subject;

  EmailSender({this.body, this.recipient, this.subject = 'VCard Token'});
  // const EmailSender({Key? key}) : super(key: key);

  @override
  _EmailSenderState createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  bool isHTML = false;





  Future<void> _send() async {
    // final bool gmailinstalled =  await isAppInstalled(GMAIL_SCHEMA);
    //  MailOptions? mailOptions;
    //
    //  mailOptions = MailOptions(
    //     body:
    //     // 'Token:\n\n${widget.body['token']}\n\n\nPIN: ${widget.body['PIN']}'
    //      Template.instance.vCardToken(token:widget.body['token'],pin: widget.body['PIN'].toString(),imageUrl: 'url'
    //      ),
    //     subject: widget.subject,
    //     recipients: [widget.recipient!],
    //     isHTML: true,
    //
    //     // bccRecipients: ['other@example.com'],
    //     // ccRecipients: ['third@example.com'],
    //     // attachments: [ 'path/to/image.png', ],
    //     appSchema: GMAIL_SCHEMA,
    //   );
 var user=  await GoogleAuthApi.signIn();

 if(user==null)return;
var _email=user.email;
var _auth=await user.authentication;
var _token=_auth.accessToken;
// var cred=JWT.decodeJWT(mailerAuth);
// var jwte=JWT.decodeJWT(jsonDecode(cred)['email']);
// var jwtp=JWT.decodeJWT(jsonDecode(cred)['pass']);
// print('email:$jwte\n pass:$jwtp');
//     final smtpServer = gmail(jwte, jwtp);
    final smtpAUTH2Server = gmailSaslXoauth2(_email, _token!);


var message = Message()
  ..from = Address(_email, 'Meezar')
  ..recipients.add('m.jan9396@gmail.com')
  // ..ccRecipients.addAll([])
  // ..bccRecipients.add(Address(''))
  ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
  // ..text = 'This is the plain text.\nThis is line 2 of the text part.';
   ..html = Template.instance.vCardToken(token: 'token090990',
   pin:'98986',
   imageUrl: 'https://th.bing.com/th/id/OIP.KDaNo3vPbY2LAJzEa2zhlAHaCU?w=311&h=109&c=7&r=0&o=5&dpr=1.25&pid=1.7');

try {
  final sendReport = await send(message, smtpAUTH2Server);
  print('Message sent: ' + sendReport.toString());
  App.snackBar(context,text:'Message sent: ' + sendReport.toString(),color: Colors.green,textColor: Colors.white);

} on MailerException catch (e) {
  App.snackBar(context,text:'Message not sent',color: Colors.red,textColor: Colors.white);
  print('Message not sent.');
  for (var p in e.problems) {
    print('Problem: ${p.code}: ${p.msg}');
    App.snackBar(context,text:'Problem: ${p.code}: ${p.msg}',color: Colors.red,textColor: Colors.white);

  }
}
  }

  @override
  void initState() {
    // : implement initState
    super.initState();
    // _bodyController = TextEditingController(
    //   text: widget.body,
    // );
  }
var headingStyle;
  @override
  Widget build(BuildContext context) {
  headingStyle=NeumorphicTheme.currentTheme(context)
      .textTheme
      .headline5;
    return Container(
      height: MediaQuery.of(context).size.height-200,
      width:MediaQuery.of(context).size.width-80,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SelectableText(
            'VCard for widget.body[name]\n\n',
            style: NeumorphicTheme.currentTheme(context)
                .textTheme
                .headline6,),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
              child:Column(      crossAxisAlignment: CrossAxisAlignment.start,
                children: [App.tileText(context, heading: 'Recipients', value: "widget.recipient",headingStyle:headingStyle ),
                  App.tileText(context, heading: 'Subject', value: "widget.subject",headingStyle:headingStyle),
                  SelectableText(
                    'Body',
                    style: headingStyle,),
                  App.tileText(context, heading: 'Token', value: "widget.body['token']"),
                  App.tileText(context, heading: 'PIN', value: "widget.body['PIN'].toString()"),],),
            ),
          ),
          CheckboxListTile(
            contentPadding:
            EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            title: Text('HTML'),
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  isHTML = value;
                });
              }
            },
            value: isHTML,
          ),
          Container(
            decoration: BoxDecoration(
              color: NeumorphicTheme.currentTheme(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Send',
                      style: TextStyle(
                        color: NeumorphicTheme.currentTheme(context)
                            .appBarTheme
                            .iconTheme!
                            .color,
                        fontSize: NeumorphicTheme.currentTheme(context)
                            .textTheme
                            .headline6!
                            .fontSize,
                        fontFamily: NeumorphicTheme.currentTheme(context)
                            .textTheme
                            .headline6!
                            .fontFamily,
                      )),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    _send();
                    // Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.send,
                    color: NeumorphicTheme.currentTheme(context)
                        .appBarTheme
                        .iconTheme!
                        .color,
                    size: 26,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
