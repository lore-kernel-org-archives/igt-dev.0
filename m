Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDADB6E0CA
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2019 08:56:28 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Mon, 1 Apr 2019 08:56:20 +0000
Message-ID: <7CD9A284D657EA499173D5571FAC2AAC19CBC6BF@PGSMSX106.gar.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [igt-dev] Suggestions Required To Add New Subtest in
 kms_plane_multiple.c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0127304549=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0127304549==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7CD9A284D657EA499173D5571FAC2AAC19CBC6BFPGSMSX106garcor_"

--_000_7CD9A284D657EA499173D5571FAC2AAC19CBC6BFPGSMSX106garcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I noticed that we do not have any test that covers the scenario where multi=
ple pipes are enabled and multiple planes are enabled on each of these pipe=
s.

For example : This is needed to verify allocation of 2nd DBUF slice in ICL.=
  Is there any existing IGT which checks for this scenario, if not I am pla=
nning to

include this case as a part of kms_plane_multiple.c . Is this a good idea? =
Or I should plan for new IGT test?


Thanks and Regards
Nidhi Gupta


--_000_7CD9A284D657EA499173D5571FAC2AAC19CBC6BFPGSMSX106garcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:\00A0-apple-system;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:10.5=
pt;font-family:&quot;&nbsp;-apple-system&quot;,serif;color:#333333;backgrou=
nd:whitesmoke">I noticed that we do not have any test that covers the scena=
rio
</span><span style=3D"font-size:10.5pt;font-family:&quot;&nbsp;-apple-syste=
m&quot;,serif;color:black;background:yellow;mso-highlight:yellow">where mul=
tiple pipes are enabled and multiple planes are enabled on each of these pi=
pes.</span><span style=3D"font-size:10.5pt;font-family:&quot;&nbsp;-apple-s=
ystem&quot;,serif;color:black;background:whitesmoke"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:10.5=
pt;font-family:&quot;&nbsp;-apple-system&quot;,serif;color:#333333;backgrou=
nd:whitesmoke">For example : This is needed to verify allocation of 2nd DBU=
F slice in ICL.
</span><span style=3D"font-size:10.5pt;font-family:&quot;&nbsp;-apple-syste=
m&quot;,serif;color:#333333">&nbsp;Is there any existing IGT which checks f=
or this scenario,<span style=3D"background:whitesmoke"> if not I am plannin=
g to
<o:p></o:p></span></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:10.5=
pt;font-family:&quot;&nbsp;-apple-system&quot;,serif;color:#333333;backgrou=
nd:whitesmoke">include this case as a part of kms_plane_multiple.c . Is thi=
s a good idea? Or I should plan for new IGT test?</span><span style=3D"font=
-size:10.5pt;font-family:&quot;&nbsp;-apple-system&quot;,serif;color:#33333=
3"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:10.5=
pt;color:#333333"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">Thanks and Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Nidhi Gupta<span style=3D"color:#5B9BD5"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_7CD9A284D657EA499173D5571FAC2AAC19CBC6BFPGSMSX106garcor_--

--===============0127304549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0127304549==--
