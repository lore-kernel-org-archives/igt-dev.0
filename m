Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE77910E7A1
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 10:09:31 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 12:08:58 +0200
Message-ID: <20231026100909.13317-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
References: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/6] drm-uapi/msm: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

Sync msm drm-uapi header with
drm-next commit ("52920704df878050123dfeb469aa6ab8022547c1")

v1: split msm header to separate patch (Kamil)
v2: correct spelling, correct Petri e-mail (Kamil)

Signed-off-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
---
 include/drm-uapi/msm_drm.h | 62 ++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
index 6b8fffc28..6c34272a1 100644
--- a/include/drm-uapi/msm_drm.h
+++ b/include/drm-uapi/msm_drm.h
@@ -67,16 +67,25 @@ struct drm_msm_timespec {
 	__s64 tv_nsec;         /* nanoseconds */
 };
 
-#define MSM_PARAM_GPU_ID     0x01
-#define MSM_PARAM_GMEM_SIZE  0x02
-#define MSM_PARAM_CHIP_ID    0x03
-#define MSM_PARAM_MAX_FREQ   0x04
-#define MSM_PARAM_TIMESTAMP  0x05
-#define MSM_PARAM_GMEM_BASE  0x06
-#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
-#define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
-#define MSM_PARAM_FAULTS     0x09
-#define MSM_PARAM_SUSPENDS   0x0a
+/* Below "RO" indicates a read-only param, "WO" indicates write-only, and
+ * "RW" indicates a param that can be both read (GET_PARAM) and written
+ * (SET_PARAM)
+ */
+#define MSM_PARAM_GPU_ID     0x01  /* RO */
+#define MSM_PARAM_GMEM_SIZE  0x02  /* RO */
+#define MSM_PARAM_CHIP_ID    0x03  /* RO */
+#define MSM_PARAM_MAX_FREQ   0x04  /* RO */
+#define MSM_PARAM_TIMESTAMP  0x05  /* RO */
+#define MSM_PARAM_GMEM_BASE  0x06  /* RO */
+#define MSM_PARAM_PRIORITIES 0x07  /* RO: The # of priority levels */
+#define MSM_PARAM_PP_PGTABLE 0x08  /* RO: Deprecated, always returns zero */
+#define MSM_PARAM_FAULTS     0x09  /* RO */
+#define MSM_PARAM_SUSPENDS   0x0a  /* RO */
+#define MSM_PARAM_SYSPROF    0x0b  /* WO: 1 preserves perfcntrs, 2 also disables suspend */
+#define MSM_PARAM_COMM       0x0c  /* WO: override for task->comm */
+#define MSM_PARAM_CMDLINE    0x0d  /* WO: override for task cmdline */
+#define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
+#define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -90,6 +99,8 @@ struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
 	__u32 param;          /* in, MSM_PARAM_x */
 	__u64 value;          /* out (get_param) or in (set_param) */
+	__u32 len;            /* zero for non-pointer params */
+	__u32 pad;            /* must be zero */
 };
 
 /*
@@ -126,6 +137,8 @@ struct drm_msm_gem_new {
 #define MSM_INFO_GET_IOVA	0x01   /* get iova, returned by value */
 #define MSM_INFO_SET_NAME	0x02   /* set the debug name (by pointer) */
 #define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
+#define MSM_INFO_SET_IOVA	0x04   /* set the iova, passed by value */
+#define MSM_INFO_GET_FLAGS	0x05   /* get the MSM_BO_x flags */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
@@ -138,8 +151,13 @@ struct drm_msm_gem_info {
 #define MSM_PREP_READ        0x01
 #define MSM_PREP_WRITE       0x02
 #define MSM_PREP_NOSYNC      0x04
+#define MSM_PREP_BOOST       0x08
 
-#define MSM_PREP_FLAGS       (MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NOSYNC)
+#define MSM_PREP_FLAGS       (MSM_PREP_READ | \
+			      MSM_PREP_WRITE | \
+			      MSM_PREP_NOSYNC | \
+			      MSM_PREP_BOOST | \
+			      0)
 
 struct drm_msm_gem_cpu_prep {
 	__u32 handle;         /* in */
@@ -168,7 +186,11 @@ struct drm_msm_gem_cpu_fini {
  */
 struct drm_msm_gem_submit_reloc {
 	__u32 submit_offset;  /* in, offset from submit_bo */
+#ifdef __cplusplus
+	__u32 _or;            /* in, value OR'd with result */
+#else
 	__u32 or;             /* in, value OR'd with result */
+#endif
 	__s32 shift;          /* in, amount of left shift (can be negative) */
 	__u32 reloc_idx;      /* in, index of reloc_bo buffer */
 	__u64 reloc_offset;   /* in, offset from start of reloc_bo */
@@ -209,10 +231,12 @@ struct drm_msm_gem_submit_cmd {
 #define MSM_SUBMIT_BO_READ             0x0001
 #define MSM_SUBMIT_BO_WRITE            0x0002
 #define MSM_SUBMIT_BO_DUMP             0x0004
+#define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
 
 #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
 					MSM_SUBMIT_BO_WRITE | \
-					MSM_SUBMIT_BO_DUMP)
+					MSM_SUBMIT_BO_DUMP | \
+					MSM_SUBMIT_BO_NO_IMPLICIT)
 
 struct drm_msm_gem_submit_bo {
 	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
@@ -227,6 +251,7 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB */
 #define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
 #define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
+#define MSM_SUBMIT_FENCE_SN_IN   0x02000000 /* userspace passes in seqno fence */
 #define MSM_SUBMIT_FLAGS                ( \
 		MSM_SUBMIT_NO_IMPLICIT   | \
 		MSM_SUBMIT_FENCE_FD_IN   | \
@@ -234,6 +259,7 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_SUDO          | \
 		MSM_SUBMIT_SYNCOBJ_IN    | \
 		MSM_SUBMIT_SYNCOBJ_OUT   | \
+		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
 #define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
@@ -253,7 +279,7 @@ struct drm_msm_gem_submit_syncobj {
  */
 struct drm_msm_gem_submit {
 	__u32 flags;          /* MSM_PIPE_x | MSM_SUBMIT_x */
-	__u32 fence;          /* out */
+	__u32 fence;          /* out (or in with MSM_SUBMIT_FENCE_SN_IN flag) */
 	__u32 nr_bos;         /* in, number of submit_bo's */
 	__u32 nr_cmds;        /* in, number of submit_cmd's */
 	__u64 bos;            /* in, ptr to array of submit_bo's */
@@ -269,6 +295,11 @@ struct drm_msm_gem_submit {
 
 };
 
+#define MSM_WAIT_FENCE_BOOST	0x00000001
+#define MSM_WAIT_FENCE_FLAGS	( \
+		MSM_WAIT_FENCE_BOOST | \
+		0)
+
 /* The normal way to synchronize with the GPU is just to CPU_PREP on
  * a buffer if you need to access it from the CPU (other cmdstream
  * submission from same or other contexts, PAGE_FLIP ioctl, etc, all
@@ -278,7 +309,7 @@ struct drm_msm_gem_submit {
  */
 struct drm_msm_wait_fence {
 	__u32 fence;          /* in */
-	__u32 pad;
+	__u32 flags;          /* in, bitmask of MSM_WAIT_FENCE_x */
 	struct drm_msm_timespec timeout;   /* in */
 	__u32 queueid;         /* in, submitqueue id */
 };
@@ -333,9 +364,7 @@ struct drm_msm_submitqueue_query {
 };
 
 #define DRM_MSM_GET_PARAM              0x00
-/* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
- */
 #define DRM_MSM_GEM_NEW                0x02
 #define DRM_MSM_GEM_INFO               0x03
 #define DRM_MSM_GEM_CPU_PREP           0x04
@@ -351,6 +380,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
+#define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
 #define DRM_IOCTL_MSM_GEM_INFO         DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_INFO, struct drm_msm_gem_info)
 #define DRM_IOCTL_MSM_GEM_CPU_PREP     DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_GEM_CPU_PREP, struct drm_msm_gem_cpu_prep)
-- 
2.42.0
