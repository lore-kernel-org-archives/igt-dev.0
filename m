Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5D110E50A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 18:24:55 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Apr 2023 20:24:40 +0200
Message-Id: <20230420182440.49442-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230420182440.49442-1-kamil.konieczny@linux.intel.com>
References: <20230420182440.49442-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915_hangman: add multigpu basic
 error state subtest
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

Verify that basic error capture works in multiGPU hardware
configuration for two or more GPUs.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/i915_hangman.c | 63 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index d76d0a037..580b3a739 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -39,6 +39,7 @@
 #include "igt_store.h"
 #include "igt_sysfs.h"
 #include "igt_debugfs.h"
+#include "igt_device_scan.h"
 #include "sw_sync.h"
 
 #ifndef I915_PARAM_CMD_PARSER_VERSION
@@ -514,6 +515,21 @@ static void do_tests(int device, int sysfs, const char *name, const char *prefix
 	}
 }
 
+static int set_engines_prop(int device, struct gem_engine_properties *params)
+{
+	const struct intel_execution_engine2 *e;
+	int num = 0;
+
+	for_each_physical_engine(device, e) {
+		params[num].engine = e;
+		params[num].preempt_timeout = 500;
+		params[num].heartbeat_interval = 1000;
+		gem_engine_properties_configure(device, params + num++);
+	}
+
+	return num;
+}
+
 igt_main
 {
 	const intel_ctx_t *ctx;
@@ -522,10 +538,9 @@ igt_main
 	int num_engines = 0;
 	int sysfs_fd = -1;
 	int i915 = -1;
+	int gpu_count;
 
 	igt_fixture {
-		const struct intel_execution_engine2 *e;
-
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
@@ -540,12 +555,8 @@ igt_main
 
 		gem_require_mmap_device_coherent(i915);
 
-		for_each_physical_engine(i915, e) {
-			saved_params[num_engines].engine = e;
-			saved_params[num_engines].preempt_timeout = 500;
-			saved_params[num_engines].heartbeat_interval = 1000;
-			gem_engine_properties_configure(i915, saved_params + num_engines++);
-		}
+		num_engines = set_engines_prop(i915, &saved_params[0]);
+		gpu_count = igt_device_filter_count();
 	}
 
 	igt_describe("Basic error capture");
@@ -576,6 +587,42 @@ igt_main
 
 	do_tests(i915, sysfs_fd, "engine", "engine", ctx);
 
+	igt_describe("Basic multigpu error capture");
+	igt_subtest("multigpu-error-basic") {
+		igt_require(gpu_count > 1);
+
+		igt_multi_fork(child, gpu_count) {
+			int gpu_fd, gpu_sysfs;
+
+			if (child)
+				gpu_fd = __drm_open_driver_another(child, DRIVER_INTEL);
+			else
+				gpu_fd = gem_reopen_driver(i915);
+
+			igt_assert(gpu_fd > 0);
+			igt_require_gem(gpu_fd);
+			ctx = intel_ctx_create_all_physical(gpu_fd);
+			hang = igt_allow_hang(gpu_fd, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
+			gpu_sysfs = igt_sysfs_open(gpu_fd);
+			igt_assert(gpu_sysfs != -1);
+			igt_require(has_error_state(gpu_sysfs));
+			gem_require_mmap_device_coherent(gpu_sysfs);
+			num_engines = set_engines_prop(gpu_fd, &saved_params[0]);
+
+			test_error_state_basic(gpu_fd, gpu_sysfs);
+
+			igt_disallow_hang(gpu_fd, hang);
+			intel_ctx_destroy(gpu_fd, ctx);
+			if (child)
+				for (int i = 0; i < num_engines; i++)
+					gem_engine_properties_restore(i915, saved_params + i);
+			close(gpu_fd);
+			close(gpu_sysfs);
+		}
+
+		igt_waitchildren();
+	}
+
 	igt_fixture {
 		int i;
 
-- 
2.37.2
