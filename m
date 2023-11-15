Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7738910E507
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 08:55:54 +0000 (UTC)
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 15 Nov 2023 08:55:44 +0000
Message-ID: <DM8PR11MB5655508A5C4A5AA2C143BBB0E0B1A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20231113081930.1189688-1-bhanuprakash.modem@intel.com>
 <20231113081930.1189688-5-bhanuprakash.modem@intel.com>
 <ZVSCl4gsegbhcQnu@intel.com>
 <DM8PR11MB5655207005EC9127C6DFAF4CE0B1A@DM8PR11MB5655.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5655207005EC9127C6DFAF4CE0B1A@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM8PR11MB5655508A5C4A5AA2C143BBB0E0B1ADM8PR11MB5655namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner checks
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

--_000_DM8PR11MB5655508A5C4A5AA2C143BBB0E0B1ADM8PR11MB5655namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
> -----Original Message-----
> From: Saarinen, Jani
> Sent: Wednesday, November 15, 2023 10:47 AM
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Modem, Bhanuprakas=
h
> <Bhanuprakash.Modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: RE: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner checks
>
> Hi,
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org<mailto:igt-dev-bou=
nces@lists.freedesktop.org>> On Behalf Of
> > Ville Syrj=E4l=E4
> > Sent: Wednesday, November 15, 2023 10:35 AM
> > To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com<mailto:bhanupraka=
sh.modem@intel.com>>
> > Cc: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>
> > Subject: Re: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner
> > checks
> >
> > On Mon, Nov 13, 2023 at 01:49:29PM +0530, Bhanuprakash Modem wrote:
> > > Bigjoiner will come in the picture when the resolution > 5K or clock
> > > > max dot-clock. Add a support to check the selected mode clock is
> > > greater than the max dot-clock.
> > >
> > > V2: - Limit the bigjoiner checks to intel hardware
> > >
> > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com<mailt=
o:bhanuprakash.modem@intel.com>>
> > > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com<mailto:ankit.=
k.nautiyal@intel.com>>
> > > ---
> > >  tests/kms_flip.c | 18 +++++++++++-------
> > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/tests/kms_flip.c b/tests/kms_flip.c index
> > > fc7cee050..d34596599 100755
> > > --- a/tests/kms_flip.c
> > > +++ b/tests/kms_flip.c
> > <snip>
> > > @@ -2136,6 +2139,7 @@ igt_main_args("e", NULL, help_str,
> > > opt_handler,
> > NULL)
> > >                   for (i =3D 0; i < sizeof(tests) / sizeof(tests[0]);=
 i++)
> > >                           tests[i].flags &=3D ~(TEST_CHECK_TS |
> > TEST_VBLANK_EXPIRED_SEQ);
> > >           }
> > > +         max_dotclock =3D igt_get_max_dotclock(drm_fd);
> >
> > That seems to have broken the test for !display platforms (bat-atsm-1).
> We were just trying to figure out what has happened on  https://intel-gfx=
-<https://intel-gfx-ci.01.org/tree/drm-tip/bat-atsm-1.html>
> ci.01.org/tree/drm-tip/bat-atsm-1.html as was also visible on Linux next
> https://intel-gfx-ci.01.org/tree/linux-next/bat-atsm-1.html .
>
> But thanks Ville commenting that this is about IGT.
Indeed IGT changed between skip and fail (bolded)
328c5873b tests/intel/xe_exec_queue_property: Negative tests for get exec_q=
ueue property ioctl =3D=3D=3D(IGT_7588)=3D=3D=3D

bec435c24 tests/intel/kms_dsc: remove redundant documentation =3D=3D=3D(IGT=
_7587)=3D=3D=3D
37c3d2d4c tests/intel/kms_dsc: add test to validate fractional bpp with inp=
ut bpc
a83d0d03c tests/intel/kms_dsc: enable validation for vdsc fractional bpp
40bb84ee2 lib/dsc: add helpers for vdsc fractional bpp debugfs entry
d99e8f119 lib/dsc: fix documentation style

c422858f8 tests/xe_evict_ccs: Disable compression on platforms without flat=
ccs =3D=3D=3D(IGT_7586)=3D=3D=3D

f7ae24e64 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED | WAIT=
_AVAILABLE =3D=3D=3D(IGT_7585)=3D=3D=3D
8c244b802 tests/kms_setmode: Fix Bigjoiner checks
3d5cd7d99 tests/kms_flip: Fix Bigjoiner checks
a6ca34472 tests/i915/kms_big_joiner: Fix Bigjoiner checks
9d45e7aae lib/igt_kms: s/is_i915_device/is_intel_device
53d1677a8 tests: s/i915_pipe_output_combo_valid/intel_pipe_output_combo_val=
id/

30e6ded90 Revert "syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTE=
D, | WAIT_AVAILABLE" =3D=3D=3D(IGT_7584)=3D=3D=3D
f6f590334 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, | WAI=
T_AVAILABLE

NO git-log.txt =3D=3D=3D(IGT_7583)=3D=3D=3D

453b9df12 tests/intel/xe_exec_queue_property: Add scheduler exec queue set =
property =3D=3D=3D(IGT_7582)=3D=3D=3D
60f199d7b tests/intel/xe_exec_queue_property: Add exec queue set property t=
ests
897748a32 tests/intel/xe_waitfence: Add invalid-engine subtest =3D=3D=3D(IG=
T_7581)=3D=3D=3D
>
>
> >
> > >   }
> > >
> > >   igt_describe("Tests that nonblocking reading fails correctly");
> > > --
> > > 2.40.0
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel


--_000_DM8PR11MB5655508A5C4A5AA2C143BBB0E0B1ADM8PR11MB5655namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Hi, <a name=3D"_MailEndCompose"></a></div>
<div>&gt; -----Original Message-----</div>
<div>&gt; From: Saarinen, Jani</div>
<div>&gt; Sent: Wednesday, November 15, 2023 10:47 AM</div>
<div>&gt; To: Ville Syrj=E4l=E4 &lt;ville.syrjala@linux.intel.com&gt;; Mode=
m, Bhanuprakash</div>
<div>&gt; &lt;Bhanuprakash.Modem@intel.com&gt;</div>
<div>&gt; Cc: igt-dev@lists.freedesktop.org</div>
<div>&gt; Subject: RE: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner =
checks</div>
<div>&gt; </div>
<div>&gt; Hi,</div>
<div>&gt; &gt; -----Original Message-----</div>
<div>&gt; &gt; From: igt-dev &lt;<a href=3D"mailto:igt-dev-bounces@lists.fr=
eedesktop.org">igt-dev-bounces@lists.freedesktop.org</a>&gt; On Behalf Of</=
div>
<div>&gt; &gt; Ville Syrj=E4l=E4</div>
<div>&gt; &gt; Sent: Wednesday, November 15, 2023 10:35 AM</div>
<div>&gt; &gt; To: Modem, Bhanuprakash &lt;<a href=3D"mailto:bhanuprakash.m=
odem@intel.com">bhanuprakash.modem@intel.com</a>&gt;</div>
<div>&gt; &gt; Cc: <a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev=
@lists.freedesktop.org</a></div>
<div>&gt; &gt; Subject: Re: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjo=
iner</div>
<div>&gt; &gt; checks</div>
<div>&gt; &gt;</div>
<div>&gt; &gt; On Mon, Nov 13, 2023 at 01:49:29PM +0530, Bhanuprakash Modem=
 wrote:</div>
<div>&gt; &gt; &gt; Bigjoiner will come in the picture when the resolution =
&gt; 5K or clock</div>
<div>&gt; &gt; &gt; &gt; max dot-clock. Add a support to check the selected=
 mode clock is</div>
<div>&gt; &gt; &gt; greater than the max dot-clock.</div>
<div>&gt; &gt; &gt;</div>
<div>&gt; &gt; &gt; V2: - Limit the bigjoiner checks to intel hardware</div=
>
<div>&gt; &gt; &gt;</div>
<div>&gt; &gt; &gt; Signed-off-by: Bhanuprakash Modem &lt;<a href=3D"mailto=
:bhanuprakash.modem@intel.com">bhanuprakash.modem@intel.com</a>&gt;</div>
<div>&gt; &gt; &gt; Reviewed-by: Ankit Nautiyal &lt;<a href=3D"mailto:ankit=
.k.nautiyal@intel.com">ankit.k.nautiyal@intel.com</a>&gt;</div>
<div>&gt; &gt; &gt; ---</div>
<div>&gt; &gt; &gt;&nbsp; tests/kms_flip.c | 18 +++++++++++-------</div>
<div>&gt; &gt; &gt;&nbsp; 1 file changed, 11 insertions(+), 7 deletions(-)<=
/div>
<div>&gt; &gt; &gt;</div>
<div>&gt; &gt; &gt; diff --git a/tests/kms_flip.c b/tests/kms_flip.c index<=
/div>
<div>&gt; &gt; &gt; fc7cee050..d34596599 100755</div>
<div>&gt; &gt; &gt; --- a/tests/kms_flip.c</div>
<div>&gt; &gt; &gt; +++ b/tests/kms_flip.c</div>
<div>&gt; &gt; &lt;snip&gt;</div>
<div>&gt; &gt; &gt; @@ -2136,6 +2139,7 @@ igt_main_args(&quot;e&quot;, NULL=
, help_str,</div>
<div>&gt; &gt; &gt; opt_handler,</div>
<div>&gt; &gt; NULL)</div>
<div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i =
&lt; sizeof(tests) / sizeof(tests[0]); i++)</div>
<div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tests[i].flags &amp;=3D ~(TEST_CHECK_TS |</=
div>
<div>&gt; &gt; TEST_VBLANK_EXPIRED_SEQ);</div>
<div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }</div>
<div>&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_d=
otclock =3D igt_get_max_dotclock(drm_fd);</div>
<div>&gt; &gt;</div>
<div>&gt; &gt; That seems to have broken the test for !display platforms (b=
at-atsm-1).</div>
<div>&gt; We were just trying to figure out what has happened on&nbsp; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/bat-atsm-1.html">https://in=
tel-gfx-</a></div>
<div>&gt; ci.01.org/tree/drm-tip/bat-atsm-1.html as was also visible on Lin=
ux next</div>
<div>&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/linux-next/bat-atsm-1=
.html">https://intel-gfx-ci.01.org/tree/linux-next/bat-atsm-1.html</a> .</d=
iv>
<div>&gt; </div>
<div>&gt; But thanks Ville commenting that this is about IGT.</div>
<div>Indeed IGT changed between skip and fail (bolded) </div>
<div><b>328c5873b</b> tests/intel/xe_exec_queue_property: Negative tests fo=
r get exec_queue property ioctl =3D=3D=3D(IGT_7588)=3D=3D=3D</div>
<div>&nbsp;</div>
<div>bec435c24 tests/intel/kms_dsc: remove redundant documentation =3D=3D=
=3D(IGT_7587)=3D=3D=3D</div>
<div>37c3d2d4c tests/intel/kms_dsc: add test to validate fractional bpp wit=
h input bpc</div>
<div>a83d0d03c tests/intel/kms_dsc: enable validation for vdsc fractional b=
pp</div>
<div>40bb84ee2 lib/dsc: add helpers for vdsc fractional bpp debugfs entry</=
div>
<div>d99e8f119 lib/dsc: fix documentation style</div>
<div>&nbsp;</div>
<div>c422858f8 tests/xe_evict_ccs: Disable compression on platforms without=
 flatccs =3D=3D=3D(IGT_7586)=3D=3D=3D</div>
<div>&nbsp;</div>
<div>f7ae24e64 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED |=
 WAIT_AVAILABLE =3D=3D=3D(IGT_7585)=3D=3D=3D</div>
<div>8c244b802 tests/kms_setmode: Fix Bigjoiner checks</div>
<div>3d5cd7d99 tests/kms_flip: Fix Bigjoiner checks</div>
<div>a6ca34472 tests/i915/kms_big_joiner: Fix Bigjoiner checks</div>
<div>9d45e7aae lib/igt_kms: s/is_i915_device/is_intel_device</div>
<div>53d1677a8 tests: s/i915_pipe_output_combo_valid/intel_pipe_output_comb=
o_valid/</div>
<div>&nbsp;</div>
<div>30e6ded90 Revert &quot;syncobj_timeline: don't expect EINVAL for WAIT_=
UNSUBMITTED, | WAIT_AVAILABLE&quot; =3D=3D=3D(IGT_7584)=3D=3D=3D</div>
<div>f6f590334 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, =
| WAIT_AVAILABLE</div>
<div>&nbsp;</div>
<div>NO git-log.txt =3D=3D=3D(IGT_7583)=3D=3D=3D</div>
<div>&nbsp;</div>
<div>453b9df12 tests/intel/xe_exec_queue_property: Add scheduler exec queue=
 set property =3D=3D=3D(IGT_7582)=3D=3D=3D</div>
<div>60f199d7b tests/intel/xe_exec_queue_property: Add exec queue set prope=
rty tests</div>
<div><b>897748a32</b> tests/intel/xe_waitfence: Add invalid-engine subtest =
=3D=3D=3D(IGT_7581)=3D=3D=3D</div>
<div>&gt; </div>
<div>&gt; </div>
<div>&gt; &gt;</div>
<div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; }</div>
<div>&gt; &gt; &gt;</div>
<div>&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests that nonbloc=
king reading fails correctly&quot;);</div>
<div>&gt; &gt; &gt; --</div>
<div>&gt; &gt; &gt; 2.40.0</div>
<div>&gt; &gt;</div>
<div>&gt; &gt; --</div>
<div>&gt; &gt; Ville Syrj=E4l=E4</div>
<div>&gt; &gt; Intel</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_DM8PR11MB5655508A5C4A5AA2C143BBB0E0B1ADM8PR11MB5655namp_--
