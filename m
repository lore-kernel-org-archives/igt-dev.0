Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F9410E690
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 06:15:20 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 10 Nov 2023 06:15:16 +0000
Message-ID: <MW3PR11MB4748E1DC397A1FB14B8710FEAEAEA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
 <20231109155410.7-51-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-51-francois.dugast@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 50/57] drm-uapi/xe: Add Tile ID information
 to the GT info query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Franco=
is
> Dugast
> Sent: Thursday, November 9, 2023 9:24 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [igt-dev] [PATCH v3 50/57] drm-uapi/xe: Add Tile ID information =
to
> the GT info query
>=20
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> Align with kernel commit ("drm/xe/uapi: Add Tile ID information to the GT
> info query")
>=20
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 2 ++
>  tests/intel/xe_query.c    | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h index
> 3881f8a94..a18c141b1 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -427,6 +427,8 @@ struct drm_xe_query_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
>  	/** @type: GT type: Main or Media */
>  	__u16 type;
> +	/** @tile_id: Tile ID where this GT lives (Information only) */
> +	__u16 tile_id;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
>  	/** @reference_clock: A clock frequency for timestamp */ diff --git
> a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> 524a1949b..6ccfb0a65 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -305,6 +305,7 @@ test_query_gt_list(int fd)
>=20
>  	for (i =3D 0; i < gt_list->num_gt; i++) {
>  		igt_info("type: %d\n", gt_list->gt_list[i].type);
> +		igt_info("tile_id: %d\n", gt_list->gt_list[i].tile_id);
>  		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
>  		igt_info("reference_clock: %u\n", gt_list-
> >gt_list[i].reference_clock);
>  	}
> --
> 2.34.1
