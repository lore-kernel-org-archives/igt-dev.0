Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C32010E72B
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Dec 2022 20:57:34 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Dec 2022 21:57:04 +0100
Message-Id: <20221202205705.58879-7-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
References: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] tests/i915/gem_exec_gttfill: add new
 subtest multigpu-basic
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

Add new subtest multigpu-basic to be run on two or more GPU cards
simultanosly. For this to work test should be run with --device
option, for example with:
  --device=pci:vendor=Intel,device=discrete,card=0\;pci:vendor=Intel,device=discrete,card=1
or
  --device=pci:vendor=Intel,device=discrete,card=all

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_gttfill.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index f9f244d6..5be8428d 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -24,6 +24,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_device_scan.h"
 #include "igt_rand.h"
 
 IGT_TEST_DESCRIPTION("Fill the GTT with batches.");
@@ -226,7 +227,7 @@ igt_main
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
-	int i915 = -1;
+	int i915 = -1, gpu_count;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -258,9 +259,36 @@ igt_main
 		fillgtt(i915, ctx, ALL_ENGINES, 20);
 
 	igt_fixture {
-		intel_allocator_multiprocess_stop();
 		igt_stop_hang_detector();
 		intel_ctx_destroy(i915, ctx);
+		// prepare multigpu tests
+		gpu_count = igt_device_filter_count();
+		if (gpu_count < 2)
+			gpu_count = 1;
+	}
+
+	igt_subtest("multigpu-basic") { /* run on two or more discrete cards */
+		igt_require(gpu_count > 1);
+		igt_multi_fork(child, gpu_count) {
+			int g_fd;
+			// prepare
+			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
+			igt_assert(g_fd >= 0);
+			ctx = intel_ctx_create_all_physical(g_fd);
+			igt_fork_hang_detector(g_fd);
+			// subtest
+			fillgtt(g_fd, ctx, ALL_ENGINES, 1);
+			// release resources
+			igt_stop_hang_detector();
+			intel_ctx_destroy(g_fd, ctx);
+			close(g_fd);
+		}
+
+		igt_waitchildren();
+	}
+
+	igt_fixture {
+		intel_allocator_multiprocess_stop();
 		close(i915);
 	}
 }
-- 
2.34.1
