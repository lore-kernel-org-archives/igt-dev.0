Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849DB10E63C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 18:58:03 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 20:57:32 +0200
Message-ID: <20231013185732.98000-6-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231013185732.98000-1-kamil.konieczny@linux.intel.com>
References: <20231013185732.98000-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] RFC: tests/intel/xe_create: example for
 useing macro for multi-gpu testing
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

Sample code extends existing create-massive-size subtest to run
on multi-GPUs boards with the help of new functions and macros,
this should work without --drivers or IGT_DRIVERS options
but have some limitations that it will not display opened device
at proper child.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 8d845e5c8..0ea890467 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -12,6 +12,8 @@
 #include <string.h>
 
 #include "igt.h"
+#include "igt_device_scan.h"
+#include "lib/i915/gem_multigpu.c"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -191,6 +193,13 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
  * Test category: functionality test
  * Description: Verifies xe bo create returns expected error code on massive
  *              buffer sizes.
+ *
+ * SUBTEST: multigpu-create-massive-size
+ * Functionality: ioctl
+ * Test category: functionality test
+ * Feature: multigpu
+ * Description: Verifies xe bo create with massive buffer sizes runs correctly
+ *		on two or more GPUs.
  */
 static void create_massive_size(int fd)
 {
@@ -228,6 +237,17 @@ igt_main
 		create_massive_size(xe);
 	}
 
+	igt_subtest("multigpu-create-massive-size") {
+		int gpu_count = gem_multigpu_count_class(DRIVER_XE);
+
+		igt_require(xe > 0);
+		igt_require(gpu_count >= 2);
+		igt_multi_fork_foreach_gpu(gpu_fd, DRIVER_XE)
+			create_massive_size(gpu_fd);
+
+		igt_waitchildren();
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 }
-- 
2.42.0
