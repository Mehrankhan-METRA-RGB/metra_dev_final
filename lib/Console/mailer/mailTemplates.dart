
import 'package:html/parser.dart' show parse;
// ignore: must_be_immutable
class Template {
Template._private();
 static final Template instance= Template._private();

 vCardToken({token,pin,imageUrl}){
  var _document = parse(
      '''<p style="text-align: center;"><strong><img src="$imageUrl" alt="Metra-App" width=100% height="300" /></strong></p>
<p>&nbsp;</p>
<p><strong>Congratulations</strong>! Your card has been generated. The following Credentials will be useful for <strong>Virtual Card</strong> Assitant.</p>
<ul>
<li>The Token contains user card decoration credentials.</li>
<li>Pin contains a simple number that will validate the token while loading your <strong>VCard.</strong></li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h3 style="text-align: center;"><strong>Don't Share these Credentials with anyone.</strong></h3>
<p>&nbsp;</p>
<p><span style="color: #ff0000;"><strong>If this message does not belong to you Please Delete it as soon as possible.</strong></span></p>
<p>&nbsp;</p>
<p><strong>Token: </strong>$token</p>
<p><strong>PIN: </strong>$pin</p>
<p><strong>How to fetch VCard?</strong></p>
<ol>
<li>Download METRA Application on the given <a title="Metra App" href="https://play.google.com/store/apps/details?id=com.developer.metra.metra_org_security" target="_blank" rel="noopener">link</a>.&nbsp;</li>
<li>Click on Virtual Card. You will see the login form.</li>
<li>Copy the above credentials and paste them into the particular fields in the METRA APP.</li>
<li>Then click on "Load" to load your Virtual card.&nbsp;</li>
</ol>''');
  return _document.outerHtml;
}

}
