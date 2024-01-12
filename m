Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C1510E0AB
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 15:57:07 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Do not validate data on GT
 reset
Date: Fri, 12 Jan 2024 07:46:11 -0800
Message-Id: <20240112154611.1395699-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In the cm-gt-reset test, data validation is blocked because a GT reset
means that we cannot verify the completion of the exec operations.
Extend this logic to all other tests that perform GT resets in
xe_exec_reset.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_exec_reset.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 0cd5b10517..168523c64c 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -294,8 +294,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	for (i = bad_batches; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & GT_RESET)) {
+		for (i = bad_batches; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
+	}
 
 	syncobj_destroy(fd, sync[0].handle);
 	for (i = 0; i < n_exec_queues; i++) {
@@ -462,8 +464,10 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	for (i = 1; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & GT_RESET)) {
+		for (i = 1; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
+	}
 
 	syncobj_destroy(fd, sync[0].handle);
 	for (i = 0; i < n_exec_queues; i++) {
-- 
2.25.1
