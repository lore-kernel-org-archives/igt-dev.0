Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2088.outbound.protection.outlook.com [40.107.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40C26E087
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 05:56:32 +0000 (UTC)
From: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>
Date: Wed, 13 Oct 2021 05:56:30 +0000
Message-ID: <BN9PR12MB51458A8FDF7B5E342334E43AFFB79@BN9PR12MB5145.namprd12.prod.outlook.com>
References: <20211008085917.393839-1-stylon.wang@amd.com>
 <1760fac2-d508-d04a-a00a-f40714333dd7@amd.com>
 <7a891b83094e437f9d430a58b052ece7@intel.com>
In-Reply-To: <7a891b83094e437f9d430a58b052ece7@intel.com>
Content-Language: en-CA
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB51458A8FDF7B5E342334E43AFFB79BN9PR12MB5145namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_hdr: Fix failure to read
 output_bpc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Choi, Nicholas" <Nicholas.Choi@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "contact@emersion.fr" <contact@emersion.fr>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BN9PR12MB51458A8FDF7B5E342334E43AFFB79BN9PR12MB5145namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Lakshminarayana,

Here it is: https://patchwork.freedesktop.org/series/95601/


Regards

Stylon Wang

MTS Software Development Eng.  |  AMD
Display Solution Team

O +(886) 2-3789-3667 ext. 23667  C +(886) 921-897-142

---------------------------------------------------------------------------=
-------------------------------------------------------

6F, 3, YuanCyu St (NanKang Software Park) Taipei, Taiwan

Facebook<https://www.facebook.com/AMD> |  Twitter<https://twitter.com/AMD> =
|  amd.com<http://www.amd.com/>



________________________________
From: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
Sent: October 9, 2021 5:04 AM
To: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; igt-dev@lists.freedesktop=
.org <igt-dev@lists.freedesktop.org>
Cc: Choi, Nicholas <Nicholas.Choi@amd.com>; Wentland, Harry <Harry.Wentland=
@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Siqueira, Ro=
drigo <Rodrigo.Siqueira@amd.com>; contact@emersion.fr <contact@emersion.fr>=
; Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_hdr: Fix failure to read output_bpc

Can you please post the series link here?

Lakshmi.
-----Original Message-----
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Sent: Friday, October 8, 2021 12:32 PM
To: igt-dev@lists.freedesktop.org; Vudum, Lakshminarayana <lakshminarayana.=
vudum@intel.com>
Cc: nicholas.choi@amd.com; harry.wentland@amd.com; nicholas.kazlauskas@amd.=
com; rodrigo.siqueira@amd.com; contact@emersion.fr; Stylon Wang <stylon.wan=
g@amd.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Fix failure to read output_bpc

Hi Lakshminarayana,

It looks like that we have another false-positive result from the CI in thi=
s patch.

Thanks
Siqueira

On 2021-10-08 4:59 a.m., Stylon Wang wrote:
> The first commit with TEST_ONLY flag in bpc-switch subtests could fail
> the test, because previous state can be with any bpc or even wth no
> crtc assigned to the connector.
>
> v2:
> - Keep the test commit for its original purpose of checking
>    if 512x512 plane size works for the hardware.
> - Add new atomic commit so the setting of 8 bpc really takes effect.
>
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>   tests/kms_hdr.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index
> 5b8529c8..273263db 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -213,16 +213,27 @@ static void test_bpc_switch_on_output(data_t
> *data, igt_output_t *output,
>
>                draw_hdr_pattern(&afb);
>
> -             /* Start in 8bpc. */
> +             /* Plane may be required to fit fullscreen. Check it here a=
nd allow
> +              * smaller plane size in following tests.
> +              */
>                igt_plane_set_fb(data->primary, &afb);
>                igt_plane_set_size(data->primary, data->w, data->h);
> -             igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_B=
PC, 8);
>                ret =3D igt_display_try_commit_atomic(display, DRM_MODE_AT=
OMIC_TEST_ONLY, NULL);
>                if (!ret) {
>                        data->w =3D afb.width;
>                        data->h =3D afb.height;
>                }
>
> +             /* Start in 8bpc. */
> +             igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_B=
PC, 8);
> +             igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MO=
DESET, NULL);
> +             /*
> +              * i915 driver doesn't expose max bpc as debugfs entry,
> +              * so limiting assert only for amd driver.
> +              */
> +             if (is_amdgpu_device(data->fd))
> +                     assert_output_bpc(data, 8);
> +
>                /*
>                 * amdgpu requires a primary plane when the CRTC is enable=
d.
>                 * However, some older Intel hardware (hsw) have scaling @=
@
> -232,13 +243,6 @@ static void test_bpc_switch_on_output(data_t *data, igt=
_output_t *output,
>                if (!is_amdgpu_device(data->fd))
>                        igt_plane_set_fb(data->primary, NULL);
>
> -             /*
> -              * i915 driver doesn't expose max bpc as debugfs entry,
> -              * so limiting assert only for amd driver.
> -              */
> -             if (is_amdgpu_device(data->fd))
> -                     assert_output_bpc(data, 8);
> -
>                /* Switch to 10bpc. */
>                igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_=
BPC, 10);
>                igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_M=
ODESET,
> NULL);
>


--_000_BN9PR12MB51458A8FDF7B5E342334E43AFFB79BN9PR12MB5145namp_
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
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
Hi Lakshminarayana,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
Here it is:&nbsp;<a href=3D"https://patchwork.freedesktop.org/series/95601/=
" id=3D"LPlnk353020">https://patchwork.freedesktop.org/series/95601/</a></d=
iv>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
Regards</div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div></div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><u><b>Stylon Wang</b></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black">MTS Software Development Eng.&nbsp;&nbsp;|<b>&nbsp;&nbsp;AMD</b><=
br>
Display Solution Team</span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><b style=3D"color:rgb(32,31,30); font-family:Calibri,sans-serif; =
font-size:14.6667px; background-color:rgb(255,255,255)"><span style=3D"marg=
in:0px; font-size:9pt; font-family:Arial,sans-serif; color:black">O</span><=
/b><span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; =
color:black; background-color:rgb(255,255,255)">&nbsp;+(886)
 2-3789-3667 ext. 23667&nbsp;&nbsp;<b>C</b>&nbsp;+(886) 921-897-142</span><=
br>
</span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<b><span style=3D"margin:0px; font-size:9pt; color:rgb(242,101,34); letter-=
spacing:-1.4pt">-----------------------------------------------------------=
-----------------------------------------------------------------------</sp=
an></b><b><span style=3D"margin:0px; font-size:9pt; color:rgb(242,101,34)">=
</span></b></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><span tabindex=3D"0" style=3D"margin:0px; padding:1px 0px; border=
-width:0px 0px 1px; border-bottom-style:dashed">6F, 3, YuanCyu St (NanKang =
Software Park) Taipei, Taiwan</span></span></p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
<span style=3D"margin:0px; font-size:9pt; font-family:Arial,sans-serif; col=
or:black"><a href=3D"https://www.facebook.com/AMD" target=3D"_blank" rel=3D=
"noopener noreferrer" style=3D"margin:0px"><span style=3D"margin:0px">Faceb=
ook</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D"https://twitter.com/AMD" target=
=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin:0px"><span style=3D=
"margin:0px">Twitter</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D"http://www.amd=
.com/" target=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin:0px"><=
span style=3D"margin:0px">amd.com</span></a></span><span style=3D"margin:0p=
x; font-size:10pt; font-family:Arial,sans-serif; color:black">&nbsp;</span>=
</p>
<p style=3D"margin:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sa=
ns-serif; color:rgb(32,31,30); text-align:start; background-color:rgb(255,2=
55,255)">
&nbsp;</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vudum, Lakshminarayan=
a &lt;lakshminarayana.vudum@intel.com&gt;<br>
<b>Sent:</b> October 9, 2021 5:04 AM<br>
<b>To:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; igt-dev@list=
s.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Choi, Nicholas &lt;Nicholas.Choi@amd.com&gt;; Wentland, Harry &l=
t;Harry.Wentland@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@=
amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; contact@em=
ersion.fr &lt;contact@emersion.fr&gt;; Wang, Chao-kai (Stylon)
 &lt;Stylon.Wang@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH i-g-t v2] tests/kms_hdr: Fix failure to read out=
put_bpc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Can you please post the series link here?<br>
<br>
Lakshmi.<br>
-----Original Message-----<br>
From: Rodrigo Siqueira Jordao &lt;rjordrigo@amd.com&gt; <br>
Sent: Friday, October 8, 2021 12:32 PM<br>
To: igt-dev@lists.freedesktop.org; Vudum, Lakshminarayana &lt;lakshminaraya=
na.vudum@intel.com&gt;<br>
Cc: nicholas.choi@amd.com; harry.wentland@amd.com; nicholas.kazlauskas@amd.=
com; rodrigo.siqueira@amd.com; contact@emersion.fr; Stylon Wang &lt;stylon.=
wang@amd.com&gt;<br>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Fix failure to read output_bpc=
<br>
<br>
Hi Lakshminarayana,<br>
<br>
It looks like that we have another false-positive result from the CI in thi=
s patch.<br>
<br>
Thanks<br>
Siqueira<br>
<br>
On 2021-10-08 4:59 a.m., Stylon Wang wrote:<br>
&gt; The first commit with TEST_ONLY flag in bpc-switch subtests could fail=
 <br>
&gt; the test, because previous state can be with any bpc or even wth no <b=
r>
&gt; crtc assigned to the connector.<br>
&gt; <br>
&gt; v2:<br>
&gt; - Keep the test commit for its original purpose of checking<br>
&gt;&nbsp;&nbsp;&nbsp; if 512x512 plane size works for the hardware.<br>
&gt; - Add new atomic commit so the setting of 8 bpc really takes effect.<b=
r>
&gt; <br>
&gt; Signed-off-by: Stylon Wang &lt;stylon.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; tests/kms_hdr.c | 22 +++++++++++++---------<br>
&gt;&nbsp;&nbsp; 1 file changed, 13 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index <br>
&gt; 5b8529c8..273263db 100644<br>
&gt; --- a/tests/kms_hdr.c<br>
&gt; +++ b/tests/kms_hdr.c<br>
&gt; @@ -213,16 +213,27 @@ static void test_bpc_switch_on_output(data_t <br=
>
&gt; *data, igt_output_t *output,<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; draw_hdr_pattern(&amp;afb);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Start in 8bpc. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Plane may be required to fit fullscreen. Check it here and allow<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * smaller plane size in following tests.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, &amp;afb);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_plane_set_size(data-&gt;primary, data-&gt;w, data-&=
gt;h);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_output_set_prop_value(data-&gt;output, IGT_CONNECTOR_MAX_BPC, 8);<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D igt_display_try_commit_atomic(display, DRM_MODE=
_ATOMIC_TEST_ONLY, NULL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (!ret) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&g=
t;w =3D afb.width;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&g=
t;h =3D afb.height;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Start in 8bpc. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_output_set_prop_value(data-&gt;output, IGT_CONNECTOR_MAX_BPC, 8);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * i915 driver doesn't expose max bpc as debugfs entry,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * so limiting assert only for amd driver.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_amdgpu_device(data-&gt;fd))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_output_bpc(data,=
 8);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * amdgpu requires a primary plane when the CRTC i=
s enabled.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * However, some older Intel hardware (hsw) have s=
caling @@ <br>
&gt; -232,13 +243,6 @@ static void test_bpc_switch_on_output(data_t *data, =
igt_output_t *output,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (!is_amdgpu_device(data-&gt;fd))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pla=
ne_set_fb(data-&gt;primary, NULL);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * i915 driver doesn't expose max bpc as debugfs entry,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * so limiting assert only for amd driver.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_amdgpu_device(data-&gt;fd))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_output_bpc(data,=
 8);<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* Switch to 10bpc. */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_output_set_prop_value(data-&gt;output, IGT_CONNECTO=
R_MAX_BPC, 10);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLO=
W_MODESET,
<br>
&gt; NULL);<br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN9PR12MB51458A8FDF7B5E342334E43AFFB79BN9PR12MB5145namp_--
