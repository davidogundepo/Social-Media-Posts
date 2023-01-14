import 'dart:developer';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:twitter_oembed_api/twitter_oembed_api.dart';


String data = 'yesssssssss';
String tdavid = 'CovPhoenixFC';
String fbpost = '10230216701908573';
String data3 = 'meeeeeeeee';

dynamic embeddedTimeline;


void main() async {

  final twitterApi = TwitterOEmbedApi();

  embeddedTimeline = await twitterApi.publishEmbeddedTimeline(
    screenName: 'DavidOOludepo',
    limit: 3,
    theme: ContentTheme.dark,
  );


  runApp( MaterialApp(home: MyHomePage(
      embeddedTimelineHtml: embeddedTimeline.html
  )
  ));

  log('data: $data');



}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     log('data: $data2');
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {

  final String embeddedTimelineHtml;

  const MyHomePage({Key? key, required this.embeddedTimelineHtml}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    log(embeddedTimeline.html);
    // log(this.embeddedTimelineHtml);

    log('data: $data3');

    return Scaffold(
      appBar: AppBar(
        title: const Text('sss'),
      ),
      body: Center(
        // child: Text(embeddedTimeline.html),
        // child: Text(this.embeddedTimelineHtml,),
      child: Container(
        height: MediaQuery.of(context).size.height * .75,
        child: InAppWebView(
          // data: embeddedTimeline.html
          initialData: InAppWebViewInitialData(
              data: '''
<!DOCTYPE html><html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.5, shrink-to-fit=no">
        <meta name="viewport" content="initial-scale=1, user-scalable=no"/>
</head>
<body style="pointer-events: none">
<a class="twitter-timeline" data-tweet-limit="5" data-chrome="nofooter"
 data-theme="dark" href="https://twitter.com/$tdavid?ref_src=twsrc%5Etfw">Tweets by $tdavid</a>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br>
<br>

<script async defer src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2"></script>  
  <div class="fb-post" 
      data-href="https://www.facebook.com/udoisohm/posts/$fbpost"
      ></div>
      <br>
      <br>
     
</body>
</html>
'''
          ),
        ),
      ),
      ),
    );
  }
}

