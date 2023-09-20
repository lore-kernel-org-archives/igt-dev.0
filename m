Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CF110E4CD
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 16:22:54 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Sep 2023 18:19:13 +0200
Message-ID: <20230920161913.54521-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230920161913.54521-1-kamil.konieczny@linux.intel.com>
References: <20230920161913.54521-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] RFC: tests/intel/xe_create: extend
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
on multi-GPUs boards. This needs changes in lib/drmtest.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 8d845e5c8..27f02ad2a 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -192,6 +192,13 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
  * Description: Verifies xe bo create returns expected error code on massive
  *              buffer sizes.
  */
+/**
+ * SUBTEST: multigpu-create-massive-size
+ * Functionality: ioctl
+ * Test category: multigpu
+ * Description: Verifies xe bo create with massive buffer sizes runs correctly
+ *		on all GPUs.
+ */
 static void create_massive_size(int fd)
 {
 	uint64_t memreg = all_memory_regions(fd), region;
@@ -228,6 +235,22 @@ igt_main
 		create_massive_size(xe);
 	}
 
+	igt_subtest("multigpu-create-massive-size") {
+		igt_require(drm_multigpu_prepare_cards(DRIVER_XE) > 1);
+		igt_multi_fork(child, drm_get_multigpu_count()) {
+			int gpu_fd;
+
+			gpu_fd = child ? __drm_open_driver_another(child, DRIVER_XE) : drm_reopen_driver(xe);
+			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
+			//test
+			create_massive_size(xe);
+			//
+			drm_close_driver(gpu_fd);
+		}
+
+		igt_waitchildren();
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 }
-- 
2.42.0
