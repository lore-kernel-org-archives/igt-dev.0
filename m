Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2130910E412
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 15:07:43 +0000 (UTC)
From: "Hung, Alex" <Alex.Hung@amd.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 14 Dec 2022 15:07:41 +0000
Message-ID: <BYAPR12MB3048BC33EEB684DC1A14DFD0F7E09@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <20221213234332.364224-1-alex.hung@amd.com>
 <20221213234332.364224-2-alex.hung@amd.com>
 <Y5mJqL+CU9fFtiGl@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Y5mJqL+CU9fFtiGl@platvala-desk.ger.corp.intel.com>
Content-Language: en-GB
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB3048BC33EEB684DC1A14DFD0F7E09BYAPR12MB3048namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_bw: Run tests on available
 pipes only
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BYAPR12MB3048BC33EEB684DC1A14DFD0F7E09BYAPR12MB3048namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Thanks for the feedback. I will drop patch 2
________________________________
From: Petri Latvala <petri.latvala@intel.com>
Sent: 14 December 2022 01:30
To: Hung, Alex <Alex.Hung@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_bw: Run tests on available pip=
es only

On Tue, Dec 13, 2022 at 04:43:32PM -0700, Alex Hung wrote:
> This cleans up unnecessary skips during executions.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_bw.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 27100587..ac801746 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -145,17 +145,9 @@ static void run_test_linear_tiling(data_t *data, int=
 pipe, const drmModeModeInfo
>        igt_output_t *output;
>        struct igt_fb buffer[IGT_MAX_PIPES];
>        igt_crc_t zero, captured[IGT_MAX_PIPES];
> -     int i =3D 0, num_pipes =3D 0;
> -     enum pipe p;
> +     int i =3D 0;
>        int ret;
>
> -     /* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 =
where they do
> -      * not give the numver of valid crtcs and always return IGT_MAX_PIP=
ES */
> -     for_each_pipe(display, p) num_pipes++;
> -
> -     igt_skip_on_f(pipe > num_pipes,
> -                      "ASIC does not have %d pipes\n", pipe);
> -
>        test_init(data);
>
>        /* create buffers */
> @@ -204,6 +196,7 @@ igt_main
>  {
>        data_t data;
>        int i =3D 0, j =3D 0;
> +     enum pipe p;
>
>        memset(&data, 0, sizeof(data));
>
> @@ -219,14 +212,13 @@ igt_main
>
>        }
>
> -     /* We're not using for_each_pipe_static because we need the
> -      * _amount_ of pipes */
> -     for (i =3D 0; i < IGT_MAX_PIPES; i++) {
> +     for_each_pipe(&data.display, p) {
>                for (j =3D 0; j < ARRAY_SIZE(test_mode); j++) {
>                        igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
>                              test_mode[j].name)
>                        run_test_linear_tiling(&data, i, &test_mode[j]);
>                }
> +             i++;
>        }


When enumerating tests with --list-subtests you don't have
data.display valid. As gitlab pipeline relay warned for this series.

What you can do is make this an igt_subtest_with_dynamic, and

igt_subtest_with_dynamic_f("linear-tiling-multiple-displays-%s", test_mode[=
j].name) {
  for_each_pipe(&data.display, p) {
    igt_dynamic_f("%d-displays", i+1) {
      run_test_linear_tiling(&data, i, &test_mode[j]);
    }
  }
}

However, even with that in place, using for_each_pipe sounds wrong. As
the comment says, this is using an _amount_ of pipes, not one
particular pipe.


--
Petri Latvala

--_000_BYAPR12MB3048BC33EEB684DC1A14DFD0F7E09BYAPR12MB3048namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255,=
 255);">
Thanks for the feedback. I will drop patch 2</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Petri Latvala &lt;pet=
ri.latvala@intel.com&gt;<br>
<b>Sent:</b> 14 December 2022 01:30<br>
<b>To:</b> Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH 2/2] tests/kms_bw: Run tests on availa=
ble pipes only</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Dec 13, 2022 at 04:43:32PM -0700, Alex Hun=
g wrote:<br>
&gt; This cleans up unnecessary skips during executions.<br>
&gt; <br>
&gt; Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_bw.c | 16 ++++------------<br>
&gt;&nbsp; 1 file changed, 4 insertions(+), 12 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/kms_bw.c b/tests/kms_bw.c<br>
&gt; index 27100587..ac801746 100644<br>
&gt; --- a/tests/kms_bw.c<br>
&gt; +++ b/tests/kms_bw.c<br>
&gt; @@ -145,17 +145,9 @@ static void run_test_linear_tiling(data_t *data, =
int pipe, const drmModeModeInfo<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb buffer[IGT_MAX=
_PIPES];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t zero, captured[IGT=
_MAX_PIPES];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0, num_pipes =3D 0;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; enum pipe p;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* Cannot use igt_display_get_n_pipes() due =
to fused pipes on i915 where they do<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * not give the numver of valid crtcs a=
nd always return IGT_MAX_PIPES */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe(display, p) num_pipes++;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(pipe &gt; num_pipes,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ASIC does n=
ot have %d pipes\n&quot;, pipe);<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_init(data);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* create buffers */<br>
&gt; @@ -204,6 +196,7 @@ igt_main<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data_t data;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0, j =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum pipe p;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;data, 0, sizeof(=
data));<br>
&gt;&nbsp; <br>
&gt; @@ -219,14 +212,13 @@ igt_main<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* We're not using for_each_pipe_static beca=
use we need the<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * _amount_ of pipes */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; IGT_MAX_PIPES; i++) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe(&amp;data.display, p) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; ARRAY_SIZE(test_mode); j++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_sub=
test_f(&quot;linear-tiling-%d-displays-%s&quot;, i+1,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mode[j].name)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_tes=
t_linear_tiling(&amp;data, i, &amp;test_mode[j]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; i++;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
<br>
When enumerating tests with --list-subtests you don't have<br>
data.display valid. As gitlab pipeline relay warned for this series.<br>
<br>
What you can do is make this an igt_subtest_with_dynamic, and<br>
<br>
igt_subtest_with_dynamic_f(&quot;linear-tiling-multiple-displays-%s&quot;, =
test_mode[j].name) {<br>
&nbsp; for_each_pipe(&amp;data.display, p) {<br>
&nbsp;&nbsp;&nbsp; igt_dynamic_f(&quot;%d-displays&quot;, i+1) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test_linear_tiling(&amp;data, i, &amp;te=
st_mode[j]);<br>
&nbsp;&nbsp;&nbsp; }<br>
&nbsp; }<br>
}<br>
<br>
However, even with that in place, using for_each_pipe sounds wrong. As<br>
the comment says, this is using an _amount_ of pipes, not one<br>
particular pipe.<br>
<br>
<br>
-- <br>
Petri Latvala<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB3048BC33EEB684DC1A14DFD0F7E09BYAPR12MB3048namp_--
