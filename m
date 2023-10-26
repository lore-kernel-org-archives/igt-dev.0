Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBD810E79E
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 10:09:18 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 12:08:56 +0200
Message-ID: <20231026100909.13317-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
References: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/6] drm-uapi/amdgpu_drm: sync with
 drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

Sync drm-uapi header amdgpu_drm.h with drm-next commit ("52920704df878050123dfeb469aa6ab8022547c1")

v1: split amdgpu to separate patch (Kamil)

Signed-off-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 118 ++++++++++++++++++++++++++++++----
 1 file changed, 106 insertions(+), 12 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 3f10e45ef..f44e140ad 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -80,7 +80,7 @@ extern "C" {
  *
  * %AMDGPU_GEM_DOMAIN_GTT	GPU accessible system memory, mapped into the
  * GPU's virtual address space via gart. Gart memory linearizes non-contiguous
- * pages of system memory, allows GPU access system memory in a linezrized
+ * pages of system memory, allows GPU access system memory in a linearized
  * fashion.
  *
  * %AMDGPU_GEM_DOMAIN_VRAM	Local video memory. For APUs, it is memory
@@ -140,6 +140,24 @@ extern "C" {
  * not require GTT memory accounting
  */
 #define AMDGPU_GEM_CREATE_PREEMPTIBLE		(1 << 11)
+/* Flag that BO can be discarded under memory pressure without keeping the
+ * content.
+ */
+#define AMDGPU_GEM_CREATE_DISCARDABLE		(1 << 12)
+/* Flag that BO is shared coherently between multiple devices or CPU threads.
+ * May depend on GPU instructions to flush caches explicitly
+ *
+ * This influences the choice of MTYPE in the PTEs on GFXv9 and later GPUs and
+ * may override the MTYPE selected in AMDGPU_VA_OP_MAP.
+ */
+#define AMDGPU_GEM_CREATE_COHERENT		(1 << 13)
+/* Flag that BO should not be cached by GPU. Coherent without having to flush
+ * GPU caches explicitly
+ *
+ * This influences the choice of MTYPE in the PTEs on GFXv9 and later GPUs and
+ * may override the MTYPE selected in AMDGPU_VA_OP_MAP.
+ */
+#define AMDGPU_GEM_CREATE_UNCACHED		(1 << 14)
 
 struct drm_amdgpu_gem_create_in  {
 	/** the requested memory size */
@@ -249,10 +267,18 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
 #define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
 
+/* select a stable profiling pstate for perfmon tools */
+#define AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK  0xf
+#define AMDGPU_CTX_STABLE_PSTATE_NONE  0
+#define AMDGPU_CTX_STABLE_PSTATE_STANDARD  1
+#define AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK  2
+#define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
+#define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
+
 struct drm_amdgpu_ctx_in {
 	/** AMDGPU_CTX_OP_* */
 	__u32	op;
-	/** For future use, no flags defined so far */
+	/** Flags */
 	__u32	flags;
 	__u32	ctx_id;
 	/** AMDGPU_CTX_PRIORITY_* */
@@ -273,6 +299,11 @@ union drm_amdgpu_ctx_out {
 			/** Reset status since the last call of the ioctl. */
 			__u32	reset_status;
 		} state;
+
+		struct {
+			__u32	flags;
+			__u32	_pad;
+		} pstate;
 };
 
 union drm_amdgpu_ctx {
@@ -525,6 +556,8 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_MTYPE_UC		(4 << 5)
 /* Use Read Write MTYPE instead of default MTYPE */
 #define AMDGPU_VM_MTYPE_RW		(5 << 5)
+/* don't allocate MALL */
+#define AMDGPU_VM_PAGE_NOALLOC		(1 << 9)
 
 struct drm_amdgpu_gem_va {
 	/** GEM object handle */
@@ -549,6 +582,10 @@ struct drm_amdgpu_gem_va {
 #define AMDGPU_HW_IP_VCE          4
 #define AMDGPU_HW_IP_UVD_ENC      5
 #define AMDGPU_HW_IP_VCN_DEC      6
+/*
+ * From VCN4, AMDGPU_HW_IP_VCN_ENC is re-used to support
+ * both encoding and decoding jobs.
+ */
 #define AMDGPU_HW_IP_VCN_ENC      7
 #define AMDGPU_HW_IP_VCN_JPEG     8
 #define AMDGPU_HW_IP_NUM          9
@@ -564,6 +601,7 @@ struct drm_amdgpu_gem_va {
 #define AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES	0x07
 #define AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT    0x08
 #define AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL  0x09
+#define AMDGPU_CHUNK_ID_CP_GFX_SHADOW   0x0a
 
 struct drm_amdgpu_cs_chunk {
 	__u32		chunk_id;
@@ -680,6 +718,15 @@ struct drm_amdgpu_cs_chunk_data {
 	};
 };
 
+#define AMDGPU_CS_CHUNK_CP_GFX_SHADOW_FLAGS_INIT_SHADOW         0x1
+
+struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
+	__u64 shadow_va;
+	__u64 csa_va;
+	__u64 gds_va;
+	__u64 flags;
+};
+
 /*
  *  Query h/w info: Flag that this is integrated (a.h.a. fusion) GPU
  *
@@ -687,6 +734,7 @@ struct drm_amdgpu_cs_chunk_data {
 #define AMDGPU_IDS_FLAGS_FUSION         0x1
 #define AMDGPU_IDS_FLAGS_PREEMPTION     0x2
 #define AMDGPU_IDS_FLAGS_TMZ            0x4
+#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD 0x8
 
 /* indicate if acceleration can be working */
 #define AMDGPU_INFO_ACCEL_WORKING		0x00
@@ -739,6 +787,18 @@ struct drm_amdgpu_cs_chunk_data {
 	#define AMDGPU_INFO_FW_DMCUB		0x14
 	/* Subquery id: Query TOC firmware version */
 	#define AMDGPU_INFO_FW_TOC		0x15
+	/* Subquery id: Query CAP firmware version */
+	#define AMDGPU_INFO_FW_CAP		0x16
+	/* Subquery id: Query GFX RLCP firmware version */
+	#define AMDGPU_INFO_FW_GFX_RLCP		0x17
+	/* Subquery id: Query GFX RLCV firmware version */
+	#define AMDGPU_INFO_FW_GFX_RLCV		0x18
+	/* Subquery id: Query MES_KIQ firmware version */
+	#define AMDGPU_INFO_FW_MES_KIQ		0x19
+	/* Subquery id: Query MES firmware version */
+	#define AMDGPU_INFO_FW_MES		0x1a
+	/* Subquery id: Query IMU firmware version */
+	#define AMDGPU_INFO_FW_IMU		0x1b
 
 /* number of bytes moved for TTM migration */
 #define AMDGPU_INFO_NUM_BYTES_MOVED		0x0f
@@ -792,18 +852,15 @@ struct drm_amdgpu_cs_chunk_data {
 	#define AMDGPU_INFO_SENSOR_STABLE_PSTATE_GFX_SCLK		0x8
 	/* Subquery id: Query GPU stable pstate memory clock */
 	#define AMDGPU_INFO_SENSOR_STABLE_PSTATE_GFX_MCLK		0x9
+	/* Subquery id: Query GPU peak pstate shader clock */
+	#define AMDGPU_INFO_SENSOR_PEAK_PSTATE_GFX_SCLK			0xa
+	/* Subquery id: Query GPU peak pstate memory clock */
+	#define AMDGPU_INFO_SENSOR_PEAK_PSTATE_GFX_MCLK			0xb
 /* Number of VRAM page faults on CPU access. */
 #define AMDGPU_INFO_NUM_VRAM_CPU_PAGE_FAULTS	0x1E
 #define AMDGPU_INFO_VRAM_LOST_COUNTER		0x1F
 /* query ras mask of enabled features*/
 #define AMDGPU_INFO_RAS_ENABLED_FEATURES	0x20
-/* query video encode/decode caps */
-#define AMDGPU_INFO_VIDEO_CAPS			0x21
-	/* Subquery id: Decode */
-	#define AMDGPU_INFO_VIDEO_CAPS_DECODE		0
-	/* Subquery id: Encode */
-	#define AMDGPU_INFO_VIDEO_CAPS_ENCODE		1
-
 /* RAS MASK: UMC (VRAM) */
 #define AMDGPU_INFO_RAS_ENABLED_UMC			(1 << 0)
 /* RAS MASK: SDMA */
@@ -832,6 +889,14 @@ struct drm_amdgpu_cs_chunk_data {
 #define AMDGPU_INFO_RAS_ENABLED_MP1			(1 << 12)
 /* RAS MASK: FUSE */
 #define AMDGPU_INFO_RAS_ENABLED_FUSE			(1 << 13)
+/* query video encode/decode caps */
+#define AMDGPU_INFO_VIDEO_CAPS			0x21
+	/* Subquery id: Decode */
+	#define AMDGPU_INFO_VIDEO_CAPS_DECODE		0
+	/* Subquery id: Encode */
+	#define AMDGPU_INFO_VIDEO_CAPS_ENCODE		1
+/* Query the max number of IBs per gang per submission */
+#define AMDGPU_INFO_MAX_IBS			0x22
 
 #define AMDGPU_INFO_MMR_SE_INDEX_SHIFT	0
 #define AMDGPU_INFO_MMR_SE_INDEX_MASK	0xff
@@ -983,6 +1048,8 @@ struct drm_amdgpu_info_vbios {
 #define AMDGPU_VRAM_TYPE_DDR4  8
 #define AMDGPU_VRAM_TYPE_GDDR6 9
 #define AMDGPU_VRAM_TYPE_DDR5  10
+#define AMDGPU_VRAM_TYPE_LPDDR4 11
+#define AMDGPU_VRAM_TYPE_LPDDR5 12
 
 struct drm_amdgpu_info_device {
 	/** PCI Device ID */
@@ -1008,7 +1075,8 @@ struct drm_amdgpu_info_device {
 	__u32 enabled_rb_pipes_mask;
 	__u32 num_rb_pipes;
 	__u32 num_hw_gfx_contexts;
-	__u32 _pad;
+	/* PCIe version (the smaller of the GPU and the CPU/motherboard) */
+	__u32 pcie_gen;
 	__u64 ids_flags;
 	/** Starting virtual address for UMDs. */
 	__u64 virtual_address_offset;
@@ -1055,7 +1123,8 @@ struct drm_amdgpu_info_device {
 	__u32 gs_prim_buffer_depth;
 	/* max gs wavefront per vgt*/
 	__u32 max_gs_waves_per_vgt;
-	__u32 _pad1;
+	/* PCIe number of lanes (the smaller of the GPU and the CPU/motherboard) */
+	__u32 pcie_num_lanes;
 	/* always on cu bitmap */
 	__u32 cu_ao_bitmap[4][4];
 	/** Starting high virtual address for UMDs. */
@@ -1066,6 +1135,26 @@ struct drm_amdgpu_info_device {
 	__u32 pa_sc_tile_steering_override;
 	/* disabled TCCs */
 	__u64 tcc_disabled_mask;
+	__u64 min_engine_clock;
+	__u64 min_memory_clock;
+	/* The following fields are only set on gfx11+, older chips set 0. */
+	__u32 tcp_cache_size;       /* AKA GL0, VMEM cache */
+	__u32 num_sqc_per_wgp;
+	__u32 sqc_data_cache_size;  /* AKA SMEM cache */
+	__u32 sqc_inst_cache_size;
+	__u32 gl1c_cache_size;
+	__u32 gl2c_cache_size;
+	__u64 mall_size;            /* AKA infinity cache */
+	/* high 32 bits of the rb pipes mask */
+	__u32 enabled_rb_pipes_mask_hi;
+	/* shadow area size for gfx11 */
+	__u32 shadow_size;
+	/* shadow area base virtual alignment for gfx11 */
+	__u32 shadow_alignment;
+	/* context save area size for gfx11 */
+	__u32 csa_size;
+	/* context save area base virtual alignment for gfx11 */
+	__u32 csa_alignment;
 };
 
 struct drm_amdgpu_info_hw_ip {
@@ -1080,7 +1169,8 @@ struct drm_amdgpu_info_hw_ip {
 	__u32  ib_size_alignment;
 	/** Bitmask of available rings. Bit 0 means ring 0, etc. */
 	__u32  available_rings;
-	__u32  _pad;
+	/** version info: bits 23:16 major, 15:8 minor, 7:0 revision */
+	__u32  ip_discovery_version;
 };
 
 struct drm_amdgpu_info_num_handles {
@@ -1145,7 +1235,11 @@ struct drm_amdgpu_info_video_caps {
 #define AMDGPU_FAMILY_RV			142 /* Raven */
 #define AMDGPU_FAMILY_NV			143 /* Navi10 */
 #define AMDGPU_FAMILY_VGH			144 /* Van Gogh */
+#define AMDGPU_FAMILY_GC_11_0_0			145 /* GC 11.0.0 */
 #define AMDGPU_FAMILY_YC			146 /* Yellow Carp */
+#define AMDGPU_FAMILY_GC_11_0_1			148 /* GC 11.0.1 */
+#define AMDGPU_FAMILY_GC_10_3_6			149 /* GC 10.3.6 */
+#define AMDGPU_FAMILY_GC_10_3_7			151 /* GC 10.3.7 */
 
 #if defined(__cplusplus)
 }
-- 
2.42.0
