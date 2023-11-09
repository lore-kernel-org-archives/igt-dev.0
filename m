Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CAA10E8E5
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:55:42 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:47 +0000
Message-Id: <20231109155410.7-35-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 34/57] drm-uapi/xe: Differentiate WAIT_OP from
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
---
 include/drm-uapi/xe_drm.h | 41 ++++++++++++++++++++-------------------
 lib/xe/xe_ioctl.c         |  8 ++++----
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index eb70c3202..e33d2a5ae 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1140,22 +1140,22 @@ struct drm_xe_exec_queue_get_property {
  * Returns to user on user fence completion or timeout.
  *
  * The wait @op can be:
- *  - %DRM_XE_UFENCE_WAIT_EQ
- *  - %DRM_XE_UFENCE_WAIT_NEQ
- *  - %DRM_XE_UFENCE_WAIT_GT
- *  - %DRM_XE_UFENCE_WAIT_GTE
- *  - %DRM_XE_UFENCE_WAIT_LT
- *  - %DRM_XE_UFENCE_WAIT_LTE
+ *  - %DRM_XE_UFENCE_WAIT_OP_EQ
+ *  - %DRM_XE_UFENCE_WAIT_OP_NEQ
+ *  - %DRM_XE_UFENCE_WAIT_OP_GT
+ *  - %DRM_XE_UFENCE_WAIT_OP_GTE
+ *  - %DRM_XE_UFENCE_WAIT_OP_LT
+ *  - %DRM_XE_UFENCE_WAIT_OP_LTE
  *
  * The wait @flags can be:
  *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
  *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
  *
  * The wait @mask can be:
- *  - %DRM_XE_UFENCE_WAIT_U8
- *  - %DRM_XE_UFENCE_WAIT_U16
- *  - %DRM_XE_UFENCE_WAIT_U32
- *  - %DRM_XE_UFENCE_WAIT_U64
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U8
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U16
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U32
+ *  - %DRM_XE_UFENCE_WAIT_MASK_U64
  *
  */
 struct drm_xe_wait_user_fence {
@@ -1167,12 +1167,12 @@ struct drm_xe_wait_user_fence {
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
 
@@ -1187,12 +1187,13 @@ struct drm_xe_wait_user_fence {
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
index e928148ee..5d4f2fcd8 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -422,10 +422,10 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
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
@@ -454,10 +454,10 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
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
-- 
2.34.1
