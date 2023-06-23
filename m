Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CC610E114
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 11:46:16 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 23 Jun 2023 17:19:46 +0530
Message-Id: <20230623114946.3803540-5-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230623114946.3803540-1-himal.prasad.ghimiray@intel.com>
References: <20230623114946.3803540-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 4/4] tests/xe/xe_sysfs_tile_prop: adds new test
 to verify per tile vram addr_range
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

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/meson.build             |  1 +
 tests/xe/xe_sysfs_tile_prop.c | 67 +++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 tests/xe/xe_sysfs_tile_prop.c

diff --git a/tests/meson.build b/tests/meson.build
index 61dcc076..569f1d22 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -267,6 +267,7 @@ xe_progs = [
 	'xe_pm',
 	'xe_prime_self_import',
 	'xe_query',
+	'xe_sysfs_tile_prop',
 	'xe_vm',
 	'xe_waitfence',
 ]
diff --git a/tests/xe/xe_sysfs_tile_prop.c b/tests/xe/xe_sysfs_tile_prop.c
new file mode 100644
index 00000000..f205970f
--- /dev/null
+++ b/tests/xe/xe_sysfs_tile_prop.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Verify addr_range of each tiles
+ * SUBTEST: addr_range
+ * Description:
+ *             Read sysfs entry for addr_range and compare with
+ *             calculated addr_range. addr_range should be sum
+ *             vram size and stolen memory.
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
+static void test_vram_addr_range(int sysfs, int tile_num, u64 vram_size)
+{
+	int err = -EAGAIN;
+	u64 addr_range;
+	char path[40];
+
+	igt_assert(snprintf(path, sizeof(path), "device/tile%d/physical_vram_size_bytes",
+			    tile_num) < sizeof(path));
+	while (err == -EAGAIN)
+		err = igt_sysfs_scanf(sysfs, path, "%lx", &addr_range);
+
+	igt_assert_lt(vram_size, addr_range);
+}
+
+igt_main
+{
+	int fd;
+	int tile, total_tiles;
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
+	igt_subtest("addr_range") {
+		igt_require(xe_has_vram(fd));
+		xe_for_each_tile(fd, tile, total_tiles) {
+			vram_size = xe_vram_size(fd, tile);
+			test_vram_addr_range(sysfs, tile, vram_size);
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
