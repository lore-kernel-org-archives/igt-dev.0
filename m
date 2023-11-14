Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7493710E0D7
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 14:44:28 +0000 (UTC)
Date: Tue, 14 Nov 2023 15:44:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231114144406.nivn77naiwkqhhgb@kamilkon-desk.igk.intel.com>
References: <20231114134426.7-1-francois.dugast@intel.com>
 <20231114134426.7-5-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231114134426.7-5-francois.dugast@intel.com>
Subject: Re: [igt-dev] [PATCH v1 4/8] drm-uapi/xe: Rename *_mem_regions mask.
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

Hi Francois,
On 2023-11-14 at 13:44:22 +0000, Francois Dugast wrote:

please remove last dot "." from subject:

[PATCH v1 4/8] drm-uapi/xe: Rename *_mem_regions mask.
-----------------------------------------------------^
s/mask\./mask/

with that:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Align with kernel commit ("drm/xe/uapi: Rename *_mem_regions masks")
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 17 +++++++++--------
>  lib/xe/xe_query.c         |  6 +++---
>  tests/intel/xe_query.c    |  8 ++++----
>  3 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 32f6cf631..621d6c0e3 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -349,17 +349,18 @@ struct drm_xe_query_gt {
>  	/** @clock_freq: A clock frequency for timestamp */
>  	__u32 clock_freq;
>  	/**
> -	 * @native_mem_regions: Bit mask of instances from
> -	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> -	 * direct access.
> +	 * @near_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that is near the current engines of this GT.
>  	 */
> -	__u64 native_mem_regions;
> +	__u64 near_mem_regions;
>  	/**
> -	 * @slow_mem_regions: Bit mask of instances from
> -	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> -	 * they live on a different GPU/Tile.
> +	 * @far_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that is far from the engines of this GT.
> +	 * In general, it has extra indirections when compared to the
> +	 * @near_mem_regions. For a discrete device this could mean system
> +	 * memory and memory living in a different Tile.
>  	 */
> -	__u64 slow_mem_regions;
> +	__u64 far_mem_regions;
>  	/** @reserved: Reserved */
>  	__u64 reserved[8];
>  };
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index d459893e1..c33bfd432 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -66,8 +66,8 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
>  	int i;
>  
>  	for (i = 0; i < gt_list->num_gt; i++)
> -		regions |= gt_list->gt_list[i].native_mem_regions |
> -			   gt_list->gt_list[i].slow_mem_regions;
> +		regions |= gt_list->gt_list[i].near_mem_regions |
> +			   gt_list->gt_list[i].far_mem_regions;
>  
>  	return regions;
>  }
> @@ -123,7 +123,7 @@ static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list,
>  	uint64_t region;
>  
>  	igt_assert(gt_list->num_gt > gt);
> -	region = gt_list->gt_list[gt].native_mem_regions;
> +	region = gt_list->gt_list[gt].near_mem_regions;
>  	igt_assert(region);
>  
>  	return region;
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 969ad1c7f..b960ccfa2 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -281,10 +281,10 @@ test_query_gt_list(int fd)
>  		igt_info("type: %d\n", gt_list->gt_list[i].type);
>  		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
>  		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
> -		igt_info("native_mem_regions: 0x%016llx\n",
> -		       gt_list->gt_list[i].native_mem_regions);
> -		igt_info("slow_mem_regions: 0x%016llx\n",
> -		       gt_list->gt_list[i].slow_mem_regions);
> +		igt_info("near_mem_regions: 0x%016llx\n",
> +		       gt_list->gt_list[i].near_mem_regions);
> +		igt_info("far_mem_regions: 0x%016llx\n",
> +		       gt_list->gt_list[i].far_mem_regions);
>  	}
>  }
>  
> -- 
> 2.34.1
> 
