Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7FEC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 10:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5310E09D;
	Tue, 18 Mar 2025 10:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QF4LY48x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46E10E09D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742294264; x=1773830264;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kctua6vGzvsq++xYfBYj+v34By9a4eI8POSygCMtTl4=;
 b=QF4LY48xb3x6jCWealkvvMcdzsRA6dQktmYCndaG3aATH4CEvLBembJ/
 ifi8RyfsToXoXCq+5499cnXFFNo9TPcu9Kkm/hAwhIDl9QhTpIRrd75SV
 XZHo1QLsPhoAITWPf9VsvjsxR60WQ2X0ZGyCi41ymZipg+4C5RZvox/9i
 F2TvLE/wLrs7MMOa/dCdm2xCkjMukeDTdAyxS+PQEB4kpzs3ErY1E79kl
 NZADaY4E5ouIILxItucPwtzEuCqO6qMo7I4lcp8FdDwngMgRUw7UYwmea
 bWkZ+NsaHgUCq+xIkoWnY+SlWcg5w488tZCu8e6Mmre40yJhYLsyU5x8D A==;
X-CSE-ConnectionGUID: P5Y2zS6WTC6qOTsEmEgnTA==
X-CSE-MsgGUID: D0ZF2RUgRgCa4lnQkqLiQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43443636"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43443636"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 03:37:43 -0700
X-CSE-ConnectionGUID: JOQJI/7QSpqUHg58IniH1w==
X-CSE-MsgGUID: 3TUGMaVcRc2den9DRfLJLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="122983524"
Received: from dut2943pvc.iind.intel.com ([10.190.215.176])
 by fmviesa009.fm.intel.com with ESMTP; 18 Mar 2025 03:37:41 -0700
From: nishit.sharma@intel.com
To: matthew.d.roper@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] PVC: tests/intel/xe_multi_tile: Added Multi tile
 verification in available platform
Date: Tue, 18 Mar 2025 10:37:40 +0000
Message-ID: <20250318103740.124966-1-nishit.sharma@intel.com>
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

This multi-tile test verifies whether platform supports multi-tile or
not. If multi-tile supported then how many gt belongs to single tile%d
and type of each gt.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_tile.c | 274 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 275 insertions(+)
 create mode 100644 tests/intel/xe_multi_tile.c

diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
new file mode 100644
index 000000000..d302dce28
--- /dev/null
+++ b/tests/intel/xe_multi_tile.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Authors:
+ *      Nishit Sharma <nishit.sharma@intel.com>
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
+ * Functionality: Tile/GT operations
+ */
+
+/**
+ * SUBTEST: multi-tile-info
+ * Description: Test gathers Tile_ID/s, GT_ID/s, GT Type info
+ * Test category: functionality test
+ *
+ */
+
+/**
+ * struct xe_gt_info - Holds ID and Type info for GT
+ * This structure required to check gt_id belongs to specific
+ * tile%d and gt_type which should differ for each gt
+ * Can be optimized in future
+ */
+struct xe_gt_info {
+	/* GT ID */
+	int gt_id;
+
+	/* GT Type */
+	int gt_type;
+};
+
+/**
+ * struct xe_tile - Holds gt_count and gt_info per tile%d
+ * This structure required to store tile%d related info like
+ * number of gt/s belongs to single tile
+ * Can be optimized in future
+ */
+struct xe_tile {
+#define XE_MAX_TILES_PER_DEVICE	2
+#define XE_MAX_GT_PER_DEVICE	4
+
+	/* GT count */
+	int gt_count;
+
+	/* GT info */
+	struct xe_gt_info gt_info[XE_MAX_GT_PER_DEVICE];
+}tile[XE_MAX_TILES_PER_DEVICE];
+
+/*
+ * Get gt_list using XE_DEVICE_QUERY UAPI returned by Driver
+ * gt_list holds tile ID/s, gt ID/s, type and other information
+ *
+ */
+static struct drm_xe_query_gt_list *xe_query_gt_list(int fd)
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
+
+/*
+ * Dipslay gt_list information to user
+ * gt_list holds tile ID/s, gt ID/s, type and other information
+ *
+ */
+static void
+xe_show_gt_info(int fd, struct drm_xe_query_gt_list *gt_list)
+{
+	uint16_t dev_id;
+	dev_id = intel_get_drm_devid(fd);
+	igt_assert(gt_list);
+
+	igt_info("Displaying GT Info\n");
+	for (int i = 0; i < gt_list->num_gt; i++) {
+		int verx100 = 100 * gt_list->gt_list[i].ip_ver_major +
+			gt_list->gt_list[i].ip_ver_minor;
+
+		igt_info("type: %d\n", gt_list->gt_list[i].type);
+		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
+		igt_info("IP version: %d.%02d, stepping %d\n",
+				gt_list->gt_list[i].ip_ver_major,
+				gt_list->gt_list[i].ip_ver_minor,
+				gt_list->gt_list[i].ip_ver_rev);
+		igt_info("reference_clock: %u\n", gt_list->gt_list[i].reference_clock);
+		igt_info("near_mem_regions: 0x%016llx\n",
+				gt_list->gt_list[i].near_mem_regions);
+		igt_info("far_mem_regions: 0x%016llx\n",
+				gt_list->gt_list[i].far_mem_regions);
+		igt_info("type of gt: %d\n",
+				gt_list->gt_list[i].type);
+		igt_info("tile_id: %d\n",
+				gt_list->gt_list[i].tile_id);
+
+		/* Sanity check IP version. */
+		if (verx100) {
+			/*
+			 * First GMD_ID platforms had graphics 12.70 and media
+			 * 13.00 so we should never see non-zero values lower
+			 * than those.
+			 */
+			if (gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
+				igt_assert_lte(1300, verx100);
+			else
+				igt_assert_lte(1270, verx100);
+
+			/*
+			 * Aside from MTL/ARL and media on BMG, all version
+			 * numbers should be 20.00 or higher.
+			 */
+			if (IS_METEORLAKE(dev_id))
+				continue;
+			if (gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA &&
+					IS_BATTLEMAGE(dev_id))
+				continue;
+
+			igt_assert_lte(20, gt_list->gt_list[i].ip_ver_major);
+		}
+	}
+}
+
+/*
+ * To check whether tiles are in order or not or if any tile order is
+ * skipped/missing as returned through UAPI
+ * Function returns 0 if all tiles in order or sequenctial otherwise
+ * returns 1
+ */
+static uint8_t
+xe_check_tile_order(int fd, struct drm_xe_query_gt_list *gt_list)
+{
+	int prev_tile = -1, tile_id;
+	uint8_t tile_mis_count = -1;
+
+	igt_info("Verifying tile order/sequence available in platform\n");
+	for(int index = 0; index < gt_list->num_gt; index++) {
+		tile_id = gt_list->gt_list[index].tile_id;
+		if(prev_tile != tile_id)
+		{
+			if(++tile_mis_count != tile_id) {
+				return 1;
+			}
+			prev_tile = tile_id;
+		}
+	}
+
+	igt_info("Tiles available in platform are in order/sequential\n");
+	return 0;
+}
+
+/*
+ * To get tile count. UAPI returns tile ID based on GT ID
+ * tile count is calculated and rturned for further processing
+ */
+static int
+xe_get_tile_count(int fd, struct drm_xe_query_gt_list *gt_list)
+{
+	int prev_tile = -1, tile_id, tile_index = 0;
+	int tile_count = 0;
+
+	for(int index = 0; index < gt_list->num_gt; index++) {
+		tile_id = gt_list->gt_list[index].tile_id;
+		if(prev_tile != tile_id)
+		{
+			prev_tile = tile_id;
+			tile[tile_id].gt_count++;
+			tile[tile_id].gt_info[index].gt_id = index;
+			tile[tile_id].gt_info[index].gt_type = gt_list->gt_list[index].type;
+			tile_count++;
+			tile_index = tile_id;
+		}
+		else
+		{
+			tile[tile_index].gt_count++;
+			tile[tile_index].gt_info[index].gt_id = index;
+			tile[tile_index].gt_info[index].gt_type = gt_list->gt_list[index].type;
+		}
+	}
+
+	tile_index = 0;
+	tile_id = 0;
+
+	return tile_count;
+}
+
+/*
+ * To check gt type. UAPI returns gt type based on gt ID
+ * The gt/s belonging to same tile%d must have dfferent types
+ * If found same gt/s within tile%d program will halt
+ */
+static void
+xe_check_gt_type(int fd, struct drm_xe_query_gt_list *gt_list,
+		 int num_tiles)
+{
+	igt_info("Verifying gt type belongs to each tile in platform\n");
+
+	for(int tile_num = 0; tile_num < num_tiles; tile_num++) {
+		for(int gt_num = 0; gt_num < tile[tile_num].gt_count - 1; gt_num++) {
+			igt_assert_neq(tile[tile_num].gt_info[gt_num].gt_type,
+					tile[tile_num].gt_info[gt_num + 1].gt_type);
+		}
+	}
+}
+
+igt_main
+{
+	int fd;
+	struct drm_xe_query_gt_list *gt_list;
+	struct xe_device *xe_dev;
+	int num_tiles = 0;
+
+	gt_list = malloc(sizeof(*gt_list));
+	igt_assert(gt_list);
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_dev = xe_device_get(fd);
+	}
+
+	igt_subtest("multi-tile-info") {
+		/** get gt information from driver **/
+		gt_list = xe_query_gt_list(fd);
+		igt_assert(gt_list);
+
+		/** display gt info to user **/	
+		xe_show_gt_info(fd, gt_list);
+
+		/** check platform has multi tile **/
+		num_tiles = xe_get_tile_count(fd, gt_list);
+		igt_assert_f(num_tiles > 1, "Tiles available %d Multi-Tile not supported.\n",
+				num_tiles);
+
+		/** check tile order **/
+		igt_assert_eq(xe_check_tile_order(fd, gt_list), 0);
+
+		/** check type of gt in tile%d **/
+		xe_check_gt_type(fd, gt_list, num_tiles);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2f5406523..cdc68498d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -328,6 +328,7 @@ intel_xe_progs = [
 	'xe_sysfs_scheduler',
         'xe_sysfs_timeslice_duration',
         'xe_tlb',
+        'xe_multi_tile',
 ]
 
 intel_xe_eudebug_progs = [
-- 
2.43.0

