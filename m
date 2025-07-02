Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF846C8303F
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 11:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C76810E6F9;
	Wed,  2 Jul 2025 11:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTNjIaa7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2468B10E6EA
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751454864; x=1782990864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LOJdoKQRtbpJN7FtfRJrhlmP66M0IgIwXjL+LXZ+bAk=;
 b=gTNjIaa7VRX21PwPEIbAW5xR0sIs+Epp7ED7AE01MrC2aG0egLg5UoU8
 MPb9gYVeArZ6WuVT/L6FJt537BgqrJ5fIaNhEn7N2cuM5nSPXcJpr9/gL
 1WeCDRn8FRPiKDn0KjaLzfeCTThbYT9RHpwd7S+xO2qCm/lKOcCoZWSX+
 ntws55CGCgfzo2tUtAbwJivkKxhd+antONQNKmN3z/LxoX2xkQ7qhuulv
 bMRBNGdpkUJrYkopu2BJ/lOd7G8Wsz37eBvXxxuHBBFGtthWBRpsbVArB
 2ZwRSts5ZujCUOVcvHP2wB2qaXzNn8wJd/axnP3Ue9T36qLhCoz24VRqP w==;
X-CSE-ConnectionGUID: g5esILxySo+MTXtVdULHfg==
X-CSE-MsgGUID: GsJ42PYmTFinvGKqG7JiOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64438128"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64438128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:14:23 -0700
X-CSE-ConnectionGUID: X+5zrZIPSJeqzet5zyrq3A==
X-CSE-MsgGUID: QJeBvan8ShCZCB89I8usXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158423769"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:14:22 -0700
Date: Wed, 2 Jul 2025 13:14:19 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/7] lib/xe: Don't assume GT ID matches location in
 GT query list
Message-ID: <hik6qz55nxnmwytd5cln2m5dtmf6gudyjkdqff5vlfh7o3nz2t@272wvekr2p3l>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <20250630163529.2096664-11-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630163529.2096664-11-matthew.d.roper@intel.com>
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

On Mon, Jun 30, 2025 at 09:35:32AM -0700, Matt Roper wrote:
> To prevent confusion between GT ID (uapi) and what a GT's index in the
> list returned by the query ioctl, switch some internal functions to take
> a pointer to the drm_xe_gt structure itself.  Also add a helper function
> that can find this structure in the GT query list, given a uapi GT ID.
> Current platforms always have list index == uapi ID, but this is not
> guaranteed to be true for future platforms.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/xe/xe_query.c | 38 ++++++++++++++++++++++++++------------
>  lib/xe/xe_query.h |  1 +
>  lib/xe/xe_util.c  |  7 ++++---
>  3 files changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index ac7b3110b..ef4034185 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -185,21 +185,21 @@ static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
>  	return oa_units;
>  }
>  
> -static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
> +static uint64_t native_region_for_gt(const struct drm_xe_gt *gt)
>  {
>  	uint64_t region;
>  
> -	igt_assert(gt_list->num_gt > gt);
> -	region = gt_list->gt_list[gt].near_mem_regions;
> +	igt_assert(gt);
> +	region = gt->near_mem_regions;
>  	igt_assert(region);
>  
>  	return region;
>  }
>  
>  static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
> -			     const struct drm_xe_query_gt_list *gt_list, int gt)
> +			     const struct drm_xe_gt *gt)
>  {
> -	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
> +	int region_idx = ffs(native_region_for_gt(gt)) - 1;

I missed this before, but we need ffsll() here.

>  
>  	if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[region_idx]))
>  		return mem_regions->mem_regions[region_idx].total_size;
> @@ -208,9 +208,9 @@ static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
>  }
>  
>  static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
> -				     const struct drm_xe_query_gt_list *gt_list, int gt)
> +				     const struct drm_xe_gt *gt)
>  {
> -	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
> +	int region_idx = ffs(native_region_for_gt(gt)) - 1;

Ditto.

>  
>  	if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[region_idx]))
>  		return mem_regions->mem_regions[region_idx].cpu_visible_size;
> @@ -359,10 +359,10 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
>  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
>  		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_regions,
> -						     xe_dev->gt_list, gt);
> +						     &xe_dev->gt_list->gt_list[gt]);
>  		xe_dev->visible_vram_size[gt] =
>  			gt_visible_vram_size(xe_dev->mem_regions,
> -					     xe_dev->gt_list, gt);
> +					     &xe_dev->gt_list->gt_list[gt]);
>  	}
>  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
> @@ -481,6 +481,20 @@ uint64_t system_memory(int fd)
>  	return regions & 0x1;
>  }
>  
> +/*
> + * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in the
> + * GT list.
> + */
> +const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id)
> +{
> +	for (int i = 0; i < xe_dev->gt_list->num_gt; i++)
> +		if (xe_dev->gt_list->gt_list[i].gt_id == gt_id)
> +			return &xe_dev->gt_list->gt_list[i];
> +
> +	return NULL;
> +}
> +
> +
>  /**
>   * vram_memory:
>   * @fd: xe device fd
> @@ -494,9 +508,9 @@ uint64_t vram_memory(int fd, int gt)
>  
>  	xe_dev = find_in_cache(fd);
>  	igt_assert(xe_dev);
> -	igt_assert(gt >= 0 && gt < xe_dev->gt_list->num_gt);
> +	igt_assert(xe_dev->gt_mask & BIT(gt));
>  
> -	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt_list, gt) : 0;
> +	return xe_has_vram(fd) ? native_region_for_gt(drm_xe_get_gt(xe_dev, gt)) : 0;
>  }
>  
>  static uint64_t __xe_visible_vram_size(int fd, int gt)
> @@ -716,7 +730,7 @@ static void __available_vram_size_snapshot(int fd, int gt, struct __available_vr
>  	xe_dev = find_in_cache(fd);
>  	igt_assert(xe_dev);
>  
> -	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
> +	region_idx = ffs(native_region_for_gt(drm_xe_get_gt(xe_dev, gt))) - 1;

And here too.

Rest looks good to me, with above fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>


>  	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
>  
>  	if (XE_IS_CLASS_VRAM(mem_region)) {
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 37b0cf31e..9a2ceb4c8 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -95,6 +95,7 @@ struct xe_device {
>  unsigned int xe_number_gt(int fd);
>  uint64_t all_memory_regions(int fd);
>  uint64_t system_memory(int fd);
> +const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
>  uint64_t vram_memory(int fd, int gt);
>  uint64_t vram_if_possible(int fd, int gt);
>  struct drm_xe_engine *xe_engines(int fd);
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 06b378ce0..794f2b639 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -241,12 +241,13 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
>  static uint32_t reference_clock(int fd, int gt_id)
>  {
>  	struct xe_device *dev = xe_device_get(fd);
> +	const struct drm_xe_gt *gt;
>  	uint32_t refclock;
>  
> -	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
> -	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
> +	igt_assert(dev && dev->gt_mask & BIT(gt_id));
>  
> -	refclock = dev->gt_list->gt_list[gt_id].reference_clock;
> +	gt = drm_xe_get_gt(dev, gt_id);
> +	refclock = gt->reference_clock;
>  
>  	igt_assert_lt(0, refclock);
>  
> -- 
> 2.49.0
> 
