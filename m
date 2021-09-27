Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD4389E0C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 17:28:34 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Date: Mon, 27 Sep 2021 17:28:32 +0000
Message-ID: <DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
References: <20210927160700.1570885-1-aurabindo.pillai@amd.com>
 <CAJUqKUpwJfdU+=jO5=atomxwu4d-KXRSN0gEppQhWdK9CqtNaQ@mail.gmail.com>
In-Reply-To: <CAJUqKUpwJfdU+=jO5=atomxwu4d-KXRSN0gEppQhWdK9CqtNaQ@mail.gmail.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79DM4PR12MB5295namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-big
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Mark Yacoub <markyacoub@google.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79DM4PR12MB5295namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Mark,


Both bo-too-big and bo-too-big-interruptible shall be skipped with this pat=
ch. The other location where TEST_BO_TOOBIG is mentioned is in the same fun=
ction.

--

Regards,
Jay
________________________________
From: Mark Yacoub <markyacoub@chromium.org>
Sent: Monday, September 27, 2021 1:21 PM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.o=
rg>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Siquei=
ra@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-b=
ig

On Mon, Sep 27, 2021 at 12:07 PM Aurabindo Pillai
<aurabindo.pillai@amd.com> wrote:
>
> [Why]
> The rationale of the test does not hold true for AMD hardware. The
> aperture size calculation has an upper bound check which is done through
> i915 specific IOCTL. Hence this part of subtest must be moved
> out of the platform agnostic tests. Moreover, AMD hardware
> supports buffers larger than aperture size.
>
> [How]
> Skip the bo-too-big subtest unless its run on i915 as the test fails on
> AMD, VKMS and VC4
>
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>  tests/kms_flip.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 54137871..20112de1 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1290,6 +1290,7 @@ static void __run_test_on_crtc_set(struct test_outp=
ut *o, int *crtc_idxs,
>         /* 256 MB is usually the maximum mappable aperture,
>          * (make it 4x times that to ensure failure) */
>         if (o->flags & TEST_BO_TOOBIG) {
There is also another place where TEST_BO_TOOBIG is used, should we
skip this one as well or it's only this part?
> +               igt_skip_on(!is_i915_device(drm_fd));
>                 bo_size =3D 4*gem_mappable_aperture_size(drm_fd);
>                 igt_require(bo_size < gem_global_aperture_size(drm_fd));
>         }
> --
> 2.30.2
>

--_000_DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79DM4PR12MB5295namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Mark,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Both bo-too-big and bo-too-big-interruptible shall be skipped with this pat=
ch. The other location where TEST_BO_TOOBIG is mentioned is in the same fun=
ction.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mark Yacoub &lt;marky=
acoub@chromium.org&gt;<br>
<b>Sent:</b> Monday, September 27, 2021 1:21 PM<br>
<b>To:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;<br>
<b>Cc:</b> Development mailing list for IGT GPU Tools &lt;igt-dev@lists.fre=
edesktop.org&gt;; Mark Yacoub &lt;markyacoub@google.com&gt;; Siqueira, Rodr=
igo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest b=
o-too-big</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Sep 27, 2021 at 12:07 PM Aurabindo Pillai<=
br>
&lt;aurabindo.pillai@amd.com&gt; wrote:<br>
&gt;<br>
&gt; [Why]<br>
&gt; The rationale of the test does not hold true for AMD hardware. The<br>
&gt; aperture size calculation has an upper bound check which is done throu=
gh<br>
&gt; i915 specific IOCTL. Hence this part of subtest must be moved<br>
&gt; out of the platform agnostic tests. Moreover, AMD hardware<br>
&gt; supports buffers larger than aperture size.<br>
&gt;<br>
&gt; [How]<br>
&gt; Skip the bo-too-big subtest unless its run on i915 as the test fails o=
n<br>
&gt; AMD, VKMS and VC4<br>
&gt;<br>
&gt; Signed-off-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/kms_flip.c | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/tests/kms_flip.c b/tests/kms_flip.c<br>
&gt; index 54137871..20112de1 100755<br>
&gt; --- a/tests/kms_flip.c<br>
&gt; +++ b/tests/kms_flip.c<br>
&gt; @@ -1290,6 +1290,7 @@ static void __run_test_on_crtc_set(struct test_o=
utput *o, int *crtc_idxs,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 256 MB is usually t=
he maximum mappable aperture,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (make it 4x ti=
mes that to ensure failure) */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (o-&gt;flags &amp; =
TEST_BO_TOOBIG) {<br>
There is also another place where TEST_BO_TOOBIG is used, should we<br>
skip this one as well or it's only this part?<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_skip_on(!is_i915_device(drm_fd));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; bo_size =3D 4*gem_mappable_aperture_size(drm_fd);=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(bo_size &lt; gem_global_aperture_size=
(drm_fd));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79DM4PR12MB5295namp_--
