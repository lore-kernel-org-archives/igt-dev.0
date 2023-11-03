Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C6D10EA0F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:25 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:07 +0000
Message-Id: <20231103144359.7-13-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 12/64] drm-uapi/xe: Kill VM_MADVISE IOCTL and
 the atomic tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with commit ("drm/xe/uapi: Kill VM_MADVISE IOCTL").

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h        |  92 ++--------------
 lib/xe/xe_ioctl.c                |  14 ---
 lib/xe/xe_ioctl.h                |   2 -
 tests/intel/xe_exec_fault_mode.c | 174 ++-----------------------------
 4 files changed, 20 insertions(+), 262 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 76d7c2a92..d2085fed7 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -103,28 +103,26 @@ struct xe_user_extension {
 #define DRM_XE_VM_CREATE		0x03
 #define DRM_XE_VM_DESTROY		0x04
 #define DRM_XE_VM_BIND			0x05
-#define DRM_XE_EXEC_QUEUE_CREATE	0x06
-#define DRM_XE_EXEC_QUEUE_DESTROY	0x07
-#define DRM_XE_EXEC			0x08
+#define DRM_XE_EXEC			0x06
+#define DRM_XE_EXEC_QUEUE_CREATE	0x07
+#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
-#define DRM_XE_WAIT_USER_FENCE		0x0a
-#define DRM_XE_VM_MADVISE		0x0b
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
-
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
+#define DRM_XE_WAIT_USER_FENCE		0x0b
 /* Must be kept compact -- no holes */
+
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
 #define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
 #define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
 #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
-#define DRM_IOCTL_XE_VM_DESTROY			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
-#define DRM_IOCTL_XE_VM_BIND			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
-#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
-#define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
-#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
 
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
@@ -1081,74 +1079,6 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_madvise - give advice about use of memory
- *
- * The @property can be:
- *  - %DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS - Setting the preferred
- *    location will trigger a migrate of the VMA backing store to new
- *    location if the backing store is already allocated.
- *    For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum
- *    drm_xe_memory_class.
- *  - %DRM_XE_VM_MADVISE_PREFERRED_GT
- *  - %DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT - In this case lower 32 bits
- *    are mem class, upper 32 are GT. Combination provides a single IOCTL
- *    plus migrate VMA to preferred location.
- *  - %DRM_XE_VM_MADVISE_CPU_ATOMIC - The CPU will do atomic memory
- *    operations to this VMA. Must be set on some devices for atomics to
- *    behave correctly.
- *  - %DRM_XE_VM_MADVISE_DEVICE_ATOMIC - The device will do atomic memory
- *    operations to this VMA. Must be set on some devices for atomics to
- *    behave correctly.
- *  - %DRM_XE_VM_MADVISE_PRIORITY - Priority WRT to eviction (moving from
- *    preferred memory location due to memory pressure). The lower the
- *    priority, the more likely to be evicted.
- *
- *    - %DRM_XE_VMA_PRIORITY_LOW
- *    - %DRM_XE_VMA_PRIORITY_NORMAL - Default
- *    - %DRM_XE_VMA_PRIORITY_HIGH - Must be user with elevated privileges
- *  - %DRM_XE_VM_MADVISE_PIN - Pin the VMA in memory, must be user with
- *    elevated privileges
- */
-struct drm_xe_vm_madvise {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @vm_id: The ID VM in which the VMA exists */
-	__u32 vm_id;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @range: Number of bytes in the VMA */
-	__u64 range;
-
-	/** @addr: Address of the VMA to operation on */
-	__u64 addr;
-
-#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS		0
-#define DRM_XE_VM_MADVISE_PREFERRED_GT			1
-#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT	2
-#define DRM_XE_VM_MADVISE_CPU_ATOMIC			3
-#define DRM_XE_VM_MADVISE_DEVICE_ATOMIC			4
-#define DRM_XE_VM_MADVISE_PRIORITY			5
-#define		DRM_XE_VMA_PRIORITY_LOW			0
-#define		DRM_XE_VMA_PRIORITY_NORMAL		1
-#define		DRM_XE_VMA_PRIORITY_HIGH		2
-#define DRM_XE_VM_MADVISE_PIN				6
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad2: MBZ */
-	__u32 pad2;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * DOC: XE PMU event config IDs
  *
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 06c3cb782..db41d5ba5 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -475,17 +475,3 @@ void xe_force_gt_reset(int fd, int gt)
 		 minor(st.st_rdev), gt);
 	system(reset_string);
 }
-
-void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
-		   uint32_t property, uint32_t value)
-{
-	struct drm_xe_vm_madvise madvise = {
-		.vm_id = vm,
-		.range = size,
-		.addr = addr,
-		.property = property,
-		.value = value,
-	};
-
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_MADVISE, &madvise), 0);
-}
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index a8dbcf376..d9c97bf22 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -90,7 +90,5 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
 			       struct drm_xe_engine_class_instance *eci,
 			       int64_t timeout);
 void xe_force_gt_reset(int fd, int gt);
-void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
-		   uint32_t property, uint32_t value);
 
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index b66f31419..92d552f97 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -23,15 +23,15 @@
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES	16
-#define USERPTR				(0x1 << 0)
-#define REBIND				(0x1 << 1)
-#define INVALIDATE			(0x1 << 2)
-#define RACE				(0x1 << 3)
-#define BIND_EXEC_QUEUE		(0x1 << 4)
-#define WAIT_ATOMIC			(0x1 << 5)
-#define IMMEDIATE			(0x1 << 6)
-#define PREFETCH			(0x1 << 7)
-#define INVALID_FAULT		(0x1 << 8)
+
+#define USERPTR		(0x1 << 0)
+#define REBIND		(0x1 << 1)
+#define INVALIDATE	(0x1 << 2)
+#define RACE		(0x1 << 3)
+#define BIND_EXEC_QUEUE	(0x1 << 4)
+#define IMMEDIATE	(0x1 << 5)
+#define PREFETCH	(0x1 << 6)
+#define INVALID_FAULT	(0x1 << 7)
 
 /**
  * SUBTEST: once-%s
@@ -317,146 +317,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }
 
-#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
-#define   MI_ATOMIC_ADD                 (0x7 << 8)
-
-/**
- * SUBTEST: atomic-once
- * Description: Run atomic fault mode test only once
- * Test category: functionality test
- *
- * SUBTEST: atomic-once-wait
- * Description: Run atomic wait fault mode test once
- * Test category: functionality test
- *
- * SUBTEST: atomic-many
- * Description: Run atomic fault mode test many times
- * Description: atomic many
- * Test category: functionality test
- *
- * SUBTEST: atomic-many-wait
- * Description: Run atomic wait fault mode test many times
- * Test category: functionality test
- *
- */
-static void
-test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
-	    int n_atomic, unsigned int flags)
-{
-	uint32_t vm;
-	uint64_t addr = 0x1a0000, addr_wait;
-#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
-	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
-	          .timeline_value = USER_FENCE_VALUE },
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(sync),
-	};
-	uint32_t exec_queue;
-	size_t bo_size;
-	uint32_t bo, bo_wait;
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint64_t vm_sync;
-		uint64_t exec_sync;
-		uint32_t data;
-	} *data;
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint64_t vm_sync;
-		uint64_t exec_sync;
-		uint32_t data;
-	} *wait;
-	uint32_t *ptr;
-	int i, b, wait_idx = 0;
-
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
-	bo_size = sizeof(*data) * n_atomic;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
-	addr_wait = addr + bo_size;
-
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				all_memory_regions(fd) |
-				visible_vram_if_possible(fd, 0));
-	bo_wait = xe_bo_create_flags(fd, vm, bo_size,
-				     visible_vram_if_possible(fd, eci->gt_id));
-	data = xe_bo_map(fd, bo, bo_size);
-	wait = xe_bo_map(fd, bo_wait, bo_size);
-	ptr = &data[0].data;
-	memset(data, 0, bo_size);
-	memset(wait, 0, bo_size);
-
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
-
-	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
-		       ONE_SEC);
-
-	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
-	xe_vm_bind_async(fd, vm, 0, bo_wait, 0, addr_wait, bo_size, sync, 1);
-	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
-		       ONE_SEC);
-
-	xe_vm_madvise(fd, vm, addr, bo_size, DRM_XE_VM_MADVISE_CPU_ATOMIC, 1);
-	xe_vm_madvise(fd, vm, addr, bo_size, DRM_XE_VM_MADVISE_DEVICE_ATOMIC, 1);
-
-	for (i = 0; i < n_atomic; i++) {
-		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
-		uint64_t batch_addr = addr + batch_offset;
-		uint64_t sdi_offset = (char *)&data[0].data - (char *)data;
-		uint64_t sdi_addr = addr + sdi_offset;
-
-		b = 0;
-		data[i].batch[b++] = MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
-			MI_ATOMIC_ADD;
-		data[i].batch[b++] = sdi_addr;
-		data[i].batch[b++] = sdi_addr >> 32;
-		data[i].batch[b++] = 1;
-		data[i].batch[b++] = MI_BATCH_BUFFER_END;
-
-		sync[0].addr = addr_wait +
-			(char *)&wait[i].exec_sync - (char *)wait;
-
-		exec.exec_queue_id = exec_queue;
-		exec.address = batch_addr;
-		xe_exec(fd, &exec);
-
-		if (flags & WAIT_ATOMIC)
-			xe_wait_ufence(fd, &wait[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
-		__atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST);
-	}
-
-	xe_wait_ufence(fd, &wait[n_atomic - 1].exec_sync, USER_FENCE_VALUE,
-		       NULL, ONE_SEC);
-	igt_assert(*ptr == n_atomic * 2);
-
-	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
-	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
-		       ONE_SEC);
-
-	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
-	xe_vm_unbind_async(fd, vm, 0, 0, addr_wait, bo_size, sync, 1);
-	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, NULL,
-		       ONE_SEC);
-
-	xe_exec_queue_destroy(fd, exec_queue);
-	munmap(data, bo_size);
-	munmap(wait, bo_size);
-	gem_close(fd, bo);
-	gem_close(fd, bo_wait);
-	xe_vm_destroy(fd, vm);
-}
-
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -546,22 +406,6 @@ igt_main
 					  s->flags);
 	}
 
-	igt_subtest("atomic-once")
-		xe_for_each_hw_engine(fd, hwe)
-			test_atomic(fd, hwe, 1, 0);
-
-	igt_subtest("atomic-once-wait")
-		xe_for_each_hw_engine(fd, hwe)
-			test_atomic(fd, hwe, 1, WAIT_ATOMIC);
-
-	igt_subtest("atomic-many")
-		xe_for_each_hw_engine(fd, hwe)
-			test_atomic(fd, hwe, 8, 0);
-
-	igt_subtest("atomic-many-wait")
-		xe_for_each_hw_engine(fd, hwe)
-			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
-
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1
