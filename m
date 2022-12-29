Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A24510E1EB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Dec 2022 03:26:49 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 29 Dec 2022 03:26:43 +0000
Message-ID: <PH7PR11MB60061DAB4F464DB8ACCF4DEDC5F39@PH7PR11MB6006.namprd11.prod.outlook.com>
References: <PH7PR11MB600698F43943115166E19407C5ED9@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB6006A34FB1D29D8E300F343AC5F29@PH7PR11MB6006.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6006A34FB1D29D8E300F343AC5F29@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB60061DAB4F464DB8ACCF4DEDC5F39PH7PR11MB6006namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 10/52] tests/kms_concurrent: Add support
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

--_000_PH7PR11MB60061DAB4F464DB8ACCF4DEDC5F39PH7PR11MB6006namp_
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
>tests/kms_concurrent.c | 10 +++++++++-
>1 file changed, 9 insertions(+), 1 deletion(-)
>diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
>index 6f8ffd4a..e6d61a84 100644
>--- a/tests/kms_concurrent.c
>+++ b/tests/kms_concurrent.c
>@@ -330,9 +330,17 @@  run_tests_for_pipe(data_t *data, enum pipe pipe)
>             igt_describe("Test atomic mode setting concurrently with mult=
iple planes and screen "
>                                 "resolution.");
>             igt_subtest_with_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)=
) {
>-                          for_each_valid_output_on_pipe(&data->display, p=
ipe, output)
>+                          for_each_valid_output_on_pipe(&data->display, p=
ipe, output) {
>+                                         igt_display_reset(&data->display=
);
>+
>+                                         igt_output_set_pipe(output, pipe=
);
>+                                         if (!i915_pipe_output_combo_vali=
d(&data->display))
>+                                                        continue;
>+
>+                                         igt_output_set_pipe(output, PIPE=
_NONE);
>                                           igt_dynamic_f("%s", igt_output_=
name(output))
>                                                          run_test(data, p=
ipe, output);
>+                          }
>             }
>}


--_000_PH7PR11MB60061DAB4F464DB8ACCF4DEDC5F39PH7PR11MB6006namp_
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
<p class=3D"MsoPlainText">On Tue, 2022-11-15 at 08:43 +0530, Bhanuprakash M=
odem wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;This patch will add a check to Skip the subtest =
if a selected pipe/output<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;combo won't support Bigjoiner or 8K mode.<o:p></=
o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;Example:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;* Pipe-D wont support a mode &gt; 5K<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;* To use 8K mode on a pipe then consecutive pipe=
 must be available &amp; free.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;V2: - Use updated helper name<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;Signed-off-by: Bhanuprakash Modem &lt;bhanupraka=
sh.modem@intel.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;---<o:p></o:p></p>
<p class=3D"MsoNormal">Reviewed-by: Nidhi Gupta &lt;nidhi1.gupta@intel.com&=
gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;tests/kms_concurrent.c | 10 +++++++++-<o:p></o:p=
></p>
<p class=3D"MsoNormal">&gt;1 file changed, 9 insertions(+), 1 deletion(-)<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;diff --git a/tests/kms_concurrent.c b/tests/kms_=
concurrent.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;index 6f8ffd4a..e6d61a84 100644<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;--- a/tests/kms_concurrent.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+++ b/tests/kms_concurrent.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;@@ -330,9 +330,17 @@&nbsp; run_tests_for_pipe(da=
ta_t *data, enum pipe pipe)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test atomic mode setting concur=
rently with multiple planes and screen &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &quot;reso=
lution.&quot;);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic_f(&quot;pipe-%s&quot;, km=
stest_pipe_name(pipe)) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_valid_output_on_pipe(&amp;data-&gt;di=
splay, pipe, output)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_valid_output_on_pipe(&amp;data-&gt;di=
splay, pipe, output) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(&amp;data-&gt=
;display);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, pip=
e);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!i915_pipe_output_combo_val=
id(&amp;data-&gt;display))<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p></=
o:p></p>
<p class=3D"MsoNormal">&gt;+<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, PIP=
E_NONE);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;=
%s&quot;, igt_output_name(output))<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_t=
est(data, pipe, output);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;}<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB60061DAB4F464DB8ACCF4DEDC5F39PH7PR11MB6006namp_--
