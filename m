Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D442110E1F5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 22:27:10 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 15:27:10 -0700
Message-Id: <20230808222710.13503-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] xe_exec_reset: Fix cm-gt-reset for LR job behavior
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

Long running jobs in Xe are not recoverable even if the job did not
trigger the GT reset due to DRM scheduler not tracking LR jobs. Update
cm-gt-reset to understand all LR jobs are lost after a GT reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_exec_reset.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index dfbaa6035..e8faf6209 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -622,8 +622,10 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_exec(fd, &exec);
 	}
 
-	if (flags & GT_RESET)
+	if (flags & GT_RESET) {
 		xe_force_gt_reset(fd, eci->gt_id);
+		usleep(150000);	/* Let GT reset soak */
+	}
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_ENGINES) {
@@ -636,7 +638,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		return;
 	}
 
-	for (i = 1; i < n_execs; i++)
+	for (i = 1; i < n_execs && !(flags & GT_RESET); i++)
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 			       NULL, THREE_SEC);
 
@@ -644,7 +646,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
 
-	for (i = 1; i < n_execs; i++)
+	for (i = 1; i < n_execs && !(flags & GT_RESET); i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
 
 	for (i = 0; i < n_engines; i++)
-- 
2.34.1
