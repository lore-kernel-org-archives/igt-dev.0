Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CCA10E639
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 18:57:53 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 20:57:29 +0200
Message-ID: <20231013185732.98000-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231013185732.98000-1-kamil.konieczny@linux.intel.com>
References: <20231013185732.98000-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] lib/i915/gem_multigpu: Introduce
 library for multi-GPU scenarios
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Implemented gem_require_multigpu in order to replace
igt_require(gpu_count > 1), as well as printing available
PCI devices if requirement fails.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
[Kamil: fixed whitespace and tabs]
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/gem_multigpu.c | 28 ++++++++++++++++++++++++++++
 lib/i915/gem_multigpu.h | 11 +++++++++++
 lib/meson.build         |  1 +
 3 files changed, 40 insertions(+)
 create mode 100644 lib/i915/gem_multigpu.c
 create mode 100644 lib/i915/gem_multigpu.h

diff --git a/lib/i915/gem_multigpu.c b/lib/i915/gem_multigpu.c
new file mode 100644
index 000000000..d4d2d3d6a
--- /dev/null
+++ b/lib/i915/gem_multigpu.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "i915/gem_multigpu.h"
+#include "igt_core.h"
+#include "igt_device_scan.h"
+
+void gem_require_multigpu(int count)
+{
+	struct igt_devices_print_format fmt = {
+		.type = IGT_PRINT_SIMPLE,
+		.option = IGT_PRINT_PCI,
+	};
+	int devices;
+
+	if (igt_device_filter_count() >= count)
+		return;
+
+	igt_info("PCI devices available in the system:\n");
+
+	igt_devices_scan(true);
+	devices = igt_device_filter_pci();
+	igt_devices_print(&fmt);
+
+	igt_skip("Test requires at least %d GPUs, %d available.\n", count, devices);
+}
diff --git a/lib/i915/gem_multigpu.h b/lib/i915/gem_multigpu.h
new file mode 100644
index 000000000..4bde96c15
--- /dev/null
+++ b/lib/i915/gem_multigpu.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef GEM_MULTIGPU_H
+#define GEM_MULTIGPU_H
+
+void gem_require_multigpu(int count);
+
+#endif /* GEM_MULTIGPU_H */
diff --git a/lib/meson.build b/lib/meson.build
index a7bccafc3..88cd3d986 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -10,6 +10,7 @@ lib_sources = [
 	'i915/gem_submission.c',
 	'i915/gem_ring.c',
 	'i915/gem_mman.c',
+	'i915/gem_multigpu.c',
 	'i915/gem_vm.c',
 	'i915/intel_decode.c',
 	'i915/intel_drrs.c',
-- 
2.42.0
