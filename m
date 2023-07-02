Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717AF10E011
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Jul 2023 22:14:19 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  2 Jul 2023 15:14:26 -0700
Message-Id: <20230702221427.1332519-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] xe_vm: Unmap BOs in bind queue independent
 test
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

Exercises the maple tree dep tracker logic.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_vm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 8eba6643a..dd09a4f91 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -819,6 +819,12 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 				NULL));
 	igt_assert_eq(data[0].data, 0xc0ffee);
 
+	syncobj_destroy(fd, sync[0].handle);
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
 	syncobj_destroy(fd, sync[0].handle);
 	for (i = 0; i < N_ENGINES; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
-- 
2.34.1
