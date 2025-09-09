Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17A9CAC587
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 15:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3673910E7AE;
	Tue,  9 Sep 2025 15:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvazuOjV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9695010E7AE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757432504; x=1788968504;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1ozhx0nwS3Wtt5UiuVQtRhzMP+yI27RF6KhqdpNo8KM=;
 b=QvazuOjV6cG/9Qif1U7x9/oYQkn2usj0UMIdHBQLLY6i+pBkXFbnIVMj
 Af4Ol3WKOwWTdrTO/+vw2KFkdqYnrvFfs4TMfuc2TT0tsojtTo9FNwELn
 n0CLHz5xbepeYgs/h2MHwqTly2TSTmLV26sBnOtgWp8kZWeMfYjNtqiLq
 8EycNvspHdsw2BW1moPHNB1TxXKS3AnNc2A5SHFhcqcPL8ZwmjgpjdzpD
 Lkp+Nw1O7RwyKptIgB9KLhmoqrQEaZSJSIX7m5P+F9vPPjQCszEDjonZE
 LlA0xeY200Xw2j36Xol7qXH5Cr6AKKqkl12Gez6xHkUF2x9Z/Ks9H0/JA g==;
X-CSE-ConnectionGUID: GqMAqj3lTl+G4+Gcj24/Zw==
X-CSE-MsgGUID: HazGnsbKTG2QL3lw6Co7vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63357956"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63357956"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:41:43 -0700
X-CSE-ConnectionGUID: LBkBQa6HRxyv4M9+/7vu+Q==
X-CSE-MsgGUID: ueUo7z3MRKOT6SS03VPg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173514592"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 08:41:42 -0700
Date: Tue, 9 Sep 2025 17:41:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t v3 1/1] lib/xe: Track valid Tile IDs
Message-ID: <20250909154128.krrwfmzneaejiojy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
References: <20250909143735.1344243-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909143735.1344243-1-nishit.sharma@intel.com>
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
On 2025-09-09 at 14:37:35 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Iterating drm_xe_gt structure to get valid tile ID instead
> of assuming tile_id == gt_id and finding sysfs path for
> GTS in multi-tile platforms. Initially it was assumed

s/GTS/GTs/

> tile_id == gt_id in multi-tile platform and if gt_id = X
> passed as input, it was considered tileX.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/igt_sysfs.c   | 19 ++++++++++---------
>  lib/xe/xe_query.c | 16 ++++++++++++++++
>  lib/xe/xe_query.h |  4 ++++
>  3 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 96ca57ed9..68f7a19e8 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -226,6 +226,7 @@ int igt_sysfs_open(int device)
>  char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
>  {
>  	struct stat st;
> +	struct xe_device *xe_dev;
>  
>  	if (xe_device < 0)
>  		return NULL;
> @@ -233,12 +234,12 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>  
> -	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
> -		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> -	else
> -		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt);
> +	xe_dev = xe_device_get(xe_device);
> +
> +	igt_assert(xe_dev);
> +
> +	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> +		 major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev, gt), gt);
>  
>  	if (!access(path, F_OK))
>  		return path;
> @@ -307,7 +308,7 @@ char *
>  xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
>  {
>  	struct stat st;
> -	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
> +	char base_path[96];
>  
>  	if (xe_device < 0)
>  		return NULL;
> @@ -315,8 +316,8 @@ xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
>  	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
>  		return NULL;
>  
> -	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
> -		 major(st.st_rdev), minor(st.st_rdev), tile, gt,
> +	xe_sysfs_gt_path(xe_device, gt, base_path, sizeof(base_path));
> +	snprintf(path, pathlen, "%s/engines/%s", base_path,
>  		 xe_engine_class_short_string(class));
>  
>  	if (!access(path, F_OK))
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 9b88cce8d..962eb4302 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -379,6 +379,10 @@ struct xe_device *xe_device_get(int fd)
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
> @@ -545,6 +549,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id)
>  	return NULL;
>  }
>  
> +/*
> + * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in the
> + * GT list and return valid tile_id otherwise invalid.
> + */
> +int drm_xe_get_tile(struct xe_device *xe_dev, int gt_id)

Rename it into xe_get_tile() as this is not calling directly
any drm ioctl, also any functions in xe_query.h also use xe_
prefix.

> +{
> +	for (int i = 0; i < xe_dev->gt_list->num_gt; i++)
> +		if (xe_dev->gt_list->gt_list[i].gt_id == gt_id)
> +			return xe_dev->gt_list->gt_list[i].tile_id;
> +
> +	return -ENOENT;
> +}
>  
>  /**
>   * vram_memory:
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 4b8a6ee77..2fdd860cd 100644
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
> +int drm_xe_get_tile(struct xe_device *xe_dev, int gt_id);

Rename into xe_get_tile()

imho you can keep r-b.

Regards,
Kamil

>  uint64_t vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);
>  struct drm_xe_engine *xe_engines(int fd);
> -- 
> 2.43.0
> 
