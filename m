Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617DA10EAFE
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 12:40:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] tests/intel: Add xe_coredump test
Date: Fri, 12 Jan 2024 13:40:43 +0100
Message-Id: <20240112124043.166886-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240112124043.166886-1-maarten.lankhorst@linux.intel.com>
References: <20240112124043.166886-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add a simple test that forces a GPU hang and then reads the resulting
devcoredump file. Map a single userptr and BO, and dump the contents of
those.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/intel/xe_coredump.c | 188 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 tests/intel/xe_coredump.c

diff --git a/tests/intel/xe_coredump.c b/tests/intel/xe_coredump.c
new file mode 100644
index 000000000..9db79bb1d
--- /dev/null
+++ b/tests/intel/xe_coredump.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Check devcoredump functionality
+ * Category: Software building block
+ * Sub-category: devcoredump
+ * Test category: functionality test
+ * Run type: BAT
+ * Description: Test devcoredump functionality and dumping work as intended.
+ */
+
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <glob.h>
+#include <wchar.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_io.h"
+#include "igt_syncobj.h"
+#include "igt_sysfs.h"
+
+#include "intel_pat.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+static struct xe_device *xe;
+static uint32_t batch_bo;
+static uint32_t *batch;
+static void *userptr;
+static uint32_t vm;
+
+#define MAX_N_ENGINES 32
+
+/*
+ * Helper to read and clear devcore.  We want to read it completely to ensure
+ * we catch any kernel side regressions like:
+ * https://gitlab.freedesktop.org/drm/msm/-/issues/20
+ */
+
+static void
+read_and_clear_devcore(bool match)
+{
+	glob_t glob_buf = {0};
+	int ret, i;
+
+	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
+	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+		return;
+
+	for (i = 0; i < glob_buf.gl_pathc; i++) {
+		char buf[0x1000];
+		int fd = open(glob_buf.gl_pathv[i], O_RDWR);
+
+		if (fd == -1)
+			continue;
+
+		/*
+		 * We want to read the entire file but we can throw away the
+		 * contents.. we just want to make sure that we exercise the
+		 * kernel side codepaths hit when reading the devcore from
+		 * sysfs
+		 */
+		igt_debug("---- begin coredump ----\n");
+		do {
+			memset(buf, 0, sizeof(buf));
+			ret = igt_readn(fd, buf, sizeof(buf) - 1);
+			igt_debug("%s", buf);
+		} while (ret > 0);
+
+		igt_debug("---- end coredump ----\n");
+
+		/* Clear the devcore: */
+		igt_writen(fd, "1", 1);
+
+		close(fd);
+		match = false;
+	}
+
+	globfree(&glob_buf);
+	igt_assert_f(!match, "No devcoredump found.\n");
+}
+
+/**
+ * SUBTEST: %s
+ * Description: Hang the GPU, and read out the resulting devcoredump.
+ * Test category: functionality test
+ */
+static void
+do_hang_test(bool all)
+{
+	uint32_t *ptr = batch;
+	uint64_t offset = xe->default_alignment - 4;
+	struct drm_xe_engine_class_instance *hwe;
+	uint32_t engines[MAX_N_ENGINES], syncobjs[MAX_N_ENGINES];
+	int i = 0;
+
+	memset(batch, 0, xe->default_alignment);
+	*(ptr++) = MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_GTE_SDD;
+	*(ptr++) = 1;
+	*(ptr++) = offset >> 32;
+	*(ptr++) = offset;
+	*(ptr++) = MI_BATCH_BUFFER_END;
+
+	xe_for_each_engine(xe->fd, hwe) {
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		};
+
+		sync.handle = syncobjs[i] = syncobj_create(xe->fd, 0);
+		engines[i] = xe_exec_queue_create(xe->fd, vm, hwe, 0);
+		xe_exec_sync(xe->fd, engines[i], 0, &sync, 1);
+		i++;
+		if (!all)
+			break;
+	}
+
+	/* Ensure all syncobjs are in a failed state */
+	while (i--) {
+		syncobj_wait(xe->fd, &syncobjs[i], 1, INT64_MAX, 0, NULL);
+		syncobj_destroy(xe->fd, syncobjs[i]);
+	}
+}
+
+igt_main
+{
+	igt_fixture {
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		};
+		struct drm_xe_vm_bind_op bind_ops[2] = { };
+
+		int fd = drm_open_driver_render(DRIVER_XE);
+		xe = xe_device_get(fd);
+
+		/* Before test, ensure devcoredump is empty */
+		read_and_clear_devcore(false);
+
+		vm = xe_vm_create(fd, 0, 0);
+		batch_bo = xe_bo_create(fd, vm, xe->default_alignment, system_memory(fd), 0);
+		batch = xe_bo_map(xe->fd, batch_bo, xe->default_alignment);
+
+		userptr = mmap(0, xe->default_alignment, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+		wmemset(userptr, 0xf1234567, xe->default_alignment / sizeof(wchar_t));
+
+		bind_ops[0].op = DRM_XE_VM_BIND_OP_MAP;
+		bind_ops[0].obj = batch_bo;
+		bind_ops[0].addr = 0;
+
+		bind_ops[1].op = DRM_XE_VM_BIND_OP_MAP_USERPTR;
+		bind_ops[1].userptr = (size_t)userptr;
+		bind_ops[1].addr = 1ULL << 40ULL;
+
+		bind_ops[0].flags = bind_ops[1].flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
+		bind_ops[0].range = bind_ops[1].range = xe->default_alignment;
+		bind_ops[0].pat_index = bind_ops[1].pat_index = intel_get_pat_idx_wb(fd);
+
+		sync.handle = syncobj_create(fd, 0);
+		xe_vm_bind_array(fd, vm, 0, bind_ops, ARRAY_SIZE(bind_ops), &sync, 1);
+		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+		syncobj_destroy(fd, sync.handle);
+
+	}
+
+	igt_describe("Test that hw fault coredump readout works");
+	igt_subtest("basic") {
+		do_hang_test(false);
+
+		read_and_clear_devcore(true);
+	}
+
+	igt_describe("Hang all engines simultaneously");
+	igt_subtest("all-simultaneously") {
+		do_hang_test(true);
+
+		read_and_clear_devcore(true);
+	}
+}
+
diff --git a/tests/meson.build b/tests/meson.build
index a6a8498e2..cb19627e1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -279,6 +279,7 @@ intel_xe_progs = [
 	'xe_create',
 	'xe_compute',
 	'xe_copy_basic',
+	'xe_coredump',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
 	'xe_drm_fdinfo',
-- 
2.40.1
