Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67DC10F42E
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 17:00:08 +0000 (UTC)
From: "Hung, Alex" <Alex.Hung@amd.com>
To: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 9 May 2022 17:00:04 +0000
Message-ID: <BYAPR12MB30480E303ED83836DAD0D0CCF7C69@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <20220509155045.907053-1-alex.hung@amd.com>
 <20220509155045.907053-2-alex.hung@amd.com>
 <CAJUqKUokPMnbDq8OK_jNqTLoq+eBZ_C5c1JwPyp3WJKG7yj-sA@mail.gmail.com>
In-Reply-To: <CAJUqKUokPMnbDq8OK_jNqTLoq+eBZ_C5c1JwPyp3WJKG7yj-sA@mail.gmail.com>
Content-Language: en-GB
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB30480E303ED83836DAD0D0CCF7C69BYAPR12MB3048namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2 i-g-t][V2] tests/kms_universal_plane:
 Enable gen9_test_pipe for all devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BYAPR12MB30480E303ED83836DAD0D0CCF7C69BYAPR12MB3048namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Thanks Mark.

I will update in V3 after collecting more feedbacks.
________________________________
From: Mark Yacoub <markyacoub@chromium.org>
Sent: 09 May 2022 10:34
To: Hung, Alex <Alex.Hung@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; markyaco=
ub@google.com <markyacoub@google.com>
Subject: Re: [igt-dev] [PATCH 2/2 i-g-t][V2] tests/kms_universal_plane: Ena=
ble gen9_test_pipe for all devices

On Mon, May 9, 2022 at 11:51 AM Alex Hung <alex.hung@amd.com> wrote:
>
> This subtest runs on non-i915 devices, and let's make it generic by
I like this, thank you!
> removing igt_require_intel and renaming it.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 3a3667e6..eab99962 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -701,15 +701,14 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *out=
put)
>   * windowing)
>   */
>  static void
> -gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> +pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *outpu=
t)
>  {
>         gen9_test_t test =3D { .data =3D data };
>         igt_plane_t *primary;
>
>         int ret =3D 0;
> -
> -       igt_require_intel(data->drm_fd);
> -       igt_skip_on(data->display_ver < 9);
> +       if (is_i915_device(data->drm_fd))
> +               igt_skip_on(data->display_ver < 9);
you can do instead ` igt_skip_on(is_i915_device(data->drm_fd) &&
data->display_ver < 9);`
>         igt_require_pipe(&data->display, pipe);
>
>         igt_output_set_pipe(output, pipe);
> @@ -789,10 +788,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>                         cursor_leak_test_pipe(data, pipe, output);
>
>         igt_describe("Check if pageflip succeeds in windowed setting");
> -       igt_subtest_f("universal-plane-gen9-features-pipe-%s",
> +       igt_subtest_f("universal-plane-pageflip-windowed-pipe-%s",
>                       kmstest_pipe_name(pipe))
>                 for_each_valid_output_on_pipe(&data->display, pipe, outpu=
t)
> -                       gen9_test_pipe(data, pipe, output);
> +                       pageflip_win_test_pipe(data, pipe, output);
>  }
>
>  static data_t data;
> --
> 2.25.1
>

--_000_BYAPR12MB30480E303ED83836DAD0D0CCF7C69BYAPR12MB3048namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks Mark.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I will update in V3 after collecting more feedbacks.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mark Yacoub &lt;marky=
acoub@chromium.org&gt;<br>
<b>Sent:</b> 09 May 2022 10:34<br>
<b>To:</b> Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; markyacoub@google.com &lt;markyacoub@google.com&gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH 2/2 i-g-t][V2] tests/kms_universal_pla=
ne: Enable gen9_test_pipe for all devices</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, May 9, 2022 at 11:51 AM Alex Hung &lt;alex=
.hung@amd.com&gt; wrote:<br>
&gt;<br>
&gt; This subtest runs on non-i915 devices, and let's make it generic by<br=
>
I like this, thank you!<br>
&gt; removing igt_require_intel and renaming it.<br>
&gt;<br>
&gt; Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_universal_plane.c | 11 +++++------<br>
&gt;&nbsp; 1 file changed, 5 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c=
<br>
&gt; index 3a3667e6..eab99962 100644<br>
&gt; --- a/tests/kms_universal_plane.c<br>
&gt; +++ b/tests/kms_universal_plane.c<br>
&gt; @@ -701,15 +701,14 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *=
output)<br>
&gt;&nbsp;&nbsp; * windowing)<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp; static void<br>
&gt; -gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)<br=
>
&gt; +pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *ou=
tput)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gen9_test_t test =3D {=
 .data =3D data };<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;<=
br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_intel(data-&gt;drm_f=
d);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on(data-&gt;display_ver=
 &lt; 9);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_i915_device(data-&gt;drm_=
fd))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_skip_on(data-&gt;display_ver &lt; 9);<br>
you can do instead ` igt_skip_on(is_i915_device(data-&gt;drm_fd) &amp;&amp;=
<br>
data-&gt;display_ver &lt; 9);`<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_pipe(&amp;=
data-&gt;display, pipe);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(ou=
tput, pipe);<br>
&gt; @@ -789,10 +788,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ursor_leak_test_pipe(data, pipe, output);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Che=
ck if pageflip succeeds in windowed setting&quot;);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;universal-pl=
ane-gen9-features-pipe-%s&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;universal-pl=
ane-pageflip-windowed-pipe-%s&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_pipe_=
name(pipe))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; for_each_valid_output_on_pipe(&amp;data-&gt;displ=
ay, pipe, output)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gen9_test_p=
ipe(data, pipe, output);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pageflip_wi=
n_test_pipe(data, pipe, output);<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; static data_t data;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB30480E303ED83836DAD0D0CCF7C69BYAPR12MB3048namp_--
