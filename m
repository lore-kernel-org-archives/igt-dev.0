Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2A810E0E9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 14:46:42 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 30 Dec 2022 14:46:36 +0000
Message-ID: <PH7PR11MB6006067299F2D7B203850DD5C5F09@PH7PR11MB6006.namprd11.prod.outlook.com>
References: <PH7PR11MB600698F43943115166E19407C5ED9@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB6006A34FB1D29D8E300F343AC5F29@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB60061DAB4F464DB8ACCF4DEDC5F39@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB6006728F645994B9F19B6925C5F39@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB600613588FABB1CFA4620647C5F09@PH7PR11MB6006.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB600613588FABB1CFA4620647C5F09@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB6006067299F2D7B203850DD5C5F09PH7PR11MB6006namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 18/52] tests/kms_invalid_mode: Add support
 for Bigjoiner
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

--_000_PH7PR11MB6006067299F2D7B203850DD5C5F09PH7PR11MB6006namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-11-15 at 08:43 +0530, Bhanuprakash Modem wrote:

>This patch will add a check to Skip the subtest if a selected pipe/output

>combo won't support Bigjoiner or 8K mode.

>

>Example:

>* Pipe-D wont support a mode > 5K

>* To use 8K mode on a pipe then consecutive pipe must be available & free.

>

>V2: - Use updated helper name

>

>Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>---

Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>

> tests/kms_invalid_mode.c | 6 ++++++

> 1 file changed, 6 insertions(+)

>diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c

>index 40042d4e..86f529e8 100644

>--- a/tests/kms_invalid_mode.c

>+++ b/tests/kms_invalid_mode.c

>@@ -301,6 +301,12 @@  igt_main

>             for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {

>                            igt_subtest_with_dynamic(subtests[i].name) {

>                                           for_each_pipe_with_valid_output=
(&data.display, pipe, output) {

>+                                                        igt_display_reset=
(&data.display);

>+

>+                                                        igt_output_set_pi=
pe(output, pipe);

>+                                                        if (!i915_pipe_ou=
tput_combo_valid(&data.display))

>+                                                                       co=
ntinue;

>+

>                                                          igt_dynamic_f("%=
s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {

>                                                                         d=
ata.output =3D output;

>                                                                         d=
ata.pipe =3D pipe;

--_000_PH7PR11MB6006067299F2D7B203850DD5C5F09PH7PR11MB6006namp_
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
span.EmailStyle22
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
<p class=3D"MsoPlainText">On Tue, 2022-11-15 at 08:43 +0530, Bhanuprakash M=
odem wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;This patch will add a check to Skip the subte=
st if a selected pipe/output<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;combo won't support Bigjoiner or 8K mode.<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;Example:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;* Pipe-D wont support a mode &gt; 5K<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt;* To use 8K mode on a pipe then consecutive p=
ipe must be available &amp; free.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;V2: - Use updated helper name<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;Signed-off-by: Bhanuprakash Modem &lt;bhanupr=
akash.modem@intel.com&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;---<o:p></o:p></p>
<p class=3D"MsoPlainText">Reviewed-by: Nidhi Gupta &lt;nidhi1.gupta@intel.c=
om&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; tests/kms_invalid_mode.c | 6 ++++++<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; 1 file changed, 6 insertions(+)<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt;diff --git a/tests/kms_invalid_mode.c b/tests=
/kms_invalid_mode.c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;index 40042d4e..86f529e8 100644<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt;--- a/tests/kms_invalid_mode.c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+++ b/tests/kms_invalid_mode.c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;@@ -301,6 +301,12 @@&nbsp; igt_main<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; ARRAY_SIZE(subtests); i++) =
{<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(subtests[i].=
name) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_val=
id_output(&amp;data.display, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_r=
eset(&amp;data.display);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_se=
t_pipe(output, pipe);<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!i915_pip=
e_output_combo_valid(&amp;data.display))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; continue;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;+<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dyn=
amic_f(&quot;%s-pipe-%s&quot;, igt_output_name(output), kmstest_pipe_name(p=
ipe)) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data.output =3D output;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data.pipe =3D pipe;<o:p></o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB6006067299F2D7B203850DD5C5F09PH7PR11MB6006namp_--
