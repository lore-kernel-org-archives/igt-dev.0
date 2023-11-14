Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E22F10E449
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:49 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:44:25 +0000
Message-Id: <20231114134426.7-8-francois.dugast@intel.com>
In-Reply-To: <20231114134426.7-1-francois.dugast@intel.com>
References: <20231114134426.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 7/8] drm-uapi/xe: Differentiate WAIT_OP from
 WAIT_MASK
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

Align with kernel commit ("drm/xe/uapi: Differentiate WAIT_OP from WAIT_MASK")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h  | 21 +++++++++++----------
 lib/xe/xe_ioctl.c          |  8 ++++----
 tests/intel/xe_waitfence.c | 10 +++++-----
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 2dae8b03e..7a02b78bf 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -914,12 +914,12 @@ struct drm_xe_wait_user_fence {
 	 */
 	__u64 addr;
 
-#define DRM_XE_UFENCE_WAIT_EQ	0
-#define DRM_XE_UFENCE_WAIT_NEQ	1
-#define DRM_XE_UFENCE_WAIT_GT	2
-#define DRM_XE_UFENCE_WAIT_GTE	3
-#define DRM_XE_UFENCE_WAIT_LT	4
-#define DRM_XE_UFENCE_WAIT_LTE	5
+#define DRM_XE_UFENCE_WAIT_OP_EQ	0x0
+#define DRM_XE_UFENCE_WAIT_OP_NEQ	0x1
+#define DRM_XE_UFENCE_WAIT_OP_GT	0x2
+#define DRM_XE_UFENCE_WAIT_OP_GTE	0x3
+#define DRM_XE_UFENCE_WAIT_OP_LT	0x4
+#define DRM_XE_UFENCE_WAIT_OP_LTE	0x5
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
@@ -934,12 +934,13 @@ struct drm_xe_wait_user_fence {
 	/** @value: compare value */
 	__u64 value;
 
-#define DRM_XE_UFENCE_WAIT_U8		0xffu
-#define DRM_XE_UFENCE_WAIT_U16		0xffffu
-#define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
-#define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
+#define DRM_XE_UFENCE_WAIT_MASK_U8	0xffu
+#define DRM_XE_UFENCE_WAIT_MASK_U16	0xffffu
+#define DRM_XE_UFENCE_WAIT_MASK_U32	0xffffffffu
+#define DRM_XE_UFENCE_WAIT_MASK_U64	0xffffffffffffffffu
 	/** @mask: comparison mask */
 	__u64 mask;
+
 	/**
 	 * @timeout: how long to wait before bailing, value in nanoseconds.
 	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index db41d5ba5..a9cfdbf9d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -415,10 +415,10 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
-		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
 		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
 		.value = value,
-		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
 		.num_engines = eci ? 1 :0,
 		.instances = eci ? to_user_pointer(eci) : 0,
@@ -447,10 +447,10 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
-		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
 		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
 		.value = value,
-		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
 		.num_engines = eci ? 1 : 0,
 		.instances = eci ? to_user_pointer(eci) : 0,
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 2efdc1245..b1cae0d9b 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -123,10 +123,10 @@ invalid_flag(int fd)
 
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(&wait_fence),
-		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
 		.flags = -1,
 		.value = 1,
-		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = -1,
 		.num_engines = 0,
 		.instances = 0,
@@ -151,7 +151,7 @@ invalid_ops(int fd)
 		.op = -1,
 		.flags = 0,
 		.value = 1,
-		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = 1,
 		.num_engines = 0,
 		.instances = 0,
@@ -173,10 +173,10 @@ invalid_engine(int fd)
 
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(&wait_fence),
-		.op = DRM_XE_UFENCE_WAIT_EQ,
+		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
 		.flags = 0,
 		.value = 1,
-		.mask = DRM_XE_UFENCE_WAIT_U64,
+		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = -1,
 		.num_engines = 1,
 		.instances = 0,
-- 
2.34.1
