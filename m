Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B51210E619
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:55:26 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 14:54:53 +0000
Message-Id: <20231129145457.7-17-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
References: <20231129145457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 16/20] drm-uapi/xe: Remove bogus engine list
 from the wait_user_fence IOCTL
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

Align with commit ("drm/xe/uapi: Remove bogus engine list from the
wait_user_fence IOCTL")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h  | 17 ++---------------
 lib/xe/xe_ioctl.c          |  8 ++------
 tests/intel/xe_waitfence.c |  8 --------
 3 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 0b9047086..df510f87e 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -961,8 +961,7 @@ struct drm_xe_wait_user_fence {
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
-#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
-#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -995,20 +994,8 @@ struct drm_xe_wait_user_fence {
 	 */
 	__s64 timeout;
 
-	/**
-	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 num_engines;
-
-	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 instances;
-
 	/** @reserved: Reserved */
-	__u64 reserved[2];
+	__u64 reserved[4];
 };
 
 /**
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 56d2fe592..37a64954c 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -423,12 +423,10 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
+		.flags = 0,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
-		.num_engines = eci ? 1 :0,
-		.instances = eci ? to_user_pointer(eci) : 0,
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
@@ -455,12 +453,10 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
+		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
-		.num_engines = eci ? 1 : 0,
-		.instances = eci ? to_user_pointer(eci) : 0,
 	};
 	struct timespec ts;
 
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 3be987954..53b390640 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -47,8 +47,6 @@ static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
-		.num_engines = eci ? 1 : 0,
-		.instances = eci ? to_user_pointer(eci) : 0,
 	};
 	struct timespec ts;
 
@@ -166,8 +164,6 @@ invalid_flag(int fd)
 		.value = 1,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = -1,
-		.num_engines = 0,
-		.instances = 0,
 	};
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -191,8 +187,6 @@ invalid_ops(int fd)
 		.value = 1,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = 1,
-		.num_engines = 0,
-		.instances = 0,
 	};
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -216,8 +210,6 @@ invalid_engine(int fd)
 		.value = 1,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = -1,
-		.num_engines = 1,
-		.instances = 0,
 	};
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-- 
2.34.1
