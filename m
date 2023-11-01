Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5B210E7F4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Nov 2023 23:55:36 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Nov 2023 16:53:01 -0700
Message-Id: <20231101235303.4645-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
References: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v2 i-g-t 1/3] lib/xe: Add __xe_exec_queue_create()
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_ioctl.c       | 29 ++++++++++++++++++++++++-----
 lib/xe/xe_ioctl.h       |  3 +++
 tests/intel/xe_create.c | 26 --------------------------
 3 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 895e3bd4e..6f06c304c 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -287,9 +287,9 @@ uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async
 	return create.exec_queue_id;
 }
 
-uint32_t xe_exec_queue_create(int fd, uint32_t vm,
-			  struct drm_xe_engine_class_instance *instance,
-			  uint64_t ext)
+uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
+				struct drm_xe_engine_class_instance *instance,
+				uint64_t ext, uint32_t *exec_queue_id)
 {
 	struct drm_xe_exec_queue_create create = {
 		.extensions = ext,
@@ -298,10 +298,29 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
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
index a8dbcf376..96aac8544 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -68,6 +68,9 @@ uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags
 			      uint32_t *handle);
 uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
 uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
+uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
+				struct drm_xe_engine_class_instance *instance,
+				uint64_t ext, uint32_t *exec_queue_id);
 uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  struct drm_xe_engine_class_instance *instance,
 			  uint64_t ext);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d99bd51cf..145d936f2 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -92,32 +92,6 @@ enum exec_queue_destroy {
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
2.21.0.rc0.32.g243a4c7e27
