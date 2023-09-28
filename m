Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA3910E60C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 11:05:44 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 11:05:11 +0000
Message-Id: <20230928110516.7-10-francois.dugast@intel.com>
In-Reply-To: <20230928110516.7-1-francois.dugast@intel.com>
References: <20230928110516.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 09/14] drm-uapi: Kill
 XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
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

Align with commit ("drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h     | 23 +----------------------
 tests/intel/xe_exec_threads.c | 14 +-------------
 tests/intel/xe_vm.c           | 13 +------------
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index a2dc80727..0a05a12b2 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -552,23 +552,6 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occurred */
-	__s32 error;
-
-	/** @op: operation that encounter an error */
-	__u32 op;
-
-	/** @addr: address of bind op */
-	__u64 addr;
-
-	/** @size: size of bind */
-	__u64 size;
-};
-
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
@@ -589,7 +572,6 @@ struct drm_xe_ext_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -674,10 +656,7 @@ struct drm_xe_vm_bind_op {
 	 * practice the bind op is good and will complete.
 	 *
 	 * If this flag is set and doesn't return an error, the bind op can
-	 * still fail and recovery is needed. If configured, the bind op that
-	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
-	 * Once the user sees the error (via a ufence +
-	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
+	 * still fail and recovery is needed. It should free memory
 	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index b22c9c052..c9a51fc00 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -740,7 +740,6 @@ static void *thread(void *data)
 
 struct vm_thread_data {
 	pthread_t thread;
-	struct drm_xe_vm_bind_op_error_capture *capture;
 	int fd;
 	int vm;
 };
@@ -772,7 +771,6 @@ static void *vm_async_ops_err_thread(void *data)
 		/* Restart and wait for next error */
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
 					&bind), 0);
-		args->capture->error = 0;
 		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
 	}
 
@@ -1021,7 +1019,6 @@ static void threads(int fd, int flags)
 	int n_hw_engines = 0, class;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
-	struct drm_xe_vm_bind_op_error_capture capture = {};
 	struct vm_thread_data vm_err_thread = {};
 	bool go = false;
 	int n_threads = 0;
@@ -1054,23 +1051,14 @@ static void threads(int fd, int flags)
 	pthread_cond_init(&cond, 0);
 
 	if (flags & SHARED_VM) {
-		struct drm_xe_ext_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_VM_EXTENSION_SET_PROPERTY,
-			.property =
-				XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
-			.value = to_user_pointer(&capture),
-		};
-
 		vm_legacy_mode = xe_vm_create(fd,
 					      DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
-					      to_user_pointer(&ext));
+					      0);
 		vm_compute_mode = xe_vm_create(fd,
 					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
 					       DRM_XE_VM_CREATE_COMPUTE_MODE,
 					       0);
 
-		vm_err_thread.capture = &capture;
 		vm_err_thread.fd = fd;
 		vm_err_thread.vm = vm_legacy_mode;
 		pthread_create(&vm_err_thread.thread, 0,
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 75e7a384b..89df6149a 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -324,7 +324,6 @@ static void userptr_invalid(int fd)
 
 struct vm_thread_data {
 	pthread_t thread;
-	struct drm_xe_vm_bind_op_error_capture *capture;
 	int fd;
 	int vm;
 	uint32_t bo;
@@ -388,7 +387,6 @@ static void *vm_async_ops_err_thread(void *data)
 		/* Restart and wait for next error */
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
 					&bind), 0);
-		args->capture->error = 0;
 		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
 	}
 
@@ -403,24 +401,15 @@ static void vm_async_ops_err(int fd, bool destroy)
 		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
 	};
 #define N_BINDS		32
-	struct drm_xe_vm_bind_op_error_capture capture = {};
-	struct drm_xe_ext_set_property ext = {
-		.base.next_extension = 0,
-		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
-		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
-		.value = to_user_pointer(&capture),
-	};
 	struct vm_thread_data thread = {};
 	uint32_t syncobjs[N_BINDS];
 	size_t bo_size = 0x1000 * 32;
 	uint32_t bo;
 	int i, j;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
-			  to_user_pointer(&ext));
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo = xe_bo_create(fd, 0, vm, bo_size);
 
-	thread.capture = &capture;
 	thread.fd = fd;
 	thread.vm = vm;
 	thread.bo = bo;
-- 
2.34.1
