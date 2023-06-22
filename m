Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE24F10E54F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 11:58:45 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Kumar, Janga
 Rahul" <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 22 Jun 2023 11:58:40 +0000
Message-ID: <SJ1PR11MB6204B860249C023BF4DA1ACF8122A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
 <MW3PR11MB4748389214D298270D692A11AE5DA@MW3PR11MB4748.namprd11.prod.outlook.com>
 <MW4PR11MB70560639D51086BAC68BA398B322A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB70560639D51086BAC68BA398B322A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 0/4] Handle GT and tile seperation in IGT.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Thursday, June 22, 2023 10:46 AM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: RE: [igt-dev] [PATCH 0/4] Handle GT and tile seperation in IGT.
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> > Sent: 21 June 2023 14:31
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Subject: RE: [igt-dev] [PATCH 0/4] Handle GT and tile seperation in IGT=
.
> >
> >
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Himal Prasad Ghimiray
> > > Sent: 13 June 2023 19:07
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Subject: [igt-dev] [PATCH 0/4] Handle GT and tile seperation in IGT.
> > please do not put dot at the end of subject:
> Sure. Will address.
> > >
> > > With seperation of GT and tiles in KMD, we will have sysfs entries
> > > for properties associated with tile and gtX sysfs parent will be
> > > moving under tileX. This series provides helper functions for
> > > accessing tile associated sysfs entries and gt specific sysfs under
> respective tile.
> > >
> > > series addresses gt related sysfs path change for xe_guc_pc.c test
> > > case and introduces new test to verify addr_range for each vram.
> > >
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Cc: Upadhyay <tejas.upadhyay@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com>
> > >
> > > Himal Prasad Ghimiray (4):
> > >   lib/igt_sysfs: Add support to query number of tiles.
> > >   lib/igt_sysfs: Handling gt related sysfs uapi changes.
> > >   test/xe_guc_pc: Change the sysfs paths.
> > >   tests/xe/xe_tile_prop: adds new test to verify per tile vram
> > >     addr_range

Not able to get patch somehow in my outlook. But for above patch, size repo=
rted now in bytes(earlier it was hex) and sysfs entry name has been changed=
 see https://patchwork.freedesktop.org/series/118927/. Please see changes a=
ccordingly.

Thanks,
Tejas

> > >
> > >  lib/igt_sysfs.c         |  28 ++++++
> > >  lib/igt_sysfs.h         |  11 +++
> > >  tests/meson.build       |   1 +
> > >  tests/xe/xe_guc_pc.c    | 199 ++++++++++++++++++++------------------=
--
> > >  tests/xe/xe_tile_prop.c |  66 +++++++++++++
> > >  5 files changed, 206 insertions(+), 99 deletions(-)  create mode
> > > 100644 tests/xe/xe_tile_prop.c
> > >
> > > --
> > > 2.25.1
