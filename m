Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C7510F179
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 09:17:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 31 Mar 2023 11:17:00 +0200
Message-Id: <20230331091700.69801-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230331091700.69801-1-zbigniew.kempczynski@intel.com>
References: <20230331091700.69801-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] xe/xe_create: Add xe_create test
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

Add basic test which exercises invalid sizes passed to create ioctl.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/meson.build    |   1 +
 tests/xe/xe_create.c | 107 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 tests/xe/xe_create.c

diff --git a/tests/meson.build b/tests/meson.build
index 7d2168beb3..da31e7824b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -242,6 +242,7 @@ i915_progs = [
 ]
 
 xe_progs = [
+	'xe_create',
 	'xe_compute',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
new file mode 100644
index 0000000000..ae841f8092
--- /dev/null
+++ b/tests/xe/xe_create.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Check bo create ioctl
+ * Category: Software building block
+ * Sub-category: uapi
+ * Test category: functionality test
+ * Run type: BAT
+ */
+
+#include <string.h>
+
+#include "igt.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define PAGE_SIZE 0x1000
+
+static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+		       uint32_t *handlep)
+{
+	struct drm_xe_gem_create create = {
+		.vm_id = vm,
+		.size = size,
+		.flags = flags,
+	};
+	int ret = 0;
+
+	igt_assert(handlep);
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create)) {
+		ret = -errno;
+		errno = 0;
+	}
+	*handlep = create.handle;
+
+	return ret;
+}
+
+/**
+ * SUBTEST: create-invalid-size
+ * Description: Verifies xe bo create returns expected error code on invalid
+ *              buffer sizes.
+ */
+static void create_invalid_size(int fd)
+{
+	struct drm_xe_query_mem_region *memregion;
+	uint64_t memreg = all_memory_regions(fd), region;
+	uint32_t vm;
+	uint32_t handle;
+	int ret;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+
+	xe_for_each_mem_region(fd, memreg, region) {
+		memregion = xe_mem_region(fd, region);
+
+		/* first try, use half of possible min page size */
+		ret = __create_bo(fd, vm, memregion->min_page_size >> 1,
+				  region, &handle);
+		if (!ret) {
+			gem_close(fd, handle);
+			xe_vm_destroy(fd, vm);
+		}
+		igt_assert_eq(ret, -EINVAL);
+
+		/*
+		 * second try, add page size to min page size if it is
+		 * bigger than page size.
+		 */
+		if (memregion->min_page_size > PAGE_SIZE) {
+			ret = __create_bo(fd, vm,
+					  memregion->min_page_size + PAGE_SIZE,
+					  region, &handle);
+			if (!ret) {
+				gem_close(fd, handle);
+				xe_vm_destroy(fd, vm);
+			}
+			igt_assert_eq(ret, -EINVAL);
+		}
+	}
+
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+		xe_device_get(xe);
+	}
+
+	igt_subtest("create-invalid-size") {
+		create_invalid_size(xe);
+	}
+
+	igt_fixture {
+		xe_device_put(xe);
+		close(xe);
+	}
+}
-- 
2.34.1
