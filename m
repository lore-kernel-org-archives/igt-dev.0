Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3594E10E478
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 16:29:32 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 6 Jul 2023 16:26:48 +0000
Message-ID: <MW3PR11MB474836AF10DF12705295A5CAAE2CA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230705085259.533791-1-himal.prasad.ghimiray@intel.com>
 <MW3PR11MB4748F65AD46E1489A180EBD8AE2FA@MW3PR11MB4748.namprd11.prod.outlook.com>
 <MW4PR11MB7056A287FB83A09C384516FBB32FA@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056A287FB83A09C384516FBB32FA@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 0/4] Handle GT and tile seperation in
 IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: 05 July 2023 14:48
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: RE: [igt-dev] [PATCH i-g-t v5 0/4] Handle GT and tile seperation=
 in IGT
>=20
> Hi Rahul,
>=20
> > -----Original Message-----
> > From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> > Sent: 05 July 2023 14:44
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Subject: RE: [igt-dev] [PATCH i-g-t v5 0/4] Handle GT and tile
> > seperation in IGT
> >
> > Hi @Himal Prasad Ghimiray,
> >
> > The change in GT sysfs path may regress the tests using "xe_force_gt_re=
set()"
> > IGT lib function.
>=20
> Xe_force_gt_reset uses debugfs force_reset. As of now debugfs entries are=
 not
> moved under tiles.
Thanks for the clarification.

-Rahul
>=20
> BR
> Himal
> > pls address this in this patch itself.
> >
> > Thanks,
> > Rahul
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Himal Prasad Ghimiray
> > > Sent: 05 July 2023 14:23
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Subject: [igt-dev] [PATCH i-g-t v5 0/4] Handle GT and tile
> > > seperation in IGT
> > >
> > > With seperation of GT and tiles in KMD, we will have sysfs entries
> > > for properties associated with tile and gtX sysfs parent will be
> > > moving under tileX. This series provides helper functions for
> > > accessing tile associated sysfs entries and gt specific sysfs under r=
espective
> tile.
> > >
> > > series addresses gt related sysfs path change for xe_guc_pc.c test
> > > case and introduces new test to verify addr_range for each vram.
> > >
> > > Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Cc: Upadhyay <tejas.upadhyay@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com>
> > >
> > > Himal Prasad Ghimiray (4):
> > >   lib/igt_sysfs: Add support to query number of tiles
> > >   lib/igt_sysfs: Handling gt related sysfs uapi changes
> > >   tests/xe/xe_guc_pc: Change the sysfs paths
> > >   tests/xe/xe_sysfs_tile_prop: adds new test to verify per tile vram
> > >     addr_range
> > >
> > >  lib/igt_sysfs.c               | 71 +++++++++++++++++++++++++++++++++=
++
> > >  lib/igt_sysfs.h               |  8 ++++
> > >  tests/meson.build             |  1 +
> > >  tests/xe/xe_guc_pc.c          | 14 ++++++-
> > >  tests/xe/xe_sysfs_tile_prop.c | 63 +++++++++++++++++++++++++++++++
> > >  5 files changed, 155 insertions(+), 2 deletions(-)  create mode
> > > 100644 tests/xe/xe_sysfs_tile_prop.c
> > >
> > > --
> > > 2.25.1
