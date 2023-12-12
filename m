Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389BA10E1EC
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 17:31:15 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1 3/6] drm-uapi/xe: Don't wait on user_fence during exec
 queue reset
Date: Tue, 12 Dec 2023 17:30:56 +0000
Message-Id: <20231212173059.7-4-francois.dugast@intel.com>
In-Reply-To: <20231212173059.7-1-francois.dugast@intel.com>
References: <20231212173059.7-1-francois.dugast@intel.com>
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

Don't wait till timeout on user fence when exec_queue reset is detected
and return return  proper error code

v2: s/drm_xe_wait_user_fence1/drm_xe_wait_user_fence/ (Francois Dugast)

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_waitfence.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index d7e2008c5..4421e571a 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -153,6 +153,9 @@ waitfence(int fd, enum waittype wt)
  *
  * SUBTEST: invalid-engine
  * Description: Check query with invalid engine info returns expected error code
+ *
+ * SUBTEST: exec_queue-reset-wait
+ * Description: Don’t wait till timeout on user fence when exec_queue reset is detected and return return proper error
  */
 
 static void
@@ -227,6 +230,82 @@ invalid_engine(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EFAULT);
 }
 
+static void
+exec_queue_reset_wait(int fd)
+{
+	uint32_t bo, b;
+	uint64_t batch_offset;
+	uint64_t batch_addr;
+	uint64_t sdi_offset;
+	uint64_t sdi_addr;
+	uint64_t addr = 0x1a0000;
+
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_TYPE_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE },
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	uint32_t exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+	struct drm_xe_wait_user_fence wait = {
+		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
+		.flags = 0,
+		.value = 0xc0ffee,
+		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
+		.timeout = -1,
+		.exec_queue_id = exec_queue,
+	};
+
+	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
+	data = xe_bo_map(fd, bo, 0x40000);
+
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr + batch_offset;
+	sdi_offset = (char *)&data[0].data - (char *)data;
+	sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
+
+	wait.addr = to_user_pointer(&data[0].exec_sync);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	xe_exec(fd, &exec);
+
+	/**
+	  * Don't do the GPU mapping(vm_bind) for object, so that exec_queue
+	  * reset will happen and xe_wait_ufence will return EIO not ETIME
+	  */
+	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EIO);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+
+	if (bo) {
+		munmap(data, 0x40000);
+		gem_close(fd, bo);
+	}
+}
 
 igt_main
 {
@@ -253,6 +332,9 @@ igt_main
 	igt_subtest("invalid-engine")
 		invalid_engine(fd);
 
+	igt_subtest("exec_queue-reset-wait")
+		exec_queue_reset_wait(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1
