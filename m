Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498E610F42C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 16:58:56 +0000 (UTC)
From: "Hung, Alex" <Alex.Hung@amd.com>
To: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 9 May 2022 16:58:53 +0000
Message-ID: <BYAPR12MB3048F6039FD8D2664C2C48D4F7C69@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <20220509155045.907053-1-alex.hung@amd.com>
 <CAJUqKUqpD=dseFj9i-h1y=vnA1OXDik--8ySrBw3SeB=1Dn3kg@mail.gmail.com>
In-Reply-To: <CAJUqKUqpD=dseFj9i-h1y=vnA1OXDik--8ySrBw3SeB=1Dn3kg@mail.gmail.com>
Content-Language: en-GB
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB3048F6039FD8D2664C2C48D4F7C69BYAPR12MB3048namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2 i-g-t][V2] tests/kms_universal_plane: Skip
 off screen universal calls on AMD devices
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

--_000_BYAPR12MB3048F6039FD8D2664C2C48D4F7C69BYAPR12MB3048namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

I think the idea is to avoid wasting of HW resources when it's not visible =
to end-users. If the check is removed in driver there will be other errors =
since the driver is not designed to handle this.

If it is not visible to end-users, current AMD driver behaviours are more o=
ptimal in IMHO.
________________________________
From: Mark Yacoub <markyacoub@chromium.org>
Sent: 09 May 2022 10:21
To: Hung, Alex <Alex.Hung@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; markyaco=
ub@google.com <markyacoub@google.com>
Subject: Re: [igt-dev] [PATCH 1/2 i-g-t][V2] tests/kms_universal_plane: Ski=
p off screen universal calls on AMD devices

On Mon, May 9, 2022 at 11:51 AM Alex Hung <alex.hung@amd.com> wrote:
>
> amdgpu_dm intentionally blocks planes outside the screen in the function
> "dm_plane_helper_check_state" and returns -EINVAL. As a results, this
do you know why it intentionally does that? What happens if you remove
this check? Maybe AMD shouldn't check for it? I'm thinking that
ideally we don't want drivers to have special handling when it's not
needed and for KMS tests to become a standard for userspace.
> piece of code should be skipped on AMD devices.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 3cb6d704..3a3667e6 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -242,16 +242,18 @@ functional_test_pipe(data_t *data, enum pipe pipe, =
igt_output_t *output)
>         igt_display_commit2(display, COMMIT_LEGACY);
>
>         /* Step 14: Universal API, set primary completely offscreen (CRC =
9) */
> -       igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plan=
e_id,
> -                                  output->config.crtc->crtc_id,
> -                                  test.blue_fb.fb_id, 0,
> -                                  9000, 9000,
> -                                  test.mode->hdisplay,
> -                                  test.mode->vdisplay,
> -                                  IGT_FIXED(0,0), IGT_FIXED(0,0),
> -                                  IGT_FIXED(test.mode->hdisplay,0),
> -                                  IGT_FIXED(test.mode->vdisplay,0)) =3D=
=3D 0);
> -       igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> +       if (!is_amdgpu_device(data->drm_fd)) {
> +               igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_pla=
ne->plane_id,
> +                                          output->config.crtc->crtc_id,
> +                                          test.blue_fb.fb_id, 0,
> +                                          9000, 9000,
> +                                          test.mode->hdisplay,
> +                                          test.mode->vdisplay,
> +                                          IGT_FIXED(0,0), IGT_FIXED(0,0)=
,
> +                                          IGT_FIXED(test.mode->hdisplay,=
0),
> +                                          IGT_FIXED(test.mode->vdisplay,=
0)) =3D=3D 0);
> +               igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> +       }
>
>         /*
>          * Step 15: Explicitly disable primary after it's already been
> --
> 2.25.1
>

--_000_BYAPR12MB3048F6039FD8D2664C2C48D4F7C69BYAPR12MB3048namp_
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
I think the idea is to avoid wasting of HW resources when it's not visible =
to end-users. If the check is removed in driver there will be other errors =
since the driver is not designed to handle this.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
If it is not visible to end-users, current AMD driver behaviours are more o=
ptimal in IMHO.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mark Yacoub &lt;marky=
acoub@chromium.org&gt;<br>
<b>Sent:</b> 09 May 2022 10:21<br>
<b>To:</b> Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; markyacoub@google.com &lt;markyacoub@google.com&gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH 1/2 i-g-t][V2] tests/kms_universal_pla=
ne: Skip off screen universal calls on AMD devices</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, May 9, 2022 at 11:51 AM Alex Hung &lt;alex=
.hung@amd.com&gt; wrote:<br>
&gt;<br>
&gt; amdgpu_dm intentionally blocks planes outside the screen in the functi=
on<br>
&gt; &quot;dm_plane_helper_check_state&quot; and returns -EINVAL. As a resu=
lts, this<br>
do you know why it intentionally does that? What happens if you remove<br>
this check? Maybe AMD shouldn't check for it? I'm thinking that<br>
ideally we don't want drivers to have special handling when it's not<br>
needed and for KMS tests to become a standard for userspace.<br>
&gt; piece of code should be skipped on AMD devices.<br>
&gt;<br>
&gt; Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_universal_plane.c | 22 ++++++++++++----------<br>
&gt;&nbsp; 1 file changed, 12 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c=
<br>
&gt; index 3cb6d704..3a3667e6 100644<br>
&gt; --- a/tests/kms_universal_plane.c<br>
&gt; +++ b/tests/kms_universal_plane.c<br>
&gt; @@ -242,16 +242,18 @@ functional_test_pipe(data_t *data, enum pipe pip=
e, igt_output_t *output)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(di=
splay, COMMIT_LEGACY);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Step 14: Universal =
API, set primary completely offscreen (CRC 9) */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(drmModeSetPlane(data-=
&gt;drm_fd, primary-&gt;drm_plane-&gt;plane_id,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;config.cr=
tc-&gt;crtc_id,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test.blue_fb.fb_id, =
0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9000, 9000,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test.mode-&gt;hdispl=
ay,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test.mode-&gt;vdispl=
ay,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_FIXED(0,0), IGT_=
FIXED(0,0),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_FIXED(test.mode-=
&gt;hdisplay,0),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_FIXED(test.mode-=
&gt;vdisplay,0)) =3D=3D 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_collect_crc(test.pi=
pe_crc, &amp;test.crc_9);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!is_amdgpu_device(data-&gt;d=
rm_fd)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_assert(drmModeSetPlane(data-&gt;drm_fd, primary-&gt;drm=
_plane-&gt;plane_id,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;config.crtc-&gt;crtc_id,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; test.blue_fb.fb_id, 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 9000, 9000,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; test.mode-&gt;hdisplay,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; test.mode-&gt;vdisplay,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_FIXED(0,0), IGT_FIXED(0,0),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_FIXED(test.mode-&gt;hdisplay,0),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_FIXED(test.mode-&gt;vdisplay,0)) =3D=3D 0);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_pipe_crc_collect_crc(test.pipe_crc, &amp;test.crc_9);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Step 15: Expli=
citly disable primary after it's already been<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB3048F6039FD8D2664C2C48D4F7C69BYAPR12MB3048namp_--
