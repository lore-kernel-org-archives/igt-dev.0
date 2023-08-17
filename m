Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793B010E420
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:50 +0200
Message-Id: <20230817094652.40243-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/7] i915/gem_compute: Add test which runs
 compute workload on i915
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

This test is verbatim copy of xe_compute with driver open exception
(it opens i915 drm fd instead xe). Technically it is possible to
create single test code (open would try DEVICE_INTEL | DEVICE_XE)
but I resisted to that distinguishing i915 and xe version.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/gem_compute.c | 46 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 tests/i915/gem_compute.c

diff --git a/tests/i915/gem_compute.c b/tests/i915/gem_compute.c
new file mode 100644
index 0000000000..b408efee16
--- /dev/null
+++ b/tests/i915/gem_compute.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Check compute-related functionality
+ * Category: Hardware building block
+ * Sub-category: compute
+ * Test category: functionality test
+ * Run type: BAT
+ */
+
+#include <string.h>
+
+#include "igt.h"
+#include "intel_compute.h"
+
+/**
+ * SUBTEST: compute-square
+ * GPU requirement: only works on TGL
+ * Description:
+ *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
+ *	for an input dataset..
+ * Functionality: compute openCL kernel
+ * TODO: extend test to cover other platforms
+ */
+static void
+test_compute_square(int fd)
+{
+	igt_require_f(run_compute_kernel(fd), "GPU not supported\n");
+}
+
+igt_main
+{
+	int i915;
+
+	igt_fixture
+		i915 = drm_open_driver(DRIVER_INTEL);
+
+	igt_subtest("compute-square")
+		test_compute_square(i915);
+
+	igt_fixture
+		drm_close_driver(i915);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 58061dbc26..b485ae836a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -107,6 +107,7 @@ i915_progs = [
 	'gem_ccs',
 	'gem_close',
 	'gem_close_race',
+	'gem_compute',
 	'gem_concurrent_blit',
 	'gem_cs_tlb',
 	'gem_ctx_bad_destroy',
-- 
2.34.1
