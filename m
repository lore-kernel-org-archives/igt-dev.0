Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB3810E636
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 14:11:49 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Date: Fri, 15 Sep 2023 14:11:44 +0000
Message-ID: <MW3PR11MB474839AB0DCD27E5E81F120BAEF6A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230914102156.412238-1-janga.rahul.kumar@intel.com>
 <20230914202746.GE233750@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230914202746.GE233750@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_vm : Validate tile mask
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Friday, September 15, 2023 1:58 AM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>
> Subject: Re: [PATCH i-g-t] tests/intel/xe_vm : Validate tile mask
>=20
> On Thu, Sep 14, 2023 at 03:51:56PM +0530, janga.rahul.kumar@intel.com
> wrote:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > Tile mask should be always less than or equal to tile count.
> >
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  tests/intel/xe_vm.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> > 4952ea786..3b11b8a68 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include "igt.h"
> > +#include "igt_sysfs.h"
> >  #include "lib/igt_syncobj.h"
> >  #include "lib/intel_reg.h"
> >  #include "xe_drm.h"
> > @@ -905,10 +906,11 @@ test_bind_array(int fd, struct
> drm_xe_engine_class_instance *eci, int n_execs,
> >  		uint64_t pad;
> >  		uint32_t data;
> >  	} *data;
> > -	int i, b;
> > +	int i, b, tile_count;
> >
> >  	igt_assert(n_execs <=3D BIND_ARRAY_MAX_N_EXEC);
> >
> > +	tile_count =3D xe_sysfs_get_num_tiles(fd);
> >  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> >  	bo_size =3D sizeof(*data) * n_execs;
> >  	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd), @@ -928,6
> +930,10
> > @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, in=
t
> n_execs,
> >  		bind_ops[i].range =3D bo_size;
> >  		bind_ops[i].addr =3D addr;
> >  		bind_ops[i].tile_mask =3D 0x1 << eci->gt_id;
>=20
> The problem is here --- you shouldn't be building a tile mask from a GT I=
D
> (you'd want to use the tile ID instead).  Tiles and GTs are different thi=
ngs and
> you can't use them interchangeably.
Agree. 	I have explored the options to break this derivation of tile id fro=
m GT id. Currently KMD doesn't provide a framework to get tile id based on =
GT id or doesn't advertise the tile count as part of XE_QUERY(Which am plan=
ning to add). Currently KMD share tile_count as part of debugfs "info" and =
IGT is counting tiles based on sysfs path of tiles.

@Roper, Matthew D
Is there any other way to UMD/IGT can get the tile info on which a GT is pr=
esent so that it can bind a VMA on that particular tile?

>=20
> > +
> > +		if (bind_ops[i].tile_mask >=3D tile_count)
> > +			bind_ops[i].tile_mask =3D tile_count - 1;
>=20
> This check doesn't seem to make sense.  If you're trying to target the se=
cond
> tile, then your tile mask would be 0x2, which is equal to tile_count on a=
 2-tile
> system (so following this condition would just force you back to a mask
> representing the first tile no matter what).
>=20
> And if you were on a 4-tile system, then trying to target either the thir=
d or
> fourth tiles would mean the mask is 0x8 or 0x4, both of which match the
> condition here and cause you to update the mask to 0x3.  And even higher
> tile counts would similarly be broken.
Understood. Thanks for detailed explanation. Will update the tile_mask to '=
0' (bind VMA to all tiles present). Test behaviour won't be impacted.

Thanks,
Rahul
>=20
>=20
> Matt
>=20
> > +
> >  		bind_ops[i].op =3D XE_VM_BIND_OP_MAP |
> XE_VM_BIND_FLAG_ASYNC;
> >  		bind_ops[i].region =3D 0;
> >  		bind_ops[i].reserved[0] =3D 0;
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
