Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF2410E41E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:47 +0200
Message-Id: <20230817094652.40243-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/7] lib/intel_compute: Reorganize the code
 for i915 version preparation
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

There's common code in compute pipeline creation so it's worth to
extract it and create dedicated functions for this purpose.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/intel_compute.c | 135 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 110 insertions(+), 25 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 647bce0e43..ef4ae539e8 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -39,6 +39,95 @@ struct bo_dict_entry {
 	void *data;
 };
 
+struct bo_execenv {
+	int fd;
+	enum intel_driver driver;
+
+	/* Xe part */
+	uint32_t vm;
+	uint32_t exec_queue;
+};
+
+static void bo_execenv_create(int fd, struct bo_execenv *execenv)
+{
+	igt_assert(execenv);
+
+	memset(execenv, 0, sizeof(*execenv));
+	execenv->fd = fd;
+	execenv->driver = get_intel_driver(fd);
+
+	if (execenv->driver == INTEL_DRIVER_XE) {
+		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
+								 DRM_XE_ENGINE_CLASS_RENDER);
+	}
+}
+
+static void bo_execenv_destroy(struct bo_execenv *execenv)
+{
+	igt_assert(execenv);
+
+	if (execenv->driver == INTEL_DRIVER_XE) {
+		xe_vm_destroy(execenv->fd, execenv->vm);
+		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
+	}
+}
+
+static void bo_execenv_bind(struct bo_execenv *execenv,
+			    struct bo_dict_entry *bo_dict, int entries)
+{
+	int fd = execenv->fd;
+
+	if (execenv->driver == INTEL_DRIVER_XE) {
+		uint32_t vm = execenv->vm;
+		uint64_t alignment = xe_get_default_alignment(fd);
+		struct drm_xe_sync sync = { 0 };
+
+		sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+		sync.handle = syncobj_create(fd, 0);
+
+		for (int i = 0; i < entries; i++) {
+			bo_dict[i].data = aligned_alloc(alignment, bo_dict[i].size);
+			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data),
+						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+			memset(bo_dict[i].data, 0, bo_dict[i].size);
+		}
+
+		syncobj_destroy(fd, sync.handle);
+	}
+}
+
+static void bo_execenv_unbind(struct bo_execenv *execenv,
+			      struct bo_dict_entry *bo_dict, int entries)
+{
+	int fd = execenv->fd;
+
+	if (execenv->driver == INTEL_DRIVER_XE) {
+		uint32_t vm = execenv->vm;
+		struct drm_xe_sync sync = { 0 };
+
+		sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+		sync.handle = syncobj_create(fd, 0);
+
+		for (int i = 0; i < entries; i++) {
+			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+			free(bo_dict[i].data);
+		}
+
+		syncobj_destroy(fd, sync.handle);
+	}
+}
+
+static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
+{
+	int fd = execenv->fd;
+
+	if (execenv->driver == INTEL_DRIVER_XE)
+		xe_exec_wait(fd, execenv->exec_queue, start_addr);
+}
+
 /*
  * TGL compatible batch
  */
@@ -389,9 +478,6 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 static void tgl_compute_exec(int fd, const unsigned char *kernel,
 			     unsigned int size)
 {
-	uint32_t vm, exec_queue;
-	float *dinput;
-	struct drm_xe_sync sync = { 0 };
 #define TGL_BO_DICT_ENTRIES 7
 	struct bo_dict_entry bo_dict[TGL_BO_DICT_ENTRIES] = {
 		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL}, // kernel
@@ -402,47 +488,46 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT }, // output
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
 	};
+	struct bo_execenv execenv;
+	float *dinput;
+
+	bo_execenv_create(fd, &execenv);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
-	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_RENDER);
-	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
-	sync.handle = syncobj_create(fd, 0);
+	bo_execenv_bind(&execenv, bo_dict, TGL_BO_DICT_ENTRIES);
 
-	for (int i = 0; i < TGL_BO_DICT_ENTRIES; i++) {
-		bo_dict[i].data = aligned_alloc(xe_get_default_alignment(fd), bo_dict[i].size);
-		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data), bo_dict[i].addr, bo_dict[i].size, &sync, 1);
-		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
-		memset(bo_dict[i].data, 0, bo_dict[i].size);
-	}
 	memcpy(bo_dict[0].data, kernel, size);
 	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	tgllp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
 	tgllp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
+
 	dinput = (float *)bo_dict[4].data;
 	srand(time(NULL));
-
 	for (int i = 0; i < SIZE_DATA; i++)
 		((float *)dinput)[i] = rand() / (float)RAND_MAX;
 
-	tgllp_compute_exec_compute(bo_dict[6].data, ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE, ADDR_INDIRECT_OBJECT_BASE, OFFSET_INDIRECT_DATA_START);
+	tgllp_compute_exec_compute(bo_dict[6].data,
+				   ADDR_SURFACE_STATE_BASE,
+				   ADDR_DYNAMIC_STATE_BASE,
+				   ADDR_INDIRECT_OBJECT_BASE,
+				   OFFSET_INDIRECT_DATA_START);
 
-	xe_exec_wait(fd, exec_queue, ADDR_BATCH);
+	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		igt_assert(((float *)bo_dict[5].data)[i] == ((float *)bo_dict[4].data)[i] * ((float *) bo_dict[4].data)[i]);
+	for (int i = 0; i < SIZE_DATA; i++) {
+		float f1, f2;
 
-	for (int i = 0; i < TGL_BO_DICT_ENTRIES; i++) {
-		xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
-		syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
-		free(bo_dict[i].data);
+		f1 = ((float *) bo_dict[5].data)[i];
+		f2 = ((float *) bo_dict[4].data)[i];
+		if (f1 != f2 * f2)
+			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
+		igt_assert(f1 == f2 * f2);
 	}
 
-	syncobj_destroy(fd, sync.handle);
-	xe_exec_queue_destroy(fd, exec_queue);
-	xe_vm_destroy(fd, vm);
+	bo_execenv_unbind(&execenv, bo_dict, TGL_BO_DICT_ENTRIES);
+	bo_execenv_destroy(&execenv);
 }
 
 /*
-- 
2.34.1
