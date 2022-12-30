Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A6E10E0E9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 14:37:12 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 30 Dec 2022 14:37:09 +0000
Message-ID: <PH7PR11MB600613588FABB1CFA4620647C5F09@PH7PR11MB6006.namprd11.prod.outlook.com>
References: <PH7PR11MB600698F43943115166E19407C5ED9@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB6006A34FB1D29D8E300F343AC5F29@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB60061DAB4F464DB8ACCF4DEDC5F39@PH7PR11MB6006.namprd11.prod.outlook.com>
 <PH7PR11MB6006728F645994B9F19B6925C5F39@PH7PR11MB6006.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6006728F645994B9F19B6925C5F39@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB600613588FABB1CFA4620647C5F09PH7PR11MB6006namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 46/52] tests/i915/kms_frontbuffer_tracking:
 Add support for Bigjoiner
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

--_000_PH7PR11MB600613588FABB1CFA4620647C5F09PH7PR11MB6006namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-11-15 at 08:43 +0530, Bhanuprakash Modem wrote:
>As many 2x tests are currently running on Pipe-A & B only, those
>tests will always SKIP if there is any 8K supported panel in the
>config. Instead of Skipping the test, add some intelligence to
>the subtest to identify the valid pipe/output combo to execute
>the subtest.
>
>V2: - Use updated helper name
>
>Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>---
Reviewed-by: Nidhi Gupta
>tests/i915/kms_frontbuffer_tracking.c | 16 ++++++++++++----
>1 file changed, 12 insertions(+), 4 deletions(-)
>diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontb=
uffer_tracking.c
>index 5b47999e..650e14a7 100644
>--- a/tests/i915/kms_frontbuffer_tracking.c
>+++ b/tests/i915/kms_frontbuffer_tracking.c
>@@ -403,15 +403,23 @@  static bool find_connector(bool edp_only, bool pipe=
_a,
>                            if (pipe_a && pipe !=3D PIPE_A)
>                                           continue;
>
>-                          if (output =3D=3D forbidden_output || pipe =3D=
=3D forbidden_pipe)
>+                          if (output =3D=3D forbidden_output || pipe =3D=
=3D forbidden_pipe) {
>+                                         igt_output_set_pipe(output, pipe=
);
>+                                         igt_output_override_mode(output,=
 connector_get_mode(output));
>+
>                                           continue;
>+                          }
>
>                            if (c->connector_type =3D=3D DRM_MODE_CONNECTO=
R_eDP && opt.no_edp)
>                                           continue;
>
>-                          *ret_output =3D output;
>-                          *ret_pipe =3D pipe;
>-                          return true;
>+                          igt_output_set_pipe(output, pipe);
>+                          igt_output_override_mode(output, connector_get_=
mode(output));
>+                          if (i915_pipe_output_combo_valid(&drm.display))=
 {
>+                                         *ret_output =3D output;
>+                                         *ret_pipe =3D pipe;
>+                                         return true;
>+                          }
>             }
>
>             return false;

--_000_PH7PR11MB600613588FABB1CFA4620647C5F09PH7PR11MB6006namp_
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
<p class=3D"MsoNormal">&gt;As many 2x tests are currently running on Pipe-A=
 &amp; B only, those<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;tests will always SKIP if there is any 8K suppor=
ted panel in the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;config. Instead of Skipping the test, add some i=
ntelligence to<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;the subtest to identify the valid pipe/output co=
mbo to execute<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;the subtest.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;V2: - Use updated helper name<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;Signed-off-by: Bhanuprakash Modem &lt;bhanupraka=
sh.modem@intel.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;---<o:p></o:p></p>
<p class=3D"MsoNormal">Reviewed-by: Nidhi Gupta<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;tests/i915/kms_frontbuffer_tracking.c | 16 +++++=
+++++++----<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;1 file changed, 12 insertions(+), 4 deletions(-)=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;diff --git a/tests/i915/kms_frontbuffer_tracking=
.c b/tests/i915/kms_frontbuffer_tracking.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;index 5b47999e..650e14a7 100644<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;--- a/tests/i915/kms_frontbuffer_tracking.c<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;+++ b/tests/i915/kms_frontbuffer_tracking.c<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;@@ -403,15 +403,23 @@&nbsp; static bool find_con=
nector(bool edp_only, bool pipe_a,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pipe_a &amp;&amp; pipe !=3D PIPE_A)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (output =3D=3D forbidden_output || pipe =3D=
=3D forbidden_pipe)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (output =3D=3D forbidden_output || pipe =3D=
=3D forbidden_pipe) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, pip=
e);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output=
, connector_get_mode(output));<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c-&gt;connector_type =3D=3D DRM_MODE=
_CONNECTOR_eDP &amp;&amp; opt.no_edp)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; *ret_output =3D output;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; *ret_pipe =3D pipe;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, pipe);<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, connector_get=
_mode(output));<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i915_pipe_output_combo_valid(&amp;drm.disp=
lay)) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *ret_output =3D output;<o:p></o=
:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *ret_pipe =3D pipe;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return false;<o:p></o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB600613588FABB1CFA4620647C5F09PH7PR11MB6006namp_--
