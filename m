Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A420110E335
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 12:48:16 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 10 Dec 2021 18:23:02 +0530
Message-Id: <20211210125306.3681902-2-apoorva1.singh@intel.com>
In-Reply-To: <20211210125306.3681902-1-apoorva1.singh@intel.com>
References: <20211210125306.3681902-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3 1/5] lib/i915: Introduce library intel_mocs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, ramalingam.c@intel.com, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add new library intel_mocs for mocs settings.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/i915/intel_mocs.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 lib/i915/intel_mocs.h | 19 ++++++++++++++++
 lib/meson.build       |  1 +
 3 files changed, 71 insertions(+)
 create mode 100644 lib/i915/intel_mocs.c
 create mode 100644 lib/i915/intel_mocs.h

diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
new file mode 100644
index 00000000..e8c19309
--- /dev/null
+++ b/lib/i915/intel_mocs.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "i915/gem.h"
+#include "intel_mocs.h"
+
+static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
+{
+	uint16_t devid = intel_get_drm_devid(fd);
+
+	/*
+	 * Gen >= 12 onwards don't have a setting for PTE,
+	 * so using I915_MOCS_PTE as mocs index may leads to
+	 * some undefined MOCS behavior.
+	 * This helper function is providing current UC as well
+	 * as WB MOCS index based on platform.
+
+	 */
+	if (IS_DG1(devid)) {
+		mocs->uc_index = 1;
+		mocs->wb_index = 5;
+	} else if (IS_GEN12(devid)) {
+		mocs->uc_index = 3;
+		mocs->wb_index = 2;
+	} else {
+		mocs->uc_index = I915_MOCS_PTE;
+		mocs->wb_index = I915_MOCS_CACHED;
+	}
+}
+
+/* BitField [6:1] represents index to MOCS Tables
+ * BitField [0] represents Encryption/Decryption */
+
+uint8_t intel_get_wb_mocs(int fd)
+{
+	struct drm_i915_mocs_index mocs;
+
+	get_mocs_index(fd, &mocs);
+	return mocs.wb_index << 1;
+}
+
+uint8_t intel_get_uc_mocs(int fd)
+{
+	struct drm_i915_mocs_index mocs;
+
+	get_mocs_index(fd, &mocs);
+	return mocs.uc_index << 1;
+}
diff --git a/lib/i915/intel_mocs.h b/lib/i915/intel_mocs.h
new file mode 100644
index 00000000..efd8607f
--- /dev/null
+++ b/lib/i915/intel_mocs.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef _INTEL_MOCS_H
+#define _INTEL_MOCS_H
+
+#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
+#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
+
+struct drm_i915_mocs_index {
+	uint8_t uc_index;
+	uint8_t wb_index;
+};
+
+uint8_t intel_get_wb_mocs(int fd);
+uint8_t intel_get_uc_mocs(int fd);
+#endif /* _INTEL_MOCS_H */
diff --git a/lib/meson.build b/lib/meson.build
index b9568a71..f500f0f1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -11,6 +11,7 @@ lib_sources = [
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
 	'i915/intel_memory_region.c',
+	'i915/intel_mocs.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
 	'igt_debugfs.c',
-- 
2.25.1
