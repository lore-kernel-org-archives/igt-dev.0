Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D979BC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 13:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2DA10E081;
	Mon, 14 Jul 2025 13:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nx8m4gTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3A610E081
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752498839; x=1784034839;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CFMwTFRO6N9DkxHcKy+Jrhj56JJC1vMYCZkMMiUnI5Q=;
 b=Nx8m4gTOTV8G81BrgxY78R4GK1Ukxk9t7ceoOHMSwWZy/YZ6GJP4qPtn
 Q3dxFBOtsRtI6ylZduVt/6u3ycZYV/v0piMkOob6kCWS4iXlJVEDTAiet
 s/Xfh+FuPL22pwBgZm1PhjwQELpah5qhOkIs8UlkESjPFe1+wKKat9bMc
 l2+TyzE32EQxmXdulIHm24GS0GZKyU309yRZhkllz+0yL/yhWhucRLn1d
 bjfdaG86PI+ZYozclCcwSIIZcG2an432ovyl/Dc+IHgcPumv4uWP2LooN
 HzzTkzQ9qZJhJWNoMM8n4RQs69ChSqy1FdxiCZNkvDFqJrRpuqvkgV3U9 Q==;
X-CSE-ConnectionGUID: ZZwcm4q3QRKQnqiP8PtRZg==
X-CSE-MsgGUID: zMBN7I8XT1CShrQOx6gOYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65390988"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65390988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 06:13:59 -0700
X-CSE-ConnectionGUID: V15GJGEGRby3o0UJW23Hnw==
X-CSE-MsgGUID: 0UiawEd+Q2i7fBavkL8oOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161235152"
Received: from dut2943pvc.iind.intel.com ([10.190.215.47])
 by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2025 06:13:57 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.d.roper@intel.com, nishit.sharma@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_multi_tile: Multi-tile support in IGT
Date: Mon, 14 Jul 2025 13:13:56 +0000
Message-ID: <20250714131356.1451824-1-nishit.sharma@intel.com>
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

Test checks wether platform supports multi-tile or not. Test peforms
sanity checks related to sysfs paths for GT IDs and Tile IDs. Test also
checks whether tiles returned by UAPI are in order or out of order.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/igt_sysfs.c             |   7 +-
 lib/xe/xe_query.h           |   7 ++
 tests/intel/xe_multi_tile.c | 141 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 4 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_multi_tile.c

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index af80e91ee..270120dd7 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -308,8 +308,13 @@ bool xe_sysfs_gt_has_node(int xe_device, int gt, const char *node)
 char *
 xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
 {
+	int tile;
 	struct stat st;
-	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
+	struct xe_device *xe_dev = xe_device_get(xe_device);
+
+	igt_assert(xe_dev);
+
+	tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? drm_xe_get_tile(xe_dev, gt) : 0;
 
 	if (xe_device < 0)
 		return NULL;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 6ff8576b9..49b591334 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -39,6 +39,9 @@ struct xe_device {
 	/** @gt_mask: bitmask of GT IDs */
 	uint64_t gt_mask;
 
+	/** @tile_mask: bitmask of Tile IDs */
+	uint64_t tile_mask;
+
 	/** @memory_regions: bitmask of all memory regions */
 	uint64_t memory_regions;
 
@@ -80,6 +83,10 @@ struct xe_device {
 	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
 	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
 	     igt_unique(__mask) &= ~(1ull << __gt))
+#define xe_for_each_tile(__fd, __tile) \
+	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
+	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
+	     igt_unique(__mask) &= ~(1ull << __tile))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
new file mode 100644
index 000000000..938a0b85a
--- /dev/null
+++ b/tests/intel/xe_multi_tile.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ *
+ * Authors:
+ *    Nishit Sharma <nishit.sharma@intel.com>
+ *
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
+ * TEST: To verify if multi-tile support available in platform
+ * Category: Core
+ * Mega feature: General Core features
+ * Functionality: Tile/GT operations
+ */
+
+/**
+ * SUBTEST: multi-tile-info
+ * Description: Test gathers Tile_ID/s,Tile_ID/s sys path,GT_ID/s path
+ * Test category: functionality test
+ */
+
+uint8_t tile_mis_count = -1;
+
+/*
+ * To check whether tiles are in order or not or if any tile order is
+ * skipped/missing as returned through UAPI
+ * Function returns 0 if all tiles in order or 1 otherwise
+ */
+static uint8_t
+xe_check_tile_order(struct xe_device *xe_dev)
+{
+	int prev_tile = -1, tile_id;
+
+	xe_for_each_tile(xe_dev->fd, tile_id) {
+		printf("Tile ID :%d\n", tile_id);
+		if (prev_tile != tile_id) {
+			if (++tile_mis_count != tile_id) {
+				igt_warn("Out of order TileID :%d available Tile_ID :%d\n",
+					  tile_mis_count, tile_id);
+				return tile_id;
+			}
+		}
+		prev_tile = tile_id;
+	}
+	return prev_tile;
+}
+
+static void
+xe_create_tile_mask(struct xe_device *xe_dev)
+{
+	/* GT IDs may be non-consecutive; keep a mask of valid Tile IDs */
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
+}
+
+/*
+ * To check whether multi-tile supported in platform
+ * Function takes device descriptior and xe_device
+ * structure pointer
+ */
+static int
+is_multitile_plat(struct xe_device *xe_dev)
+{
+	int gt_id;
+
+	xe_for_each_gt(xe_dev->fd, gt_id)
+		if (xe_dev->gt_list->gt_list[gt_id].tile_id > 0)
+			return true;
+	return false;
+}
+
+igt_main
+{
+	int fd, tile_id, sysfs_path;
+	struct xe_device *xe_dev;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_dev = xe_device_get(fd);
+		igt_assert(xe_dev);
+	}
+
+	igt_subtest("multi-tile-info") {
+
+		/** keep mask of valid Tile IDs **/
+		xe_create_tile_mask(xe_dev);
+
+		/** check multi-tile supported in platform **/
+		igt_skip_on_f(!is_multitile_plat(xe_dev),
+				"Multi-Tile not supported on this platform.\n");
+
+		/* Sanity check for valid tile_id available
+		 * Arbitrary gt_id passed as second argument
+		 * returned negative tile_id
+		 *
+		 */
+		tile_id = drm_xe_get_tile(xe_dev, 1);
+		if (tile_id < 0) {
+			tile_id = 0;
+			igt_require(!tile_id);
+		}
+
+		/** check tile order whether sequential or not**/
+		tile_id = xe_check_tile_order(xe_dev);
+		if (tile_id != tile_mis_count)
+			igt_warn("Expected tile_id :%d, Available :%d\n", tile_mis_count, tile_id);
+
+		/** Sanity to check valid GT path **/
+		sysfs_path = xe_sysfs_gt_open(fd, 1);
+		if (sysfs_path < 0)
+			sysfs_path = 0;
+		igt_skip_on(!sysfs_path);
+
+		/** Sanity to check valid Tile path **/
+		sysfs_path = xe_sysfs_tile_open(fd, 1);
+		if (sysfs_path < 0)
+			sysfs_path = 0;
+		igt_skip_on(!sysfs_path);
+
+		igt_info("Tile_id after iterating gt :%d\n", drm_xe_get_tile(xe_dev, 0));
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
+
diff --git a/tests/meson.build b/tests/meson.build
index 9b87a0d24..b45695f09 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -331,6 +331,7 @@ intel_xe_progs = [
 	'xe_sysfs_scheduler',
         'xe_sysfs_timeslice_duration',
         'xe_tlb',
+        'xe_multi_tile',
 ]
 
 intel_xe_eudebug_progs = [
-- 
2.43.0

