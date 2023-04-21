Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15DD10EDB5
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 07:34:40 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Fri, 21 Apr 2023 07:34:22 +0000
Message-ID: <PH7PR11MB60068548E43AA330BD0AC26BC5609@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB60068548E43AA330BD0AC26BC5609PH7PR11MB6006namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t,
 15/45] tests/i915/kms_big_joiner: Add XE support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_PH7PR11MB60068548E43AA330BD0AC26BC5609PH7PR11MB6006namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2023-04-18 at 09:10 PM, Bhanuprakash Modem wrote:

Looks good to me.

Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
>Add XE driver support for kms tests.
>
>Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>---
>tests/i915/kms_big_joiner.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
>index 8be60ea11..b9dda58f6 100644
>--- a/tests/i915/kms_big_joiner.c
>+++ b/tests/i915/kms_big_joiner.c
>@@ -188,7 +188,7 @@  igt_main
>             enum pipe pipe_seq[IGT_MAX_PIPES];
>
>             igt_fixture {
>-                          data.drm_fd =3D drm_open_driver_master(DRIVER_I=
NTEL);
>+                          data.drm_fd =3D drm_open_driver_master(DRIVER_I=
NTEL | DRIVER_XE);
>                            kmstest_set_vt_graphics_mode();
>
>                            igt_display_require(&data.display, data.drm_fd=
);


--_000_PH7PR11MB60068548E43AA330BD0AC26BC5609PH7PR11MB6006namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">On 2023-04-18 at 09:10 PM, Bhanuprakash Modem wro=
te:<o:p></o:p></p>
<p class=3D"MsoPlainText">Looks good to me.<o:p></o:p></p>
<p class=3D"MsoPlainText">Reviewed-by: Nidhi Gupta &lt;nidhi1.gupta@intel.c=
om&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;Add XE driver support for kms tests.<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;Signed-off-by: Bhanuprakash Modem &lt;bhanupraka=
sh.modem@intel.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;---<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;tests/i915/kms_big_joiner.c | 2 +-<o:p></o:p></p=
>
<p class=3D"MsoNormal">&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;diff --git a/tests/i915/kms_big_joiner.c b/tests=
/i915/kms_big_joiner.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;index 8be60ea11..b9dda58f6 100644<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;--- a/tests/i915/kms_big_joiner.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+++ b/tests/i915/kms_big_joiner.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;@@ -188,7 +188,7 @@&nbsp; igt_main<o:p></o:p></p=
>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; enum pipe pipe_seq[IGT_MAX_PIPES];<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_fixture {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; data.drm_fd =3D drm_open_driver_master(DRIVER_=
INTEL);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; data.drm_fd =3D drm_open_driver_master(DRIVER_=
INTEL | DRIVER_XE);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_vt_graphics_mode();<o:p></o:=
p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_require(&amp;data.display, d=
ata.drm_fd);<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB60068548E43AA330BD0AC26BC5609PH7PR11MB6006namp_--
