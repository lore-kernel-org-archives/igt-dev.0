Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2527BC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 15:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D378B10E700;
	Wed, 22 Jan 2025 15:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XM6dT+VU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6C10E700
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737558084; x=1769094084;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9eF6JuOiYElh64F4RNxHTpSW+6I35mkKLh4n3OsZqtY=;
 b=XM6dT+VUnXuH0CMAoF56KA1jGfaxv73zZ8shGI9sWPEu+ETbxES+JLmn
 QXKd6xDSZDKgqLIIgUZvoxTgH683JeQw9ixmaOCnYQi0NEGGqslwE+Ox4
 lgeIKk8V1pjGzQSh6rX2naWdhxJ0V7M1hQv8BNa/BadJvE3mPMAD5KRDn
 tjzOQDgDJcBS1JmFOdLes16B0LPUDXQTkQ+SQB5zDaGwUJ5AOHPYkk6bo
 CUBDTQNHuuQt488FvWJkus8DO1ZUd85JboKouQdjbHmVV7KBElZJFvLVF
 vzcJaJDSFQymIon1RrFihWmH9c98bVbD099CT7nZjywQoP4ntltqjcwWd Q==;
X-CSE-ConnectionGUID: EeOm4kJ4Tcm6OpM+Yt/6QA==
X-CSE-MsgGUID: eFskD6ViQnehiXZ/1SqiFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="60486376"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="60486376"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 07:00:57 -0800
X-CSE-ConnectionGUID: qegkPyLCTG+O94rLsg2tXg==
X-CSE-MsgGUID: vHyIJcHpSzGo+3grz+eCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107091053"
Received: from dut7077atsm.jf.intel.com ([10.75.201.71])
 by fmviesa007.fm.intel.com with ESMTP; 22 Jan 2025 07:00:52 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 zbigniew.kempczynski@intel.com, matthew.d.roper@intel.com
Subject: [PATCH i-g-t] lib/igt_sysfs: Multi-Tile support in IGT
Date: Wed, 22 Jan 2025 15:00:51 +0000
Message-Id: <20250122150051.8154-1-nishit.sharma@intel.com>
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

Added functionality in xe_sysfs_gt_path() function to get Tile ID
in multi-tile platforms. Added IGT test tests/intel/xe_multi_tile
to verify Tile IDs and GT IDs

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/igt_sysfs.c             |   3 +-
 tests/intel/xe_multi_tile.c | 109 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 3 files changed, 112 insertions(+), 1 deletion(-)
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
index 000000000..222da9389
--- /dev/null
+++ b/tests/intel/xe_multi_tile.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
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
+#include "xe_drm.h"
+#include "xe/xe_query.h"
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
+ * SUBTEST: show-tile
+ * SUBTEST: gt-configuration
+ * Description: Test prints the tile_ids and gt_ids available in GPU
+ * Test category: functionality test
+ *
+ */
+static void engine_test_defaults(int xe, int engine, const char **property,
+				 uint16_t class, int gt)
+{
+	struct dirent *de;
+	uint64_t property_value;
+	int defaults;
+	DIR *dir;
+
+	defaults = openat(engine, ".defaults", O_DIRECTORY);
+	igt_require(defaults != -1);
+
+	dir = fdopendir(engine);
+	while ((de = readdir(dir))) {
+		if (*de->d_name == '.')
+			continue;
+
+		igt_debug("Checking attr '%s'\n", de->d_name);
+
+		igt_assert_f(__igt_sysfs_get_u64(defaults, de->d_name, &property_value),
+				"Default value %s is not present!\n", de->d_name);
+
+		igt_debug("Default property:%s, value:0x%" PRId64 "\n", de->d_name, property_value);
+
+		igt_assert_f(!igt_sysfs_set(defaults, de->d_name, "garbage"),
+				"write into default value of %s succeeded!\n",
+				de->d_name);
+	}
+	closedir(dir);
+}
+
+igt_main
+{
+	int fd;
+	struct xe_engine_list_entry *en;
+	struct drm_xe_engine_class_instance *hwe;
+	int gt, tile_id, prev_tile = -1, gt_num;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+		gt_num = xe_number_gt(fd);
+	}
+
+	igt_subtest("show-tile") {
+		xe_for_each_gt(fd, gt) {
+			tile_id = xe_gt_get_tile_id(fd, gt);
+			if (prev_tile != tile_id) {
+				igt_info("Tile id: %d\n", tile_id);
+				prev_tile = tile_id;
+			}
+			igt_info("GT id: %d\n", gt);
+		}
+	}
+
+	igt_subtest_with_dynamic("gt-configuration") {
+		for (gt = 0; gt < gt_num; gt++) {
+			int engines_fd = -1;
+			int gt_fd = -1;
+
+			gt_fd = xe_sysfs_gt_open(fd, gt);
+			igt_require(gt_fd != -1);
+			engines_fd = openat(gt_fd, "engines", O_RDONLY);
+			igt_require(engines_fd != -1);
+
+			igt_sysfs_engines(fd, engines_fd, 0, 0, NULL, engine_test_defaults);
+
+			close(engines_fd);
+			close(gt_fd);
+		}
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

