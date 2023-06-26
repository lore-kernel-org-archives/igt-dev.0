Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1E810E1CC
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 10:48:21 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Jun 2023 10:48:16 +0000
Message-ID: <SJ1PR11MB62046E8F51197B7B60F54E2E8126A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230623114946.3803540-1-himal.prasad.ghimiray@intel.com>
 <20230623114946.3803540-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230623114946.3803540-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 2/4] lib/igt_sysfs: Handling gt related
 sysfs uapi changes
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
> Sent: Friday, June 23, 2023 5:20 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Iddamsetty,
> Aravind <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v2 2/4] lib/igt_sysfs: Handling gt related sysfs uapi cha=
nges
>=20
> Patch https://patchwork.freedesktop.org/series/118927/
> is moving gt sysfs parent under tile folder.
>=20
> With the above patch path for sysfs changes:
> from: /sys/class/drm/cardX/device/gtN/
> to : /sys/class/drm/cardX/device/tileN/gtN
>=20
> Adding xe_for_each_gt_under_each_tile macro to access new path.
>=20
> v2:
> - Calculate number of tiles once within iterator. (Rahul)
>=20
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Upadhyay <tejas.upadhyay@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  lib/igt_sysfs.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index de2c9a86..42bf2741 1=
00644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -80,6 +80,12 @@
>=20
>  #define xe_for_each_tile for_each_sysfs_tile_dirfd
>=20
> +/* FIXME: Need to revisit if GT indexing under TILE changes from KMD */
> +#define xe_for_each_gt_under_each_tile(xe__, gt__, tile__, tile_cnt__) \
> +	for (gt__ =3D 0, tile__ =3D 0, tile_cnt__ =3D igt_sysfs_get_num_tiles(x=
e__) ; \
> +	     gt__ < xe_number_gt(xe__); \
> +	     (xe_number_gt(xe__) =3D=3D tile_cnt__) ? ++gt__, ++tile__ : ++gt__=
)
> +

This is with consideration of indexing and also considering equal (or all G=
T counts are on one tile) GT counts on each tile. Consider case when 2GTs o=
n 1 tile and 1 GT on other tile. But for all current platforms we have it s=
hould work, need to revisit when any of those scenario comes.

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
=20
>  enum i915_attr_id {
>  	RPS_ACT_FREQ_MHZ,
>  	RPS_CUR_FREQ_MHZ,
> --
> 2.25.1
