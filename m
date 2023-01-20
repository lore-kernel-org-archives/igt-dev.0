Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5DE10E00B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 12:29:11 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 13:28:57 +0100
Message-Id: <20230120122857.28445-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_create: add two
 multi-gpu subtests
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

Create two multi-gpu tests for basic functionality. Also
while at it improve a little subtest basic and check if
we get context id we requested. Add also a helper for creating
non-zero random number.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_ctx_create.c | 71 +++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 39f070af..4d12e769 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -34,6 +34,7 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_rand.h"
+#include "lib/igt_device_scan.h"
 #include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Test the context create ioctls");
@@ -558,12 +559,36 @@ static void iris_pipeline(int i915)
 #endif /* I915_DEFINE_CONTEXT_PARAM_ENGINES */
 }
 
+static int nonzero_rand(void)
+{
+	int i, r;
+
+	for (i = 0, r = rand(); r == 0 && i <= 1; i++)
+		r = rand();
+
+	igt_assert_f(r, "rand() error\n");
+
+	return r;
+}
+
+static void test_create_id(int fd, uint32_t id)
+{
+	struct drm_i915_gem_context_create create;
+
+	igt_assert(id != 0);
+	memset(&create, 0, sizeof(create));
+	create.ctx_id = id;
+	igt_assert_eq(create_ioctl(fd, &create), 0);
+	gem_context_destroy(fd, create.ctx_id);
+	igt_assert(create.ctx_id == id);
+}
+
 igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-	struct drm_i915_gem_context_create create;
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg;
+	int gpu_count;
 	int fd = -1;
 
 	igt_fixture {
@@ -589,12 +614,7 @@ igt_main
 
 	igt_describe("Test random context creation");
 	igt_subtest("basic") {
-		memset(&create, 0, sizeof(create));
-		create.ctx_id = rand();
-		create.pad = 0;
-		igt_assert_eq(create_ioctl(fd, &create), 0);
-		igt_assert(create.ctx_id != 0);
-		gem_context_destroy(fd, create.ctx_id);
+		test_create_id(fd, nonzero_rand());
 	}
 
 	igt_describe("Verify valid and invalid context extensions");
@@ -668,5 +688,42 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		close(fd);
+		gpu_count = igt_device_filter_count();
+	}
+
+	igt_describe("Test context creation on multi-GPU machine");
+	igt_subtest("multigpu-basic") {
+		igt_require(gpu_count > 1);
+
+		igt_multi_fork(child, gpu_count) {
+			int gpu_fd = __drm_open_driver_another(child, DRIVER_INTEL);
+
+			igt_assert(gpu_fd > 0);
+			test_create_id(gpu_fd, nonzero_rand());
+			close(gpu_fd);
+		}
+
+		igt_waitchildren();
+	}
+
+	igt_describe("Exercise implicit per-fd context creation on multi-GPU machine");
+	igt_subtest("multigpu-basic-files")
+	{
+			igt_require(gpu_count > 1);
+			igt_multi_fork(child, gpu_count) {
+				int gpu_fd = __drm_open_driver_another(child, DRIVER_INTEL);
+				intel_ctx_cfg_t gpu_cfg;
+
+				igt_assert(gpu_fd > 0);
+				igt_fork_hang_detector(gpu_fd);
+				gpu_cfg = intel_ctx_cfg_all_physical(gpu_fd);
+
+				files(gpu_fd, &gpu_cfg, 2, 1);
+
+				igt_stop_hang_detector();
+				close(gpu_fd);
+			}
+
+			igt_waitchildren();
 	}
 }
-- 
2.37.2
