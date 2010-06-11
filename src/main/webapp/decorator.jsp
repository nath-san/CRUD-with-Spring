<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="sv">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Underhåll av enhetstester &laquo; Stacktrace.se</title>

	<style type="text/css" media="screen">
		@import url( http://s0.wp.com/wp-content/themes/pub/connections/style.css?m=1274400606g );
	</style>
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://stacktrace.se/feed/" />
	<link rel="pingback" href="http://stacktrace.se/xmlrpc.php" />

			<script src='http://wordpress.com/remote-login.php?action=js&amp;host=stacktrace.se&amp;id=854322&amp;t=1276258476&amp;back=stacktrace.se%2F2009%2F06%2F26%2Funittest_maintainability_mocks_stubs%2F' type="text/javascript"></script>
		<link rel="alternate" type="application/rss+xml" title="Stacktrace.se &raquo; Underhåll av&nbsp;enhetstester kommentarsflöde" href="http://stacktrace.se/2009/06/26/unittest_maintainability_mocks_stubs/feed/" />
<script type="text/javascript">
/* <![CDATA[ */
function addLoadEvent(func){var oldonload=window.onload;if(typeof window.onload!='function'){window.onload=func;}else{window.onload=function(){oldonload();func();}}}
/* ]]> */
</script>
<link rel="stylesheet" href="http://s0.wp.com/wp-content/themes/h4/global.css?m=1256671583g" type="text/css" />
<script type='text/javascript' src='http://s0.wp.com/wp-includes/js/comment-reply.js?m=1231878779g&amp;ver=20090102'></script>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://cygni.wordpress.com/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://cygni.wordpress.com/wp-includes/wlwmanifest.xml" /> 
<link rel='index' title='Stacktrace.se' href='http://stacktrace.se/' />
<link rel='prev' title='VisualVM/JConsole bakom&nbsp;brandvägg' href='http://stacktrace.se/2009/05/29/visualvmjconsole-bakom-brandvagg/' />
<link rel='next' title='Ny garbage collector i Java 7 (och Java 6 update&nbsp;14)' href='http://stacktrace.se/2009/08/11/ny-gc-i-java-7-och-java-6-update-14/' />
<meta name="generator" content="WordPress.com" />
<link rel='canonical' href='index.html' />
<link rel='shortlink' href='http://wp.me/p3Afo-6V' />
<link rel="shortcut icon" type="image/x-icon" href="http://www.gravatar.com/blavatar/973bf7bc0152e0cf5f4af07bb8bb2861?s=16&#038;d=http://s2.wp.com/i/favicon.ico" />
<link rel="icon" type="image/x-icon" href="http://www.gravatar.com/blavatar/973bf7bc0152e0cf5f4af07bb8bb2861?s=16&#038;d=http://s2.wp.com/i/favicon.ico" />
<link rel="apple-touch-icon" href="http://www.gravatar.com/blavatar/651ff83bf3943a39299c438422eb1189?s=158&#038;d=http://s0.wp.com/wp-content/themes/h4/i/webclip.png" />
<link rel='openid.server' href='http://cygni.wordpress.com/?openidserver=1' />
<link rel='openid.delegate' href='http://cygni.wordpress.com/' />
<link rel="search" type="application/opensearchdescription+xml" href="http://wordpress.com/opensearch.xml" title="WordPress.com" />
<link rel="search" type="application/opensearchdescription+xml" href="http://stacktrace.se/osd.xml" title="Stacktrace.se" />
<style type="text/css">
#headimg {
	background:#7d8b5a url(http://cygni.files.wordpress.com/2008/07/cygniteambloggreen.gif) center repeat-y;
}
#headimg h1 a, #headimg h1 a:hover, #headimg #desc {
	color: #B5C09D;
}	
</style>

<script defer="defer" id="snap_preview_anywhere" type="text/javascript" src="http://spa.snap.com/snap_preview_anywhere.js?ap=0&amp;si=1&amp;sb=1&amp;key=e5a3c1e6dff5de35b1c6e7c470411886&amp;domain=&amp;fl=wordpress&amp;pub=pub-2311827-www.wordpress.com&amp;es=all&amp;lang=sv"></script>

</head>

<body>
<div id="rap">

<div id="header">
	<ul id="topnav">
		<li><a href="http://stacktrace.se" id="navHome" title="Nyligen inlagt" accesskey="h">Hem</a></li>
		<li class="page_item page-item-209"><a href="http://stacktrace.se/jobba-pa-cygni/" title="Jobba på&nbsp;Cygni">Jobba på&nbsp;Cygni</a></li>
<li class="page_item page-item-2"><a href="http://stacktrace.se/about/" title="Om&nbsp;Stacktrace.se">Om&nbsp;Stacktrace.se</a></li>
	</ul>
	<div id="headimg">
	<h1><a href="http://stacktrace.se" title="Stacktrace.se">Stacktrace.se</a></h1>
	<div id="desc">Om professionell systemutveckling</div>
	</div>
</div>
	
	<div id="main">
	<div id="content">
						<div class="post-429 post type-post hentry category-junit category-systemutveckling">
				<p class="post-date">26 juni, 2009</p>
<div class="post-info"><h2 class="post-title"><a href="index.html" rel="bookmark" title="Permanent länk: Underhåll av&nbsp;enhetstester">Underhåll av&nbsp;enhetstester</a></h2>
Posted by Johan Risén under <a href="http://sv.wordpress.com/tag/junit/" title="Se alla inlägg i JUnit" rel="category tag">JUnit</a>, <a href="http://sv.wordpress.com/tag/systemutveckling/" title="Se alla inlägg i Systemutveckling" rel="category tag">Systemutveckling</a> <br/><a href="index.html#respond" title="Kommentera Underhåll av&nbsp;enhetstester">Leave a Comment</a>&nbsp;</div>
<div class="post-content">
	<div class='snap_preview'><p>Den här artikeln tar upp några punkter att tänka på i enhetstestning, i synnerhet underhåll av tester. Fokus är på stora legacysystem där andra förutsättningar gäller jämfört med tex testdriven nyutveckling.<br />
    <sitemesh:write property='body'/>
</div>	<div class="post-info">
													
	</div>
	<div class="post-footer">&nbsp;</div>
</div>
				

<div id="respond">
<h3>Lämna ett svar</h3>
<div id="cancel-comment-reply"><small><a rel="nofollow" id="cancel-comment-reply-link" href="index.html#respond" style="display:none;">Klicka här för att avbryta svar.</a></small></div>

<p>Du måste vara <a href="http://stacktrace.se/wp-login.php?redirect_to=http://stacktrace.se/2009/06/26/unittest_maintainability_mocks_stubs/">inloggad</a> för att skriva en kommentar.</p>
</div>
			</div>
					<p align="center"></p>		
	</div>
	<div id="sidebar">
		<h2>Arkiverat inlägg</h2>
	<ul>
	<li><strong>Inläggsdatum :</strong></li>
	<li>26 juni, 2009 at 13:06</li>
		<li><strong>Kategori :</strong></li>
	<li><a href="http://sv.wordpress.com/tag/junit/" title="Se alla inlägg i JUnit" rel="category tag">JUnit</a>, <a href="http://sv.wordpress.com/tag/systemutveckling/" title="Se alla inlägg i Systemutveckling" rel="category tag">Systemutveckling</a></li>
			<li><strong>Gör mer :</strong></li>
	<li>							You can <a href="index.html#respond">leave a response</a>, or <a href="http://stacktrace.se/2009/06/26/unittest_maintainability_mocks_stubs/trackback/">trackback</a> from your own site.
						
						</li>
	</ul>
		
	</div>
<p id="footer"><a href='http://sv.wordpress.com/' rel='generator'>Blogga med WordPress.com</a>. &#8212; Theme: Connections by <a href="http://www.vanillamist.com" rel="designer">www.vanillamist.com</a></p>


<script type="text/javascript" src="http://wordpresscom.skimlinks.com/api/wordpress.js"></script>
<script type="text/javascript">
var skimlinks_pub_id = "725X1342";
var skimlinks_sitename = "cygni.wordpress.com";
var skimlinks_domain = "go2.wordpress.com";
skimlinks();
</script>
<script type="text/javascript">_qacct='p-18-mFEk4J448M';_qoptions={labels:'adt.0,language.sv'};</script>
<script type="text/javascript" src="http://secure.quantserve.com/quant.js"></script>
<noscript><p><img class="robots-nocontent" src="http://secure.quantserve.com/pixel/p-18-mFEk4J448M.gif?labels=adt.0%2Clanguage.sv" style="display:none" height="1" width="1" alt="" /></p></noscript>
<script type="text/javascript" src="http://b.scorecardresearch.com/beacon.js"></script><script type="text/javascript">try{COMSCORE.beacon({c1:2,c2:7518284});}catch(e){}</script><noscript><p class="robots-nocontent"><img src="http://b.scorecardresearch.com/p?cj=1c1=2&#038;c2=7518284" alt="" style="display:none" width="1" height="1" /></p></noscript><script src="http://s.stats.wordpress.com/w.js?19" type="text/javascript"></script>
<script type="text/javascript">
st_go({'blog':'854322','v':'wpcom','user_id':'0','post':'429','subd':'cygni'});
ex_go({'crypt':'RDZ8LFkxbXFDLnxzdyZ0LlVGclZsRU92T1hDeU8vZHFseWdFYzFpcV9STXpMdy5sW1E3T3VkWEJMeXprRUZFN1ZddlBjNWFdQ3Q/Ni1uJTNrcl0sK290RnFLYUx5bWFLU3JETkhreWhxcWp2b2JKVDN2OCVDZVolLUtBPWtUaHAscDhxPUpiZ2o3c081Pz1XbjRTN1ZULltuLTQ1YnNSbC9wWEgsfHM5ZzA1RmVIYmgtUC0seGJKOVkwdE5vN3FkU0ltLiUtVUh1W214Zz1rYzNtV1N2dFh3'});
addLoadEvent(function(){linktracker_init('854322',429);});
	</script>
</div>
</div>
</body>
</html>