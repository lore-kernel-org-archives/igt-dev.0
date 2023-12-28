Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B77510E23D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Dec 2023 00:10:33 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, nirmoy.das@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_compute_preempt: Add compute preempt
 test
Date: Thu, 28 Dec 2023 05:45:10 +0530
Message-Id: <20231228001510.1399329-4-janga.rahul.kumar@intel.com>
In-Reply-To: <20231228001510.1399329-1-janga.rahul.kumar@intel.com>
References: <20231228001510.1399329-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Test submits long and short opencl kernels to exercise
preemption scenario.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_compute_preempt.c | 46 ++++++++++++++++++++++++++++++++
 tests/meson.build                |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 tests/intel/xe_compute_preempt.c

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
new file mode 100644
index 000000000..fdf817d12
--- /dev/null
+++ b/tests/intel/xe_compute_preempt.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/**
+ * TEST: Check compute-related preemption functionality
+ * Category: Hardware building block
+ * Sub-category: compute
+ * Test category: functionality test
+ */
+
+#include <string.h>
+
+#include "igt.h"
+#include "intel_compute.h"
+#include "xe/xe_query.h"
+
+/**
+ * SUBTEST: compute-preempt
+ * GPU requirement: LNL
+ * Description:
+ *      Exercise preemption scenario
+ * Functionality: compute openCL kernel
+ */
+static void
+test_compute_preempt(int fd)
+{
+	igt_require_f(run_intel_compute_kernel_preempt(fd), "GPU not supported\n");
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture
+		xe = drm_open_driver(DRIVER_XE);
+
+	igt_subtest("compute-preempt")
+		test_compute_preempt(xe);
+
+	igt_fixture
+		drm_close_driver(xe);
+
+}
+
diff --git a/tests/meson.build b/tests/meson.build
index a6a8498e2..24dd1caba 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -278,6 +278,7 @@ intel_xe_progs = [
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
+	'xe_compute_preempt',
 	'xe_copy_basic',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
-- 
2.25.1
