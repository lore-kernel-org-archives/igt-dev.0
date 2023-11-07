Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDE410E636
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 17:44:06 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 18:43:46 +0100
Message-ID: <20231107174349.60255-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
References: <20231107174349.60255-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 2/5] drm-uapi/amdgpu: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sync with drm-next commit ("f2cab4b318ee8023f4ad640b906ae268942a7db4")

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/amdgpu_drm.h | 50 ++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index f44e140ad..ad21c613f 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -94,6 +94,9 @@ extern "C" {
  *
  * %AMDGPU_GEM_DOMAIN_OA	Ordered append, used by 3D or Compute engines
  * for appending data.
+ *
+ * %AMDGPU_GEM_DOMAIN_DOORBELL	Doorbell. It is an MMIO region for
+ * signalling user mode queues.
  */
 #define AMDGPU_GEM_DOMAIN_CPU		0x1
 #define AMDGPU_GEM_DOMAIN_GTT		0x2
@@ -101,12 +104,14 @@ extern "C" {
 #define AMDGPU_GEM_DOMAIN_GDS		0x8
 #define AMDGPU_GEM_DOMAIN_GWS		0x10
 #define AMDGPU_GEM_DOMAIN_OA		0x20
+#define AMDGPU_GEM_DOMAIN_DOORBELL	0x40
 #define AMDGPU_GEM_DOMAIN_MASK		(AMDGPU_GEM_DOMAIN_CPU | \
 					 AMDGPU_GEM_DOMAIN_GTT | \
 					 AMDGPU_GEM_DOMAIN_VRAM | \
 					 AMDGPU_GEM_DOMAIN_GDS | \
 					 AMDGPU_GEM_DOMAIN_GWS | \
-					 AMDGPU_GEM_DOMAIN_OA)
+					 AMDGPU_GEM_DOMAIN_OA | \
+					 AMDGPU_GEM_DOMAIN_DOORBELL)
 
 /* Flag that CPU access will be required for the case of VRAM domain */
 #define AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED	(1 << 0)
@@ -145,7 +150,7 @@ extern "C" {
  */
 #define AMDGPU_GEM_CREATE_DISCARDABLE		(1 << 12)
 /* Flag that BO is shared coherently between multiple devices or CPU threads.
- * May depend on GPU instructions to flush caches explicitly
+ * May depend on GPU instructions to flush caches to system scope explicitly.
  *
  * This influences the choice of MTYPE in the PTEs on GFXv9 and later GPUs and
  * may override the MTYPE selected in AMDGPU_VA_OP_MAP.
@@ -158,6 +163,14 @@ extern "C" {
  * may override the MTYPE selected in AMDGPU_VA_OP_MAP.
  */
 #define AMDGPU_GEM_CREATE_UNCACHED		(1 << 14)
+/* Flag that BO should be coherent across devices when using device-level
+ * atomics. May depend on GPU instructions to flush caches to device scope
+ * explicitly, promoting them to system scope automatically.
+ *
+ * This influences the choice of MTYPE in the PTEs on GFXv9 and later GPUs and
+ * may override the MTYPE selected in AMDGPU_VA_OP_MAP.
+ */
+#define AMDGPU_GEM_CREATE_EXT_COHERENT		(1 << 15)
 
 struct drm_amdgpu_gem_create_in  {
 	/** the requested memory size */
@@ -236,9 +249,9 @@ union drm_amdgpu_bo_list {
 /* unknown cause */
 #define AMDGPU_CTX_UNKNOWN_RESET	3
 
-/* indicate gpu reset occured after ctx created */
+/* indicate gpu reset occurred after ctx created */
 #define AMDGPU_CTX_QUERY2_FLAGS_RESET    (1<<0)
-/* indicate vram lost occured after ctx created */
+/* indicate vram lost occurred after ctx created */
 #define AMDGPU_CTX_QUERY2_FLAGS_VRAMLOST (1<<1)
 /* indicate some job from this context once cause gpu hang */
 #define AMDGPU_CTX_QUERY2_FLAGS_GUILTY   (1<<2)
@@ -259,13 +272,6 @@ union drm_amdgpu_bo_list {
 */
 #define AMDGPU_CTX_PRIORITY_HIGH        512
 #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
-/* select a stable profiling pstate for perfmon tools */
-#define AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK  0xf
-#define AMDGPU_CTX_STABLE_PSTATE_NONE  0
-#define AMDGPU_CTX_STABLE_PSTATE_STANDARD  1
-#define AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK  2
-#define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
-#define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
 
 /* select a stable profiling pstate for perfmon tools */
 #define AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK  0xf
@@ -588,7 +594,8 @@ struct drm_amdgpu_gem_va {
  */
 #define AMDGPU_HW_IP_VCN_ENC      7
 #define AMDGPU_HW_IP_VCN_JPEG     8
-#define AMDGPU_HW_IP_NUM          9
+#define AMDGPU_HW_IP_VPE          9
+#define AMDGPU_HW_IP_NUM          10
 
 #define AMDGPU_HW_IP_INSTANCE_MAX_COUNT 1
 
@@ -799,6 +806,8 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
 	#define AMDGPU_INFO_FW_MES		0x1a
 	/* Subquery id: Query IMU firmware version */
 	#define AMDGPU_INFO_FW_IMU		0x1b
+	/* Subquery id: Query VPE firmware version */
+	#define AMDGPU_INFO_FW_VPE		0x1c
 
 /* number of bytes moved for TTM migration */
 #define AMDGPU_INFO_NUM_BYTES_MOVED		0x0f
@@ -897,6 +906,8 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
 	#define AMDGPU_INFO_VIDEO_CAPS_ENCODE		1
 /* Query the max number of IBs per gang per submission */
 #define AMDGPU_INFO_MAX_IBS			0x22
+/* query last page fault info */
+#define AMDGPU_INFO_GPUVM_FAULT			0x23
 
 #define AMDGPU_INFO_MMR_SE_INDEX_SHIFT	0
 #define AMDGPU_INFO_MMR_SE_INDEX_MASK	0xff
@@ -1222,6 +1233,20 @@ struct drm_amdgpu_info_video_caps {
 	struct drm_amdgpu_info_video_codec_info codec_info[AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_COUNT];
 };
 
+#define AMDGPU_VMHUB_TYPE_MASK			0xff
+#define AMDGPU_VMHUB_TYPE_SHIFT			0
+#define AMDGPU_VMHUB_TYPE_GFX			0
+#define AMDGPU_VMHUB_TYPE_MM0			1
+#define AMDGPU_VMHUB_TYPE_MM1			2
+#define AMDGPU_VMHUB_IDX_MASK			0xff00
+#define AMDGPU_VMHUB_IDX_SHIFT			8
+
+struct drm_amdgpu_info_gpuvm_fault {
+	__u64 addr;
+	__u32 status;
+	__u32 vmhub;
+};
+
 /*
  * Supported GPU families
  */
@@ -1240,6 +1265,7 @@ struct drm_amdgpu_info_video_caps {
 #define AMDGPU_FAMILY_GC_11_0_1			148 /* GC 11.0.1 */
 #define AMDGPU_FAMILY_GC_10_3_6			149 /* GC 10.3.6 */
 #define AMDGPU_FAMILY_GC_10_3_7			151 /* GC 10.3.7 */
+#define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 
 #if defined(__cplusplus)
 }
-- 
2.42.0
