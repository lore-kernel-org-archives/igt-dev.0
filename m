Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D3CFA76E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7036D10E855;
	Fri, 21 Nov 2025 11:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA/Gg+Ro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A6D10E854
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763722833; x=1795258833;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=8pYE693PVCGlDwiDKKGZ5bze3IKM/wKUa1xC35gTet8=;
 b=CA/Gg+RoD8m0y83YGm7MeyebhhRJDe4YMn7qHzPCz5TxvGd1YDHImWgG
 n/L0H1sN3J449Gvccs2TSGV2q+fnNuZ7H9eYlbmPOqaCgKrvyVjBMagBT
 IVM4737I5ADMqQdWrqVBNjoJPiG5oHeg2sjroKtcSZdoF05rwq/0GzkNB
 k1jl7i8dv2FmALoz0FOoL3ds3dD/XKLTZS31i2Mmm2Yb/ewnaWQeLAu5D
 TP+GXVzNsLC7fy/CWwtCzPOARw/DPEnmKq0UIKU+1AvJ+9YqjmQI3p3nP
 vSYH1UF5Ve1/7ijzDN9fDZsNNJd8GFwv/14Jsf33EJiCiSRpOk4x5lp05 g==;
X-CSE-ConnectionGUID: uHzbyO13TxONhUQz7+F0Jg==
X-CSE-MsgGUID: IkJ9cl68TaqWI4goFW/Vvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83203550"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83203550"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:33 -0800
X-CSE-ConnectionGUID: 4TFvbS3NQTuoLrCgTUnQbQ==
X-CSE-MsgGUID: HR7iEFBrSy2WFrs6nAiNAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195953855"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:31 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 21 Nov 2025 11:59:02 +0100
Subject: [PATCH v5 3/5] lib/xe/xe_query: use recently introduced helper to
 query device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-xe_query_helpers-v5-3-d69c1c160e96@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
In-Reply-To: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7514;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=8pYE693PVCGlDwiDKKGZ5bze3IKM/wKUa1xC35gTet8=;
 b=kA0DAAoBI2Kyk94Q/dcByyZiAGkgRgaiSay7lwf2CmaAqPNFbVQDmCV1HN/2nQRJAsgeYA1OF
 okBswQAAQoAHRYhBPyoRDE03b9d4X8DTSNispPeEP3XBQJpIEYGAAoJECNispPeEP3XZzwL/imT
 Y9sTSzR0KJrO1L5wf0fO0Hdwx+OiCcQYXUc34VT5AD7CQRKfYofuTOo4VtUrltGsnQxLhm8GGw8
 oQC9d+G4wwZvKNVqtisgdFlSzCug7gxXIeoGJO7Otp1Sqw9MluDTDVpCVffe1u1YWoLpoWgnTuX
 ymnRmibcGmdTN7EDUFbCvn0Vu4qymlA75IsbfN4nssgadhsCeSxTf1kVa+y70W4ZG+eaLX58Jop
 SDuY07uaNFBlniXL4pf/oDPG8rp8Krk74aOHtBKdNLiAqQBudo6Bvh8zgyIUBTYqgcR9VoBSGKH
 PeihZIFVqZpG9iWPtXgxFzJ8qAszMs1EGuQ4xnde2T9gqAJtQEhPwR76Bhzf+8vJUVusoSpVry5
 brg6tskc8xSZaBGLrMIe+9K40rH/0MCZKDlsidaloHifw4FtMO+Bt3WgCBkfhwUULPDw/1KrX4j
 vnquPFPjgvxzaAd0JXijqO6HJ9tZNJO1WDX9YiddgOxOwF2RcOQHQP+pncXg==
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

It simplifies the code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.c | 190 +++---------------------------------------------------
 1 file changed, 8 insertions(+), 182 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a185b852e19b87e393f4bc6edbf9e0952439d518..3f3ee9b965949c2d0b821c9346183021db8338a9 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -68,83 +68,6 @@ skip_query:
 	return data;
 }
 
-static struct drm_xe_query_config *xe_query_config_new(int fd)
-{
-	struct drm_xe_query_config *config;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_CONFIG,
-		.size = 0,
-		.data = 0,
-	};
-
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	config = malloc(query.size);
-	igt_assert(config);
-
-	query.data = to_user_pointer(config);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(config, query.size));
-
-	igt_assert(config->num_params > 0);
-
-	return config;
-}
-
-static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
-{
-	uint32_t *hwconfig;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
-		.size = 0,
-		.data = 0,
-	};
-
-	/* Perform the initial query to get the size */
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	if (!query.size)
-		return NULL;
-
-	hwconfig = malloc(query.size);
-	igt_assert(hwconfig);
-
-	query.data = to_user_pointer(hwconfig);
-
-	/* Perform the query to get the actual data */
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(hwconfig, query.size));
-
-	*hwconfig_size = query.size;
-	return hwconfig;
-}
-
-static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
-{
-	struct drm_xe_query_gt_list *gt_list;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
-		.size = 0,
-		.data = 0,
-	};
-
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	gt_list = malloc(query.size);
-	igt_assert(gt_list);
-
-	query.data = to_user_pointer(gt_list);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(gt_list, query.size));
-
-	return gt_list;
-}
-
 static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 {
 	uint64_t regions = 0;
@@ -157,103 +80,6 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 	return regions;
 }
 
-static struct drm_xe_query_engines *xe_query_engines(int fd)
-{
-	struct drm_xe_query_engines *engines;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_ENGINES,
-		.size = 0,
-		.data = 0,
-	};
-
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	engines = malloc(query.size);
-	igt_assert(engines);
-
-	query.data = to_user_pointer(engines);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(engines, query.size));
-
-	return engines;
-}
-
-static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
-{
-	struct drm_xe_query_mem_regions *mem_regions;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
-		.size = 0,
-		.data = 0,
-	};
-
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	mem_regions = malloc(query.size);
-	igt_assert(mem_regions);
-
-	query.data = to_user_pointer(mem_regions);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(mem_regions, query.size));
-
-	return mem_regions;
-}
-
-static struct drm_xe_query_eu_stall *xe_query_eu_stall_new(int fd)
-{
-	struct drm_xe_query_eu_stall *query_eu_stall;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
-		.size = 0,
-		.data = 0,
-	};
-
-	/* Support older kernels where this uapi is not yet available */
-	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
-		return NULL;
-	igt_assert_neq(query.size, 0);
-
-	query_eu_stall = malloc(query.size);
-	igt_assert(query_eu_stall);
-
-	query.data = to_user_pointer(query_eu_stall);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(query_eu_stall, query.size));
-
-	return query_eu_stall;
-}
-
-static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
-{
-	struct drm_xe_query_oa_units *oa_units;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_OA_UNITS,
-		.size = 0,
-		.data = 0,
-	};
-
-	/* Support older kernels where this uapi is not yet available */
-	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
-		return NULL;
-
-	oa_units = malloc(query.size);
-	igt_assert(oa_units);
-
-	query.data = to_user_pointer(oa_units);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(oa_units, query.size));
-
-	return oa_units;
-}
-
 static uint64_t native_region_for_gt(const struct drm_xe_gt *gt)
 {
 	uint64_t region;
@@ -412,11 +238,11 @@ struct xe_device *xe_device_get(int fd)
 	igt_assert(xe_dev);
 
 	xe_dev->fd = fd;
-	xe_dev->config = xe_query_config_new(fd);
-	xe_dev->hwconfig = xe_query_hwconfig_new(fd, &xe_dev->hwconfig_size);
+	xe_dev->config = xe_query_device(fd, DRM_XE_DEVICE_QUERY_CONFIG, NULL);
+	xe_dev->hwconfig = xe_query_device_may_fail(fd, DRM_XE_DEVICE_QUERY_HWCONFIG, &xe_dev->hwconfig_size);
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
-	xe_dev->gt_list = xe_query_gt_list_new(fd);
+	xe_dev->gt_list = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_LIST, NULL);
 
 	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
@@ -427,10 +253,10 @@ struct xe_device *xe_device_get(int fd)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
 
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
-	xe_dev->engines = xe_query_engines(fd);
-	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
-	xe_dev->eu_stall = xe_query_eu_stall_new(fd);
-	xe_dev->oa_units = xe_query_oa_units_new(fd);
+	xe_dev->engines = xe_query_device(fd, DRM_XE_DEVICE_QUERY_ENGINES, NULL);
+	xe_dev->mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL);
+	xe_dev->eu_stall = xe_query_device_may_fail(fd, DRM_XE_DEVICE_QUERY_EU_STALL, NULL);
+	xe_dev->oa_units = xe_query_device_may_fail(fd, DRM_XE_DEVICE_QUERY_OA_UNITS, NULL);
 
 	/*
 	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
@@ -860,7 +686,7 @@ static void __available_vram_size_snapshot(int fd, int gt, struct __available_vr
 	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
-		mem_regions = xe_query_mem_regions_new(fd);
+		mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL);
 		pthread_mutex_lock(&cache.cache_mutex);
 		mem_region->used = mem_regions->mem_regions[region_idx].used;
 		mem_region->cpu_visible_used =

-- 
2.43.0

