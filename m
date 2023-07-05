Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEFD10E33E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 09:18:29 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 5 Jul 2023 09:18:22 +0000
Message-ID: <MW4PR11MB7056A287FB83A09C384516FBB32FA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230705085259.533791-1-himal.prasad.ghimiray@intel.com>
 <MW3PR11MB4748F65AD46E1489A180EBD8AE2FA@MW3PR11MB4748.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4748F65AD46E1489A180EBD8AE2FA@MW3PR11MB4748.namprd11.prod.outlook.com>
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

Hi Rahul,

> -----Original Message-----
> From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Sent: 05 July 2023 14:44
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: RE: [igt-dev] [PATCH i-g-t v5 0/4] Handle GT and tile seperation=
 in IGT
>=20
> Hi @Himal Prasad Ghimiray,
>=20
> The change in GT sysfs path may regress the tests using "xe_force_gt_rese=
t()"
> IGT lib function.

Xe_force_gt_reset uses debugfs force_reset. As of now debugfs entries are n=
ot moved under tiles.

BR
Himal=20
> pls address this in this patch itself.
>=20
> Thanks,
> Rahul
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Himal Prasad Ghimiray
> > Sent: 05 July 2023 14:23
> > To: igt-dev@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Subject: [igt-dev] [PATCH i-g-t v5 0/4] Handle GT and tile seperation
> > in IGT
> >
> > With seperation of GT and tiles in KMD, we will have sysfs entries for
> > properties associated with tile and gtX sysfs parent will be moving
> > under tileX. This series provides helper functions for accessing tile
> > associated sysfs entries and gt specific sysfs under respective tile.
> >
> > series addresses gt related sysfs path change for xe_guc_pc.c test
> > case and introduces new test to verify addr_range for each vram.
> >
> > Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >
> > Himal Prasad Ghimiray (4):
> >   lib/igt_sysfs: Add support to query number of tiles
> >   lib/igt_sysfs: Handling gt related sysfs uapi changes
> >   tests/xe/xe_guc_pc: Change the sysfs paths
> >   tests/xe/xe_sysfs_tile_prop: adds new test to verify per tile vram
> >     addr_range
> >
> >  lib/igt_sysfs.c               | 71 +++++++++++++++++++++++++++++++++++
> >  lib/igt_sysfs.h               |  8 ++++
> >  tests/meson.build             |  1 +
> >  tests/xe/xe_guc_pc.c          | 14 ++++++-
> >  tests/xe/xe_sysfs_tile_prop.c | 63 +++++++++++++++++++++++++++++++
> >  5 files changed, 155 insertions(+), 2 deletions(-)  create mode
> > 100644 tests/xe/xe_sysfs_tile_prop.c
> >
> > --
> > 2.25.1
