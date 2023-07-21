Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38F910E61A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 04:38:00 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 21:37:34 -0700
Message-Id: <20230721043735.205229-4-matthew.brost@intel.com>
In-Reply-To: <20230721043735.205229-1-matthew.brost@intel.com>
References: <20230721043735.205229-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/5] xe_vm: Unmap BOs in bind queue independent
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

Unmaps also exercise the bind conflict logic in Xe, add an unmap to the
bind queue independent test to further test the conflict logic.

v2: new commit message (Rodrigo)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_vm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 5fd511f0b8..36cd803577 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -811,6 +811,12 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
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
