Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2162E10E4D1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 10:40:28 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 16:15:00 +0530
Message-Id: <20230706104500.595707-5-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230706104500.595707-1-himal.prasad.ghimiray@intel.com>
References: <20230706104500.595707-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 4/4] tests/xe/xe_sysfs_tile_prop: adds
 new test to verify per tile vram addr_range
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For each tile the test reads the sysfs entry physical_vram_size_bytes
and compares the value with vram size exposed from query ioctl.

v2:
- Change sysfs entry name. (Tejas)
- Change test name to xe_sysfs_tile_prop. (Rahul)

v3:
- Rectify assertion condition.

v4:
- use igt_assert_lt_u64 instead of igt_assert_lt
for comparing u64.

v5:
- update xe_for_each_tile call.

Reviewed-by: Upadhyay <tejas.upadhyay@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/meson.build             |  1 +
 tests/xe/xe_sysfs_tile_prop.c | 63 +++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 tests/xe/xe_sysfs_tile_prop.c

diff --git a/tests/meson.build b/tests/meson.build
index ee066b849..fac9123b5 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -268,6 +268,7 @@ xe_progs = [
 	'xe_pm',
 	'xe_prime_self_import',
 	'xe_query',
+	'xe_sysfs_tile_prop',
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
diff --git a/tests/xe/xe_sysfs_tile_prop.c b/tests/xe/xe_sysfs_tile_prop.c
new file mode 100644
index 000000000..9d5da8f22
--- /dev/null
+++ b/tests/xe/xe_sysfs_tile_prop.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Verify physical_vram_size_bytes of each tiles
+ * SUBTEST: physical_vram_size_bytes
+ * Description:
+ *             Read sysfs entry for physical_vram_size_bytes and compare with
+ *             vram size. physical_vram_size_bytes should be more than vram size.
+ */
+
+#include <string.h>
+#include <sys/time.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+static void test_vram_physical_vram_size_bytes(int sysfs, int tile_num, u64 vram_size)
+{
+	u64 physical_vram_size_bytes;
+	char path[40];
+
+	igt_assert(snprintf(path, sizeof(path), "device/tile%d/physical_vram_size_bytes",
+			    tile_num) < sizeof(path));
+	igt_assert(igt_sysfs_scanf(sysfs, path, "%lx", &physical_vram_size_bytes) > 0);
+	igt_assert_lt_u64(vram_size, physical_vram_size_bytes);
+}
+
+igt_main
+{
+	int fd, tmp;
+	int tile;
+	static int sysfs = -1;
+	u64 vram_size;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+
+		sysfs = igt_sysfs_open(fd);
+		igt_assert(sysfs != -1);
+	}
+
+	igt_subtest("physical_vram_size_bytes") {
+		igt_require(xe_has_vram(fd));
+		xe_for_each_tile(fd, tmp, tile) {
+			vram_size = xe_vram_size(fd, tile);
+			test_vram_physical_vram_size_bytes(sysfs, tile, vram_size);
+		}
+	}
+
+	igt_fixture {
+		close(sysfs);
+		xe_device_put(fd);
+		close(fd);
+	}
+}
-- 
2.25.1
