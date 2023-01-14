import 'dart:developer';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:twitter_oembed_api/twitter_oembed_api.dart';


String data = 'yesssssssss';
String david = 'CovPhoenixFC';
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
 data-theme="dark" href="https://twitter.com/$david?ref_src=twsrc%5Etfw">Tweets by $david</a>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br>
<br>

<script async defer src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2"></script>  
  <div class="fb-post" 
      data-href="https://www.facebook.com/20531316728/posts/10154009990506729/"
      data-width="500"></div>
      
      <br>
      <br>
      <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Ffeyisayo.fagbadegun%2Fposts%2Fpfbid0fgNL9p7tXGLbMs5ieUoWMo67PeC55hFj92zTRNjYJMMDmBc53yQvoebjFTe5m6h7l&show_text=true&width=500" width="500" height="396" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>

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

