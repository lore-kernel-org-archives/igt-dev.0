Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8316E04E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Aug 2021 02:26:23 +0000 (UTC)
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
Date: Fri, 27 Aug 2021 02:26:22 +0000
Message-ID: <DM4PR12MB5294807BC901437851CAA13595C89@DM4PR12MB5294.namprd12.prod.outlook.com>
References: <20210825074707.145773-1-tianci.yin@amd.com>
 <20210826123635.7oue5lowthdkln5d@outlook.office365.com>
In-Reply-To: <20210826123635.7oue5lowthdkln5d@outlook.office365.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5294807BC901437851CAA13595C89DM4PR12MB5294namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic_interruptible: fix a warning
 message on AMD GPU
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>, Mark Yacoub <markyacoub@google.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Choi, Nicholas" <Nicholas.Choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM4PR12MB5294807BC901437851CAA13595C89DM4PR12MB5294namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Rodrigo Siqueira,

Thanks for your reviewing.
I only sent the patch one time by git send-email, I don't know where does t=
he V2 come from.

Thanks,
Rico

________________________________
From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
Sent: Thursday, August 26, 2021 20:36
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Petri La=
tvala <petri.latvala@intel.com>; Arkadiusz Hiler <arek@hiler.eu>; Mark Yaco=
ub <markyacoub@google.com>; Wentland, Harry <Harry.Wentland@amd.com>; Choi,=
 Nicholas <Nicholas.Choi@amd.com>
Subject: Re: [PATCH] tests/kms_atomic_interruptible: fix a warning message =
on AMD GPU

On 08/25, Tianci Yin wrote:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> [why]
> For subtest legacy-setmode and atomic-setmode, fb buffer is
> unbinded from plane by block_plane(), then igt_display_commit2()
> will trigger a dmesg warning message in drm_atomic_helper_commit(),
> since for block commit, drm will wait fences that represents
> finishing fb writing, when it find this fence has no accompanying
> fb, it gives out a warning.
>
> [how]
> Just remove igt_plane_set_fb() from block_plane() to retain
> the fb binding with plane.
> Verified on AMD Radeon Pro W5500 and Intel UHD Graphics 630
> (inside i7-9700K), both pass.
>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> ---
>  tests/kms_atomic_interruptible.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interrup=
tible.c
> index 0a127921..03980d6e 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -49,7 +49,6 @@ static int block_plane(igt_display_t *display, igt_outp=
ut_t *output, enum plane_
>
>                if (test_type =3D=3D test_legacy_modeset || test_type =3D=
=3D test_atomic_modeset) {
>                        igt_output_set_pipe(output, PIPE_NONE);
> -                     igt_plane_set_fb(plane, NULL);
>                }
>                igt_plane_set_fence_fd(plane, sw_sync_timeline_create_fenc=
e(timeline, 1));
>
> --
> 2.25.1
>

Btw, did you submit a V2?

If so, it looks like that there is a merge problem in the new version, see:

https://patchwork.freedesktop.org/series/94006/#rev2

Thanks

--
Rodrigo Siqueira
https://siqueira.tech

--_000_DM4PR12MB5294807BC901437851CAA13595C89DM4PR12MB5294namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi <font size=3D"2"><span style=3D"font-size:11pt">Rodrigo Siqueira</span><=
/font>,<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks for your reviewing.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I only sent the patch one time by git send-email, I don't know where does t=
he V2 come from.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Rico<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Siqueira, Rodrigo &=
lt;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 26, 2021 20:36<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Petri Latvala &lt;petri.latvala@intel.com&gt;; Arkadiusz Hiler &lt;are=
k@hiler.eu&gt;; Mark Yacoub &lt;markyacoub@google.com&gt;; Wentland, Harry =
&lt;Harry.Wentland@amd.com&gt;; Choi, Nicholas &lt;Nicholas.Choi@amd.com&gt=
;<br>
<b>Subject:</b> Re: [PATCH] tests/kms_atomic_interruptible: fix a warning m=
essage on AMD GPU</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On 08/25, Tianci Yin wrote:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt; <br>
&gt; [why]<br>
&gt; For subtest legacy-setmode and atomic-setmode, fb buffer is<br>
&gt; unbinded from plane by block_plane(), then igt_display_commit2()<br>
&gt; will trigger a dmesg warning message in drm_atomic_helper_commit(),<br=
>
&gt; since for block commit, drm will wait fences that represents<br>
&gt; finishing fb writing, when it find this fence has no accompanying<br>
&gt; fb, it gives out a warning.<br>
&gt; <br>
&gt; [how]<br>
&gt; Just remove igt_plane_set_fb() from block_plane() to retain<br>
&gt; the fb binding with plane.<br>
&gt; Verified on AMD Radeon Pro W5500 and Intel UHD Graphics 630<br>
&gt; (inside i7-9700K), both pass.<br>
&gt; <br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_atomic_interruptible.c | 1 -<br>
&gt;&nbsp; 1 file changed, 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_inter=
ruptible.c<br>
&gt; index 0a127921..03980d6e 100644<br>
&gt; --- a/tests/kms_atomic_interruptible.c<br>
&gt; +++ b/tests/kms_atomic_interruptible.c<br>
&gt; @@ -49,7 +49,6 @@ static int block_plane(igt_display_t *display, igt_o=
utput_t *output, enum plane_<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (test_type =3D=3D test_legacy_modeset || test_type =
=3D=3D test_atomic_modeset) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_out=
put_set_pipe(output, PIPE_NONE);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(plane,=
 NULL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_plane_set_fence_fd(plane, sw_sync_timeline_create_f=
ence(timeline, 1));<br>
&gt;&nbsp; <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt;<br>
<br>
Btw, did you submit a V2?<br>
<br>
If so, it looks like that there is a merge problem in the new version, see:=
<br>
<br>
<a href=3D"https://patchwork.freedesktop.org/series/94006/#rev2">https://pa=
tchwork.freedesktop.org/series/94006/#rev2</a>
<br>
<br>
Thanks<br>
<br>
-- <br>
Rodrigo Siqueira<br>
<a href=3D"https://siqueira.tech">https://siqueira.tech</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB5294807BC901437851CAA13595C89DM4PR12MB5294namp_--
