Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E3B10E1EC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 14:18:28 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 15:18:10 +0100
Message-Id: <20230315141810.40105-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] text/xe/xe_exec_basic: Wait for the correct
 vm_bind before exec
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The test was submitting the same syncobj for signalling to all
vm_bind operations, and then awaited it in all execs. However, the
binds don't necessarily complete in order, leading to GPU hangs if
an exec is launched before its bind is complete:

sudo ./xe_exec_basic --r many-engines-many-vm-basic-defer-mmap
IGT-Version: 1.26-g9b86de12 (x86_64) (Linux: 6.1.0+ x86_64)
Starting subtest: many-engines-many-vm-basic-defer-mmap
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: Test assertion failure function __xe_exec_assert, file ../lib/xe/xe_ioctl.c:373:
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: Failed assertion: igt_ioctl(fd, (((1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0x40 + 0x08)) << 0) | ((((sizeof(struct drm_xe_exec)))) << ((0+8)+8))), exec) == 0
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: Last errno: 125, Operation canceled
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: error: -1 != 0
Stack trace:
Subtest many-engines-many-vm-basic-defer-mmap failed.
**** DEBUG ****
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: Test assertion failure function __xe_exec_assert, file ../lib/xe/xe_ioctl.c:373:
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: Failed assertion: igt_ioctl(fd, (((1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0x40 + 0x08)) << 0) | ((((sizeof(struct drm_xe_exec)))) << ((0+8)+8))), exec) == 0
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: Last errno: 125, Operation canceled
(xe_exec_basic:4204) xe/xe_ioctl-CRITICAL: error: -1 != 0
(xe_exec_basic:4204) igt_core-INFO: Stack trace:
****  END  ****
Subtest many-engines-many-vm-basic-defer-mmap: FAIL (0.231s)

Fix this by using a unique syncobj per vm which is awaited in
execs touching that VM.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/xe/xe_exec_basic.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index cb0b8d2c..c1069829 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -93,6 +93,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t engines[MAX_N_ENGINES];
 	uint32_t bind_engines[MAX_N_ENGINES];
 	uint32_t syncobjs[MAX_N_ENGINES];
+	uint32_t bind_syncobjs[MAX_N_ENGINES];
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct {
@@ -150,10 +151,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		else
 			bind_engines[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
+		bind_syncobjs[i] = syncobj_create(fd, 0);
 	};
 
-	sync[0].handle = syncobj_create(fd, 0);
 	for (i = 0; i < n_vm; ++i) {
+		sync[0].handle = bind_syncobjs[i];
 		if (bo)
 			xe_vm_bind_async(fd, vm[i], bind_engines[i], bo, 0,
 					 addr[i], bo_size, sync, 1);
@@ -167,7 +169,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_execs; i++) {
-		uint64_t __addr = addr[i % n_vm];
+		int cur_vm = i % n_vm;
+		uint64_t __addr = addr[cur_vm];
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = __addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
@@ -183,6 +186,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
 		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[0].handle = bind_syncobjs[cur_vm];
 		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
@@ -193,7 +197,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		__xe_exec_assert(fd, &exec);
 
 		if (flags & REBIND && i + 1 != n_execs) {
-			uint32_t __vm = vm[i % n_vm];
+			uint32_t __vm = vm[cur_vm];
 
 			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
 			xe_vm_unbind_async(fd, __vm, bind_engines[e], 0,
@@ -243,7 +247,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < n_engines && n_execs; i++)
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_vm; i++)
+		igt_assert(syncobj_wait(fd, &bind_syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
 
 	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
 	for (i = 0; i < n_vm; ++i) {
@@ -258,7 +265,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	     i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
 
-	syncobj_destroy(fd, sync[0].handle);
 	for (i = 0; i < n_engines; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
 		xe_engine_destroy(fd, engines[i]);
@@ -272,8 +278,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
-	for (i = 0; i < n_vm; ++i)
+	for (i = 0; i < n_vm; ++i) {
+		syncobj_destroy(fd, bind_syncobjs[i]);
 		xe_vm_destroy(fd, vm[i]);
+	}
 }
 
 igt_main
-- 
2.39.2
