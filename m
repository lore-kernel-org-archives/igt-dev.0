Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1EC10E46A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 01:21:41 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:21:35 -0700
Message-Id: <20230727012136.456190-4-matthew.brost@intel.com>
In-Reply-To: <20230727012136.456190-1-matthew.brost@intel.com>
References: <20230727012136.456190-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/4] xe_exec_basic: Add section to test zero
 number of BB in exec IOCTL
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

Verify the exec queue ordering works wrt out-sync signaling when zero
number of BB passed to exec IOCTL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_exec_basic.c | 107 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 33750458e9..259e5e158a 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -18,6 +18,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 #include <string.h>
 
 #define MAX_N_ENGINES 16
@@ -300,6 +301,108 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 }
 
+/**
+ * SUBTEST: zero-execs
+ * Description: Test zero execs in IOCTL
+ * Functionality: exec IOCTL
+ * Run type: BAT
+ */
+
+static void test_zero_execs(int fd, struct drm_xe_engine_class_instance *eci,
+			    int n_execs)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	size_t bo_size;
+	uint32_t bo = 0;
+	uint32_t syncobj;
+	uint32_t engine;
+	struct xe_cork cork;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
+	data = xe_bo_map(fd, bo, bo_size);
+	engine = xe_engine_create(fd, vm, eci, 0);
+
+	xe_cork_init(fd, eci, &cork);
+	xe_cork_wait_started(&cork);
+
+	/* Initial bind behind cork */
+	sync[0].handle = syncobj = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[1].handle = cork.syncobj;
+	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 2);
+
+	/* Exec behind bind */
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+	}
+
+	/* Exec with no batch buffer */
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	exec.num_batch_buffer = 0;
+	exec.address = 0;
+	xe_exec(fd, &exec);
+
+	/* Let jobs runs for a bit */
+	usleep(100000);
+
+	/* both bind and execs are waiting */
+	igt_assert(!syncobj_wait(fd, &syncobj, 1, 0, 0, NULL));
+	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
+
+	/* Release cork */
+	xe_cork_end(&cork);
+	xe_cork_wait_done(&cork);
+	xe_cork_fini(&cork);
+
+	/* both binds are done */
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -369,6 +472,10 @@ igt_main
 				test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
+	igt_subtest("zero-execs")
+		xe_for_each_hw_engine(fd, hwe)
+			test_zero_execs(fd, hwe, 1);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1
