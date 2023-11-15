Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC23F10E508
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 09:01:39 +0000 (UTC)
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 15 Nov 2023 09:01:29 +0000
Message-ID: <DM8PR11MB5655516EF2C36B9C7004EC4EE0B1A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20231113081930.1189688-1-bhanuprakash.modem@intel.com>
 <20231113081930.1189688-5-bhanuprakash.modem@intel.com>
 <ZVSCl4gsegbhcQnu@intel.com>
 <DM8PR11MB5655207005EC9127C6DFAF4CE0B1A@DM8PR11MB5655.namprd11.prod.outlook.com>
 <DM8PR11MB5655508A5C4A5AA2C143BBB0E0B1A@DM8PR11MB5655.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5655508A5C4A5AA2C143BBB0E0B1A@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi,=20
> -----Original Message-----
> From: Saarinen, Jani
> Sent: Wednesday, November 15, 2023 10:56 AM
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Modem, Bhanuprakas=
h
> <Bhanuprakash.Modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: RE: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner checks
>=20
> Hi,
> > -----Original Message-----
> > From: Saarinen, Jani
> > Sent: Wednesday, November 15, 2023 10:47 AM
> > To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Modem, Bhanuprak=
ash
> > <Bhanuprakash.Modem@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: RE: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner
> > checks
> >
> > Hi,
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org
> > > <mailto:igt-dev-bounces@lists.freedesktop.org> > On Behalf Of Ville
> > > Syrj=E4l=E4
> > > Sent: Wednesday, November 15, 2023 10:35 AM
> > > To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com
> > > <mailto:bhanuprakash.modem@intel.com> >
> > > Cc: igt-dev@lists.freedesktop.org
> > > <mailto:igt-dev@lists.freedesktop.org>
> > > Subject: Re: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner
> > > checks
> > >
> > > On Mon, Nov 13, 2023 at 01:49:29PM +0530, Bhanuprakash Modem wrote:
> > > > Bigjoiner will come in the picture when the resolution > 5K or
> > > > clock
> > > > > max dot-clock. Add a support to check the selected mode clock is
> > > > greater than the max dot-clock.
> > > >
> > > > V2: - Limit the bigjoiner checks to intel hardware
> > > >
> > > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com
> > > > <mailto:bhanuprakash.modem@intel.com> >
> > > > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com
> > > > <mailto:ankit.k.nautiyal@intel.com> >
> > > > ---
> > > >  tests/kms_flip.c | 18 +++++++++++-------
> > > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/tests/kms_flip.c b/tests/kms_flip.c index
> > > > fc7cee050..d34596599 100755
> > > > --- a/tests/kms_flip.c
> > > > +++ b/tests/kms_flip.c
> > > <snip>
> > > > @@ -2136,6 +2139,7 @@ igt_main_args("e", NULL, help_str,
> > > > opt_handler,
> > > NULL)
> > > >  			for (i =3D 0; i < sizeof(tests) / sizeof(tests[0]); i++)
> > > >  				tests[i].flags &=3D ~(TEST_CHECK_TS |
> > > TEST_VBLANK_EXPIRED_SEQ);
> > > >  		}
> > > > +		max_dotclock =3D igt_get_max_dotclock(drm_fd);
> > >
> > > That seems to have broken the test for !display platforms (bat-atsm-1=
).
> > We were just trying to figure out what has happened on
> > https://intel-gfx-
> > <https://intel-gfx-ci.01.org/tree/drm-tip/bat-atsm-1.html>
> > ci.01.org/tree/drm-tip/bat-atsm-1.html as was also visible on Linux
> > next https://intel-gfx-ci.01.org/tree/linux-next/bat-atsm-1.html .
> >
> > But thanks Ville commenting that this is about IGT.
> Indeed IGT changed between skip and fail (bolded) 328c5873b
This was with Linux-next actually and on BAT this was for IGT's
f7ae24e64 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED | WAIT=
_AVAILABLE =3D=3D=3D(IGT_7585)=3D=3D=3D
^^^new
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
^^ old

> tests/intel/xe_exec_queue_property: Negative tests for get exec_queue pro=
perty
> ioctl =3D=3D=3D(IGT_7588)=3D=3D=3D
>=20
> bec435c24 tests/intel/kms_dsc: remove redundant documentation
> =3D=3D=3D(IGT_7587)=3D=3D=3D 37c3d2d4c tests/intel/kms_dsc: add test to v=
alidate fractional
> bpp with input bpc a83d0d03c tests/intel/kms_dsc: enable validation for v=
dsc
> fractional bpp
> 40bb84ee2 lib/dsc: add helpers for vdsc fractional bpp debugfs entry
> d99e8f119 lib/dsc: fix documentation style
>=20
> c422858f8 tests/xe_evict_ccs: Disable compression on platforms without fl=
atccs
> =3D=3D=3D(IGT_7586)=3D=3D=3D
>=20
> f7ae24e64 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED |
> WAIT_AVAILABLE =3D=3D=3D(IGT_7585)=3D=3D=3D
> 8c244b802 tests/kms_setmode: Fix Bigjoiner checks
> 3d5cd7d99 tests/kms_flip: Fix Bigjoiner checks
> a6ca34472 tests/i915/kms_big_joiner: Fix Bigjoiner checks 9d45e7aae
> lib/igt_kms: s/is_i915_device/is_intel_device
> 53d1677a8 tests:
> s/i915_pipe_output_combo_valid/intel_pipe_output_combo_valid/
>=20
> 30e6ded90 Revert "syncobj_timeline: don't expect EINVAL for
> WAIT_UNSUBMITTED, | WAIT_AVAILABLE" =3D=3D=3D(IGT_7584)=3D=3D=3D
> f6f590334 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, |
> WAIT_AVAILABLE
>=20
> NO git-log.txt =3D=3D=3D(IGT_7583)=3D=3D=3D
>=20
> 453b9df12 tests/intel/xe_exec_queue_property: Add scheduler exec queue se=
t
> property =3D=3D=3D(IGT_7582)=3D=3D=3D 60f199d7b tests/intel/xe_exec_queue=
_property: Add
> exec queue set property tests
> 897748a32 tests/intel/xe_waitfence: Add invalid-engine subtest
> =3D=3D=3D(IGT_7581)=3D=3D=3D
> >
> >
> > >
> > > >  	}
> > > >
> > > >  	igt_describe("Tests that nonblocking reading fails correctly");
> > > > --
> > > > 2.40.0
> > >
> > > --
> > > Ville Syrj=E4l=E4
> > > Intel
