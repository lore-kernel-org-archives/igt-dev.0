Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B6D10E1F5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 00:02:52 +0000 (UTC)
From: "Hung, Alex" <Alex.Hung@amd.com>
To: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 14 Apr 2022 00:02:48 +0000
Message-ID: <BYAPR12MB3048AD2942B2E340109010CBF7EF9@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <20220407174215.171440-1-alex.hung@amd.com>
 <CAJUqKUpntYp_s6cCt=SSY8JwkqL4TrG+juNGx36yPburAnEs9g@mail.gmail.com>
In-Reply-To: <CAJUqKUpntYp_s6cCt=SSY8JwkqL4TrG+juNGx36yPburAnEs9g@mail.gmail.com>
Content-Language: en-GB
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB3048AD2942B2E340109010CBF7EF9BYAPR12MB3048namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t][V2] tests/kms: Skip kms test cases for
 DCC and DCC_RETILE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "bas@basnieuwenhuizen.nl" <bas@basnieuwenhuizen.nl>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BYAPR12MB3048AD2942B2E340109010CBF7EF9BYAPR12MB3048namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]



________________________________
From: Mark Yacoub <markyacoub@chromium.org>
Sent: 13 April 2022 13:56
To: Hung, Alex <Alex.Hung@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; markyaco=
ub@google.com <markyacoub@google.com>; bas@basnieuwenhuizen.nl <bas@basnieu=
wenhuizen.nl>
Subject: Re: [igt-dev] [PATCH i-g-t][V2] tests/kms: Skip kms test cases for=
 DCC and DCC_RETILE

On Thu, Apr 7, 2022 at 1:42 PM Alex Hung <alex.hung@amd.com> wrote:
title of commit message should include the test name if you're fixing
only 1 text. so it would be tests/kms_plane
>
> Skip the KMS test cases for planes that has modifiers with
nit: s/has/have.
> DCC and DCC_RETILE on AMDGPU.
>
> Current pixel-format and pixel-format-source-clamping subtests do not
> support modifers with DCC or DCC_RETILE in kernel.
nit: s/modifers/modifiers
>
> 1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors
is [1] referring to a url? i dont see it.
> "Format requires non-linear modifier for plane 1" because block_size
> (i.e. cpp[1]) =3D=3D 0. See kernel commits 816853f9dc40 and 8db2dc852941.
I would prefer you add links to make it easy to look up.
>
> 2. the subtests cause kernel's amdgpu_display_verify_sizes to fail
> because they do not provide an extra plane with compression metadata.
> See kernel commit 234055fd9728 for details.
ditto

if this is affecting a specific subtest, please add it here.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>
> v2: update comments in commit messages
>
>  tests/kms_plane.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 137f23a8..1a71822a 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1004,6 +1004,14 @@ static bool skip_plane(data_t *data, igt_plane_t *=
plane)
>  {
>         int index =3D plane->index;
>
> +       for (int i =3D 0; i < plane->format_mod_count; i++) {
not sure how it compiled, i think you'll need to move int i to above.

igt has many "for (int i ...)" so I use the same approach just for neatness=
. I will move it to above in V3.

> +               if (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
> +                   AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i])) {
> +                       igt_debug("Skipping planes with DCC or DCC_RETILE=
\n");
> +                       return true;
> +               }
> +       }
> +
>         if (data->extended)
>                 return false;
>
> --
> 2.35.1
>

--_000_BYAPR12MB3048AD2942B2E340109010CBF7EF9BYAPR12MB3048namp_
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
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Mark Yacoub &lt;marky=
acoub@chromium.org&gt;<br>
<b>Sent:</b> 13 April 2022 13:56<br>
<b>To:</b> Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; markyacoub@google.com &lt;markyacoub@google.com&gt;; bas@basnieuwenhui=
zen.nl &lt;bas@basnieuwenhuizen.nl&gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH i-g-t][V2] tests/kms: Skip kms test ca=
ses for DCC and DCC_RETILE</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, Apr 7, 2022 at 1:42 PM Alex Hung &lt;alex.=
hung@amd.com&gt; wrote:<br>
title of commit message should include the test name if you're fixing<br>
only 1 text. so it would be tests/kms_plane<br>
&gt;<br>
&gt; Skip the KMS test cases for planes that has modifiers with<br>
nit: s/has/have.<br>
&gt; DCC and DCC_RETILE on AMDGPU.<br>
&gt;<br>
&gt; Current pixel-format and pixel-format-source-clamping subtests do not<=
br>
&gt; support modifers with DCC or DCC_RETILE in kernel.<br>
nit: s/modifers/modifiers<br>
&gt;<br>
&gt; 1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors<br=
>
is [1] referring to a url? i dont see it.<br>
&gt; &quot;Format requires non-linear modifier for plane 1&quot; because bl=
ock_size<br>
&gt; (i.e. cpp[1]) =3D=3D 0. See kernel commits 816853f9dc40 and 8db2dc8529=
41.<br>
I would prefer you add links to make it easy to look up.<br>
&gt;<br>
&gt; 2. the subtests cause kernel's amdgpu_display_verify_sizes to fail<br>
&gt; because they do not provide an extra plane with compression metadata.<=
br>
&gt; See kernel commit 234055fd9728 for details.<br>
ditto<br>
<br>
if this is affecting a specific subtest, please add it here.<br>
&gt;<br>
&gt; Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; v2: update comments in commit messages<br>
&gt;<br>
&gt;&nbsp; tests/kms_plane.c | 8 ++++++++<br>
&gt;&nbsp; 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/kms_plane.c b/tests/kms_plane.c<br>
&gt; index 137f23a8..1a71822a 100644<br>
&gt; --- a/tests/kms_plane.c<br>
&gt; +++ b/tests/kms_plane.c<br>
&gt; @@ -1004,6 +1004,14 @@ static bool skip_plane(data_t *data, igt_plane_=
t *plane)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int index =3D plane-&g=
t;index;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; plane-&=
gt;format_mod_count; i++) {<br>
not sure how it compiled, i think you'll need to move int i to above.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><span style=3D"background-color:rgb(255, 255, 255)=
;display:inline !important">igt has many &quot;for (int i ...)&quot; so I u=
se the same approach just for neatness. I will move it to above in V3.</spa=
n><br>
</div>
<div class=3D"PlainText"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (AMD_FMT_MOD_GET(DCC, plane-&gt;modifiers[i]) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_FMT_MOD_GET(DCC_RETILE, plane-&=
gt;modifiers[i])) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&=
quot;Skipping planes with DCC or DCC_RETILE\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (data-&gt;extended)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB3048AD2942B2E340109010CBF7EF9BYAPR12MB3048namp_--
