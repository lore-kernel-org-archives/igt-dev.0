Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82981C02192
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 14:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8C610E1EC;
	Fri, 31 Jan 2025 14:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV2FV02T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270E10E1EC
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738333641; x=1769869641;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5smfggSkvb2/SWrVQ2um2r5/aoOtbf41cQdRcUXJz68=;
 b=AV2FV02TFUX0LD2wNvAOHSozSwrU2pW3xTlQS+ckwl+Jtp0P+dqWul64
 wzegF8U8NeAyh56G9g8djJBYeY2NaOHXcBonAE27e6y01OOCwxP7gahCO
 aALmrXSzj8XFlXWoIh9LC0m/px9wSM+VUyW0Oh+BoTlDQlWV0e2ouEDIt
 Y4USv5VbvhsE1XeLH4hDBvVDDmrZy+ZeXBudHXPVB1bmYm/CshQMJKCuU
 IqxSdUkbEpusMKCvf2ztbCOG2T+HrPbymWNd/xJvPKZ4NKgNM+ZWkCuuS
 Z5CMCn/1u3ZEkU69D33zWSzS5WnPiJTOGxeIzlfx1SrLqIR/fhbQdeX4A w==;
X-CSE-ConnectionGUID: +36cJmm/TDihePVTzYjWog==
X-CSE-MsgGUID: EthfKCatSMOj7Y1Wy/xNyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="41734416"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="41734416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 06:27:20 -0800
X-CSE-ConnectionGUID: 3Y4pPFLLSnalq1RhbAdAXg==
X-CSE-MsgGUID: dwRxk2Y0RbS5wh38/552Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110088180"
Received: from dut7077atsm.jf.intel.com ([10.75.201.71])
 by orviesa007.jf.intel.com with ESMTP; 31 Jan 2025 06:27:18 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 zbigniew.kempczynski@intel.com, matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_multi_tile: Multi-Tile support in IGT
Date: Fri, 31 Jan 2025 14:27:12 +0000
Message-Id: <20250131142712.86716-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
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

Added functionality to get Tile ID, GT ID, GT belongs to which tile ID
in multi-tile/single-tile platforms. Added functionality to check if any
tile_ID information not provided by driver. E.g.tile available in platforms in order tile0,
tile1...tileX in serial order, If tile1 tile2 tile4...tileX populated
than will get Warning tile3 not available.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/igt_sysfs.c             |   3 +-
 tests/intel/xe_multi_tile.c | 191 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 3 files changed, 194 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_multi_tile.c

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 00d5822fd..37f1716e2 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -234,7 +234,8 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 
 	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
-			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
+			 major(st.st_rdev), minor(st.st_rdev),
+			 xe_gt_get_tile_id(xe_device, gt), gt);
 	else
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
 			 major(st.st_rdev), minor(st.st_rdev), gt);
diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
new file mode 100644
index 000000000..7ca40f1fe
--- /dev/null
+++ b/tests/intel/xe_multi_tile.c
@@ -0,0 +1,191 @@
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
+#define MAX_TILES	8
+#define MAX_SLICES	2
+
+struct xe_gt_info {
+	/** @type: GT type: Main or Media */
+	uint16_t type;
+
+	/** @tile_id: Tile ID where this GT lives (Information only) */
+	uint16_t  tile_id;
+
+	/** @gt_id: Unique ID of this GT within the PCI Device */
+	uint16_t gt_id;
+};
+
+/** @info: tile-gt info */
+struct xe_tile_info {
+	uint8_t tile_count;
+	uint8_t gt_count;
+	uint8_t mis_tile:1;
+	uint8_t mis_tile_id;
+	struct xe_gt_info gt_info[];
+};
+
+/**
+ * TEST: Test to get tile_id by iterating gt on xe
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: mapping tile/s with slices available
+ * Functionality: gt operation
+ */
+
+/**
+ * SUBTEST: show-tile-info
+ * SUBTEST: gt-configuration
+ * Description: Test iniitialize xe_tile_info structure with tile_id
+ * Test category: functionality test
+ *
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
+
+static void igt_get_gt_info(int fd, struct xe_tile_info *tile_info)
+{
+	uint8_t iteration = 0;
+	uint8_t gt_id = 0;
+
+	igt_info("GT iteration\n");
+
+	for (int tile_id = 0; tile_id < tile_info->tile_count; tile_id++) {
+		for (gt_id += iteration; gt_id < tile_info->gt_count; gt_id++) {
+			if (tile_id == tile_info->gt_info[gt_id].tile_id) {
+				igt_info("GT :gt%d belongs to :tile%d\n",
+						tile_info->gt_info[gt_id].gt_id,
+						tile_info->gt_info[gt_id].tile_id);
+				iteration++;
+			}
+			else {
+				igt_info("GT :gt%d belongs to :tile%d\n",
+						tile_info->gt_info[gt_id].gt_id,
+						tile_info->gt_info[gt_id].tile_id);
+				continue;
+			}
+		}
+	}
+}
+
+static void igt_check_if_missingtile(int fd, struct xe_tile_info *tile_info)
+{
+	if (tile_info->mis_tile == true)
+		igt_warn("Missing :tile%d\n", tile_info->mis_tile_id);
+}
+
+static void igt_check_if_multitile(int fd, struct xe_tile_info *tile_info)
+{
+	igt_info("Check for Multi-tile support in Platform\n");
+
+	igt_skip_on_f(tile_info->tile_count == 0,
+		      "No Tile :%d found in platform\n",
+		      tile_info->tile_count);
+
+	if (tile_info->tile_count == 1)
+		igt_info("Single tile :tile%d found in platform\n",
+			 tile_info->tile_count);
+	else {
+		igt_info("Tile count :%d in Multi-Tile platform\n",
+			 tile_info->tile_count);
+
+		for (int tile_id = 0; tile_id < tile_info->tile_count; tile_id++)
+			igt_info("Tile :tile%d available in platform\n", tile_id);
+	}
+}
+
+static void igt_get_tile_info(int fd, struct drm_xe_query_gt_list *gt_list,
+			 struct xe_tile_info *tile_info)
+{
+	uint8_t tile_mis_count = -1;
+	int prev_tile = -1, tile_id;
+
+	tile_info->tile_count = 0;
+	tile_info->mis_tile = false;
+	for (int index = 0; index < gt_list->num_gt; index++) {
+		tile_id = gt_list->gt_list[index].tile_id;
+		if (prev_tile != tile_id) {
+			if (++tile_mis_count != tile_id) {
+				tile_info->mis_tile = true;
+				tile_info->mis_tile_id = tile_mis_count;
+				tile_mis_count = tile_id;
+			}
+			prev_tile = tile_id;
+			tile_info->tile_count++;
+			tile_info->gt_info[index].tile_id = prev_tile;
+			tile_info->gt_info[index].gt_id = index;
+		}
+		else {
+			tile_info->gt_info[index].tile_id = tile_id;
+			tile_info->gt_info[index].gt_id = index;
+		}
+		tile_info->gt_info[index].type = xe_is_media_gt(fd, index);
+	}
+	tile_info->gt_count = gt_list->num_gt;
+}
+
+igt_main
+{
+	int fd;
+	struct xe_engine_list_entry *en;
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_gt_list *gt_list;
+	struct xe_tile_info *tile_info;
+
+	tile_info = malloc(sizeof(*tile_info));
+	igt_assert(tile_info);
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest("multi-tile-info") {
+		gt_list = xe_gt_list(fd);
+
+		igt_get_tile_info(fd, gt_list, tile_info);
+		igt_check_if_multitile(fd, tile_info);
+		igt_check_if_missingtile(fd, tile_info);
+		igt_get_gt_info(fd, tile_info);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..2cc01aa0c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_exec_reset',
 	'xe_exec_sip',
 	'xe_exec_store',
+	'xe_multi_tile',
 	'xe_exec_threads',
 	'xe_exercise_blt',
 	'xe_fault_injection',
-- 
2.34.1

