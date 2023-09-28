Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E5010E634
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 12:00:16 +0000 (UTC)
Date: Thu, 28 Sep 2023 14:00:03 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <ZRVqw3ngveiDRotC@fdugast-desk.home>
References: <20230928110516.7-1-francois.dugast@intel.com>
 <20230928110516.7-12-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928110516.7-12-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 11/14] drm-uapi/xe: Replace useless
 'instance' per unique gt_id
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 11:05:13AM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Align with commit ("drm/xe/uapi: Replace useless 'instance' per unique gt_id")
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
>  tests/intel/xe_query.c    |  2 +-
>  2 files changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 80b4c76f3..e6879a6be 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -334,6 +334,47 @@ struct drm_xe_query_config {
>  	__u64 info[];
>  };
>  
> +/**
> + * struct drm_xe_query_gt - describe an individual GT.
> + *
> + * To be used with drm_xe_query_gts, which will return a list with all the
> + * existing GT individual descriptions.
> + * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> + * implementing graphics and/or media operations.
> + */
> +struct drm_xe_query_gt {
> +#define XE_QUERY_GT_TYPE_MAIN		0
> +#define XE_QUERY_GT_TYPE_REMOTE		1
> +#define XE_QUERY_GT_TYPE_MEDIA		2
> +	/** @type: GT type: Main, Remote, or Media */
> +	__u16 type;
> +	/** @gt_id: Unique ID of this GT within the PCI Device */
> +	__u16 gt_id;
> +	/** @clock_freq: A clock frequency for timestamp */
> +	__u32 clock_freq;
> +	/** @features: Reserved for future information about GT features */
> +	__u64 features;
> +	/**
> +	 * @native_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> +	 * direct access.
> +	 */
> +	__u64 native_mem_regions;
> +	/**
> +	 * @slow_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> +	 * they live on a different GPU/Tile.
> +	 */
> +	__u64 slow_mem_regions;
> +	/**
> +	 * @inaccessible_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
> +	 */
> +	__u64 inaccessible_mem_regions;
> +	/** @reserved: Reserved */
> +	__u64 reserved[8];
> +};
> +
>  /**
>   * struct drm_xe_query_gts - describe GTs
>   *
> @@ -344,30 +385,10 @@ struct drm_xe_query_config {
>  struct drm_xe_query_gts {
>  	/** @num_gt: number of GTs returned in gts */
>  	__u32 num_gt;
> -
>  	/** @pad: MBZ */
>  	__u32 pad;
> -
> -	/**
> -	 * @gts: The GTs returned for this device
> -	 *
> -	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> -	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
> -	 * bandwidth between this GT and remote region?
> -	 */
> -	struct drm_xe_query_gt {
> -#define XE_QUERY_GT_TYPE_MAIN		0
> -#define XE_QUERY_GT_TYPE_REMOTE		1
> -#define XE_QUERY_GT_TYPE_MEDIA		2
> -		__u16 type;
> -		__u16 instance;
> -		__u32 clock_freq;
> -		__u64 features;
> -		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> -		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> -		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> -		__u64 reserved[8];
> -	} gts[];
> +	/** @gts: The GT list returned for this device */
> +	struct drm_xe_query_gt gts[];
>  };
>  
>  /**
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 3e7460ff4..f1ae1bf40 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -279,7 +279,7 @@ test_query_gts(int fd)
>  
>  	for (i = 0; i < gts->num_gt; i++) {
>  		igt_info("type: %d\n", gts->gts[i].type);
> -		igt_info("instance: %d\n", gts->gts[i].instance);
> +		igt_info("gt_id: %d\n", gts->gts[i].gt_id);
>  		igt_info("clock_freq: %u\n", gts->gts[i].clock_freq);
>  		igt_info("features: 0x%016llx\n", gts->gts[i].features);
>  		igt_info("native_mem_regions: 0x%016llx\n",
> -- 
> 2.34.1
> 
