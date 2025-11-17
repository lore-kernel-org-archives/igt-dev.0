Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F79CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0071010E1B3;
	Mon, 17 Nov 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jca26UCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6404210E1BE
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376561; x=1794912561;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yGkzLqJsP5ZExk3waBKK62PKjNEA1ReT3mYWTl6dhv4=;
 b=jca26UCyiANLuSJByMZLC3fiQj2ykBnPPWuQpsStnrPavOf0tcWPb29L
 ak2XM/iX+SaGApYoEOIyXTQAhKeQ/iKRxT0XjYJCkogD+YtHt+l83yPFp
 gYgYqRoDrRarKAtXCVnMBwujm9C+MRBblw3Js4fROkn5GvwW5300++Eky
 ADPJg5T+9CZn8BtYNMt07IFfcURjd3m+l6/EKCalKnpsuxBxHJCwg6ld1
 Hy3fEZFJBaiO3g8bM9oG6UGjUpB37eAKh4JHKTrlsjfwh7uZNI/2ojLbp
 eHCK6dBMUFXAdH056NGgFwBZlzpFZfTSeWowtvDz/oYs0gzL7xiLuyw8H Q==;
X-CSE-ConnectionGUID: FGO0ma62SUWXFWuGsQcUcg==
X-CSE-MsgGUID: pRpsBA/fTw62K201RYiYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306099"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:21 -0800
X-CSE-ConnectionGUID: Pi6K0iQgTxSis8jzvumdWA==
X-CSE-MsgGUID: 58iymxLFRWir8B8ki8C9CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213817990"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:18 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:42 +0100
Subject: [PATCH v3 4/8] lib/xe/xe_query: use recently introduced helper to
 query device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-4-25d984ae58cb@intel.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7540;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=yGkzLqJsP5ZExk3waBKK62PKjNEA1ReT3mYWTl6dhv4=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1ji7Vj+d7HsWelIs9D/XadQGRtavzGtO4aA
 ef6q+2+XdSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9YwAKCRAjYrKT3hD9
 17KGDAC0ODGiUYMFTL1bGxndznGsMaEvj0n8CCnIBTPKgqQREblWJOu8FLvTh9p9FGVTWKR2SF6
 n7F7gr1oKkZ4+R1sXVW9PFUjijC5oemDESroDo5pHqm3O9d7yuUsc4InpinlAJtp65pp7lVtQgV
 ZtZLSLLl4DaW+8VJHi1teBLHTKtFu5t8dVGFvlWW+eB56iax9VNhZuut6IIZSxVR3bTY69G3ZDf
 9Lnkerts+ClU6xkBhoaSVfhih00gQhka+RUTX/EoP/wXkDPaPEAuOS+SqsyetJbh5r92PJkBoXp
 2Ms+RabdzeGc++FtUv/zQmLQGb6GZSr3VDdfhI3Vj5SZG8+9lfezeccMiOUlM9hgukEKvbh9Znf
 wPmwVIkw9OZj8/M6Q+VUIhT6wHxwI2/Ahlq+RAnCwuoFM3Qv+95n6sjYGFfR3oWnCqDvr7GECSs
 70HXlgrwtJfxw7EXErEex+SpdlwJzA56r1QYDFOPJEfhJoFAAA45A06k9on+usnkhkiT8=
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
index 4d46b36fa9754fc48e50633dd79f06b935ce8300..3049af6d9a1ab33636f808cf7efed2461b6c76d7 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -72,83 +72,6 @@ skip_query:
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
@@ -161,103 +84,6 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
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
@@ -416,11 +242,11 @@ struct xe_device *xe_device_get(int fd)
 	igt_assert(xe_dev);
 
 	xe_dev->fd = fd;
-	xe_dev->config = xe_query_config_new(fd);
-	xe_dev->hwconfig = xe_query_hwconfig_new(fd, &xe_dev->hwconfig_size);
+	xe_dev->config = xe_query_device(fd, DRM_XE_DEVICE_QUERY_CONFIG, NULL, false);
+	xe_dev->hwconfig = xe_query_device(fd, DRM_XE_DEVICE_QUERY_HWCONFIG, &xe_dev->hwconfig_size, true);
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
-	xe_dev->gt_list = xe_query_gt_list_new(fd);
+	xe_dev->gt_list = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_LIST, NULL, false);
 
 	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
@@ -431,10 +257,10 @@ struct xe_device *xe_device_get(int fd)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
 
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
-	xe_dev->engines = xe_query_engines(fd);
-	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
-	xe_dev->eu_stall = xe_query_eu_stall_new(fd);
-	xe_dev->oa_units = xe_query_oa_units_new(fd);
+	xe_dev->engines = xe_query_device(fd, DRM_XE_DEVICE_QUERY_ENGINES, NULL, false);
+	xe_dev->mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL, false);
+	xe_dev->eu_stall = xe_query_device(fd, DRM_XE_DEVICE_QUERY_EU_STALL, NULL, true);
+	xe_dev->oa_units = xe_query_device(fd, DRM_XE_DEVICE_QUERY_OA_UNITS, NULL, true);
 
 	/*
 	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
@@ -864,7 +690,7 @@ static void __available_vram_size_snapshot(int fd, int gt, struct __available_vr
 	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
-		mem_regions = xe_query_mem_regions_new(fd);
+		mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL, false);
 		pthread_mutex_lock(&cache.cache_mutex);
 		mem_region->used = mem_regions->mem_regions[region_idx].used;
 		mem_region->cpu_visible_used =

-- 
2.43.0

