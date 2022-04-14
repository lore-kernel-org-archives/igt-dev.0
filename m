Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6056010F203
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 01:01:37 +0000 (UTC)
From: "Hung, Alex" <Alex.Hung@amd.com>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 14 Apr 2022 01:01:32 +0000
Message-ID: <BYAPR12MB3048D361909BF8758C8CEA4CF7EF9@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <20220407174215.171440-1-alex.hung@amd.com>
 <CAP+8YyFV8mdU+xUqeP0bF+YuNo2Uo=A9WVBJOJBvoc+ZEwuEmw@mail.gmail.com>
In-Reply-To: <CAP+8YyFV8mdU+xUqeP0bF+YuNo2Uo=A9WVBJOJBvoc+ZEwuEmw@mail.gmail.com>
Content-Language: en-GB
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB3048D361909BF8758C8CEA4CF7EF9BYAPR12MB3048namp_"
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
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BYAPR12MB3048D361909BF8758C8CEA4CF7EF9BYAPR12MB3048namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]



________________________________
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Sent: 13 April 2022 16:00
To: Hung, Alex <Alex.Hung@amd.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.o=
rg>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Siquei=
ra@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
Subject: Re: [PATCH i-g-t][V2] tests/kms: Skip kms test cases for DCC and D=
CC_RETILE

On Thu, Apr 7, 2022 at 7:42 PM Alex Hung <alex.hung@amd.com> wrote:
>
> Skip the KMS test cases for planes that has modifiers with
> DCC and DCC_RETILE on AMDGPU.
>
> Current pixel-format and pixel-format-source-clamping subtests do not
> support modifers with DCC or DCC_RETILE in kernel.
>
> 1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors
> "Format requires non-linear modifier for plane 1" because block_size
> (i.e. cpp[1]) =3D=3D 0. See kernel commits 816853f9dc40 and 8db2dc852941.

We aren't using a linear modifier here, why would this trigger?

The data seems to be all zero, and r->modifier[i] will be zero and equals D=
RM_FORMAT_MOD_LINEAR (=3D 0)

>
> 2. the subtests cause kernel's amdgpu_display_verify_sizes to fail
> because they do not provide an extra plane with compression metadata.
> See kernel commit 234055fd9728 for details.

Can we do something more generic by skipping all modifiers where the
number of planes !=3D the number of planes for the format with a linear
modifier?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Do you mean something like below:

        int nlinear =3D 0;
        int i;

        for (i =3D 0; i < plane->format_mod_count; i++)
                if (plane->modifiers[i] =3D=3D DRM_FORMAT_MOD_LINEAR)
                        nlinear++;

        if (plane->format_mod_count !=3D nlinear)
                return true;

This will affect more than DCC.

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
> +               if (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
> +                   AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i])) {

This check is only valid if you first check that this is an AMD modifier.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Thanks. This can be fixed by the following if it is to be used.

        for (i =3D 0; i < plane->format_mod_count; i++) {
                if (IS_AMD_FMT_MOD(plane->modifiers[i]) &&
                    (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
                     AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i]))) {
                        igt_debug("Skipping planes with DCC or DCC_RETILE\n=
");
                        return true;
                }
        }


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

--_000_BYAPR12MB3048D361909BF8758C8CEA4CF7EF9BYAPR12MB3048namp_
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
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Bas Nieuwenhuizen &lt=
;bas@basnieuwenhuizen.nl&gt;<br>
<b>Sent:</b> 13 April 2022 16:00<br>
<b>To:</b> Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Cc:</b> Development mailing list for IGT GPU Tools &lt;igt-dev@lists.fre=
edesktop.org&gt;; Mark Yacoub &lt;markyacoub@google.com&gt;; Siqueira, Rodr=
igo &lt;Rodrigo.Siqueira@amd.com&gt;; Pillai, Aurabindo &lt;Aurabindo.Pilla=
i@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t][V2] tests/kms: Skip kms test cases for DC=
C and DCC_RETILE</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, Apr 7, 2022 at 7:42 PM Alex Hung &lt;alex.=
hung@amd.com&gt; wrote:<br>
&gt;<br>
&gt; Skip the KMS test cases for planes that has modifiers with<br>
&gt; DCC and DCC_RETILE on AMDGPU.<br>
&gt;<br>
&gt; Current pixel-format and pixel-format-source-clamping subtests do not<=
br>
&gt; support modifers with DCC or DCC_RETILE in kernel.<br>
&gt;<br>
&gt; 1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors<br=
>
&gt; &quot;Format requires non-linear modifier for plane 1&quot; because bl=
ock_size<br>
&gt; (i.e. cpp[1]) =3D=3D 0. See kernel commits 816853f9dc40 and 8db2dc8529=
41.<br>
<br>
We aren't using a linear modifier here, why would this trigger?</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">The data seems to be all zero, and r-&gt;modifier[=
i] will be zero and equals&nbsp;DRM_FORMAT_MOD_LINEAR (=3D 0)</div>
<div class=3D"PlainText"><br>
&gt;<br>
&gt; 2. the subtests cause kernel's amdgpu_display_verify_sizes to fail<br>
&gt; because they do not provide an extra plane with compression metadata.<=
br>
&gt; See kernel commit 234055fd9728 for details.<br>
<br>
Can we do something more generic by skipping all modifiers where the<br>
number of planes !=3D the number of planes for the format with a linear<br>
modifier?<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Do you mean something like below:</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">&nbsp; &nbsp; &nbsp; &nbsp; int nlinear =3D 0;
<div>&nbsp; &nbsp; &nbsp; &nbsp; int i;</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; plane-&gt;format_mod_=
count; i++) </div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (plane-&gt;=
modifiers[i] =3D=3D DRM_FORMAT_MOD_LINEAR)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; nlinear++;</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (plane-&gt;format_mod_count !=3D nlinea=
r)</div>
<span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return true;<=
/span><br>
<br>
This will affect more than DCC.<br>
<br>
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
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (AMD_FMT_MOD_GET(DCC, plane-&gt;modifiers[i]) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_FMT_MOD_GET(DCC_RETILE, plane-&=
gt;modifiers[i])) {<br>
<br>
This check is only valid if you first check that this is an AMD modifier.</=
div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><span style=3D"background-color:rgb(255, 255, 255)=
;display:inline !important">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</span><br>
</div>
<div class=3D"PlainText">Thanks. This can be fixed by the following if it i=
s to be used.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">&nbsp; &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; p=
lane-&gt;format_mod_count; i++) {
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (IS_AMD_FMT=
_MOD(plane-&gt;modifiers[i]) &amp;&amp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
(AMD_FMT_MOD_GET(DCC, plane-&gt;modifiers[i]) ||</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;AMD_FMT_MOD_GET(DCC_RETILE, plane-&gt;modifiers[i]))) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; igt_debug(&quot;Skipping planes with DCC or DCC_RETILE\n&quot=
;);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; return true;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<span>&nbsp; &nbsp; &nbsp; &nbsp; }</span><br>
<br>
<br>
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

--_000_BYAPR12MB3048D361909BF8758C8CEA4CF7EF9BYAPR12MB3048namp_--
