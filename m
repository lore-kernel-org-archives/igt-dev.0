Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFF4C19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 09:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4D310EC22;
	Fri, 28 Feb 2025 09:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEgXd+Gh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E1510EC22
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740734574; x=1772270574;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q3rKHLhvfw2DcCDBAqzuYURWXZfdWEypxicQzxWno40=;
 b=gEgXd+GhVFJB+PrLuiMixtXXQZvLf2rYa11/Pfot9I+w5Lsj8PY4hHWH
 7t10HE0uAwlKgzHvOUnC8c3X4omvfvoMqAYXZlSPu+drDgqrObKWIJXEY
 lHZ8wpoLLBatrJxLUIcFfoP/rxswWBPHpoNRijciIMA8A1xatzytqMwWV
 6le6geXQR8E4D9UAG6mSul8Nfg2iBitH2ieE0sl532QwzjPvICyY1NTQK
 YYBHfSU1xXuH6+DeCO0Ho+VGtQW3t2/nrqYllKsU10bd62DiKQX1fSlUX
 Q9DzjXXfTO6j9n9QLwIsUGtH1tESt5lmJ7jDiDPEaivCw8QFKhs+XiXIF A==;
X-CSE-ConnectionGUID: TibZ6b0VRTSrnAA/EyN2lQ==
X-CSE-MsgGUID: a3+W9lW8S8O5GLBbSLuBpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41504096"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="41504096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:22:52 -0800
X-CSE-ConnectionGUID: CVE2ugJwQa6qsiDtTQZkvw==
X-CSE-MsgGUID: ODXrJBRdSPGyYFQWa9IB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="122229510"
Received: from dut1011pvc.igk.intel.com ([10.211.176.222])
 by orviesa003.jf.intel.com with ESMTP; 28 Feb 2025 01:22:52 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_multi_tile: Multi-Tile support in IGT
Date: Fri, 28 Feb 2025 09:22:51 +0000
Message-ID: <20250228092251.15170-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

From: Nishit Sharma <nishit.sharma@intel.com>

Added functionality to check Multi-Tile available in platform or not. GT%d exposed
related to each Tile%d. Functionality added to check if any tile%d not provided by
driver or missed E.g.tile available in platforms in order tile0, tile1...tileX in
serial order, If tile1 tile2 tile4...tileX populated than will get Warning tile3 not available.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 include/drm-uapi/xe_drm.h   |  88 ++++++++
 lib/igt_sysfs.c             |   3 +-
 lib/xe/xe_query.h           |  38 +++-
 tests/intel/xe_multi_tile.c | 423 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 5 files changed, 551 insertions(+), 2 deletions(-)
 create mode 100644 tests/intel/xe_multi_tile.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 08e263b3b..5e2a54353 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -188,6 +188,94 @@ struct drm_xe_user_extension {
 	__u32 pad;
 };
 
+enum xe_gt_type {
+	XE_GT_TYPE_UNINITIALIZED,
+	XE_GT_TYPE_MAIN,
+	XE_GT_TYPE_MEDIA,
+};
+
+/**
+ * struct xe_gt - A "Graphics Technology" unit of the GPU
+ *
+ * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
+ * for implementing the graphics, compute, and/or media IP.
+ *
+ */
+struct xe_gt {
+	/** @tile: Backpointer to GT's tile */
+	struct drm_xe_tile *tile;
+
+	/** @info: GT info */
+	struct {
+		/** @info.type: type of GT */
+		enum xe_gt_type type;
+
+		/** @info.id: Unique ID of this GT within the PCI Device */
+
+		__u8 id;
+
+		/**
+		 * @gt_count: Number of GT/s available in tile
+		 *
+		 * */
+		__u8 gt_count;
+	} info;
+};
+
+/**
+ * struct drm_xe_tile - hardware tile structure
+ *
+ * Tile structure contains info like tile ID, vram id, flag to check any tile
+ * missing or out of order, gt count per tile
+ *
+ */
+struct drm_xe_tile {
+	/** @xe: Backpointer to tile's PCI device */
+	struct xe_device *xe;
+
+	/** @id: ID of the tile */
+	__u8 id;
+
+	/**
+	 * @vram_id: ID of associated TTM VRAM region
+	 *
+	 * For multi-tile platforms not using unified vram, this is same
+	 * as @id.  Otherwise this is always 0 to denote a single unified
+	 * vram region is in use.
+	 */
+	__u8 vram_id;
+
+	/**
+	 * @mis_tile: Flasg to check if tile ID missing or out of order
+	 *
+	 */
+	__u8 mis_tile:1;
+
+	/**
+	 * @gt_count: Number of GT/s available in tile
+	 *
+	 * */
+	__u8 gt_count;
+
+	/**
+	 * @primary_gt: Primary GT
+	 */
+	struct xe_gt *primary_gt;
+
+	/**
+	 * @media_gt: Media GT
+	 *
+	 * Only present on devices with media version >= 13.
+	 */
+	struct xe_gt *media_gt;
+
+	/**
+	 * @gt_list: List of GT descriptors from driver
+	 *
+	 */
+	struct drm_xe_query_gt_list *gt_list;
+};
+
 /**
  * struct drm_xe_ext_set_property - Generic set property extension
  *
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2e4c2ee63..6fb70ccc9 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -235,7 +235,8 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 
 	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
-			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
+			 major(st.st_rdev), minor(st.st_rdev),
+			 xe_gt_get_tile_id(xe_device, gt), gt);
 	else
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
 			 major(st.st_rdev), minor(st.st_rdev), gt);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index a84a6bfa5..34fea94d1 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -21,6 +21,7 @@
 #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
 
 struct xe_device {
+#define XE_MAX_TILES_PER_DEVICE	4
 	/** @fd: xe fd */
 	int fd;
 
@@ -36,6 +37,27 @@ struct xe_device {
 	/** @gt_list: gt info */
 	struct drm_xe_query_gt_list *gt_list;
 
+	/** @tiles: device tiles */
+	struct drm_xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
+
+	/** @info: device info */
+	struct drm_xe_tile_info {
+		/** @info.tile_count: Number of tiles */
+		uint8_t tile_count;
+		/** @info.gt_count: Total number of GTs for entire device */
+		uint8_t gt_count;
+		/** @tile_unvailable: Flag to check if tile is missing or out of order */
+		uint8_t tile_unavailable:1;
+		/** @mis_tile: Tile ID missing or out of order */
+		uint8_t mis_tile_id[XE_MAX_TILES_PER_DEVICE];
+		/** @mis_tile_count: missing TIle ID **/
+		uint8_t mis_tile_count;
+		/** @info.graphics_verx100: graphics IP version */
+		__u32 graphics_verx100;
+		/** @info.media_verx100: media IP version */
+		__u32 media_verx100;
+	} info;
+
 	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
 
@@ -75,13 +97,22 @@ struct xe_device {
 	     ++__class)
 #define xe_for_each_gt(__fd, __gt) \
 	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
-
+#define xe_for_each_tile(tile__, xe__, id__) \
+        for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
+                for_each_if((tile__) = &(xe__)->tiles[(id__)])
+#define xe_for_each_remote_tile(tile__, xe__, id__) \
+        for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
+                for_each_if((tile__) = &(xe__)->tiles[(id__)])
+#define xe_for_each_device_gt(gt__, xe__, id__) \
+       for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
+               for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
 
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
+#define MEDIA_VER(xe) ((xe)->info.media_verx100 / 100)
 
 /*
  * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
@@ -89,6 +120,11 @@ struct xe_device {
  */
 #define XE_MAX_ENGINE_INSTANCE	9
 
+/*
+ * Max possible GT per Tile
+ */
+#define XE_MAX_GT_PER_TILE	2
+
 unsigned int xe_number_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
new file mode 100644
index 000000000..c5b2e0472
--- /dev/null
+++ b/tests/intel/xe_multi_tile.c
@@ -0,0 +1,423 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ * 
+ * Authors:
+ *    Nishit Sharma <nishit.sharma@intel.com>
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: Test to verify if multi-tile support available in platform
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Tile/GT operations
+ * Functionality: multi-tile
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: multi-tile-info
+ * Description: Test gathers Tile_ID/s and GT_ID/s, update internal struct
+ */
+
+struct xe_gt *xe_gt_alloc(struct drm_xe_tile *tile);
+int xe_tile_init(struct drm_xe_tile *tile, struct xe_device *xe, uint8_t id);
+struct drm_xe_tile *xe_device_get_root_tile(struct xe_device *xe);
+struct xe_gt *xe_tile_get_gt(struct drm_xe_tile *tile, u8 gt_id);
+struct xe_gt *xe_device_get_gt(struct xe_device *xe_dev, uint8_t gt_id);
+
+/*
+ * xe_gt_list: Get the list of gt%d, tile%d and count from driver
+ * @fd: GPU device descriptor
+ *
+ * Function gets the count of gt available in device
+ * including other information such as gt count, graphics ip version
+ *
+ * Return: Returns drm_xe_query_gt_list pointer
+ */
+struct drm_xe_query_gt_list *xe_gt_list(int fd)
+{
+	struct drm_xe_query_gt_list *gt_list;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	gt_list = malloc(query.size);
+	igt_assert(gt_list);
+
+	query.data = to_user_pointer(gt_list);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	return gt_list;
+}
+/*
+ * xe_gt_alloc: Memory allocation for gt struct and initializing 
+ * 		struct drm_xe_tile as per gt
+ * @tile *: Tile structure
+ *
+ * This allocates memory per GT available on tile and assigns corresponding tile address
+ * to corresponding gt
+ *
+ * Return: Returns gt structure pointer
+ */  
+struct xe_gt *xe_gt_alloc(struct drm_xe_tile *tile)
+{
+	struct xe_gt *gt;
+
+	gt = malloc(sizeof(*gt));
+	igt_assert(gt);
+
+	gt->tile = tile;
+	return gt;
+}
+/**
+ * xe_tile_init - Initialize the tile structure and allocates memmory for primary GT
+ * @tile: Tile to initialize
+ * @xe: Parent Xe device
+ * @id: Tile ID
+ *
+ * Initializes per-tile resources.
+ *
+ * Returns: 0 on success, assert if no memory allocation.
+ */
+int xe_tile_init(struct drm_xe_tile *tile, struct xe_device *xe, uint8_t id)
+{
+	tile->xe = xe;
+	tile->id = id;
+
+	tile->primary_gt = xe_gt_alloc(tile);
+	igt_assert(tile->primary_gt);
+
+	return 0;
+}
+/**
+ * xe_device_get_root_tile: Returns address of root tile
+ * @xe: GPU Device structure which holds information about tile
+ * 	available in system
+ *
+ * Return: root tile address
+ */
+struct drm_xe_tile *xe_device_get_root_tile(struct xe_device *xe)
+{
+	return &xe->tiles[0];
+}
+/**
+ * xe_tile_get_gt: Return address gt struct
+ * @tile *: Tile associated with gt
+ * @gt_id: gt%d 
+ *
+ * Returns: Based on gt_id passed xe_gt address returned which
+ * 	    can be media_gt or primary gt 
+ */
+struct xe_gt *xe_tile_get_gt(struct drm_xe_tile *tile, u8 gt_id)
+{
+	igt_assert_f(gt_id <= XE_MAX_GT_PER_TILE, "gt_id greater than defined XE_MAX_GT_PER_TILE");
+
+	return gt_id ? tile->media_gt : tile->primary_gt;
+}
+/**
+ * @xe_dev: GPU Device structure which holds information about tile
+ * @gt_id: gt%d
+ *
+ * Returns: gt struct address based on media version available in platform
+ */
+struct xe_gt *xe_device_get_gt(struct xe_device *xe_dev, uint8_t gt_id)
+{
+	struct drm_xe_tile *root_tile = xe_device_get_root_tile(xe_dev);
+	struct xe_gt *gt;
+
+	if (MEDIA_VER(xe_dev) >= 13)
+		gt = xe_tile_get_gt(root_tile, gt_id);
+	else
+		gt = xe_dev->tiles[gt_id].primary_gt;
+
+	igt_assert(gt);
+
+	return gt;
+}
+/**
+ * @xe_dev: GPU Device structure which holds information about tile 
+ * @gt_id: gt%d
+ *
+ * Check gt%d passed available or not on tile%d
+ *
+ * Return: None
+ */
+static void igt_check_gt_per_tile(struct xe_device *xe_dev, uint8_t gt_id)
+{
+	uint8_t id;
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt;
+
+	xe_for_each_device_gt(gt, xe_dev, id) {
+		tile = gt->tile;
+		if(gt_id == gt->info.id)
+		{
+			igt_info("GT ID :%d available in Tile :tile%d\n",
+				 gt_id, tile->id);
+		}
+	}
+}
+/**
+ * @xe_dev: GPU Device structure which holds information about tile
+ * @gt_id: gt%d
+ *
+ * To query gt%d available in tile%d by iterating over list of tiles available
+ *
+ * Returns: None
+ */
+static void igt_query_gt_per_tile(struct xe_device *xe_dev, uint8_t gt_id)
+{
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt;
+
+	xe_for_each_tile(tile, xe_dev, gt_id) {
+		gt = tile->primary_gt;
+
+		if(MEDIA_VER(xe_dev) >= 12)
+			gt = tile->media_gt;
+
+		igt_info("Inside GT Id :%d GT type :%d GT count :%d for Tile ID :%d GT count in Tile :%d\n",
+				gt->info.id, gt->info.type, gt->info.gt_count, tile->id, tile->gt_count);
+	}
+}
+/**
+ * igt_show_device_gt: To show gt availale on GPU device
+ * @xe_dev: GPU Device structure which holds information about tile
+ * @fd: GPU device descriptor
+ *
+ * Show GT%d available on device
+ *
+ * Return: None
+ */
+static void igt_show_device_gt(struct xe_device *xe_dev, int fd)
+{
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt;
+
+	uint8_t id;
+
+	xe_for_each_device_gt(gt, xe_dev, id) {
+		tile = gt->tile;
+		igt_info("GT Id :%d GT type :%d Tile ID :%d\n",
+				gt->info.id, gt->info.type, tile->id);
+	}
+}
+/**
+ * igt_gt_init_per_tile: Initialize xe_gt structure per gt%d and per tile%d
+ * @xe_dev: GPU Device structure which holds information about tile
+ * @fd: GPU device descriptor
+ *
+ * Returns: 0 in case of success or assert
+ */
+static uint8_t igt_gt_init_per_tile(struct xe_device *xe_dev, int fd)
+{
+	uint8_t gt_id = 0;
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt;
+	int ip_version, media_version;
+	char name[100];
+	FILE *file;
+
+	igt_info("per Tile initialization\n");
+
+	xe_for_each_tile(tile, xe_dev, gt_id) {
+		int err;
+		err = xe_tile_init(tile, xe_dev, gt_id);
+		igt_assert_eq(err, 0);
+	}
+
+	xe_for_each_tile(tile, xe_dev, gt_id) {
+		gt = tile->primary_gt;
+		//new_gt = gt;
+		gt->info.id = xe_dev->info.gt_count++;
+		gt->info.type= XE_GT_TYPE_MAIN;
+		gt->info.gt_count++;
+		tile->gt_count++;
+
+		file = fopen("/sys/kernel/debug/dri/0/info", "r");
+		igt_assert(file);
+
+		while (fscanf(file, "%s %d", name, &ip_version) == 1) {
+			ip_version = -1;
+		}
+		while (fscanf(file, "%s %d", name, &media_version) == 1) {
+			media_version = -1;
+		}
+
+		fclose(file);
+
+		xe_dev->info.graphics_verx100 = ip_version;
+		xe_dev->info.media_verx100 = media_version;
+
+		if (MEDIA_VER(xe_dev) < 13)
+			continue;
+
+		/*
+		 * Allocate and setup media GT for platforms with standalone
+		 * media.
+		 *
+		 */
+		tile->media_gt = xe_gt_alloc(tile);
+		igt_assert(tile->media_gt);
+		gt->info.type = XE_GT_TYPE_MEDIA;
+		gt->info.id = xe_dev->info.gt_count++;
+		gt->info.gt_count++;
+		tile->gt_count++;
+	}
+
+	return 0;
+}
+/**
+ * igt_check_missing_tile_sysfs: Checking if tile missing or out of order in system
+ * @xe_device: GPU Device structure which holds information about tile
+ * @fd: Device descriptor
+ *
+ * This opens the sysfs tile directory corresponding to device and tile for use
+ * The mis_tile_id[] contains tile%d which is checked with sysfs whether entry is present
+ * or not. E.g. After tile2 user get tile4, tile3 is missing which will be checked in sysfs path  
+ *
+ * Returns: None
+ */
+static void igt_check_missing_tile_sysfs(struct xe_device *xe_dev,
+					 int fd)
+{
+	char path[96];
+
+	igt_info("Checking missing tiles with sysfs\n");
+
+	for(int mis = 0; mis < xe_dev->info.mis_tile_count; mis++) {
+		xe_sysfs_tile_path(fd, xe_dev->info.mis_tile_id[mis], path, sizeof(path));
+	}
+
+	igt_assert_f(xe_dev->info.mis_tile_count < 0, "No Tile entry in sysfs found.");
+}
+/**
+ * igt_check_if_missingtile: Checking if tile missing by iterating over
+ * 			     filled mis tile array
+ * @xe_dev: GPU Device structure which holds information about tile
+ * fd: GPU device descriptor
+ *
+ * Returns: None
+ */
+static void igt_check_if_missingtile(struct xe_device *xe_dev, int fd)
+{
+	igt_info("Checking missing/out of order tiles\n");
+
+	for(int i= 0; i < xe_dev->info.mis_tile_count; i++){
+		igt_warn("Tile :%d out of order/missing\n",
+				xe_dev->info.mis_tile_id[i]);
+	}
+}
+/**
+ * igt_get_tile_count: To get count of tile/s available in system,
+ * 		       Getting missing tile and tle count if any
+ * @xe_dev: GPU Device structure which holds information about tile
+ * @fd: Device descriptor
+ * gt_list: list of gt%d and relavant information returned from Driver via IOCTL
+ *
+ * Return: Tile count
+ */
+static uint8_t igt_get_tile_count(struct xe_device *xe_dev, int fd,
+				  struct drm_xe_query_gt_list *gt_list)
+{
+	int prev_tile = -1, tile_id;
+	uint8_t tile_mis_count = -1;
+
+	for(int index = 0; index < gt_list->num_gt; index++) {
+		tile_id = gt_list->gt_list[index].tile_id;
+		if(prev_tile != tile_id)
+		{
+			if(++tile_mis_count != tile_id) {
+				xe_dev->info.tile_unavailable = true;
+				xe_dev->info.mis_tile_id[xe_dev->info.mis_tile_count++] = tile_mis_count;
+			}
+			prev_tile = tile_id;
+			xe_dev->info.tile_count++;
+		}
+		xe_dev->info.tile_unavailable = false;
+	}
+
+	return xe_dev->info.tile_count;
+}
+
+igt_main
+{
+	int fd;
+	struct drm_xe_query_gt_list *gt_list;
+	struct xe_device *xe_dev;
+	struct drm_xe_tile *tile;
+	uint8_t gt_count;
+	uint8_t gt_arr[] = {0,1,2,3,4,5,6,7,8};
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_dev = xe_device_get(fd);
+	}
+
+	tile = malloc(sizeof(*tile));
+	igt_assert(tile);
+
+	igt_subtest("multi-tile-info") {
+		/** get gt information from driver using ioctl **/
+		gt_list = xe_gt_list(fd);
+		/** store pointer returned from driver which have gt information **/
+		tile->gt_list = gt_list;
+
+		/** Get tile count, initialize flag to check if any tile missing
+		 * Fill internal struct
+		 */
+		gt_count = igt_get_tile_count(xe_dev, fd, gt_list);
+		igt_assert_neq(gt_count, 0);
+		igt_info("Tiles :%d available in platform\n", gt_count);
+
+		/** check if multi-tile supported in platform */
+		igt_assert_f(xe_dev->info.tile_count > 1,
+				"Multi-Tile not supported in platform :%d\n",
+				xe_dev->info.tile_count);
+
+		/************* Per Tile Initilization ***********/
+		igt_assert_eq(igt_gt_init_per_tile(xe_dev, fd), 0);
+
+		/******** Condition to check if any tile missing/out of order *****/
+		if (xe_dev->info.tile_unavailable)
+			igt_check_if_missingtile(xe_dev, fd);
+
+		/******* Checking missing/out of order tile comparing with sysfs ***/
+		if (xe_dev->info.tile_unavailable)
+			igt_check_missing_tile_sysfs(xe_dev, fd);
+
+		/****** Display GT information on GPU Device  *******/
+		igt_show_device_gt(xe_dev, fd);
+
+		/****** Query GT per Tile *****/
+		igt_query_gt_per_tile(xe_dev, fd);	
+
+		/***** Checking GT exist, if exist on which tile or doesn't exist ******/
+		for(int gt_id = 0; gt_id < sizeof(gt_arr); gt_id++)
+			igt_check_gt_per_tile(xe_dev, gt_id);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a0f984b34..9def89f38 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -294,6 +294,7 @@ intel_xe_progs = [
 	'xe_exec_reset',
 	'xe_exec_sip',
 	'xe_exec_store',
+        'xe_multi_tile',
 	'xe_exec_threads',
 	'xe_exercise_blt',
 	'xe_fault_injection',
-- 
2.43.0

