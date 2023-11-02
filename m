Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2D610E879
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 12:10:58 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 13:10:37 +0100
Message-ID: <20231102121044.58786-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231102121044.58786-1-kamil.konieczny@linux.intel.com>
References: <20231102121044.58786-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 2/4] tests/intel/xe_create: add multi-GPU
 basic test
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

Add basic multi-GPU test using drm filtered helpers.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d99bd51cf..dc7c9502e 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -191,6 +191,13 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
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
@@ -228,6 +235,25 @@ igt_main
 		create_massive_size(xe);
 	}
 
+	igt_subtest("multigpu-create-massive-size") {
+		int gpu_count = drm_get_filtered_gpu_count(DRIVER_XE);
+
+		igt_require(xe > 0);
+		igt_require(gpu_count >= 2);
+		igt_multi_fork(child, gpu_count) {
+			int gpu_fd;
+
+			gpu_fd = drm_open_filtered_card(child);
+			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
+			igt_assert(is_xe_device(gpu_fd));
+
+			create_massive_size(gpu_fd);
+			drm_close_driver(gpu_fd);
+		}
+		igt_waitchildren();
+	}
+
+
 	igt_fixture
 		drm_close_driver(xe);
 }
-- 
2.42.0
