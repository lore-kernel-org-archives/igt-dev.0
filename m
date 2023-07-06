Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F13F10E3D6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 03:17:33 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Thu, 6 Jul 2023 03:17:29 +0000
Message-ID: <MW4PR11MB705620BF4121EEE3CF7A182FB32CA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230705131853.545449-1-himal.prasad.ghimiray@intel.com>
 <20230705131853.545449-2-himal.prasad.ghimiray@intel.com>
 <87o7kpdcf6.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87o7kpdcf6.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/4] lib/igt_sysfs: Add support to
 query number of tiles
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Upadhyay,
 Tejas" <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 06 July 2023 07:33
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: Re: [PATCH i-g-t v6 1/4] lib/igt_sysfs: Add support to query num=
ber
> of tiles
>=20
> On Wed, 05 Jul 2023 06:18:50 -0700, Himal Prasad Ghimiray wrote:
> >
>=20
> Hi Himal,
>=20
> > With tile and GT seperation in KMD, we need to know number of tiles
> > supported by platform.
> > We will need to access tile associated properties from IGT.
> > Hence adding iterator for all supported tiles.
> >
> > v2:
> > - Calculate number of tiles once within iterator. (Rahul)
> > - Use snprintf instead of sprintf.
> >
> > v3:
> > - Remove unrequired for_each_sysfs_tile_dirfd (Ashutosh)
> >
> > Reviewed-by: Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  lib/igt_sysfs.c | 30 ++++++++++++++++++++++++++++++  lib/igt_sysfs.h
> > |  7 +++++++
> >  2 files changed, 37 insertions(+)
> >
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index
> > 0876f4c6b..2ea9eb1b9 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -287,6 +287,36 @@ int igt_sysfs_get_num_gt(int device)
> >	return num_gts;
> >  }
> >
> > +/**
> > + * igt_sysfs_get_num_tiles:
> > + * @device: fd of the device
> > + *
> > + * Reads number of tiles sysfs entries.
> > + * Asserts for at least one tile entry.
> > + *
> > + * Returns: Number of tiles.
> > + */
> > +int igt_sysfs_get_num_tiles(int device) {
> > +	int num_tiles;
> > +	char sysfs[48];
> > +	char tiledir[96];
> > +
> > +	num_tiles =3D 0;
> > +	if (!igt_sysfs_path(device, sysfs, sizeof(sysfs)))
> > +		return -1;
> > +
> > +	do {
> > +		igt_assert(snprintf(tiledir, sizeof(tiledir), "%s/device/tile%d",
> > +				    sysfs, num_tiles) < sizeof(tiledir));
> > +		num_tiles++;
> > +	} while (!access(tiledir, F_OK));
> > +
> > +	num_tiles--;
>=20
> This decrement is ugly. Can we get rid of it?
Will address this.
>=20
> I seriously think we should model these functions similar to
> igt_sysfs_gt_open, igt_sysfs_get_num_gt, igt_sysfs_gt_path,
> for_each_sysfs_gt_dirfd. So we could have xe_sysfs_tile_open,
> xe_sysfs_get_num_tile, xe_sysfs_tile_path, xe_for_each_sysfs_tile_dirfd e=
tc.
> This will cleanup patch 4 too.

Let me look into it.
>=20
> Thanks.
> --
> Ashutosh
>=20
> > +	igt_assert_f(num_tiles > 0, "No tiles sysfs entry is found.");
> > +	return num_tiles;
> > +}
> > +
> >  /**
> >   * igt_sysfs_write:
> >   * @dir: directory for the device from igt_sysfs_open() diff --git
> > a/lib/igt_sysfs.h b/lib/igt_sysfs.h index 5635fc690..c31765542 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -73,6 +73,12 @@
> >  #define igt_sysfs_rps_set_boolean(dir, id, value) \
> >	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
> >
> > +#define xe_for_each_tile(xe__, tile__, tile_cnt__) \
> > +	for (tile__ =3D 0, tile_cnt__ =3D igt_sysfs_get_num_tiles(xe__); \
> > +	     tile__ < tile_cnt__; \
> > +	     ++tile__)
> > +
> > +
> >  enum i915_attr_id {
> >	RPS_ACT_FREQ_MHZ,
> >	RPS_CUR_FREQ_MHZ,
> > @@ -97,6 +103,7 @@ int igt_sysfs_open(int device);
> >  char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
> >  int igt_sysfs_gt_open(int device, int gt);
> >  int igt_sysfs_get_num_gt(int device);
> > +int igt_sysfs_get_num_tiles(int device);
> >  bool igt_sysfs_has_attr(int dir, const char *attr);  const char
> > *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id);  const char
> > *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id);
> > --
> > 2.25.1
> >
