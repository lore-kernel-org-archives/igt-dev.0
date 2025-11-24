Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BB3CFD313
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 11:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C33910E206;
	Mon, 24 Nov 2025 11:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/93B8hw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4775910E206
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 11:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763982111; x=1795518111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MhT5MfpPa4GrNZ76nRefkk75Kt+vVppmAEUS8rwvXng=;
 b=C/93B8hwjmaudBrQwiBfauHL0KWMjyFb2+HKYSnqZBl1Gbz7Vmfxr4eE
 BDBA4MQLxo41OuGEWoNx78v5SKpLwMPlY7MwIOwOOZzBdoGzoKu+MnXHP
 kjJch7pj+JPQXgMF1K1p9H4agnNz117PKBJZpDWvNKa+vgNHsnDXT/DzA
 WzBkw1mtVP0QKVHlyQP0eAriw0W0nW/x3Hr2uYiRwY7MaVZcQC1+xFO2m
 1iJSWq5jqBgqjt5otw9ACFJBuORUSHSp0NRbPEMEW7riYZ2JyCfXnpyzw
 Y1MzY/ZOVvCc3+trd0/n+/X0CAfYfy4+BvIcgDcqujGilbKr5v8WoNViu A==;
X-CSE-ConnectionGUID: kGHngCZTSvy5uTpCxdmktA==
X-CSE-MsgGUID: bg2scGVZTuayo0pK5PGGzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77451415"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="77451415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 03:01:50 -0800
X-CSE-ConnectionGUID: OfK7Qg6oTfWEIkbjhXVYxQ==
X-CSE-MsgGUID: /PVwcBAqRkCPtQDEN8b77Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192772023"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 03:01:48 -0800
Date: Mon, 24 Nov 2025 12:01:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v5 3/5] lib/xe/xe_query: use recently introduced helper
 to query device
Message-ID: <20251124110146.bu4gjqcsek4po43l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
 <20251121-xe_query_helpers-v5-3-d69c1c160e96@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121-xe_query_helpers-v5-3-d69c1c160e96@intel.com>
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

Hi Andrzej,
On 2025-11-21 at 11:59:02 +0100, Andrzej Hajda wrote:
> It simplifies the code.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_query.c | 190 +++---------------------------------------------------
>  1 file changed, 8 insertions(+), 182 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index a185b852e19b87e393f4bc6edbf9e0952439d518..3f3ee9b965949c2d0b821c9346183021db8338a9 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -68,83 +68,6 @@ skip_query:
>  	return data;
>  }
>  
> -static struct drm_xe_query_config *xe_query_config_new(int fd)
> -{
> -	struct drm_xe_query_config *config;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_CONFIG,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	config = malloc(query.size);
> -	igt_assert(config);
> -
> -	query.data = to_user_pointer(config);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(config, query.size));
> -
> -	igt_assert(config->num_params > 0);
> -
> -	return config;
> -}
> -
> -static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
> -{
> -	uint32_t *hwconfig;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	/* Perform the initial query to get the size */
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	if (!query.size)
> -		return NULL;
> -
> -	hwconfig = malloc(query.size);
> -	igt_assert(hwconfig);
> -
> -	query.data = to_user_pointer(hwconfig);
> -
> -	/* Perform the query to get the actual data */
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(hwconfig, query.size));
> -
> -	*hwconfig_size = query.size;
> -	return hwconfig;
> -}
> -
> -static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
> -{
> -	struct drm_xe_query_gt_list *gt_list;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	gt_list = malloc(query.size);
> -	igt_assert(gt_list);
> -
> -	query.data = to_user_pointer(gt_list);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(gt_list, query.size));
> -
> -	return gt_list;
> -}
> -
>  static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
>  {
>  	uint64_t regions = 0;
> @@ -157,103 +80,6 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
>  	return regions;
>  }
>  
> -static struct drm_xe_query_engines *xe_query_engines(int fd)
> -{
> -	struct drm_xe_query_engines *engines;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_ENGINES,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	engines = malloc(query.size);
> -	igt_assert(engines);
> -
> -	query.data = to_user_pointer(engines);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(engines, query.size));
> -
> -	return engines;
> -}
> -
> -static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
> -{
> -	struct drm_xe_query_mem_regions *mem_regions;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	mem_regions = malloc(query.size);
> -	igt_assert(mem_regions);
> -
> -	query.data = to_user_pointer(mem_regions);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(mem_regions, query.size));
> -
> -	return mem_regions;
> -}
> -
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
> -static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
> -{
> -	struct drm_xe_query_oa_units *oa_units;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_OA_UNITS,
> -		.size = 0,
> -		.data = 0,
> -	};
> -
> -	/* Support older kernels where this uapi is not yet available */
> -	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
> -		return NULL;
> -
> -	oa_units = malloc(query.size);
> -	igt_assert(oa_units);
> -
> -	query.data = to_user_pointer(oa_units);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	VG(VALGRIND_MAKE_MEM_DEFINED(oa_units, query.size));
> -
> -	return oa_units;
> -}
> -
>  static uint64_t native_region_for_gt(const struct drm_xe_gt *gt)
>  {
>  	uint64_t region;
> @@ -412,11 +238,11 @@ struct xe_device *xe_device_get(int fd)
>  	igt_assert(xe_dev);
>  
>  	xe_dev->fd = fd;
> -	xe_dev->config = xe_query_config_new(fd);
> -	xe_dev->hwconfig = xe_query_hwconfig_new(fd, &xe_dev->hwconfig_size);
> +	xe_dev->config = xe_query_device(fd, DRM_XE_DEVICE_QUERY_CONFIG, NULL);
> +	xe_dev->hwconfig = xe_query_device_may_fail(fd, DRM_XE_DEVICE_QUERY_HWCONFIG, &xe_dev->hwconfig_size);
>  	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
>  	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
> -	xe_dev->gt_list = xe_query_gt_list_new(fd);
> +	xe_dev->gt_list = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_LIST, NULL);
>  
>  	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
>  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> @@ -427,10 +253,10 @@ struct xe_device *xe_device_get(int fd)
>  		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
>  
>  	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
> -	xe_dev->engines = xe_query_engines(fd);
> -	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
> -	xe_dev->eu_stall = xe_query_eu_stall_new(fd);
> -	xe_dev->oa_units = xe_query_oa_units_new(fd);
> +	xe_dev->engines = xe_query_device(fd, DRM_XE_DEVICE_QUERY_ENGINES, NULL);
> +	xe_dev->mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL);
> +	xe_dev->eu_stall = xe_query_device_may_fail(fd, DRM_XE_DEVICE_QUERY_EU_STALL, NULL);
> +	xe_dev->oa_units = xe_query_device_may_fail(fd, DRM_XE_DEVICE_QUERY_OA_UNITS, NULL);
>  
>  	/*
>  	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
> @@ -860,7 +686,7 @@ static void __available_vram_size_snapshot(int fd, int gt, struct __available_vr
>  	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
>  
>  	if (XE_IS_CLASS_VRAM(mem_region)) {
> -		mem_regions = xe_query_mem_regions_new(fd);
> +		mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL);
>  		pthread_mutex_lock(&cache.cache_mutex);
>  		mem_region->used = mem_regions->mem_regions[region_idx].used;
>  		mem_region->cpu_visible_used =
> 
> -- 
> 2.43.0
> 
