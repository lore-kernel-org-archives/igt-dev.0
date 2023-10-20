Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B6E10E5B3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:00:40 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:10 +0200
Message-ID: <20231020130016.86398-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
References: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 2/8] tests/intel/xe_create: extend
 massive subtest to multi-gpu
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
on multi-GPUs boards. This will currently work only with
--drivers or IGT_DEVICE options selecting at least two dGPU
cards.

v2: Fixed bug in opening wrong multi-gpu device (Zbigniew)
v3: revert to use filter count, add require for xe, change
    subtest description
v4: correct description

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_create.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d99bd51cf..d74c2140d 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -12,6 +12,7 @@
 #include <string.h>
 
 #include "igt.h"
+#include "igt_device_scan.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -191,6 +192,13 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
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
@@ -228,6 +236,23 @@ igt_main
 		create_massive_size(xe);
 	}
 
+	igt_subtest("multigpu-create-massive-size") {
+		int gpu_filter_count = igt_device_filter_count();
+
+		igt_require(xe > 0);
+		igt_require(gpu_filter_count >= 2);
+		igt_multi_fork(child, gpu_filter_count) {
+			int gpu_fd;
+
+			gpu_fd = child ? __drm_open_driver_another(child, DRIVER_XE) : drm_reopen_driver(xe);
+			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
+
+			create_massive_size(gpu_fd);
+			drm_close_driver(gpu_fd);
+		}
+		igt_waitchildren();
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 }
-- 
2.42.0
