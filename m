Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB70A10EA90
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 19:29:47 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/xe_query: Add multigpu subtests
Date: Fri, 15 Dec 2023 20:29:34 +0100
Message-ID: <20231215192934.83009-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
References: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
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

Extend testing of all subtests to all GPU cards present on system.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_query.c | 77 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 5424f9dba..399d4ef2d 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -174,6 +174,11 @@ const char *get_topo_name(int value)
  * SUBTEST: query-engines
  * Description: Display engine classes available for xe device
  * Test category: functionality test
+ *
+ * SUBTEST: multigpu-query-engines
+ * Description: Display engine classes available for all Xe devices.
+ * Test category: functionality test
+ * Sub-category: MultiGPU
  */
 static void
 test_query_engines(int fd)
@@ -196,6 +201,11 @@ test_query_engines(int fd)
  * Test category: functionality test
  * Description: Display memory information like memory class, size
  *	and alignment.
+ *
+ * SUBTEST: multigpu-query-mem-usage
+ * Test category: functionality test
+ * Sub-category: MultiGPU
+ * Description: Display memory information for all Xe devices.
  */
 static void
 test_query_mem_regions(int fd)
@@ -255,6 +265,11 @@ test_query_mem_regions(int fd)
  * SUBTEST: query-gt-list
  * Test category: functionality test
  * Description: Display information about available GT components for xe device.
+ *
+ * SUBTEST: multigpu-query-gt-list
+ * Test category: functionality test
+ * Description: Display information about GT components for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void
 test_query_gt_list(int fd)
@@ -292,6 +307,11 @@ test_query_gt_list(int fd)
  * SUBTEST: query-topology
  * Test category: functionality test
  * Description: Display topology information of GT.
+ *
+ * SUBTEST: multigpu-query-topology
+ * Test category: functionality test
+ * Description: Display topology information of GT for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void
 test_query_gt_topology(int fd)
@@ -336,6 +356,11 @@ test_query_gt_topology(int fd)
  * SUBTEST: query-config
  * Test category: functionality test
  * Description: Display xe device id, revision and configuration.
+ *
+ * SUBTEST: multigpu-query-config
+ * Test category: functionality test
+ * Description: Display config information for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void
 test_query_config(int fd)
@@ -385,6 +410,11 @@ test_query_config(int fd)
  * SUBTEST: query-hwconfig
  * Test category: functionality test
  * Description: Display hardware configuration of xe device.
+ *
+ * SUBTEST: multigpu-query-hwconfig
+ * Test category: functionality test
+ * Description: Display hardware configuration of xe device.
+ * Sub-category: MultiGPU
  */
 static void
 test_query_hwconfig(int fd)
@@ -419,6 +449,11 @@ test_query_hwconfig(int fd)
  * SUBTEST: query-invalid-query
  * Test category: negative test
  * Description: Check query with invalid arguments returns expected error code.
+ *
+ * SUBTEST: multigpu-query-invalid-query
+ * Test category: negative test
+ * Description: Check query with invalid arguments for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void
 test_query_invalid_query(int fd)
@@ -437,6 +472,11 @@ test_query_invalid_query(int fd)
  * SUBTEST: query-invalid-size
  * Test category: negative test
  * Description: Check query with invalid size returns expected error code.
+ *
+ * SUBTEST: multigpu-query-invalid-size
+ * Test category: negative test
+ * Description: Check query with invalid size for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void
 test_query_invalid_size(int fd)
@@ -455,6 +495,11 @@ test_query_invalid_size(int fd)
  * SUBTEST: query-invalid-extension
  * Test category: negative test
  * Description: Check query with invalid extension returns expected error code.
+ *
+ * SUBTEST: multigpu-query-invalid-extension
+ * Test category: negative test
+ * Description: Check query with invalid extension for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void
 test_query_invalid_extension(int fd)
@@ -614,6 +659,10 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 /**
  * SUBTEST: query-cs-cycles
  * Description: Query CPU-GPU timestamp correlation
+ *
+ * SUBTEST: multigpu-query-cs-cycles
+ * Description: Query CPU-GPU timestamp correlation for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void test_query_engine_cycles(int fd)
 {
@@ -630,6 +679,10 @@ static void test_query_engine_cycles(int fd)
 /**
  * SUBTEST: query-invalid-cs-cycles
  * Description: Check query with invalid arguments returns expected error code.
+ *
+ * SUBTEST: multigpu-query-invalid-cs-cycles
+ * Description: Check query with invalid arguments for all Xe devices.
+ * Sub-category: MultiGPU
  */
 static void test_engine_cycles_invalid(int fd)
 {
@@ -696,7 +749,7 @@ igt_main
 		{ "query-invalid-extension", test_query_invalid_extension },
 		{ }
 	}, *f;
-	int xe;
+	int xe, gpu_count;
 
 	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
@@ -706,6 +759,26 @@ igt_main
 			f->func(xe);
 	}
 
-	igt_fixture
+	igt_fixture {
 		drm_close_driver(xe);
+		gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
+	}
+
+	for (f = funcs; f->name; f++) {
+		igt_subtest_f("multigpu-%s", f->name) {
+			igt_require(gpu_count >= 2);
+			intel_allocator_multiprocess_start(); /* for multigpu-query-cs-cycles */
+
+			igt_multi_fork(child, gpu_count) {
+				xe = drm_open_filtered_card(child);
+				igt_assert_f(xe > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
+				igt_assert(is_xe_device(xe));
+
+				f->func(xe);
+				drm_close_driver(xe);
+			}
+			igt_waitchildren();
+			intel_allocator_multiprocess_stop();
+		}
+	}
 }
-- 
2.42.0
