Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F0810E00F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 02:54:15 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Tue, 25 Apr 2023 02:53:51 +0000
Message-ID: <PH7PR11MB6006E273D0BDF88209433FBCC5649@PH7PR11MB6006.namprd11.prod.outlook.com>
References: <PH7PR11MB60068548E43AA330BD0AC26BC5609@PH7PR11MB6006.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB60068548E43AA330BD0AC26BC5609@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB6006E273D0BDF88209433FBCC5649PH7PR11MB6006namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t,
 43/45] tests/kms_universal_plane: Add XE support
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

--_000_PH7PR11MB6006E273D0BDF88209433FBCC5649PH7PR11MB6006namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2023-04-18 at 09:10 PM, Bhanuprakash Modem wrote:

Looks good to me.

Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com<mailto:nidhi1.gupta@intel.=
com>>
>diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
>index 114918d97..ddd356eda 100644
>--- a/tests/kms_universal_plane.c
>+++ b/tests/kms_universal_plane.c
>@@ -576,13 +576,18 @@  cursor_leak_test_fini(data_t *data,
>}
>
>static int
>-i915_gem_fb_count(data_t *data)
>+intel_gem_fb_count(data_t *data)
>{
>             char buf[1024];
>             FILE *fp;
>             int fd;
>             int count =3D 0;
>
>+           /*
>+           * FIXME: As of now, XE's debugfs is using i915 namespace. Once=
 Kernel
>+           * changes got landed, please update this logic to use XE speci=
fic
>+           * debugfs.
>+           */
>             fd =3D igt_debugfs_open(data->drm_fd, "i915_gem_framebuffer",=
 O_RDONLY);
>             fp =3D fdopen(fd, "r");
>             igt_require(fp);
>@@ -617,7 +622,7 @@  cursor_leak_test_pipe(data_t *data, enum pipe pipe, i=
gt_output_t *output)
>             mode =3D igt_output_get_mode(output);
>
>             /* Count GEM framebuffers before creating our cursor FB's */
>-           count1 =3D i915_gem_fb_count(data);
>+           count1 =3D intel_gem_fb_count(data);
>
>             /* Black background FB */
>             igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisp=
lay,
>@@ -675,7 +680,7 @@  cursor_leak_test_pipe(data_t *data, enum pipe pipe, i=
gt_output_t *output)
>             cursor_leak_test_fini(data, output, &background_fb, cursor_fb=
);
>
>             /* We should be back to the same framebuffer count as when we=
 started */
>-           count2 =3D i915_gem_fb_count(data);
>+           count2 =3D intel_gem_fb_count(data);
>
>             igt_assert_eq(count1, count2);
>}
>@@ -737,7 +742,7 @@  pageflip_win_test_pipe(data_t *data, enum pipe pipe, =
igt_output_t *output)
>
>             int ret =3D 0;
>
>-           igt_skip_on(is_i915_device(data->drm_fd) && data->display_ver =
< 9);
>+           igt_skip_on(is_intel_device(data->drm_fd) && data->display_ver=
 < 9);
>             igt_require_pipe(&data->display, pipe);
>
>             igt_info("Using (pipe %s + %s) to run the subtest.\n",
>@@ -895,7 +900,7 @@  igt_main
>
>             igt_fixture {
>                            data.drm_fd =3D drm_open_driver_master(DRIVER_=
ANY);
>-                          if (is_i915_device(data.drm_fd))
>+                          if (is_intel_device(data.drm_fd))
>                                           data.display_ver =3D intel_disp=
lay_ver(intel_get_drm_devid(data.drm_fd));
>
>                            kmstest_set_vt_graphics_mode();

--_000_PH7PR11MB6006E273D0BDF88209433FBCC5649PH7PR11MB6006namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoPlainText">Reviewed-by: Nidhi Gupta &lt;<a href=3D"mailto:ni=
dhi1.gupta@intel.com">nidhi1.gupta@intel.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;diff --git a/tests/kms_universal_plane.c b/tests=
/kms_universal_plane.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;index 114918d97..ddd356eda 100644<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;--- a/tests/kms_universal_plane.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+++ b/tests/kms_universal_plane.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;@@ -576,13 +576,18 @@&nbsp; cursor_leak_test_fin=
i(data_t *data,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;}<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;static int<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-i915_gem_fb_count(data_t *data)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+intel_gem_fb_count(data_t *data)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;{<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; char buf[1024];<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; int fd;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; int count =3D 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /*<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * FIXME: As of now, XE's debugfs is using i915 namespace. Onc=
e Kernel<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * changes got landed, please update this logic to use XE spec=
ific<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * debugfs.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fd =3D igt_debugfs_open(data-&gt;drm_fd, &quot;i91=
5_gem_framebuffer&quot;, O_RDONLY);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fp =3D fdopen(fd, &quot;r&quot;);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_require(fp);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;@@ -617,7 +622,7 @@&nbsp; cursor_leak_test_pipe(=
data_t *data, enum pipe pipe, igt_output_t *output)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; mode =3D igt_output_get_mode(output);<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; /* Count GEM framebuffers before creating our curs=
or FB's */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; count1 =3D i915_gem_fb_count(data);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; count1 =3D intel_gem_fb_count(data);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* Black background FB */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, mode-&gt;hdis=
play, mode-&gt;vdisplay,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;@@ -675,7 +680,7 @@&nbsp; cursor_leak_test_pipe(=
data_t *data, enum pipe pipe, igt_output_t *output)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; cursor_leak_test_fini(data, output, &amp;backgroun=
d_fb, cursor_fb);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; /* We should be back to the same framebuffer count=
 as when we started */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; count2 =3D i915_gem_fb_count(data);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; count2 =3D intel_gem_fb_count(data);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(count1, count2);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;}<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;@@ -737,7 +742,7 @@&nbsp; pageflip_win_test_pipe=
(data_t *data, enum pipe pipe, igt_output_t *output)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_skip_on(is_i915_device(data-&gt;drm_fd) &amp;&amp; data-&=
gt;display_ver &lt; 9);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_skip_on(is_intel_device(data-&gt;drm_fd) &amp;&amp; data-=
&gt;display_ver &lt; 9);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_require_pipe(&amp;data-&gt;display, pipe);<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Using (pipe %s + %s) to run the sub=
test.\n&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;@@ -895,7 +900,7 @@&nbsp; igt_main<o:p></o:p></p=
>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.drm_fd =3D drm_open_driver_mas=
ter(DRIVER_ANY);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_i915_device(data.drm_fd))<o:p></o:p></p=
>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_intel_device(data.drm_fd))<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.display_ver =3D=
 intel_display_ver(intel_get_drm_devid(data.drm_fd));<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_vt_graphics_mode();<o:p=
></o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB6006E273D0BDF88209433FBCC5649PH7PR11MB6006namp_--
