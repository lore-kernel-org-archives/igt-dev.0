Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3861410E5ED
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 21:22:57 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t v2 4/4] tests/intel/xe_compute_preempt: Add compute
 preempt test
Date: Wed, 17 Jan 2024 02:57:56 +0530
Message-Id: <20240116212756.2687603-5-janga.rahul.kumar@intel.com>
In-Reply-To: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
References: <20240116212756.2687603-1-janga.rahul.kumar@intel.com>
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
Cc: nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Test submits long and short opencl kernels to exercise
preemption scenario.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_compute_preempt.c | 45 ++++++++++++++++++++++++++++++++
 tests/meson.build                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 tests/intel/xe_compute_preempt.c

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
new file mode 100644
index 000000000..31703638e
--- /dev/null
+++ b/tests/intel/xe_compute_preempt.c
@@ -0,0 +1,45 @@
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
+ *      Exercise compute walker mid thread preemption scenario
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
