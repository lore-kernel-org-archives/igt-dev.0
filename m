Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7932010E7F4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Nov 2023 23:55:36 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Nov 2023 16:53:03 -0700
Message-Id: <20231101235303.4645-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
References: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v2 i-g-t 3/3] tests/xe_compute: Validate ccs_mode
 setting
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

Validate 'ccs_mode' sysfs uapi interface and ensure compute
kernels can be run on enabled compute engines.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_compute.c | 146 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 35ba8b346..7f30b1cdd 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -13,9 +13,149 @@
 #include <string.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_compute.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define MAX_TILE	4
+
+static bool ccs_mode_supported(int fd)
+{
+	int tilefd, ret;
+	u32 ccs_mode;
+
+	tilefd = xe_sysfs_tile_open(fd, 0);
+	ret = igt_sysfs_scanf(tilefd, "ccs_mode", "%x", &ccs_mode);
+	close(tilefd);
+
+	return ret > 0;
+}
+
+/**
+ * SUBTEST: ccs-mode-basic
+ * GPU requirement: PVC
+ * Description: Validate 'ccs_mode' sysfs uapi
+ * Functionality: ccs_mode user interface
+ */
+static void
+test_ccs_mode(int fd)
+{
+	u32 t, m, ccs_mode, vm, q, cslices[MAX_TILE] = { };
+	struct drm_xe_engine_class_instance *hwe;
+	int tilefd, ret;
+
+	igt_require(ccs_mode_supported(fd));
+
+	/* Get available compute slices */
+	xe_for_each_hw_engine(fd, hwe)
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+			cslices[hwe->gt_id]++;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	for (t = 0; t < MAX_TILE; t++) {
+		if (!cslices[t])
+			continue;
+
+		tilefd = xe_sysfs_tile_open(fd, t);
+		igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", 0) < 0);
+		for (m = 1; m <= cslices[t]; m++) {
+			/* compute slices are to be equally distributed among enabled engines */
+			if (cslices[t] % m) {
+				igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", m) < 0);
+				continue;
+			}
+
+			/* Validate allowed ccs mode setting by reading it back */
+			igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", m) > 0);
+			igt_assert(igt_sysfs_scanf(tilefd, "ccs_mode", "%x", &ccs_mode) > 0);
+			igt_assert(m == ccs_mode);
+
+			xe_for_each_hw_engine(fd, hwe) {
+				if (hwe->gt_id != t ||
+				    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+					continue;
+
+				ret = __xe_exec_queue_create(fd, vm, hwe, 0, &q);
+				if (hwe->engine_instance < m) {
+					/* exec_queues creation is allowed for enabled CCS engines */
+					igt_assert_eq(ret, 0);
+					xe_exec_queue_destroy(fd, q);
+				} else {
+					/* Can't create exec_queues with disabled CCS engines */
+					igt_assert_neq(ret, 0);
+				}
+			}
+		}
+		igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", m) < 0);
+
+		/* Can't change ccs_mode with an open exec_queue */
+		q = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COMPUTE);
+		igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", 1) < 0);
+		xe_exec_queue_destroy(fd, q);
+
+		/* Set ccs_mode back to default value */
+		igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", 1) > 0);
+
+		close(tilefd);
+	}
+
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: ccs-mode-compute-kernel
+ * GPU requirement: PVC
+ * Description: Validate 'ccs_mode' by running compute kernel
+ * Functionality: CCS mode funtionality
+ */
+static void
+test_compute_kernel_with_ccs_mode(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	u32 t, m, cslices[MAX_TILE] = { };
+	int tilefd;
+
+	igt_require(ccs_mode_supported(fd));
+
+	/* Get available compute slices */
+	xe_for_each_hw_engine(fd, hwe)
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+			cslices[hwe->gt_id]++;
+
+	for (t = 0; t < MAX_TILE; t++) {
+		if (!cslices[t])
+			continue;
+
+		tilefd = xe_sysfs_tile_open(fd, t);
+		for (m = 1; m <= cslices[t]; m++) {
+			if (cslices[t] % m)
+				continue;
+
+			igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", m) > 0);
+
+			/* Run compute kernel on enabled engines */
+			xe_for_each_hw_engine(fd, hwe) {
+				if (hwe->gt_id != t ||
+				    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE ||
+				    hwe->engine_instance >= m)
+					continue;
+
+				igt_info("Tile-%d ccs_mode %d engine %d\n",
+					 t, m, hwe->engine_instance);
+				igt_assert_f(run_intel_compute_kernel_on_engine(fd, hwe),
+					     "Unable to run compute kernel successfully\n");
+			}
+		}
+
+		/* Set ccs_mode back to default value */
+		igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u", 1) > 0);
+
+		close(tilefd);
+	}
+}
+
 /**
  * SUBTEST: compute-square
  * GPU requirement: TGL, PVC
@@ -40,6 +180,12 @@ igt_main
 	igt_subtest("compute-square")
 		test_compute_square(xe);
 
+	igt_subtest("ccs-mode-basic")
+		test_ccs_mode(xe);
+
+	igt_subtest("ccs-mode-compute-kernel")
+		test_compute_kernel_with_ccs_mode(xe);
+
 	igt_fixture
 		drm_close_driver(xe);
 }
-- 
2.21.0.rc0.32.g243a4c7e27
