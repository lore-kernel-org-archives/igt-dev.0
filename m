Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FDE10E258
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 13:33:14 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:07:13 +0530
Message-Id: <20230613133713.3315078-5-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
References: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/4] tests/xe/xe_tile_prop: adds new test to
 verify per tile vram addr_range
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For each tile the test reads the sysfs entry addr_range and compares
the value with vram size exposed from query ioctl.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/meson.build       |  1 +
 tests/xe/xe_tile_prop.c | 66 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 tests/xe/xe_tile_prop.c

diff --git a/tests/meson.build b/tests/meson.build
index f71be1db..ec8f4632 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -266,6 +266,7 @@ xe_progs = [
 	'xe_pm',
 	'xe_prime_self_import',
 	'xe_query',
+	'xe_tile_prop',
 	'xe_vm',
 	'xe_waitfence',
 ]
diff --git a/tests/xe/xe_tile_prop.c b/tests/xe/xe_tile_prop.c
new file mode 100644
index 00000000..80b1b794
--- /dev/null
+++ b/tests/xe/xe_tile_prop.c
@@ -0,0 +1,66 @@
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
+	sprintf(path, "device/tile%d/addr_range", tile_num);
+	while (err == -EAGAIN)
+		err = igt_sysfs_scanf(sysfs, path, "%lx", &addr_range);
+
+	igt_assert_lt(vram_size, addr_range);
+}
+
+igt_main
+{
+	int fd;
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
+	igt_subtest("addr_range") {
+		igt_require(xe_has_vram(fd));
+		xe_for_each_tile(fd, tile) {
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
