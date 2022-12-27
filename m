Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FD510E02D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 05:27:36 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Dec 2022 05:27:31 +0000
Message-ID: <PH7PR11MB600698F43943115166E19407C5ED9@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB600698F43943115166E19407C5ED9PH7PR11MB6006namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 05/52] tests/kms_atomic_interruptible: Add
 support for Bigjoiner
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

--_000_PH7PR11MB600698F43943115166E19407C5ED9PH7PR11MB6006namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-11-15 at 08:43 +0530, Bhanuprakash Modem wrote:

>This patch will add a check to Skip the subtest if a selected

>pipe/output combo won't support Bigjoiner or 8K mode.

>

>Example:

>* Pipe-D wont support a mode > 5K

>* To use 8K mode on a pipe then consecutive pipe must be available & free.

>

>V2: - Use updated helper name

>

>Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com<mailto:bha=
nuprakash.modem@intel.com>>

Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com<mailto:nidhi1.gupta@intel.=
com>>

---

tests/kms_atomic_interruptible.c | 40 ++++++++++++++++++++++++++++++++

1 file changed, 40 insertions(+)

>diff --git a/tests/kms_atomic_interruptible.c

>b/tests/kms_atomic_interruptible.c

>index f461a15c..74b2e246 100644

>--- a/tests/kms_atomic_interruptible.c

>+++ b/tests/kms_atomic_interruptible.c

>@@ -82,11 +82,15 @@  static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t

>             igt_plane_t *primary, *plane;

>             int block;

>

>+           igt_info("Using (pipe %s + %s) to run the subtest.\n",

>+                          kmstest_pipe_name(pipe), igt_output_name(output=
));

>+

>             /*

>             * Make sure we start with everything disabled to force a real=
 modeset.

>              * igt_display_require only sets sw state, and assumes the fi=
rst test

>              * doesn't care about hw state.

>              */

>+           igt_display_reset(display);

>             igt_display_commit2(display, COMMIT_ATOMIC);

>

>             igt_output_set_pipe(output, pipe);

>@@ -265,6 +269,21 @@  static void run_plane_test(igt_display_t *display, e=
num pipe pipe, igt_output_t

>             igt_remove_fb(display->drm_fd, &fb);

> }

>

>+static bool pipe_output_combo_valid(igt_display_t *display,

>+                                                            enum pipe pip=
e, igt_output_t *output) {

>+           bool ret =3D true;

>+

>+           igt_display_reset(display);

>+

>+           igt_output_set_pipe(output, pipe);

>+           if (!i915_pipe_output_combo_valid(display))

>+                          ret =3D false;

>+           igt_output_set_pipe(output, PIPE_NONE);

>+

>+           return ret;

>+}

>+

>igt_main

>{

>             igt_display_t display;

>@@ -286,6 +305,9 @@  igt_main

>             igt_describe("Tests the interrupt properties of legacy modese=
t");

>             igt_subtest_with_dynamic("legacy-setmode") {

>                            for_each_pipe_with_valid_output(&display, pipe=
, output) {

>+                                         if (!pipe_output_combo_valid(&di=
splay, pipe, output))

>+                                                        continue;

>+

>                                           igt_dynamic_f("%s-pipe-%s", igt=
_output_name(output), kmstest_pipe_name(pipe))

>                                                          run_plane_test(&=
display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);

>                                           break;

>@@ -295,6 +317,9 @@  igt_main

>             igt_describe("Tests the interrupt properties of atomic modese=
t");

>             igt_subtest_with_dynamic("atomic-setmode") {

>                            for_each_pipe_with_valid_output(&display, pipe=
, output) {

>+                                         if (!pipe_output_combo_valid(&di=
splay, pipe, output))

>+                                                        continue;

>+

>                                           igt_dynamic_f("%s-pipe-%s", igt=
_output_name(output), kmstest_pipe_name(pipe))

>                                                          run_plane_test(&=
display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);

>                                           break;

>@@ -304,6 +329,9 @@  igt_main

>             igt_describe("Tests the interrupt properties for DPMS");

>             igt_subtest_with_dynamic("legacy-dpms") {

>                            for_each_pipe_with_valid_output(&display, pipe=
, output) {

>+                                         if (!pipe_output_combo_valid(&di=
splay, pipe, output))

>+                                                        continue;

>+

>                                           igt_dynamic_f("%s-pipe-%s", igt=
_output_name(output), kmstest_pipe_name(pipe))

>                                                          run_plane_test(&=
display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);

>                                           break;

>@@ -313,6 +341,9 @@  igt_main

>             igt_describe("Tests the interrupt properties for pageflip");

>             igt_subtest_with_dynamic("legacy-pageflip") {

>                            for_each_pipe_with_valid_output(&display, pipe=
, output) {

>+                                         if (!pipe_output_combo_valid(&di=
splay, pipe, output))

>+                                                        continue;

>+

>                                           igt_dynamic_f("%s-pipe-%s", igt=
_output_name(output), kmstest_pipe_name(pipe))

>                                                          run_plane_test(&=
display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);

>                                           break;

>@@ -322,6 +353,9 @@  igt_main

>             igt_describe("Tests the interrupt properties for cursor");

>             igt_subtest_with_dynamic("legacy-cursor") {

>                            for_each_pipe_with_valid_output(&display, pipe=
, output) {

>+                                         if (!pipe_output_combo_valid(&di=
splay, pipe, output))

>+                                                        continue;

>+

>                                           igt_dynamic_f("%s-pipe-%s", igt=
_output_name(output), kmstest_pipe_name(pipe))

>                                                          run_plane_test(&=
display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);

>                                           break;

>@@ -331,6 +365,9 @@  igt_main

>             igt_describe("Tests the interrupt properties for primary plan=
e");

>             igt_subtest_with_dynamic("universal-setplane-primary") {

>                            for_each_pipe_with_valid_output(&display, pipe=
, output) {

>+                                         if (!pipe_output_combo_valid(&di=
splay, pipe, output))

>+                                                        continue;

>+

>                                           igt_dynamic_f("%s-pipe-%s", igt=
_output_name(output), kmstest_pipe_name(pipe))

>                                                          run_plane_test(&=
display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);

>                                           break;

>@@ -340,6 +377,9 @@  igt_main

>             igt_describe("Tests the interrupt properties for cursor plane=
");

>             igt_subtest_with_dynamic("universal-setplane-cursor") {

>                            for_each_pipe_with_valid_output(&display, pipe=
, output) {

>+                                         if (!pipe_output_combo_valid(&di=
splay, pipe, output))

>+                                                        continue;

>+

>                                           igt_dynamic_f("%s-pipe-%s", igt=
_output_name(output), kmstest_pipe_name(pipe))

>                                                          run_plane_test(&=
display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);

>                                           break;

--_000_PH7PR11MB600698F43943115166E19407C5ED9PH7PR11MB6006namp_
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">On Tue, 2022-11-15 at 08:43 +0530, Bhanuprakash M=
odem wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;This patch will add a check to Skip the subte=
st if a selected
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;pipe/output combo won't support Bigjoiner or =
8K mode.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;Example:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;* Pipe-D wont support a mode &gt; 5K<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt;* To use 8K mode on a pipe then consecutive p=
ipe must be available &amp; free.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;V2: - Use updated helper name<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;Signed-off-by: Bhanuprakash Modem &lt;<a href=
=3D"mailto:bhanuprakash.modem@intel.com">bhanuprakash.modem@intel.com</a>&g=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">Reviewed-by: Nidhi Gupta &lt;<a href=3D"mailto:ni=
dhi1.gupta@intel.com">nidhi1.gupta@intel.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">---<o:p></o:p></p>
<p class=3D"MsoPlainText">tests/kms_atomic_interruptible.c | 40 +++++++++++=
+++++++++++++++++++++<o:p></o:p></p>
<p class=3D"MsoPlainText">1 file changed, 40 insertions(+)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;diff --git a/tests/kms_atomic_interruptible.c=
 <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;b/tests/kms_atomic_interruptible.c<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt;index f461a15c..74b2e246 100644<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt;--- a/tests/kms_atomic_interruptible.c<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt;+++ b/tests/kms_atomic_interruptible.c<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -82,11 +82,15 @@&nbsp; static void run_pla=
ne_test(igt_display_t *display, enum pipe pipe, igt_output_t<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary, *plane;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; int block;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; igt_info(&quot;Using (pipe %s + %s) to run the subtest.\n&=
quot;,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_pipe_name(pipe), igt_output_name(ou=
tput));<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /*<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; * Make sure we start with everything disabled t=
o force a real modeset.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &nbsp;* igt_display_require only sets sw state, and =
assumes the first test<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &nbsp;* doesn't care about hw state.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &nbsp;*/<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; igt_display_reset(display);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(display, COMMIT_ATOMIC);<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, pipe);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -265,6 +269,21 @@&nbsp; static void run_pl=
ane_test(igt_display_t *display, enum pipe pipe, igt_output_t<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(display-&gt;drm_fd, &amp;fb);<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+static bool pipe_output_combo_valid(igt_disp=
lay_t *display,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; enum pipe pipe, igt_output_t *output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bool ret =3D true;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; igt_display_reset(display);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; igt_output_set_pipe(output, pipe);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (!i915_pipe_output_combo_valid(display))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D false;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; igt_output_set_pipe(output, PIPE_NONE);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return ret;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;igt_main<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;{<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -286,6 +305,9 @@&nbsp; igt_main<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests the interrupt properties of=
 legacy modeset&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;legacy-setmode&quot;)=
 {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;=
display, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_output_combo_valid=
(&amp;display, pipe, output))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%s=
-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(pipe))<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_pla=
ne_test(&amp;display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRI=
MARY);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -295,6 +317,9 @@&nbsp; igt_main<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests the interrupt properties of=
 atomic modeset&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;atomic-setmode&quot;)=
 {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;=
display, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_output_combo_valid=
(&amp;display, pipe, output))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%s=
-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(pipe))<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_pla=
ne_test(&amp;display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRI=
MARY);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -304,6 +329,9 @@&nbsp; igt_main<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests the interrupt properties fo=
r DPMS&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;legacy-dpms&quot;) {<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;=
display, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_output_combo_valid=
(&amp;display, pipe, output))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%s=
-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(pipe))<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_plane_te=
st(&amp;display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -313,6 +341,9 @@&nbsp; igt_main<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests the interrupt properties fo=
r pageflip&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;legacy-pageflip&quot;=
) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;=
display, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_output_combo_valid=
(&amp;display, pipe, output))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%s=
-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(pipe))<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_pla=
ne_test(&amp;display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -322,6 +353,9 @@&nbsp; igt_main<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests the interrupt properties fo=
r cursor&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;legacy-cursor&quot;) =
{<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;displ=
ay, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_output_combo_valid=
(&amp;display, pipe, output))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%s=
-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(pipe))<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_pla=
ne_test(&amp;display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -331,6 +365,9 @@&nbsp; igt_main<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests the interrupt properties fo=
r primary plane&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;universal-setplane-pr=
imary&quot;) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;=
display, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_output_combo_valid=
(&amp;display, pipe, output))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%s=
-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(pipe))<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_pla=
ne_test(&amp;display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -340,6 +377,9 @@&nbsp; igt_main<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests the interrupt properties fo=
r cursor plane&quot;);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;universal-setplane-cu=
rsor&quot;) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(&amp;=
display, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pipe_output_combo_valid=
(&amp;display, pipe, output))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%s=
-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(pipe))<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_pla=
ne_test(&amp;display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<o:p></o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB600698F43943115166E19407C5ED9PH7PR11MB6006namp_--
