Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574E110E989
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 21:24:33 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 1/3] lib/xe: Add __xe_exec_queue_create()
Date: Thu,  7 Dec 2023 13:24:24 -0800
Message-ID: <20231207212429.7690-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231207212429.7690-1-niranjana.vishwanathapura@intel.com>
References: <20231207212429.7690-1-niranjana.vishwanathapura@intel.com>
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

Add __xe_exec_queue_create() which does not assert upon error.

v2: Change __xe_exec_queue_create() return type to int.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_ioctl.c       | 29 ++++++++++++++++++++++++-----
 lib/xe/xe_ioctl.h       |  3 +++
 tests/intel/xe_create.c | 26 --------------------------
 3 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index b29ca40ad..8b12c0369 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -334,9 +334,9 @@ uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async
 	return create.exec_queue_id;
 }
 
-uint32_t xe_exec_queue_create(int fd, uint32_t vm,
-			  struct drm_xe_engine_class_instance *instance,
-			  uint64_t ext)
+int __xe_exec_queue_create(int fd, uint32_t vm,
+			   struct drm_xe_engine_class_instance *instance,
+			   uint64_t ext, uint32_t *exec_queue_id)
 {
 	struct drm_xe_exec_queue_create create = {
 		.extensions = ext,
@@ -345,10 +345,29 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 		.num_placements = 1,
 		.instances = to_user_pointer(instance),
 	};
+	int err;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+	err = igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create);
+	if (err) {
+		err = -errno;
+		igt_assume(err);
+		errno = 0;
+		return err;
+	}
 
-	return create.exec_queue_id;
+	*exec_queue_id = create.exec_queue_id;
+	return 0;
+}
+
+uint32_t xe_exec_queue_create(int fd, uint32_t vm,
+			      struct drm_xe_engine_class_instance *instance,
+			      uint64_t ext)
+{
+	uint32_t exec_queue_id;
+
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, instance, ext, &exec_queue_id), 0);
+
+	return exec_queue_id;
 }
 
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index bd660bd27..bbfa40391 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -73,6 +73,9 @@ uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t pla
 uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 			      uint32_t flags, uint16_t cpu_caching);
 uint16_t __xe_default_cpu_caching_from_placement(int fd, uint32_t placement);
+int __xe_exec_queue_create(int fd, uint32_t vm,
+			   struct drm_xe_engine_class_instance *instance,
+			   uint64_t ext, uint32_t *exec_queue_id);
 uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  struct drm_xe_engine_class_instance *instance,
 			  uint64_t ext);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index cef9db23d..64eadc734 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -101,32 +101,6 @@ enum exec_queue_destroy {
 	LEAK
 };
 
-static uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
-				   struct drm_xe_engine_class_instance *instance,
-				   uint64_t ext,
-				   uint32_t *exec_queuep)
-{
-	struct drm_xe_exec_queue_create create = {
-		.extensions = ext,
-		.vm_id = vm,
-		.width = 1,
-		.num_placements = 1,
-		.instances = to_user_pointer(instance),
-	};
-	int err = 0;
-
-	if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create) == 0) {
-		*exec_queuep = create.exec_queue_id;
-	} else {
-		igt_warn("Can't create exec_queue, errno: %d\n", errno);
-		err = -errno;
-		igt_assume(err);
-	}
-	errno = 0;
-
-	return err;
-}
-
 #define MAXEXECQUEUES 2048
 #define MAXTIME 5
 
-- 
2.43.0
