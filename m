Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0882ECA0EFF
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 12:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDBB10E7AD;
	Wed, 27 Aug 2025 12:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjc/MBr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC19110E7AD
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756296156; x=1787832156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wzf//p7OjMH8D5AtQJoQCq75RILlT9ACQlkU7LohFRk=;
 b=bjc/MBr5ErTSbnwYXO9Ui8ETJMd0b9Hp/GPCTi81uUY9zWSa5GNUNtTm
 yF/Q5jP9HFMiarkBxsCN4az+IcHDoG68fRxZdCVtsmb/se6lPKbTP4i21
 bQTs5PBLEtzgDuhLB2iWHY1wZqJTwYDC/31ah+NsFtj3giZHDRgVGbYF5
 UTmQWwqgm44PJK0eo89P+dHGkH0YAyBnwT4xG1zCAw86h+wf5h4SM33wu
 d4QlMhAhiWUT3PYBHfOj4MvV1UMq6LaIaRJIStOiKUmGkZi6RYlbth7CR
 yHm91+T6LBl8lt1iER7Ud4b5ATAu+HB4aK8w0KjF1orxP40mlCmtUjwRy w==;
X-CSE-ConnectionGUID: qaEkoXoAQlubLK/d2oRXWg==
X-CSE-MsgGUID: qjFa1HQeRQeg/tl1jy6HOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="75997379"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="75997379"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 05:02:36 -0700
X-CSE-ConnectionGUID: R317ZfWGRzCzLaOv9tb/MA==
X-CSE-MsgGUID: 6RYiotaTRu2ZII76jO38Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="193475112"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 05:02:33 -0700
Date: Wed, 27 Aug 2025 14:02:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH i-g-t v2] lib/xe: Track valid Tile IDs
Message-ID: <20250827120231.wxputpdoads4mczn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 matthew.d.roper@intel.com
References: <20250825061054.304277-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825061054.304277-1-nishit.sharma@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Nishit,
On 2025-08-25 at 06:10:54 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Iterating drm_xe_gt structure to get valid tile ID instead
> of assuming tile_id == gt_id and finding sysfs path for
> GTS in multi-tile platforms. Initially it was assumed
> tile_id == gt_id in multi-tile platform and if gt_id = X
> passed, it was considered tileX.

Add newline here.

> Fixed compilation issue. Removed unused funtion from library.

I guess this is version changes, so imho better:

v2: Fixed compilation, removed unused funtion from library.

Btw are you referring to removing xe_query_eu_stall_new()?
If yes, please make it in separate patch, not in this one.

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/igt_sysfs.c   | 28 ++++++++++++++++++--------
>  lib/xe/xe_query.c | 50 ++++++++++++++++++-----------------------------
>  lib/xe/xe_query.h |  4 ++++
>  3 files changed, 43 insertions(+), 39 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 96ca57ed9..0ef1182b1 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -233,9 +233,14 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>  
> -	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
> +	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device))) {
> +		struct xe_device *xe_dev = xe_device_get(xe_device);
> +
> +		igt_assert(xe_dev);
> +
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> +			 major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev, gt), gt);
> +	}
>  	else
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
>  			 major(st.st_rdev), minor(st.st_rdev), gt);

Btw why do we need checks for PVC here? Cannot this be simplified
into one-liner:
  	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
		 major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev, gt), gt);

> @@ -307,7 +312,6 @@ char *
>  xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
>  {
>  	struct stat st;
> -	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
>  
>  	if (xe_device < 0)
>  		return NULL;
> @@ -315,9 +319,16 @@ xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>  
> -	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> -		 major(st.st_rdev), minor(st.st_rdev), tile, gt,
> -		 xe_engine_class_short_string(class));
> +	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device))) {
> +		struct xe_device *xe_dev = xe_device_get(xe_device);
> +
> +		igt_assert(xe_dev);
> +
> +		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> +			       major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev, gt), gt);
> +	} else
> +		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> +			       major(st.st_rdev), minor(st.st_rdev), 0, gt, xe_engine_class_short_string(class));

This is repeating code from function xe_sysfs_gt_path() plus
engine and class, imho reuse that function here.
Less code is better.

>  
>  	if (!access(path, F_OK))
>  		return path;
> @@ -506,6 +517,7 @@ void igt_drm_debug_mask_reset_exit_handler(int sig)
>   */
>  void igt_drm_debug_mask_update(unsigned int mask_to_set)
>  {
> +	unsigned int new_debug_mask;

This looks like unrelated change, for a separate patch,
remove it.

>  	static bool debug_mask_read_once = true;
>  	char buf[20];
>  	int dir;
> @@ -524,8 +536,8 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
>  		}
>  	}
>  
> -	igt_debug("Setting DRM debug mask to %d\n", mask_to_set);
> -	snprintf(buf, sizeof(buf), "%d", mask_to_set);
> +	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
> +	snprintf(buf, sizeof(buf), "%d", new_debug_mask);

Same here, unrelated change.

>  	igt_assert(igt_sysfs_set(dir, "debug", buf));
>  
>  	close(dir);
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 3b8a682f8..ead44cda6 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -160,32 +160,6 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
>  	return mem_regions;
>  }
>  
> -static struct drm_xe_query_eu_stall *xe_query_eu_stall_new(int fd)
> -{
> -	struct drm_xe_query_eu_stall *query_eu_stall;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	/* Support older kernels where this uapi is not yet available */
> -	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> -		return NULL;
> -	igt_assert_neq(query.size, 0);
> -
> -	query_eu_stall = malloc(query.size);
> -	igt_assert(query_eu_stall);
> -
> -	query.data = to_user_pointer(query_eu_stall);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(query_eu_stall, query.size));
> -
> -	return query_eu_stall;
> -}
> -

Same here, unrelated change.

>  static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
>  {
>  	struct drm_xe_query_oa_units *oa_units;
> @@ -343,7 +317,6 @@ static void xe_device_free(struct xe_device *xe_dev)
>  	free(xe_dev->engines);
>  	free(xe_dev->mem_regions);
>  	free(xe_dev->vram_size);
> -	free(xe_dev->eu_stall);

Same here, unrelated change.

>  	free(xe_dev);
>  }
>  
> @@ -379,19 +352,22 @@ struct xe_device *xe_device_get(int fd)
>  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
>  
> +	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
> +
>  	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
>  	xe_dev->engines = xe_query_engines(fd);
>  	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
> -	xe_dev->eu_stall = xe_query_eu_stall_new(fd);

Same here, unrelated change.

>  	xe_dev->oa_units = xe_query_oa_units_new(fd);
>  
>  	/*
>  	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
>  	 * the allocation is large enough to hold the highest GT ID
>  	 */
> -	max_gt = igt_fls(xe_dev->gt_mask) - 1;
> -	xe_dev->vram_size = calloc(max_gt + 1, sizeof(*xe_dev->vram_size));
> -	xe_dev->visible_vram_size = calloc(max_gt + 1, sizeof(*xe_dev->visible_vram_size));
> +	max_gt = ffsll(xe_dev->gt_mask) - 1;
> +	xe_dev->vram_size = calloc(max_gt, sizeof(*xe_dev->vram_size));
> +	xe_dev->visible_vram_size = calloc(max_gt, sizeof(*xe_dev->visible_vram_size));

Same here, unrelated change.

>  
>  	for (int idx = 0; idx < xe_dev->gt_list->num_gt; idx++) {
>  		struct drm_xe_gt *gt = &xe_dev->gt_list->gt_list[idx];
> @@ -545,6 +521,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id)
>  	return NULL;
>  }
>  
> +/*
> + * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in the
> + * GT list and return valid tile_id.
> + */
> +uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id)
> +{
> +	for (int i = 0; i < xe_dev->gt_list->num_gt; i++)
> +		if (xe_dev->gt_list->gt_list[i].gt_id == gt_id)
> +			return xe_dev->gt_list->gt_list[i].tile_id;
> +
> +	return -1;

This should be unsigned? imho this should be defined as
invalid and returned instead.

Regards,
Kamil

> +}
>  
>  /**
>   * vram_memory:
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index cc54ec956..d8da1f9eb 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -39,6 +39,9 @@ struct xe_device {
>  	/** @gt_mask: bitmask of GT IDs */
>  	uint64_t gt_mask;
>  
> +	/** @tile_mask: bitmask of Tile IDs */
> +	uint64_t tile_mask;
> +
>  	/** @memory_regions: bitmask of all memory regions */
>  	uint64_t memory_regions;
>  
> @@ -101,6 +104,7 @@ unsigned int xe_dev_max_gt(int fd);
>  uint64_t all_memory_regions(int fd);
>  uint64_t system_memory(int fd);
>  const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
> +uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id);
>  uint64_t vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);
>  struct drm_xe_engine *xe_engines(int fd);
> -- 
> 2.43.0
> 
