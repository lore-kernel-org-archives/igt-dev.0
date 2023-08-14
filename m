Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAF510E17F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 09:39:11 +0000 (UTC)
Date: Mon, 14 Aug 2023 11:39:07 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <20230814113907.6a990b1b@maurocar-mobl2>
In-Reply-To: <6de815ec-bb1c-b809-e469-b89604862929@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-17-bhanuprakash.modem@intel.com>
 <963feb81-6a1d-1535-c76b-af1f1947633d@intel.com>
 <0912f0c5-3eb3-b903-8342-88e927cbf8ed@intel.com>
 <6de815ec-bb1c-b809-e469-b89604862929@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [V5 i-g-t 16/81] tests/i915/kms_dsc: Document each
 subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 14 Aug 2023 10:34:52 +0530
"Sharma, Swati2" <swati2.sharma@intel.com> wrote:

> On 10-Aug-23 10:53 PM, Modem, Bhanuprakash wrote:
> > Hi Swati,
> >=20
> > On Wed-09-08-2023 01:20 pm, Sharma, Swati2 wrote: =20
> >> On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote: =20
> >>> Add documentation for all kms tests which is used by IGT testplan
> >>> documentation.
> >>>
> >>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >>> ---
> >>> =C2=A0 tests/i915/kms_dsc.c | 27 +++++++++++++++++++++++++++
> >>> =C2=A0 1 file changed, 27 insertions(+)
> >>>
> >>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> >>> index 0a3e29924..4cce7face 100644
> >>> --- a/tests/i915/kms_dsc.c
> >>> +++ b/tests/i915/kms_dsc.c
> >>> @@ -30,8 +30,35 @@
> >>> =C2=A0=C2=A0 *
> >>> =C2=A0=C2=A0 */
> >>> +/**
> >>> + * TEST: kms dsc
> >>> + * Category: Display
> >>> + * Description: Test to validate display stream compression
> >>> + */
> >>> =C2=A0 #include "kms_dsc_helper.h"
> >>> +/**
> >>> + * SUBTEST: dsc-%s
> >>> + * Description: Tests basic display stream compression functionality=
=20
> >>> if supported
> >>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 by a connector by forcing %arg[1] =20
> >>
> >> forcing DSC on all connectors that support it with %arg[1]
> >> (remove this from below subtests description) =20
> >=20
> > This description is adopted from igt_describe(), Feel free to update th=
e=20
> > subtest description I can pick it from there. =20
>=20
> But you haven't copied it as it is..right? Its the optimized version
> of igt_describe(). I simply meant.
> "forcing DSC on all connectors that support it with %arg[1]" =3D> is=20
> redundant in descriptions you have written below for each subtest.
> We don't have to change igt_describe() for this. This should be handled=20
> here.
>=20
> >  =20
> >> =20
> >>> + * Driver requirement: any =20
> >>
> >> This is intel specific test. =20
> >=20
> > Yes. As this kms testplan is designed for Intel, the allowed values are:
> >=20
> > i915: supports i915 driver only
> > xe: supports xe driver only
> > any: supports both i915 & xe =20
>=20
> This ANY seems to correspond to drm_open_driver_master(DRIVER_ANY).
> IDK this is right. @mauro do you have any inputs here?
> Shouldn't "any" correspond to "any" driver. Even if this documentation
> is specific to intel but tests outside i915/ directory are used by other
> vendors too.

IMO, the best here is to provide a list of drivers that support the test,
e. g.:

	Driver requirement: i915, xe

Rationale:

- It lets it clear that only Intel drivers are supported;
- It is clear what drivers support it;
- There's no need to document somewhere what "any" means;
- If in the future we have a new XYZ driver that it is not supported
  by this test, there won't be any need to change existing documentation;
- We already use comma-separated lists for other fields, like feature
  (used on some core tests and at i915 driver).

Regards,
Mauro
