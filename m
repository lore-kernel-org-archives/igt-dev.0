Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE1CCFA1A
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADD210E88A;
	Thu,  6 Nov 2025 10:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXaOwwIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3610E884
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424944; x=1793960944;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=BmnnwdgtTjTHBt/ZKey6F4Xm2LBdqzL4zU3TiFeWfQI=;
 b=SXaOwwIMC3hOyJ7zTqacErzohXVxEn7+0sWz+MGGtjpTuXXJbqac7LLY
 SR1ZyyUnLIUyF2u8stxlVWGJbZJoE3cPoTZDv9og+8b5VAbUf68rGJNyS
 9HHn/Npcs8Usb8R+9wIAGWZgUEQGzADWQJym9gNYIdmyopVHT81eOmLqg
 GCiiX5KpiUQ/8cKw4HNvDqKdTziz02P5Yg/OyPtfgDs/ZM7EWAIvPhMfN
 Tp31s1u3ydzyy9r+e+4mUZx33fP7nh1YYJho1K2/2U3Vwt2v1KJfrvRjF
 CiWyiMiJU8UCrWWWyEfXxEJ7MVCR56mfd5bVXiHvOO/xPaa8EVDevf70S Q==;
X-CSE-ConnectionGUID: ZAFcU3iITaWQ0bNVspk8IQ==
X-CSE-MsgGUID: 1QlNxcxpSR+pg52UH8iOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960956"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:04 -0800
X-CSE-ConnectionGUID: 9YiN7BI8QtOKLwmmwJ3j3Q==
X-CSE-MsgGUID: ZQgZP3/QSKePOY3hkHSDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667924"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:03 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 06 Nov 2025 11:27:28 +0100
Subject: [PATCH 3/7] lib/xe/xe_query: introduce helper for device query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-xe_query_helpers-v1-3-d761a944c237@intel.com>
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9102;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=BmnnwdgtTjTHBt/ZKey6F4Xm2LBdqzL4zU3TiFeWfQI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHgmippIeG6bMgQDoFdrFrI/HIGJzM/OaXKRw
 QVq6llv0vOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4JgAKCRAjYrKT3hD9
 1zfRC/9PkUYF77ztTzv0DqwQ4c8Wqa5DYF5emYS0oa0aecoO6NkMGnZI7A45k5xmns6K/9FmoE8
 M06s+jQib789PKI2yjI6BXU/MndIxCtRaCogt12pYT8c+k5TxA4zuGTpzvj4UicJMt79yYAnpqD
 dnGKf7S/z18SuWdcKtZCT9AXUkr5C5ur+T7DcfaTRuVk9ttOubGTEHGHAHaWVo5o/8CoKz5UMqR
 zUemmklDBlVNQSR7uMO0XvBu7exHxDcvE4yDs/iPn2l3K9KmZPLJcJEQcYiYWB2TSo9gcPY/Vw6
 /b9iQCw6MHhSF4JcjM4fRSY8IfzexIBUyv8b8JJSJv35PFiw/09tY5il1z4ZdIfWgU4W4aDD1wJ
 xfaqOTD+OG7WD6qga6/WZwEVTwdrr98s4TR/lNKPN/vgDrZUo+wcfjPFg7XNSyIRnqZdV34PhQq
 SgCg6X/s8ZGS54RKnWM6tkqAdL8l+PctB3XQprap/Y4tWfFTL0CjxZBIpjJL9x30Obf2Q=
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

The helper abstracts out common bits of DRM_XE_DEVICE_QUERY_HWCONFIG ioctl:
- query data size,
- alloc memory,
- get data,
- error checks,
- valgrind annotations.

Since almost all users of DRM_XE_DEVICE_QUERY_HWCONFIG use asserts for
error checking helper uses them as well.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.c | 195 ++++++++----------------------------------------------
 lib/xe/xe_query.h |   1 +
 2 files changed, 30 insertions(+), 166 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index d8ea79108d67dbbb8c859762b1f56d954ee749c3..f40a8a86c84fd2825b04729b0ba32b51a22de4d0 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -25,81 +25,41 @@
 #include "xe_query.h"
 #include "xe_ioctl.h"
 
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
+/**
+ * xe_query_device:
+ * @fd: xe device fd
+ * @type: query type, one of DRM_XE_DEVICE_QUERY_* values
+ * @size: pointer to get size of returned data, can be NULL
+ *
+ * Calls DRM_IOCTL_XE_DEVICE_QUERY ioctl to query device information
+ * about specified @type. Returns pointer to malloc'ed data, which
+ * should be freed later by the user.
+ * The function asserts on ioctl and malloc errors.
+ */
+void *xe_query_device(int fd, uint32_t type, uint32_t *size)
 {
-	uint32_t *hwconfig;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
+		.query = type,
 		.size = 0,
 		.data = 0,
 	};
+	void *data;
 
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
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
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
+	data = malloc(query.size);
+	igt_assert(data);
 
+	query.data = to_user_pointer(data);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	gt_list = malloc(query.size);
-	igt_assert(gt_list);
+	VG(VALGRIND_MAKE_MEM_DEFINED(data, query.size));
 
-	query.data = to_user_pointer(gt_list);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(gt_list, query.size));
+	if (size)
+		*size = query.size;
 
-	return gt_list;
+	return data;
 }
 
 static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
@@ -114,103 +74,6 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
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
@@ -369,11 +232,11 @@ struct xe_device *xe_device_get(int fd)
 	igt_assert(xe_dev);
 
 	xe_dev->fd = fd;
-	xe_dev->config = xe_query_config_new(fd);
-	xe_dev->hwconfig = xe_query_hwconfig_new(fd, &xe_dev->hwconfig_size);
+	xe_dev->config = xe_query_device(fd, DRM_XE_DEVICE_QUERY_CONFIG, NULL);
+	xe_dev->hwconfig = xe_query_device(fd, DRM_XE_DEVICE_QUERY_HWCONFIG, &xe_dev->hwconfig_size);
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
-	xe_dev->gt_list = xe_query_gt_list_new(fd);
+	xe_dev->gt_list = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_LIST, NULL);
 
 	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
@@ -384,10 +247,10 @@ struct xe_device *xe_device_get(int fd)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
 
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
-	xe_dev->engines = xe_query_engines(fd);
-	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
-	xe_dev->eu_stall = xe_query_eu_stall_new(fd);
-	xe_dev->oa_units = xe_query_oa_units_new(fd);
+	xe_dev->engines = xe_query_device(fd, DRM_XE_DEVICE_QUERY_ENGINES, NULL);
+	xe_dev->mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL);
+	xe_dev->eu_stall = xe_query_device(fd, DRM_XE_DEVICE_QUERY_EU_STALL, NULL);
+	xe_dev->oa_units = xe_query_device(fd, DRM_XE_DEVICE_QUERY_OA_UNITS, NULL);
 
 	/*
 	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
@@ -801,7 +664,7 @@ static void __available_vram_size_snapshot(int fd, int gt, struct __available_vr
 	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
-		mem_regions = xe_query_mem_regions_new(fd);
+		mem_regions = xe_query_device(fd, DRM_XE_DEVICE_QUERY_MEM_REGIONS, NULL);
 		pthread_mutex_lock(&cache.cache_mutex);
 		mem_region->used = mem_regions->mem_regions[region_idx].used;
 		mem_region->cpu_visible_used =
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index acf3291b07968e829e6e72ebcbf08f00e847e27a..9e4512fa03ac619e3d59b017eed4a58b294f716c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -137,6 +137,7 @@ bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
+void *xe_query_device(int fd, uint32_t type, uint32_t *size);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 

-- 
2.43.0

