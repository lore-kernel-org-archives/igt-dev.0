Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC27010E2D6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 12:19:32 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 20 Jun 2023 12:19:24 +0000
Message-ID: <DM6PR11MB449202248F2842F4AA2F78D18D5CA@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230613134156.3315199-1-himal.prasad.ghimiray@intel.com>
 <20230613134156.3315199-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230613134156.3315199-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/4] lib/igt_sysfs: Handling gt related sysfs
 uapi changes.
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Himal
> Prasad Ghimiray
> Sent: 13 June 2023 07:12 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH 2/4] lib/igt_sysfs: Handling gt related sysfs u=
api
> changes.
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
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  lib/igt_sysfs.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index 2fb2303c..6c0ab617 1=
00644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -78,6 +78,11 @@
>=20
>  #define xe_for_each_tile for_each_sysfs_tile_dirfd
>=20
> +/* FIXME: Need to revisit if GT indexing under TILE changes from KMD */
> +#define xe_for_each_gt_under_each_tile(xe__, gt__, tile__) \
> +	for (gt__ =3D 0, tile__ =3D 0 ; gt__ < xe_number_gt(xe__); \
> +	     (xe_number_gt(xe__) =3D=3D igt_sysfs_get_num_tiles(xe__)) ? ++gt__=
,
> +++tile__ : ++gt__)
> +
It looks like for PVC, MTL and system memory(without device memory) the abo=
ve logic works.
If we have both system memory and device memory, will the above logic work?
>  enum i915_attr_id {
>  	RPS_ACT_FREQ_MHZ,
>  	RPS_CUR_FREQ_MHZ,
> --
> 2.25.1
