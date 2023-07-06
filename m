Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB4310E3D4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 03:18:42 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Date: Thu, 6 Jul 2023 03:18:38 +0000
Message-ID: <MW4PR11MB7056C3296558E98BF54DF76CB32CA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230705131853.545449-1-himal.prasad.ghimiray@intel.com>
 <20230705131853.545449-3-himal.prasad.ghimiray@intel.com>
 <87r0pldhcs.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87r0pldhcs.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 2/4] lib/igt_sysfs: Handling gt
 related sysfs uapi changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 06 July 2023 05:47
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH i-g-t v6 2/4] lib/igt_sysfs: Handling gt related sysf=
s uapi
> changes
>=20
> On Wed, 05 Jul 2023 06:18:51 -0700, Himal Prasad Ghimiray wrote:
> >
> > Patch https://patchwork.freedesktop.org/series/118927/
> > is moving gt sysfs parent under tile folder.
> >
> > With the above patch path for sysfs changes:
> > from: /sys/class/drm/cardX/device/gtN/ to :
> > /sys/class/drm/cardX/device/tileN/gtN
> >
> > Adding xe_gt_sysfs_path function to access new path.
> >
> > v2:
> > - Calculate number of tiles once within iterator. (Rahul)
> >
> > v3:
> > - Drop usage of local variable for tilecount.
> > - Change order of tile and gt. (Ashutosh)
> >
> > v4:
> > - Drop xe_for_each_gt_under_each_tile macro
> >   add xe_gt_sysfs_path to return path. (Ashutosh)
> > - Support older dir path along with new. (kamil)
> >
> > v5:
> > - Initialize the variable and use for loop instead of while.
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  lib/igt_sysfs.c | 40 ++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_sysfs.h |  1 +
> >  2 files changed, 41 insertions(+)
> >
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index
> > 2ea9eb1b9..32d78cfb6 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -46,6 +46,7 @@
> >  #include "igt_device.h"
> >  #include "igt_io.h"
> >
> > +#define XE_MAX_GT_SYSFS_PATH 3
> >  /**
> >   * SECTION:igt_sysfs
> >   * @short_description: Support code for sysfs features  @@ -933,3
> >+934,42 @@ void igt_sysfs_engines(int xe, int engines, const char
> **property,
> >		close(engine_fd);
> >	}
> >  }
> > +
> > +/**
> > + * xe_gt_sysfs_path::
> > + * @sysfs: fd of sysfs
> > + * @gt_id: gt id
> > + *
> > + * This function returns the path for gtX directory  */ char
> > +*xe_gt_sysfs_path(int sysfs, int gt_id) {
> > +	char path[XE_MAX_GT_SYSFS_PATH][32];
> > +	struct stat gtpathstat;
> > +	char *gt_path;
> > +	int i;
> > +
> > +	/* Path for multitile platforms with single gt on each tile
> > +	 * Tile id will be same as gt id.
> > +	 */
> > +	snprintf(path[0], sizeof(path[0]), "device/tile%d/gt%d/", gt_id,
> > +gt_id);
> > +
> > +	/* Path for single tile platforms with multiple gt's
> > +	 * all gt's will be under tile0 eg: MTL.
> > +	 */
> > +	snprintf(path[1], sizeof(path[1]), "device/tile0/gt%d/", gt_id);
> > +
> > +	/* Path not under tile.
> > +	 * To support older dir structure.
> > +	 */
> > +	snprintf(path[2], sizeof(path[2]), "device/gt%d/", gt_id);
>=20
> Is this needed now? If not I'd say get rid of it.
@Kamil Konieczny to comment on this. He recommended to support old dir stru=
cture.
>=20
> > +
> > +	for (i =3D 0; i < XE_MAX_GT_SYSFS_PATH; i++) {
> > +		if (!fstatat(sysfs, path[i], &gtpathstat, 0) &&
> S_ISDIR(gtpathstat.st_mode)) {
> > +			gt_path =3D malloc(sizeof(path[i]));
> > +			strcpy(gt_path, path[i]);
> > +			return gt_path;
> > +		}
> > +	}
> > +	igt_assert_f(false, "No gt%d dir found in sysfs", gt_id); }
>=20
> I prefer this: start with tile0, look for all gt%d under under tile0 and =
see if gtN
> is there, repeat for next tile, till we have gone over all tiles. This wi=
ll work
> always whereas the code above breaks as soon as we have a platform which
> has say: tile0/gt0, tile0/gt1, tile1/gt2.
Sure. Will address.
>=20
> Since we are doing the work, with just a little extra work, do a good job=
 of it.
>=20
> Thanks.
> --
> Ashutosh
>=20
>=20
>=20
>=20
>=20
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index
> > c31765542..a937ee7b5 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -153,6 +153,7 @@ typedef struct igt_sysfs_rw_attr {  }
> > igt_sysfs_rw_attr_t;
> >
> >  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
> > +char *xe_gt_sysfs_path(int sysfs, int gt_id);
> >
> >  void igt_sysfs_engines(int xe, int engines, const char **property,
> >		       void (*test)(int, int, const char **));
> > --
> > 2.25.1
> >
