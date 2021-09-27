Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856866E03C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 19:23:10 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Date: Mon, 27 Sep 2021 19:23:07 +0000
Message-ID: <DM4PR12MB52958E8DC8ED99397D2176D78BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
References: <20210927160700.1570885-1-aurabindo.pillai@amd.com>
 <CAJUqKUpwJfdU+=jO5=atomxwu4d-KXRSN0gEppQhWdK9CqtNaQ@mail.gmail.com>
 <DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
 <CAJUqKUoXc4g8QCKUBJAi5opMD31KW7ei2o2mA9ozHF0UV9qSFg@mail.gmail.com>
 <DM4PR12MB529578D5A447184B322867638BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
 <CAJUqKUpBjFvNtH6wQs+wKaZAcNjWsrprfsaqWGPpbmQXEE+WSA@mail.gmail.com>
In-Reply-To: <CAJUqKUpBjFvNtH6wQs+wKaZAcNjWsrprfsaqWGPpbmQXEE+WSA@mail.gmail.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB52958E8DC8ED99397D2176D78BA79DM4PR12MB5295namp_"
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

--_000_DM4PR12MB52958E8DC8ED99397D2176D78BA79DM4PR12MB5295namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Sure, that makes sense. Will send a v2

--

Regards,
Jay

________________________________
From: Mark Yacoub <markyacoub@chromium.org>
Sent: Monday, September 27, 2021 3:12 PM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.o=
rg>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Siquei=
ra@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-b=
ig

I'm not 100% sure but personally if I'm running the test on an AMD
device, I don't really care about seeing a subtest that I'm not
interested in.

On Mon, Sep 27, 2021 at 3:10 PM Pillai, Aurabindo
<Aurabindo.Pillai@amd.com> wrote:
>
> [AMD Official Use Only]
>
>
> Skipping using the continue statement has the side effect of this subtest=
 being absent from the list of subtests, when running the test executable w=
ith paramter --list-subtest. Is that okay ?
>
> --
>
> Regards,
> Jay
> ________________________________
> From: Mark Yacoub <markyacoub@chromium.org>
> Sent: Monday, September 27, 2021 1:34 PM
> To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
> Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop=
.org>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Siqu=
eira@amd.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too=
-big
>
> so for the sake of consistency, I'm wondering if we can skip the test
> the same way we skip other tests such as
> ```
> if (tests[i].flags & TEST_NO_2X_OUTPUT)
> continue;
> ```
> because we're not failing a certain condition but a whole test, it
> might be better not to run the test in the first place unless it's
> intel.
> So in both main loops that call run_test we can do if
> if (tests[i].flags & TEST_BO_TOOBIG && !intel)
>     continue;
> this way we're not too worried where the flag would be used across the
> test and not skip halfway through a test.
>
> On Mon, Sep 27, 2021 at 1:28 PM Pillai, Aurabindo
> <Aurabindo.Pillai@amd.com> wrote:
> >
> > [AMD Official Use Only]
> >
> >
> > Hi Mark,
> >
> >
> > Both bo-too-big and bo-too-big-interruptible shall be skipped with this=
 patch. The other location where TEST_BO_TOOBIG is mentioned is in the same=
 function.
> >
> > --
> >
> > Regards,
> > Jay
> > ________________________________
> > From: Mark Yacoub <markyacoub@chromium.org>
> > Sent: Monday, September 27, 2021 1:21 PM
> > To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
> > Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedeskt=
op.org>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Si=
queira@amd.com>
> > Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-t=
oo-big
> >
> > On Mon, Sep 27, 2021 at 12:07 PM Aurabindo Pillai
> > <aurabindo.pillai@amd.com> wrote:
> > >
> > > [Why]
> > > The rationale of the test does not hold true for AMD hardware. The
> > > aperture size calculation has an upper bound check which is done thro=
ugh
> > > i915 specific IOCTL. Hence this part of subtest must be moved
> > > out of the platform agnostic tests. Moreover, AMD hardware
> > > supports buffers larger than aperture size.
> > >
> > > [How]
> > > Skip the bo-too-big subtest unless its run on i915 as the test fails =
on
> > > AMD, VKMS and VC4
> > >
> > > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > > ---
> > >  tests/kms_flip.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > > index 54137871..20112de1 100755
> > > --- a/tests/kms_flip.c
> > > +++ b/tests/kms_flip.c
> > > @@ -1290,6 +1290,7 @@ static void __run_test_on_crtc_set(struct test_=
output *o, int *crtc_idxs,
> > >         /* 256 MB is usually the maximum mappable aperture,
> > >          * (make it 4x times that to ensure failure) */
> > >         if (o->flags & TEST_BO_TOOBIG) {
> > There is also another place where TEST_BO_TOOBIG is used, should we
> > skip this one as well or it's only this part?
> > > +               igt_skip_on(!is_i915_device(drm_fd));
> > >                 bo_size =3D 4*gem_mappable_aperture_size(drm_fd);
> > >                 igt_require(bo_size < gem_global_aperture_size(drm_fd=
));
> > >         }
> > > --
> > > 2.30.2
> > >

--_000_DM4PR12MB52958E8DC8ED99397D2176D78BA79DM4PR12MB5295namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Sure, that makes sense. Will send a v2<br>
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt;" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Mark Yacoub &lt;mar=
kyacoub@chromium.org&gt;<br>
<b>Sent:</b> Monday, September 27, 2021 3:12 PM<br>
<b>To:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;<br>
<b>Cc:</b> Development mailing list for IGT GPU Tools &lt;igt-dev@lists.fre=
edesktop.org&gt;; Mark Yacoub &lt;markyacoub@google.com&gt;; Siqueira, Rodr=
igo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest b=
o-too-big</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">I'm not 100% sure but personally if I'm running th=
e test on an AMD<br>
device, I don't really care about seeing a subtest that I'm not<br>
interested in.<br>
<br>
On Mon, Sep 27, 2021 at 3:10 PM Pillai, Aurabindo<br>
&lt;Aurabindo.Pillai@amd.com&gt; wrote:<br>
&gt;<br>
&gt; [AMD Official Use Only]<br>
&gt;<br>
&gt;<br>
&gt; Skipping using the continue statement has the side effect of this subt=
est being absent from the list of subtests, when running the test executabl=
e with paramter --list-subtest. Is that okay ?<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Regards,<br>
&gt; Jay<br>
&gt; ________________________________<br>
&gt; From: Mark Yacoub &lt;markyacoub@chromium.org&gt;<br>
&gt; Sent: Monday, September 27, 2021 1:34 PM<br>
&gt; To: Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;<br>
&gt; Cc: Development mailing list for IGT GPU Tools &lt;igt-dev@lists.freed=
esktop.org&gt;; Mark Yacoub &lt;markyacoub@google.com&gt;; Siqueira, Rodrig=
o &lt;Rodrigo.Siqueira@amd.com&gt;<br>
&gt; Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-=
too-big<br>
&gt;<br>
&gt; so for the sake of consistency, I'm wondering if we can skip the test<=
br>
&gt; the same way we skip other tests such as<br>
&gt; ```<br>
&gt; if (tests[i].flags &amp; TEST_NO_2X_OUTPUT)<br>
&gt; continue;<br>
&gt; ```<br>
&gt; because we're not failing a certain condition but a whole test, it<br>
&gt; might be better not to run the test in the first place unless it's<br>
&gt; intel.<br>
&gt; So in both main loops that call run_test we can do if<br>
&gt; if (tests[i].flags &amp; TEST_BO_TOOBIG &amp;&amp; !intel)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; this way we're not too worried where the flag would be used across the=
<br>
&gt; test and not skip halfway through a test.<br>
&gt;<br>
&gt; On Mon, Sep 27, 2021 at 1:28 PM Pillai, Aurabindo<br>
&gt; &lt;Aurabindo.Pillai@amd.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; [AMD Official Use Only]<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hi Mark,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Both bo-too-big and bo-too-big-interruptible shall be skipped wit=
h this patch. The other location where TEST_BO_TOOBIG is mentioned is in th=
e same function.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Jay<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Mark Yacoub &lt;markyacoub@chromium.org&gt;<br>
&gt; &gt; Sent: Monday, September 27, 2021 1:21 PM<br>
&gt; &gt; To: Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;<br>
&gt; &gt; Cc: Development mailing list for IGT GPU Tools &lt;igt-dev@lists.=
freedesktop.org&gt;; Mark Yacoub &lt;markyacoub@google.com&gt;; Siqueira, R=
odrigo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
&gt; &gt; Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtes=
t bo-too-big<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Sep 27, 2021 at 12:07 PM Aurabindo Pillai<br>
&gt; &gt; &lt;aurabindo.pillai@amd.com&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [Why]<br>
&gt; &gt; &gt; The rationale of the test does not hold true for AMD hardwar=
e. The<br>
&gt; &gt; &gt; aperture size calculation has an upper bound check which is =
done through<br>
&gt; &gt; &gt; i915 specific IOCTL. Hence this part of subtest must be move=
d<br>
&gt; &gt; &gt; out of the platform agnostic tests. Moreover, AMD hardware<b=
r>
&gt; &gt; &gt; supports buffers larger than aperture size.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [How]<br>
&gt; &gt; &gt; Skip the bo-too-big subtest unless its run on i915 as the te=
st fails on<br>
&gt; &gt; &gt; AMD, VKMS and VC4<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com=
&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;&nbsp; tests/kms_flip.c | 1 +<br>
&gt; &gt; &gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/tests/kms_flip.c b/tests/kms_flip.c<br>
&gt; &gt; &gt; index 54137871..20112de1 100755<br>
&gt; &gt; &gt; --- a/tests/kms_flip.c<br>
&gt; &gt; &gt; +++ b/tests/kms_flip.c<br>
&gt; &gt; &gt; @@ -1290,6 +1290,7 @@ static void __run_test_on_crtc_set(str=
uct test_output *o, int *crtc_idxs,<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 256 MB is=
 usually the maximum mappable aperture,<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (mak=
e it 4x times that to ensure failure) */<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (o-&gt;fl=
ags &amp; TEST_BO_TOOBIG) {<br>
&gt; &gt; There is also another place where TEST_BO_TOOBIG is used, should =
we<br>
&gt; &gt; skip this one as well or it's only this part?<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on(!is_i915_device(drm_fd));<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_size =3D 4*gem_mappable_aperture_siz=
e(drm_fd);<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(bo_size &lt; gem_global_ape=
rture_size(drm_fd));<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.30.2<br>
&gt; &gt; &gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB52958E8DC8ED99397D2176D78BA79DM4PR12MB5295namp_--
