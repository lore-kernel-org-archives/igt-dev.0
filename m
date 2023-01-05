Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390E410E6B4
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 06:26:30 +0000 (UTC)
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 5 Jan 2023 06:26:18 +0000
Message-ID: <IA1PR11MB6266C009541FA5B893E06065E2FA9@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
 <Y7RAqN8nGYF8IOKr@kamilkon-desk1>
In-Reply-To: <Y7RAqN8nGYF8IOKr@kamilkon-desk1>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_IA1PR11MB6266C009541FA5B893E06065E2FA9IA1PR11MB6266namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: Add Gaurd for MSO eDP
 for Pipe C and D
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Kurmi, Suresh
 Kumar" <suresh.kumar.kurmi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_IA1PR11MB6266C009541FA5B893E06065E2FA9IA1PR11MB6266namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Kamil,
Thanks for the inputs.
I will keep note this comments and update this patch for the same.

From: Kamil Konieczny<mailto:kamil.konieczny@linux.intel.com>
Sent: Tuesday, January 3, 2023 8:20 PM
To: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>
Cc: Bhadane, Dnyaneshwar<mailto:dnyaneshwar.bhadane@intel.com>; Borah, Chai=
tanya Kumar<mailto:chaitanya.kumar.borah@intel.com>; Kurmi, Suresh Kumar<ma=
ilto:suresh.kumar.kurmi@intel.com>; Sharma, Swati2<mailto:swati2.sharma@int=
el.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: Add Gaurd for MSO eDP =
for Pipe C and D

Hi,

On 2022-12-30 at 12:16:38 +0530, bhadanednyaneshwar wrote:
> MSO eDP is not supported on pipe C and D. Added a test condition
------------------------------------------- ^
> to prevent tests from execution on pipe C and D.This condition was
> missed for cursor-size-change,cursor-alpha-opaque and
> cursor-alpha-transparent testcases.

Please improve a little commit message, you just added skips for
not supported cursors in those subtests.

>
> Inside require_cursor_size() checks first for eligiblity to igt commit
> using test buffer.For MSO eDP, It is fail to commit for pipe C/pipe D
> and require_cursor_size() return non zero value. So it will skip
> the dynamic testcase for pipe C and D.

The above paragraph is spelling what you done. Will it only skip
for pipe C and D ? Or any pipe on which it cannot create cursor ?

You can add cc here:

Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: bhadanednyaneshwar <dnyaneshwar.bhadane@intel.com>
---------------- ^
Please put here your name (look for example for Swati), I guess
it should be

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

but if I guess wrong please put correct one (it is best to put this
in global git config).

> ---
>  tests/kms_cursor_crc.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 17f294d6..d8fb9c0d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -786,7 +786,12 @@ static void run_tests_on_pipe(data_t *data)
>        igt_subtest_with_dynamic("cursor-size-change") {
>                for_each_pipe(&data->display, pipe) {
>                        data->pipe =3D pipe;
> -
> +                     create_cursor_fb(data, data->cursor_max_w, data->cu=
rsor_max_h);
----------------------- ^
Do you really need this here ? It is used elsewhere within fixup
(there is assert in this function), in other tests below
require_cursor_size is called without create_cursor_fb

> +                     if (require_cursor_size(data, data->cursor_max_w, d=
ata->cursor_max_h)) {
> +                             igt_debug("Cursor size %dx%d not supported =
by driver\n",
> +                                       data->cursor_max_w, data->cursor_=
max_h);
> +                             continue;
> +                     }

Put newline here.

>                        igt_dynamic_f("pipe-%s-%s",
>                                      kmstest_pipe_name(pipe),
>                                      data->output->name)
> @@ -800,7 +805,12 @@ static void run_tests_on_pipe(data_t *data)
>        igt_subtest_with_dynamic("cursor-alpha-opaque") {
>                for_each_pipe(&data->display, pipe) {
>                        data->pipe =3D pipe;
> -
> +                     create_cursor_fb(data, data->cursor_max_w, data->cu=
rsor_max_h);
----------------------- ^
> +                     if (require_cursor_size(data, data->cursor_max_w, d=
ata->cursor_max_h)) {
> +                             igt_debug("Cursor size %dx%d not supported =
by driver\n",
> +                                       data->cursor_max_w, data->cursor_=
max_h);
> +                             continue;
> +                     }

Put newline here.

>                        igt_dynamic_f("pipe-%s-%s",
>                                      kmstest_pipe_name(pipe),
>                                      data->output->name)
> @@ -814,7 +824,12 @@ static void run_tests_on_pipe(data_t *data)
>        igt_subtest_with_dynamic("cursor-alpha-transparent") {
>                for_each_pipe(&data->display, pipe) {
>                        data->pipe =3D pipe;
> -
> +                     create_cursor_fb(data, data->cursor_max_w, data->cu=
rsor_max_h);
----------------------- ^
> +                     if (require_cursor_size(data, data->cursor_max_w, d=
ata->cursor_max_h)) {
> +                             igt_debug("Cursor size %dx%d not supported =
by driver\n",
> +                                       data->cursor_max_w, data->cursor_=
max_h);
> +                             continue;
> +                     }

Put newline here.

Regards,
Kamil

>                        igt_dynamic_f("pipe-%s-%s",
>                                      kmstest_pipe_name(pipe),
>                                      data->output->name)
> --
> 2.35.1
>


--_000_IA1PR11MB6266C009541FA5B893E06065E2FA9IA1PR11MB6266namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Kamil,</p>
<p class=3D"MsoNormal">Thanks for the inputs.</p>
<p class=3D"MsoNormal">I will keep note this comments and update this patch=
 for the same.
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:kamil.konieczny@linux.intel.com">Kamil Konieczny</a><br>
<b>Sent: </b>Tuesday, January 3, 2023 8:20 PM<br>
<b>To: </b><a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.f=
reedesktop.org</a><br>
<b>Cc: </b><a href=3D"mailto:dnyaneshwar.bhadane@intel.com">Bhadane, Dnyane=
shwar</a>;
<a href=3D"mailto:chaitanya.kumar.borah@intel.com">Borah, Chaitanya Kumar</=
a>; <a href=3D"mailto:suresh.kumar.kurmi@intel.com">
Kurmi, Suresh Kumar</a>; <a href=3D"mailto:swati2.sharma@intel.com">Sharma,=
 Swati2</a><br>
<b>Subject: </b>Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: Add Gaurd for M=
SO eDP for Pipe C and D</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi,<br>
<br>
On 2022-12-30 at 12:16:38 +0530, bhadanednyaneshwar wrote:<br>
&gt; MSO eDP is not supported on pipe C and D. Added a test condition<br>
------------------------------------------- ^<br>
&gt; to prevent tests from execution on pipe C and D.This condition was<br>
&gt; missed for cursor-size-change,cursor-alpha-opaque and<br>
&gt; cursor-alpha-transparent testcases.<br>
<br>
Please improve a little commit message, you just added skips for<br>
not supported cursors in those subtests.<br>
<br>
&gt; <br>
&gt; Inside require_cursor_size() checks first for eligiblity to igt commit=
<br>
&gt; using test buffer.For MSO eDP, It is fail to commit for pipe C/pipe D<=
br>
&gt; and require_cursor_size() return non zero value. So it will skip<br>
&gt; the dynamic testcase for pipe C and D.<br>
<br>
The above paragraph is spelling what you done. Will it only skip<br>
for pipe C and D ? Or any pipe on which it cannot create cursor ?<br>
<br>
You can add cc here:<br>
<br>
Cc: Chaitanya Kumar Borah &lt;chaitanya.kumar.borah@intel.com&gt;<br>
Cc: Suresh Kumar Kurmi &lt;suresh.kumar.kurmi@intel.com&gt;<br>
Cc: Swati Sharma &lt;swati2.sharma@intel.com&gt;<br>
&gt; <br>
&gt; Signed-off-by: bhadanednyaneshwar &lt;dnyaneshwar.bhadane@intel.com&gt=
;<br>
---------------- ^<br>
Please put here your name (look for example for Swati), I guess<br>
it should be<br>
<br>
Signed-off-by: Dnyaneshwar Bhadane &lt;dnyaneshwar.bhadane@intel.com&gt;<br=
>
<br>
but if I guess wrong please put correct one (it is best to put this<br>
in global git config).<br>
<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_cursor_crc.c | 21 ++++++++++++++++++---<br>
&gt;&nbsp; 1 file changed, 18 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c<br>
&gt; index 17f294d6..d8fb9c0d 100644<br>
&gt; --- a/tests/kms_cursor_crc.c<br>
&gt; +++ b/tests/kms_cursor_crc.c<br>
&gt; @@ -786,7 +786,12 @@ static void run_tests_on_pipe(data_t *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&qu=
ot;cursor-size-change&quot;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; for_each_pipe(&amp;data-&gt;display, pipe) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&g=
t;pipe =3D pipe;<br>
&gt; -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_cursor_fb(data, =
data-&gt;cursor_max_w, data-&gt;cursor_max_h);<br>
----------------------- ^<br>
Do you really need this here ? It is used elsewhere within fixup<br>
(there is assert in this function), in other tests below<br>
require_cursor_size is called without create_cursor_fb<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (require_cursor_size=
(data, data-&gt;cursor_max_w, data-&gt;cursor_max_h)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Cursor size %dx%d not supported by=
 driver\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; data-&gt;cursor_max_w, data-&gt;cursor_max_h);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Put newline here.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dyn=
amic_f(&quot;pipe-%s-%s&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; kmstest_pipe_name(pipe),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; data-&gt;output-&gt;name)<br>
&gt; @@ -800,7 +805,12 @@ static void run_tests_on_pipe(data_t *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&qu=
ot;cursor-alpha-opaque&quot;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; for_each_pipe(&amp;data-&gt;display, pipe) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&g=
t;pipe =3D pipe;<br>
&gt; -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_cursor_fb(data, =
data-&gt;cursor_max_w, data-&gt;cursor_max_h);<br>
----------------------- ^<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (require_cursor_size=
(data, data-&gt;cursor_max_w, data-&gt;cursor_max_h)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Cursor size %dx%d not supported by=
 driver\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; data-&gt;cursor_max_w, data-&gt;cursor_max_h);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Put newline here.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dyn=
amic_f(&quot;pipe-%s-%s&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; kmstest_pipe_name(pipe),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; data-&gt;output-&gt;name)<br>
&gt; @@ -814,7 +824,12 @@ static void run_tests_on_pipe(data_t *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&qu=
ot;cursor-alpha-transparent&quot;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; for_each_pipe(&amp;data-&gt;display, pipe) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&g=
t;pipe =3D pipe;<br>
&gt; -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_cursor_fb(data, =
data-&gt;cursor_max_w, data-&gt;cursor_max_h);<br>
----------------------- ^<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (require_cursor_size=
(data, data-&gt;cursor_max_w, data-&gt;cursor_max_h)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Cursor size %dx%d not supported by=
 driver\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; data-&gt;cursor_max_w, data-&gt;cursor_max_h);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Put newline here.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dyn=
amic_f(&quot;pipe-%s-%s&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; kmstest_pipe_name(pipe),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; data-&gt;output-&gt;name)<br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_IA1PR11MB6266C009541FA5B893E06065E2FA9IA1PR11MB6266namp_--
