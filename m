Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F38C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 09:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EB510E5EC;
	Tue, 16 Jul 2024 09:02:34 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1896510E5EC
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2024 09:02:32 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] tests/xe_exec_reset: Add readout of devcoredump
Date: Tue, 16 Jul 2024 11:02:41 +0200
Message-ID: <20240716090241.109992-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

We're mostly testing if we can read the devcoredump, clear the
devcoredump at the start of each subtest, and read it out at the end
of the test.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/intel/xe_exec_reset.c | 134 ++++++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 817b82cde..c88e72a65 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -12,7 +12,12 @@
  * Test category: functionality test
  */
 
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+
 #include "igt.h"
+#include "lib/igt_io.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
@@ -22,6 +27,74 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
+static int sysfd = -1;
+
+static u64 dummy_size;
+static void *dummy;
+
+/* Clear any previous devcoredump */
+static void tryclear_hang(void)
+{
+	int fd;
+	char buf[256];
+
+	if (sysfd < 0)
+		return;
+
+	fd = openat(sysfd, "devcoredump/data", O_RDWR);
+	if (fd < 0)
+		return;
+
+	/* Read is optional, but see comment below why we do it */
+	while (read(fd, buf, sizeof(buf)) > 0)
+		{ }
+	write(fd, "1", 1);
+	close(fd);
+}
+
+/*
+ * Helper to read and clear devcore.  We want to read it completely to ensure
+ * we catch any kernel side regressions like:
+ * https://gitlab.freedesktop.org/drm/msm/-/issues/20
+ */
+static void
+read_and_clear_hang(void)
+{
+	char buf[0x1000];
+	int fd;
+
+	if (sysfd < 0)
+		return;
+
+	fd = openat(sysfd, "devcoredump/data", O_RDWR);
+	igt_assert(fd >= 0);
+
+	/*
+	 * We want to read the entire file but we can throw away the
+	 * contents.. we just want to make sure that we exercise the
+	 * kernel side codepaths hit when reading the devcore from
+	 * sysfs
+	 */
+	igt_debug("---- begin coredump ----\n");
+	while (1) {
+		ssize_t ret;
+
+		ret = igt_readn(fd, buf, sizeof(buf) - 1);
+		igt_assert(ret >= 0);
+		if (ret == 0)
+			break;
+		buf[ret] = '\0';
+		igt_debug("%s", buf);
+	}
+
+	igt_debug("---- end coredump ----\n");
+
+	/* Clear the devcore: */
+	igt_writen(fd, "1", 1);
+
+	close(fd);
+}
+
 /**
  * SUBTEST: spin
  * Description: test spin
@@ -59,7 +132,11 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	syncobj = syncobj_create(fd, 0);
 
 	sync[0].handle = syncobj_create(fd, 0);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
+			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
+
+	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
+				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
 
 	xe_spin_init(spin, &spin_opts);
 
@@ -90,6 +167,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	munmap(spin, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
+
+	read_and_clear_hang();
 }
 
 #define MAX_N_EXECQUEUES	16
@@ -100,6 +179,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 #define VIRTUAL				(0x1 << 3)
 #define PARALLEL			(0x1 << 4)
 #define CAT_ERROR			(0x1 << 5)
+#define CAPTURE				(0x1 << 6)
 
 /**
  * SUBTEST: %s-cat-error
@@ -160,6 +240,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
+	tryclear_hang();
+
 	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
@@ -187,7 +269,11 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
 
 	sync[0].handle = syncobj_create(fd, 0);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
+			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
+
+	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
+				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
 
 	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & GT_RESET))
 		bad_batches = num_placements;
@@ -275,6 +361,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
+
+	read_and_clear_hang();
 }
 
 /**
@@ -327,6 +415,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
+	tryclear_hang();
+
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
@@ -342,7 +432,11 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	};
 
 	sync[0].handle = syncobj_create(fd, 0);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
+			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
+
+	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
+				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t base_addr = flags & CAT_ERROR && !i ?
@@ -419,6 +513,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
+
+	read_and_clear_hang();
 }
 
 /**
@@ -473,6 +569,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
+	tryclear_hang();
+
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
@@ -488,7 +586,12 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	};
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, bo_size, sync, 1,
+			       DRM_XE_VM_BIND_FLAG_DUMPABLE);
+
+	/* Capture BO as userptr too */
+	xe_vm_bind_userptr_async_flags(fd, vm, 0, to_user_pointer(dummy), addr + bo_size, dummy_size, sync, 1,
+				       DRM_XE_VM_BIND_FLAG_DUMPABLE);
 
 #define THREE_SEC	MS_TO_NS(3000)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_SEC);
@@ -571,6 +674,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
+
+	read_and_clear_hang();
 }
 
 struct gt_thread_data {
@@ -591,6 +696,8 @@ static void do_resets(struct gt_thread_data *t)
 		usleep(250000);	/* 250 ms */
 		(*t->num_reset)++;
 		xe_force_gt_reset_async(t->fd, t->gt);
+
+		tryclear_hang();
 	}
 }
 
@@ -700,6 +807,8 @@ gt_reset(int fd, int n_threads, int n_sec)
 	printf("number of resets %d\n", num_reset);
 
 	free(threads);
+
+	tryclear_hang();
 }
 
 igt_main
@@ -717,9 +826,24 @@ igt_main
 	int class;
 	int fd;
 
-	igt_fixture
+	igt_fixture {
+		struct stat stat;
+		char str[256];
+
 		fd = drm_open_driver(DRIVER_XE);
 
+		igt_assert_eq(fstat(fd, &stat), 0);
+		sprintf(str, "/sys/dev/char/%ld:%ld/device", stat.st_rdev >> 8, stat.st_rdev & 0xff);
+		sysfd = open(str, O_DIRECTORY);
+
+		tryclear_hang();
+
+		dummy_size = sysconf(_SC_PAGESIZE);
+		if (dummy_size < SZ_64K)
+			dummy_size = SZ_64K;
+		dummy = aligned_alloc(dummy_size, dummy_size);
+	}
+
 	igt_subtest("spin")
 		xe_for_each_engine(fd, hwe)
 			test_spin(fd, hwe);
-- 
2.45.2

