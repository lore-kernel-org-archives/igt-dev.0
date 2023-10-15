Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD1710E070
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Oct 2023 05:29:13 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 14 Oct 2023 22:28:50 -0700
Message-Id: <20231015052850.6120-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t] tests/xe_exec_compute_mode: Validate fixed
 CCS mode setting
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

Validate static assignment of compute slices to a user selected
number of compute engines. Select number of compute engines by
writing it to the per-tile 'ccs_mode' sysfs interface.

As the test only uses compute command streamer commands (and not the
compute kernel), which does not use compute slices, any CCS engine
will still work irrespective of the ccs_mode selected.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 6d1084727..479bf09a4 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -13,6 +13,7 @@
 #include <fcntl.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
@@ -29,6 +30,28 @@
 #define BIND_EXECQUEUE		(0x1 << 4)
 #define VM_FOR_BO			(0x1 << 5)
 #define EXEC_QUEUE_EARLY	(0x1 << 6)
+#define SWITCH_CCS_MODE		(0x1 << 6)
+
+static void switch_ccs_mode(int fd)
+{
+	int tilefd, tile;
+	u32 num_ccs_engines[] = { 1, 2, 4 };
+	static int mode = 0;
+
+	for_each_sysfs_tile_dirfd(fd, tilefd, tile) {
+		igt_require_f(!faccessat(tilefd, "ccs_mode", W_OK, 0),
+			      "ccs_mode is not present\n");
+		igt_assert(igt_sysfs_printf(tilefd, "ccs_mode", "%u",
+					    num_ccs_engines[mode]) > 0);
+	}
+
+	mode++;
+	if (mode == ARRAY_SIZE(num_ccs_engines))
+		mode = 0;
+
+	/* Ensure tile reset is complete */
+	sleep(1);
+}
 
 /**
  * SUBTEST: twice-%s
@@ -46,6 +69,7 @@
  * arg[1]:
  *
  * @basic:				basic
+ * @basic-ccs-mode:			basic with ccs mode switch
  * @preempt-fence-early:		preempt fence early
  * @userptr:				userptr
  * @rebind:				rebind
@@ -69,6 +93,7 @@
  * arg[1]:
  *
  * @basic:				basic
+ * @basic-ccs-mode:			basic with ccs mode switch
  * @preempt-fence-early:		preempt fence early
  * @userptr:				userptr
  * @rebind:				rebind
@@ -111,6 +136,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	int map_fd = -1;
 	int64_t fence_timeout;
 
+	igt_info("NNV %s eci %d:%d:%d\n", __func__, eci->gt_id, eci->engine_class, eci->engine_instance);
+	if (flags & SWITCH_CCS_MODE)
+		switch_ccs_mode(fd);
+
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
@@ -312,6 +341,7 @@ igt_main
 		unsigned int flags;
 	} sections[] = {
 		{ "basic", 0 },
+		{ "basic-ccs-mode", SWITCH_CCS_MODE },
 		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY },
 		{ "userptr", USERPTR },
 		{ "rebind", REBIND },
-- 
2.21.0.rc0.32.g243a4c7e27
