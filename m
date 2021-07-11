Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419566EB87
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:23 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:03 -0700
Message-Id: <20210711061211.2879015-2-lucas.demarchi@intel.com>
In-Reply-To: <20210711061211.2879015-1-lucas.demarchi@intel.com>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/9] include/drm-uapi: sync kernel headers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Sync with drm-next:

	21c355b09711 ("Merge tag 'drm-misc-next-fixes-2021-07-01' of git://anongit.freedesktop.org/drm/drm-misc into drm-next")

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm-uapi/amdgpu_drm.h   |  93 ++++++++++--
 include/drm-uapi/drm.h          | 250 +++++++++++++++++++++++++-------
 include/drm-uapi/drm_fourcc.h   |  74 +++++++++-
 include/drm-uapi/drm_mode.h     | 195 ++++++++++++++++++-------
 include/drm-uapi/etnaviv_drm.h  |   3 +
 include/drm-uapi/exynos_drm.h   |   2 +-
 include/drm-uapi/lima_drm.h     | 176 ++++++++++++++++++++++
 include/drm-uapi/msm_drm.h      |  32 +++-
 include/drm-uapi/nouveau_drm.h  |   1 +
 include/drm-uapi/panfrost_drm.h |   1 +
 include/drm-uapi/virtgpu_drm.h  |  39 ++++-
 include/drm-uapi/vmwgfx_drm.h   |  33 ++++-
 12 files changed, 766 insertions(+), 133 deletions(-)
 create mode 100644 include/drm-uapi/lima_drm.h

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ac387982..0cbd1540 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -116,8 +116,6 @@ extern "C" {
 #define AMDGPU_GEM_CREATE_CPU_GTT_USWC		(1 << 2)
 /* Flag that the memory should be in VRAM and cleared */
 #define AMDGPU_GEM_CREATE_VRAM_CLEARED		(1 << 3)
-/* Flag that create shadow bo(GTT) while allocating vram bo */
-#define AMDGPU_GEM_CREATE_SHADOW		(1 << 4)
 /* Flag that allocating the BO should use linear VRAM */
 #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS	(1 << 5)
 /* Flag that BO is always valid in this VM */
@@ -125,13 +123,23 @@ extern "C" {
 /* Flag that BO sharing will be explicitly synchronized */
 #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC		(1 << 7)
 /* Flag that indicates allocating MQD gart on GFX9, where the mtype
- * for the second page onward should be set to NC.
+ * for the second page onward should be set to NC. It should never
+ * be used by user space applications.
  */
-#define AMDGPU_GEM_CREATE_MQD_GFX9		(1 << 8)
+#define AMDGPU_GEM_CREATE_CP_MQD_GFX9		(1 << 8)
 /* Flag that BO may contain sensitive data that must be wiped before
  * releasing the memory
  */
 #define AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE	(1 << 9)
+/* Flag that BO will be encrypted and that the TMZ bit should be
+ * set in the PTEs when mapping this buffer via GPUVM or
+ * accessing it with various hw blocks
+ */
+#define AMDGPU_GEM_CREATE_ENCRYPTED		(1 << 10)
+/* Flag that BO will be used only in preemptible context, which does
+ * not require GTT memory accounting
+ */
+#define AMDGPU_GEM_CREATE_PREEMPTIBLE		(1 << 11)
 
 struct drm_amdgpu_gem_create_in  {
 	/** the requested memory size */
@@ -345,6 +353,10 @@ struct drm_amdgpu_gem_userptr {
 #define AMDGPU_TILING_DCC_PITCH_MAX_MASK		0x3FFF
 #define AMDGPU_TILING_DCC_INDEPENDENT_64B_SHIFT		43
 #define AMDGPU_TILING_DCC_INDEPENDENT_64B_MASK		0x1
+#define AMDGPU_TILING_DCC_INDEPENDENT_128B_SHIFT	44
+#define AMDGPU_TILING_DCC_INDEPENDENT_128B_MASK		0x1
+#define AMDGPU_TILING_SCANOUT_SHIFT			63
+#define AMDGPU_TILING_SCANOUT_MASK			0x1
 
 /* Set/Get helpers for tiling flags. */
 #define AMDGPU_TILING_SET(field, value) \
@@ -492,15 +504,15 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_MTYPE_MASK		(0xf << 5)
 /* Default MTYPE. Pre-AI must use this.  Recommended for newer ASICs. */
 #define AMDGPU_VM_MTYPE_DEFAULT		(0 << 5)
-/* Use NC MTYPE instead of default MTYPE */
+/* Use Non Coherent MTYPE instead of default MTYPE */
 #define AMDGPU_VM_MTYPE_NC		(1 << 5)
-/* Use WC MTYPE instead of default MTYPE */
+/* Use Write Combine MTYPE instead of default MTYPE */
 #define AMDGPU_VM_MTYPE_WC		(2 << 5)
-/* Use CC MTYPE instead of default MTYPE */
+/* Use Cache Coherent MTYPE instead of default MTYPE */
 #define AMDGPU_VM_MTYPE_CC		(3 << 5)
-/* Use UC MTYPE instead of default MTYPE */
+/* Use UnCached MTYPE instead of default MTYPE */
 #define AMDGPU_VM_MTYPE_UC		(4 << 5)
-/* Use RW MTYPE instead of default MTYPE */
+/* Use Read Write MTYPE instead of default MTYPE */
 #define AMDGPU_VM_MTYPE_RW		(5 << 5)
 
 struct drm_amdgpu_gem_va {
@@ -554,7 +566,7 @@ struct drm_amdgpu_cs_in {
 	/**  Handle of resource list associated with CS */
 	__u32		bo_list_handle;
 	__u32		num_chunks;
-	__u32		_pad;
+	__u32		flags;
 	/** this points to __u64 * which point to cs chunks */
 	__u64		chunks;
 };
@@ -588,6 +600,14 @@ union drm_amdgpu_cs {
  */
 #define AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID (1 << 4)
 
+/* Flag the IB as secure (TMZ)
+ */
+#define AMDGPU_IB_FLAGS_SECURE  (1 << 5)
+
+/* Tell KMD to flush and invalidate caches
+ */
+#define AMDGPU_IB_FLAG_EMIT_MEM_SYNC  (1 << 6)
+
 struct drm_amdgpu_cs_chunk_ib {
 	__u32 _pad;
 	/** AMDGPU_IB_FLAG_* */
@@ -649,12 +669,13 @@ struct drm_amdgpu_cs_chunk_data {
 	};
 };
 
-/**
+/*
  *  Query h/w info: Flag that this is integrated (a.h.a. fusion) GPU
  *
  */
 #define AMDGPU_IDS_FLAGS_FUSION         0x1
 #define AMDGPU_IDS_FLAGS_PREEMPTION     0x2
+#define AMDGPU_IDS_FLAGS_TMZ            0x4
 
 /* indicate if acceleration can be working */
 #define AMDGPU_INFO_ACCEL_WORKING		0x00
@@ -705,6 +726,8 @@ struct drm_amdgpu_cs_chunk_data {
 	#define AMDGPU_INFO_FW_TA		0x13
 	/* Subquery id: Query DMCUB firmware version */
 	#define AMDGPU_INFO_FW_DMCUB		0x14
+	/* Subquery id: Query TOC firmware version */
+	#define AMDGPU_INFO_FW_TOC		0x15
 
 /* number of bytes moved for TTM migration */
 #define AMDGPU_INFO_NUM_BYTES_MOVED		0x0f
@@ -734,6 +757,8 @@ struct drm_amdgpu_cs_chunk_data {
 	#define AMDGPU_INFO_VBIOS_SIZE		0x1
 	/* Subquery id: Query vbios image */
 	#define AMDGPU_INFO_VBIOS_IMAGE		0x2
+	/* Subquery id: Query vbios info */
+	#define AMDGPU_INFO_VBIOS_INFO		0x3
 /* Query UVD handles */
 #define AMDGPU_INFO_NUM_HANDLES			0x1C
 /* Query sensor related information */
@@ -761,6 +786,12 @@ struct drm_amdgpu_cs_chunk_data {
 #define AMDGPU_INFO_VRAM_LOST_COUNTER		0x1F
 /* query ras mask of enabled features*/
 #define AMDGPU_INFO_RAS_ENABLED_FEATURES	0x20
+/* query video encode/decode caps */
+#define AMDGPU_INFO_VIDEO_CAPS			0x21
+	/* Subquery id: Decode */
+	#define AMDGPU_INFO_VIDEO_CAPS_DECODE		0
+	/* Subquery id: Encode */
+	#define AMDGPU_INFO_VIDEO_CAPS_ENCODE		1
 
 /* RAS MASK: UMC (VRAM) */
 #define AMDGPU_INFO_RAS_ENABLED_UMC			(1 << 0)
@@ -857,6 +888,10 @@ struct drm_amdgpu_info {
 		struct {
 			__u32 type;
 		} sensor_info;
+
+		struct {
+			__u32 type;
+		} video_cap;
 	};
 };
 
@@ -917,6 +952,15 @@ struct drm_amdgpu_info_firmware {
 	__u32 feature;
 };
 
+struct drm_amdgpu_info_vbios {
+	__u8 name[64];
+	__u8 vbios_pn[64];
+	__u32 version;
+	__u32 pad;
+	__u8 vbios_ver_str[32];
+	__u8 date[32];
+};
+
 #define AMDGPU_VRAM_TYPE_UNKNOWN 0
 #define AMDGPU_VRAM_TYPE_GDDR1 1
 #define AMDGPU_VRAM_TYPE_DDR2  2
@@ -927,6 +971,7 @@ struct drm_amdgpu_info_firmware {
 #define AMDGPU_VRAM_TYPE_DDR3  7
 #define AMDGPU_VRAM_TYPE_DDR4  8
 #define AMDGPU_VRAM_TYPE_GDDR6 9
+#define AMDGPU_VRAM_TYPE_DDR5  10
 
 struct drm_amdgpu_info_device {
 	/** PCI Device ID */
@@ -1052,6 +1097,30 @@ struct drm_amdgpu_info_vce_clock_table {
 	__u32 pad;
 };
 
+/* query video encode/decode caps */
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG2			0
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4			1
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VC1			2
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_MPEG4_AVC		3
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_HEVC			4
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_JPEG			5
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_VP9			6
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_AV1			7
+#define AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_COUNT			8
+
+struct drm_amdgpu_info_video_codec_info {
+	__u32 valid;
+	__u32 max_width;
+	__u32 max_height;
+	__u32 max_pixels_per_frame;
+	__u32 max_level;
+	__u32 pad;
+};
+
+struct drm_amdgpu_info_video_caps {
+	struct drm_amdgpu_info_video_codec_info codec_info[AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_COUNT];
+};
+
 /*
  * Supported GPU families
  */
@@ -1064,6 +1133,8 @@ struct drm_amdgpu_info_vce_clock_table {
 #define AMDGPU_FAMILY_AI			141 /* Vega10 */
 #define AMDGPU_FAMILY_RV			142 /* Raven */
 #define AMDGPU_FAMILY_NV			143 /* Navi10 */
+#define AMDGPU_FAMILY_VGH			144 /* Van Gogh */
+#define AMDGPU_FAMILY_YC			146 /* Yellow Carp */
 
 #if defined(__cplusplus)
 }
diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index c7fd2a35..398c396f 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -1,11 +1,10 @@
-/**
- * \file drm.h
+/*
  * Header for the Direct Rendering Manager
  *
- * \author Rickard E. (Rik) Faith <faith@valinux.com>
+ * Author: Rickard E. (Rik) Faith <faith@valinux.com>
  *
- * \par Acknowledgments:
- * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic \c cmpxchg.
+ * Acknowledgments:
+ * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic cmpxchg.
  */
 
 /*
@@ -79,7 +78,7 @@ typedef unsigned int drm_context_t;
 typedef unsigned int drm_drawable_t;
 typedef unsigned int drm_magic_t;
 
-/**
+/*
  * Cliprect.
  *
  * \warning: If you change this structure, make sure you change
@@ -95,7 +94,7 @@ struct drm_clip_rect {
 	unsigned short y2;
 };
 
-/**
+/*
  * Drawable information.
  */
 struct drm_drawable_info {
@@ -103,7 +102,7 @@ struct drm_drawable_info {
 	struct drm_clip_rect *rects;
 };
 
-/**
+/*
  * Texture region,
  */
 struct drm_tex_region {
@@ -114,7 +113,7 @@ struct drm_tex_region {
 	unsigned int age;
 };
 
-/**
+/*
  * Hardware lock.
  *
  * The lock structure is a simple cache-line aligned integer.  To avoid
@@ -126,7 +125,7 @@ struct drm_hw_lock {
 	char padding[60];			/**< Pad to cache line */
 };
 
-/**
+/*
  * DRM_IOCTL_VERSION ioctl argument type.
  *
  * \sa drmGetVersion().
@@ -143,7 +142,7 @@ struct drm_version {
 	char *desc;	  /**< User-space buffer to hold desc */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_UNIQUE ioctl argument type.
  *
  * \sa drmGetBusid() and drmSetBusId().
@@ -162,7 +161,7 @@ struct drm_block {
 	int unused;
 };
 
-/**
+/*
  * DRM_IOCTL_CONTROL ioctl argument type.
  *
  * \sa drmCtlInstHandler() and drmCtlUninstHandler().
@@ -177,7 +176,7 @@ struct drm_control {
 	int irq;
 };
 
-/**
+/*
  * Type of memory to map.
  */
 enum drm_map_type {
@@ -189,7 +188,7 @@ enum drm_map_type {
 	_DRM_CONSISTENT = 5	  /**< Consistent memory for PCI DMA */
 };
 
-/**
+/*
  * Memory mapping flags.
  */
 enum drm_map_flags {
@@ -208,7 +207,7 @@ struct drm_ctx_priv_map {
 	void *handle;		 /**< Handle of map */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_MAP, DRM_IOCTL_ADD_MAP and DRM_IOCTL_RM_MAP ioctls
  * argument type.
  *
@@ -225,7 +224,7 @@ struct drm_map {
 	/*   Private data */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_CLIENT ioctl argument type.
  */
 struct drm_client {
@@ -257,7 +256,7 @@ enum drm_stat_type {
 	    /* Add to the *END* of the list */
 };
 
-/**
+/*
  * DRM_IOCTL_GET_STATS ioctl argument type.
  */
 struct drm_stats {
@@ -268,7 +267,7 @@ struct drm_stats {
 	} data[15];
 };
 
-/**
+/*
  * Hardware locking flags.
  */
 enum drm_lock_flags {
@@ -283,7 +282,7 @@ enum drm_lock_flags {
 	_DRM_HALT_CUR_QUEUES = 0x20  /**< Halt all current queues */
 };
 
-/**
+/*
  * DRM_IOCTL_LOCK, DRM_IOCTL_UNLOCK and DRM_IOCTL_FINISH ioctl argument type.
  *
  * \sa drmGetLock() and drmUnlock().
@@ -293,7 +292,7 @@ struct drm_lock {
 	enum drm_lock_flags flags;
 };
 
-/**
+/*
  * DMA flags
  *
  * \warning
@@ -322,7 +321,7 @@ enum drm_dma_flags {
 	_DRM_DMA_LARGER_OK = 0x40     /**< Larger-than-requested buffers OK */
 };
 
-/**
+/*
  * DRM_IOCTL_ADD_BUFS and DRM_IOCTL_MARK_BUFS ioctl argument type.
  *
  * \sa drmAddBufs().
@@ -345,7 +344,7 @@ struct drm_buf_desc {
 				  */
 };
 
-/**
+/*
  * DRM_IOCTL_INFO_BUFS ioctl argument type.
  */
 struct drm_buf_info {
@@ -353,7 +352,7 @@ struct drm_buf_info {
 	struct drm_buf_desc *list;
 };
 
-/**
+/*
  * DRM_IOCTL_FREE_BUFS ioctl argument type.
  */
 struct drm_buf_free {
@@ -361,7 +360,7 @@ struct drm_buf_free {
 	int *list;
 };
 
-/**
+/*
  * Buffer information
  *
  * \sa drm_buf_map.
@@ -373,7 +372,7 @@ struct drm_buf_pub {
 	void *address;	       /**< Address of buffer */
 };
 
-/**
+/*
  * DRM_IOCTL_MAP_BUFS ioctl argument type.
  */
 struct drm_buf_map {
@@ -386,7 +385,7 @@ struct drm_buf_map {
 	struct drm_buf_pub *list;	/**< Buffer information */
 };
 
-/**
+/*
  * DRM_IOCTL_DMA ioctl argument type.
  *
  * Indices here refer to the offset into the buffer list in drm_buf_get.
@@ -411,7 +410,7 @@ enum drm_ctx_flags {
 	_DRM_CONTEXT_2DONLY = 0x02
 };
 
-/**
+/*
  * DRM_IOCTL_ADD_CTX ioctl argument type.
  *
  * \sa drmCreateContext() and drmDestroyContext().
@@ -421,7 +420,7 @@ struct drm_ctx {
 	enum drm_ctx_flags flags;
 };
 
-/**
+/*
  * DRM_IOCTL_RES_CTX ioctl argument type.
  */
 struct drm_ctx_res {
@@ -429,14 +428,14 @@ struct drm_ctx_res {
 	struct drm_ctx *contexts;
 };
 
-/**
+/*
  * DRM_IOCTL_ADD_DRAW and DRM_IOCTL_RM_DRAW ioctl argument type.
  */
 struct drm_draw {
 	drm_drawable_t handle;
 };
 
-/**
+/*
  * DRM_IOCTL_UPDATE_DRAW ioctl argument type.
  */
 typedef enum {
@@ -450,14 +449,14 @@ struct drm_update_draw {
 	unsigned long long data;
 };
 
-/**
+/*
  * DRM_IOCTL_GET_MAGIC and DRM_IOCTL_AUTH_MAGIC ioctl argument type.
  */
 struct drm_auth {
 	drm_magic_t magic;
 };
 
-/**
+/*
  * DRM_IOCTL_IRQ_BUSID ioctl argument type.
  *
  * \sa drmGetInterruptFromBusID().
@@ -499,7 +498,7 @@ struct drm_wait_vblank_reply {
 	long tval_usec;
 };
 
-/**
+/*
  * DRM_IOCTL_WAIT_VBLANK ioctl argument type.
  *
  * \sa drmWaitVBlank().
@@ -512,7 +511,7 @@ union drm_wait_vblank {
 #define _DRM_PRE_MODESET 1
 #define _DRM_POST_MODESET 2
 
-/**
+/*
  * DRM_IOCTL_MODESET_CTL ioctl argument type
  *
  * \sa drmModesetCtl().
@@ -522,7 +521,7 @@ struct drm_modeset_ctl {
 	__u32 cmd;
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_ENABLE ioctl argument type.
  *
  * \sa drmAgpEnable().
@@ -531,7 +530,7 @@ struct drm_agp_mode {
 	unsigned long mode;	/**< AGP mode */
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_ALLOC and DRM_IOCTL_AGP_FREE ioctls argument type.
  *
  * \sa drmAgpAlloc() and drmAgpFree().
@@ -543,7 +542,7 @@ struct drm_agp_buffer {
 	unsigned long physical;	/**< Physical used by i810 */
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_BIND and DRM_IOCTL_AGP_UNBIND ioctls argument type.
  *
  * \sa drmAgpBind() and drmAgpUnbind().
@@ -553,7 +552,7 @@ struct drm_agp_binding {
 	unsigned long offset;	/**< In bytes -- will round to page boundary */
 };
 
-/**
+/*
  * DRM_IOCTL_AGP_INFO ioctl argument type.
  *
  * \sa drmAgpVersionMajor(), drmAgpVersionMinor(), drmAgpGetMode(),
@@ -574,7 +573,7 @@ struct drm_agp_info {
 	unsigned short id_device;
 };
 
-/**
+/*
  * DRM_IOCTL_SG_ALLOC ioctl argument type.
  */
 struct drm_scatter_gather {
@@ -582,7 +581,7 @@ struct drm_scatter_gather {
 	unsigned long handle;	/**< Used for mapping / unmapping */
 };
 
-/**
+/*
  * DRM_IOCTL_SET_VERSION ioctl argument type.
  */
 struct drm_set_version {
@@ -592,14 +591,14 @@ struct drm_set_version {
 	int drm_dd_minor;
 };
 
-/** DRM_IOCTL_GEM_CLOSE ioctl argument type */
+/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
 struct drm_gem_close {
 	/** Handle of the object to be closed. */
 	__u32 handle;
 	__u32 pad;
 };
 
-/** DRM_IOCTL_GEM_FLINK ioctl argument type */
+/* DRM_IOCTL_GEM_FLINK ioctl argument type */
 struct drm_gem_flink {
 	/** Handle for the object being named */
 	__u32 handle;
@@ -608,7 +607,7 @@ struct drm_gem_flink {
 	__u32 name;
 };
 
-/** DRM_IOCTL_GEM_OPEN ioctl argument type */
+/* DRM_IOCTL_GEM_OPEN ioctl argument type */
 struct drm_gem_open {
 	/** Name of object being opened */
 	__u32 name;
@@ -620,33 +619,150 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/**
+ * DRM_CAP_DUMB_BUFFER
+ *
+ * If set to 1, the driver supports creating dumb buffers via the
+ * &DRM_IOCTL_MODE_CREATE_DUMB ioctl.
+ */
 #define DRM_CAP_DUMB_BUFFER		0x1
+/**
+ * DRM_CAP_VBLANK_HIGH_CRTC
+ *
+ * If set to 1, the kernel supports specifying a CRTC index in the high bits of
+ * &drm_wait_vblank_request.type.
+ *
+ * Starting kernel version 2.6.39, this capability is always set to 1.
+ */
 #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
+/**
+ * DRM_CAP_DUMB_PREFERRED_DEPTH
+ *
+ * The preferred bit depth for dumb buffers.
+ *
+ * The bit depth is the number of bits used to indicate the color of a single
+ * pixel excluding any padding. This is different from the number of bits per
+ * pixel. For instance, XRGB8888 has a bit depth of 24 but has 32 bits per
+ * pixel.
+ *
+ * Note that this preference only applies to dumb buffers, it's irrelevant for
+ * other types of buffers.
+ */
 #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
+/**
+ * DRM_CAP_DUMB_PREFER_SHADOW
+ *
+ * If set to 1, the driver prefers userspace to render to a shadow buffer
+ * instead of directly rendering to a dumb buffer. For best speed, userspace
+ * should do streaming ordered memory copies into the dumb buffer and never
+ * read from it.
+ *
+ * Note that this preference only applies to dumb buffers, it's irrelevant for
+ * other types of buffers.
+ */
 #define DRM_CAP_DUMB_PREFER_SHADOW	0x4
+/**
+ * DRM_CAP_PRIME
+ *
+ * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IMPORT
+ * and &DRM_PRIME_CAP_EXPORT.
+ *
+ * PRIME buffers are exposed as dma-buf file descriptors. See
+ * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
+ */
 #define DRM_CAP_PRIME			0x5
+/**
+ * DRM_PRIME_CAP_IMPORT
+ *
+ * If this bit is set in &DRM_CAP_PRIME, the driver supports importing PRIME
+ * buffers via the &DRM_IOCTL_PRIME_FD_TO_HANDLE ioctl.
+ */
 #define  DRM_PRIME_CAP_IMPORT		0x1
+/**
+ * DRM_PRIME_CAP_EXPORT
+ *
+ * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting PRIME
+ * buffers via the &DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl.
+ */
 #define  DRM_PRIME_CAP_EXPORT		0x2
+/**
+ * DRM_CAP_TIMESTAMP_MONOTONIC
+ *
+ * If set to 0, the kernel will report timestamps with ``CLOCK_REALTIME`` in
+ * struct drm_event_vblank. If set to 1, the kernel will report timestamps with
+ * ``CLOCK_MONOTONIC``. See ``clock_gettime(2)`` for the definition of these
+ * clocks.
+ *
+ * Starting from kernel version 2.6.39, the default value for this capability
+ * is 1. Starting kernel version 4.15, this capability is always set to 1.
+ */
 #define DRM_CAP_TIMESTAMP_MONOTONIC	0x6
+/**
+ * DRM_CAP_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
+ */
 #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
-/*
- * The CURSOR_WIDTH and CURSOR_HEIGHT capabilities return a valid widthxheight
- * combination for the hardware cursor. The intention is that a hardware
- * agnostic userspace can query a cursor plane size to use.
+/**
+ * DRM_CAP_CURSOR_WIDTH
+ *
+ * The ``CURSOR_WIDTH`` and ``CURSOR_HEIGHT`` capabilities return a valid
+ * width x height combination for the hardware cursor. The intention is that a
+ * hardware agnostic userspace can query a cursor plane size to use.
  *
  * Note that the cross-driver contract is to merely return a valid size;
  * drivers are free to attach another meaning on top, eg. i915 returns the
  * maximum plane size.
  */
 #define DRM_CAP_CURSOR_WIDTH		0x8
+/**
+ * DRM_CAP_CURSOR_HEIGHT
+ *
+ * See &DRM_CAP_CURSOR_WIDTH.
+ */
 #define DRM_CAP_CURSOR_HEIGHT		0x9
+/**
+ * DRM_CAP_ADDFB2_MODIFIERS
+ *
+ * If set to 1, the driver supports supplying modifiers in the
+ * &DRM_IOCTL_MODE_ADDFB2 ioctl.
+ */
 #define DRM_CAP_ADDFB2_MODIFIERS	0x10
+/**
+ * DRM_CAP_PAGE_FLIP_TARGET
+ *
+ * If set to 1, the driver supports the &DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE and
+ * &DRM_MODE_PAGE_FLIP_TARGET_RELATIVE flags in
+ * &drm_mode_crtc_page_flip_target.flags for the &DRM_IOCTL_MODE_PAGE_FLIP
+ * ioctl.
+ */
 #define DRM_CAP_PAGE_FLIP_TARGET	0x11
+/**
+ * DRM_CAP_CRTC_IN_VBLANK_EVENT
+ *
+ * If set to 1, the kernel supports reporting the CRTC ID in
+ * &drm_event_vblank.crtc_id for the &DRM_EVENT_VBLANK and
+ * &DRM_EVENT_FLIP_COMPLETE events.
+ *
+ * Starting kernel version 4.12, this capability is always set to 1.
+ */
 #define DRM_CAP_CRTC_IN_VBLANK_EVENT	0x12
+/**
+ * DRM_CAP_SYNCOBJ
+ *
+ * If set to 1, the driver supports sync objects. See
+ * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ */
 #define DRM_CAP_SYNCOBJ		0x13
+/**
+ * DRM_CAP_SYNCOBJ_TIMELINE
+ *
+ * If set to 1, the driver supports timeline operations on sync objects. See
+ * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
 
-/** DRM_IOCTL_GET_CAP ioctl argument type */
+/* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
 	__u64 capability;
 	__u64 value;
@@ -655,9 +771,12 @@ struct drm_get_cap {
 /**
  * DRM_CLIENT_CAP_STEREO_3D
  *
- * if set to 1, the DRM core will expose the stereo 3D capabilities of the
+ * If set to 1, the DRM core will expose the stereo 3D capabilities of the
  * monitor by advertising the supported 3D layouts in the flags of struct
- * drm_mode_modeinfo.
+ * drm_mode_modeinfo. See ``DRM_MODE_FLAG_3D_*``.
+ *
+ * This capability is always supported for all drivers starting from kernel
+ * version 3.13.
  */
 #define DRM_CLIENT_CAP_STEREO_3D	1
 
@@ -666,13 +785,25 @@ struct drm_get_cap {
  *
  * If set to 1, the DRM core will expose all planes (overlay, primary, and
  * cursor) to userspace.
+ *
+ * This capability has been introduced in kernel version 3.15. Starting from
+ * kernel version 3.17, this capability is always supported for all drivers.
  */
 #define DRM_CLIENT_CAP_UNIVERSAL_PLANES  2
 
 /**
  * DRM_CLIENT_CAP_ATOMIC
  *
- * If set to 1, the DRM core will expose atomic properties to userspace
+ * If set to 1, the DRM core will expose atomic properties to userspace. This
+ * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
+ * &DRM_CLIENT_CAP_ASPECT_RATIO.
+ *
+ * If the driver doesn't support atomic mode-setting, enabling this capability
+ * will fail with -EOPNOTSUPP.
+ *
+ * This capability has been introduced in kernel version 4.0. Starting from
+ * kernel version 4.2, this capability is always supported for atomic-capable
+ * drivers.
  */
 #define DRM_CLIENT_CAP_ATOMIC	3
 
@@ -680,6 +811,10 @@ struct drm_get_cap {
  * DRM_CLIENT_CAP_ASPECT_RATIO
  *
  * If set to 1, the DRM core will provide aspect ratio information in modes.
+ * See ``DRM_MODE_FLAG_PIC_AR_*``.
+ *
+ * This capability is always supported for all drivers starting from kernel
+ * version 4.18.
  */
 #define DRM_CLIENT_CAP_ASPECT_RATIO    4
 
@@ -687,12 +822,15 @@ struct drm_get_cap {
  * DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
  *
  * If set to 1, the DRM core will expose special connectors to be used for
- * writing back to memory the scene setup in the commit. Depends on client
- * also supporting DRM_CLIENT_CAP_ATOMIC
+ * writing back to memory the scene setup in the commit. The client must enable
+ * &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is always supported for atomic-capable drivers starting from
+ * kernel version 4.19.
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
-/** DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
+/* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
 	__u64 value;
@@ -944,7 +1082,7 @@ extern "C" {
 
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
 
-/**
+/*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
  * Generic IOCTLS restart at 0xA0.
@@ -955,7 +1093,7 @@ extern "C" {
 #define DRM_COMMAND_BASE                0x40
 #define DRM_COMMAND_END			0xA0
 
-/**
+/*
  * Header for events written back to userspace on the drm fd.  The
  * type defines the type of event, the length specifies the total
  * length of the event (including the header), and user_data is
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index a7bc058c..cd3ce8a8 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -58,6 +58,30 @@ extern "C" {
  * may preserve meaning - such as number of planes - from the fourcc code,
  * whereas others may not.
  *
+ * Modifiers must uniquely encode buffer layout. In other words, a buffer must
+ * match only a single modifier. A modifier must not be a subset of layouts of
+ * another modifier. For instance, it's incorrect to encode pitch alignment in
+ * a modifier: a buffer may match a 64-pixel aligned modifier and a 32-pixel
+ * aligned modifier. That said, modifiers can have implicit minimal
+ * requirements.
+ *
+ * For modifiers where the combination of fourcc code and modifier can alias,
+ * a canonical pair needs to be defined and used by all drivers. Preferred
+ * combinations are also encouraged where all combinations might lead to
+ * confusion and unnecessarily reduced interoperability. An example for the
+ * latter is AFBC, where the ABGR layouts are preferred over ARGB layouts.
+ *
+ * There are two kinds of modifier users:
+ *
+ * - Kernel and user-space drivers: for drivers it's important that modifiers
+ *   don't alias, otherwise two drivers might support the same format but use
+ *   different aliases, preventing them from sharing buffers in an efficient
+ *   format.
+ * - Higher-level programs interfacing with KMS/GBM/EGL/Vulkan/etc: these users
+ *   see modifiers as opaque tokens they can check for equality and intersect.
+ *   These users musn't need to know to reason about the modifier value
+ *   (i.e. they are not expected to extract information out of the modifier).
+ *
  * Vendors should document their modifier usage in as much detail as
  * possible, to ensure maximum compatibility across devices, drivers and
  * applications.
@@ -144,6 +168,13 @@ extern "C" {
 #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
 #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
 
+/* 64 bpp RGB */
+#define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */
+
+#define DRM_FORMAT_ARGB16161616	fourcc_code('A', 'R', '4', '8') /* [63:0] A:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
+
 /*
  * Floating point 64bpp RGB
  * IEEE 754-2008 binary16 half-precision float
@@ -155,6 +186,12 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+/*
+ * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
+ * of unused padding per component:
+ */
+#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
+
 /* packed YCbCr */
 #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
@@ -320,7 +357,6 @@ extern "C" {
  */
 
 /* Vendor Ids: */
-#define DRM_FORMAT_MOD_NONE           0
 #define DRM_FORMAT_MOD_VENDOR_NONE    0
 #define DRM_FORMAT_MOD_VENDOR_INTEL   0x01
 #define DRM_FORMAT_MOD_VENDOR_AMD     0x02
@@ -392,6 +428,16 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_LINEAR	fourcc_mod_code(NONE, 0)
 
+/*
+ * Deprecated: use DRM_FORMAT_MOD_LINEAR instead
+ *
+ * The "none" format modifier doesn't actually mean that the modifier is
+ * implicit, instead it means that the layout is linear. Whether modifiers are
+ * used is out-of-band information carried in an API-specific way (e.g. in a
+ * flag for drm_mode_fb_cmd2).
+ */
+#define DRM_FORMAT_MOD_NONE	0
+
 /* Intel framebuffer modifiers */
 
 /*
@@ -488,6 +534,25 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
 
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
+ * compression.
+ *
+ * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
+ * and at index 1. The clear color is stored at index 2, and the pitch should
+ * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
+ * by 32 bits. The raw clear color is consumed by the 3d engine and generates
+ * the converted clear color of size 64 bits. The first 32 bits store the Lower
+ * Converted Clear Color value and the next 32 bits store the Higher Converted
+ * Clear Color value when applicable. The Converted Clear Color values are
+ * consumed by the DE. The last 64 bits are used to store Color Discard Enable
+ * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
+ * corresponds to an area of 4x1 tiles in the main surface. The main surface
+ * pitch is required to be a multiple of 4 tile widths.
+ */
+#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
@@ -671,7 +736,7 @@ extern "C" {
  * which corresponds to the "generic" kind used for simple single-sample
  * uncompressed color formats on Fermi - Volta GPUs.
  */
-static inline __u64
+static __inline__ __u64
 drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 {
 	if (!(modifier & 0x10) || (modifier & (0xff << 12)))
@@ -997,9 +1062,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * Not all combinations are valid, and different SoCs may support different
  * combinations of layout and options.
  */
-#define __fourcc_mod_amlogic_layout_mask 0xf
+#define __fourcc_mod_amlogic_layout_mask 0xff
 #define __fourcc_mod_amlogic_options_shift 8
-#define __fourcc_mod_amlogic_options_mask 0xf
+#define __fourcc_mod_amlogic_options_mask 0xff
 
 #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
 	fourcc_mod_code(AMLOGIC, \
@@ -1195,4 +1260,3 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #endif
 
 #endif /* DRM_FOURCC_H */
-
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 735c8cfd..9b6722d4 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -218,6 +218,27 @@ extern "C" {
 #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
 #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
 
+/**
+ * struct drm_mode_modeinfo - Display mode information.
+ * @clock: pixel clock in kHz
+ * @hdisplay: horizontal display size
+ * @hsync_start: horizontal sync start
+ * @hsync_end: horizontal sync end
+ * @htotal: horizontal total size
+ * @hskew: horizontal skew
+ * @vdisplay: vertical display size
+ * @vsync_start: vertical sync start
+ * @vsync_end: vertical sync end
+ * @vtotal: vertical total size
+ * @vscan: vertical scan
+ * @vrefresh: approximate vertical refresh rate in Hz
+ * @flags: bitmask of misc. flags, see DRM_MODE_FLAG_* defines
+ * @type: bitmask of type flags, see DRM_MODE_TYPE_* defines
+ * @name: string describing the mode resolution
+ *
+ * This is the user-space API display mode information structure. For the
+ * kernel version see struct drm_display_mode.
+ */
 struct drm_mode_modeinfo {
 	__u32 clock;
 	__u16 hdisplay;
@@ -332,14 +353,19 @@ struct drm_mode_get_encoder {
 /* This is for connectors with multiple signal types. */
 /* Try to match DRM_MODE_CONNECTOR_X as closely as possible. */
 enum drm_mode_subconnector {
-	DRM_MODE_SUBCONNECTOR_Automatic = 0,
-	DRM_MODE_SUBCONNECTOR_Unknown = 0,
-	DRM_MODE_SUBCONNECTOR_DVID = 3,
-	DRM_MODE_SUBCONNECTOR_DVIA = 4,
-	DRM_MODE_SUBCONNECTOR_Composite = 5,
-	DRM_MODE_SUBCONNECTOR_SVIDEO = 6,
-	DRM_MODE_SUBCONNECTOR_Component = 8,
-	DRM_MODE_SUBCONNECTOR_SCART = 9,
+	DRM_MODE_SUBCONNECTOR_Automatic   = 0,  /* DVI-I, TV     */
+	DRM_MODE_SUBCONNECTOR_Unknown     = 0,  /* DVI-I, TV, DP */
+	DRM_MODE_SUBCONNECTOR_VGA	  = 1,  /*            DP */
+	DRM_MODE_SUBCONNECTOR_DVID	  = 3,  /* DVI-I      DP */
+	DRM_MODE_SUBCONNECTOR_DVIA	  = 4,  /* DVI-I         */
+	DRM_MODE_SUBCONNECTOR_Composite   = 5,  /*        TV     */
+	DRM_MODE_SUBCONNECTOR_SVIDEO	  = 6,  /*        TV     */
+	DRM_MODE_SUBCONNECTOR_Component   = 8,  /*        TV     */
+	DRM_MODE_SUBCONNECTOR_SCART	  = 9,  /*        TV     */
+	DRM_MODE_SUBCONNECTOR_DisplayPort = 10, /*            DP */
+	DRM_MODE_SUBCONNECTOR_HDMIA       = 11, /*            DP */
+	DRM_MODE_SUBCONNECTOR_Native      = 15, /*            DP */
+	DRM_MODE_SUBCONNECTOR_Wireless    = 18, /*            DP */
 };
 
 #define DRM_MODE_CONNECTOR_Unknown	0
@@ -362,28 +388,95 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_DPI		17
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
+#define DRM_MODE_CONNECTOR_USB		20
 
+/**
+ * struct drm_mode_get_connector - Get connector metadata.
+ *
+ * User-space can perform a GETCONNECTOR ioctl to retrieve information about a
+ * connector. User-space is expected to retrieve encoders, modes and properties
+ * by performing this ioctl at least twice: the first time to retrieve the
+ * number of elements, the second time to retrieve the elements themselves.
+ *
+ * To retrieve the number of elements, set @count_props and @count_encoders to
+ * zero, set @count_modes to 1, and set @modes_ptr to a temporary struct
+ * drm_mode_modeinfo element.
+ *
+ * To retrieve the elements, allocate arrays for @encoders_ptr, @modes_ptr,
+ * @props_ptr and @prop_values_ptr, then set @count_modes, @count_props and
+ * @count_encoders to their capacity.
+ *
+ * Performing the ioctl only twice may be racy: the number of elements may have
+ * changed with a hotplug event in-between the two ioctls. User-space is
+ * expected to retry the last ioctl until the number of elements stabilizes.
+ * The kernel won't fill any array which doesn't have the expected length.
+ *
+ * **Force-probing a connector**
+ *
+ * If the @count_modes field is set to zero and the DRM client is the current
+ * DRM master, the kernel will perform a forced probe on the connector to
+ * refresh the connector status, modes and EDID. A forced-probe can be slow,
+ * might cause flickering and the ioctl will block.
+ *
+ * User-space needs to force-probe connectors to ensure their metadata is
+ * up-to-date at startup and after receiving a hot-plug event. User-space
+ * may perform a forced-probe when the user explicitly requests it. User-space
+ * shouldn't perform a forced-probe in other situations.
+ */
 struct drm_mode_get_connector {
-
+	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
 	__u64 encoders_ptr;
+	/** @modes_ptr: Pointer to struct drm_mode_modeinfo array. */
 	__u64 modes_ptr;
+	/** @props_ptr: Pointer to ``__u32`` array of property IDs. */
 	__u64 props_ptr;
+	/** @prop_values_ptr: Pointer to ``__u64`` array of property values. */
 	__u64 prop_values_ptr;
 
+	/** @count_modes: Number of modes. */
 	__u32 count_modes;
+	/** @count_props: Number of properties. */
 	__u32 count_props;
+	/** @count_encoders: Number of encoders. */
 	__u32 count_encoders;
 
-	__u32 encoder_id; /**< Current Encoder */
-	__u32 connector_id; /**< Id */
+	/** @encoder_id: Object ID of the current encoder. */
+	__u32 encoder_id;
+	/** @connector_id: Object ID of the connector. */
+	__u32 connector_id;
+	/**
+	 * @connector_type: Type of the connector.
+	 *
+	 * See DRM_MODE_CONNECTOR_* defines.
+	 */
 	__u32 connector_type;
+	/**
+	 * @connector_type_id: Type-specific connector number.
+	 *
+	 * This is not an object ID. This is a per-type connector number. Each
+	 * (type, type_id) combination is unique across all connectors of a DRM
+	 * device.
+	 */
 	__u32 connector_type_id;
 
+	/**
+	 * @connection: Status of the connector.
+	 *
+	 * See enum drm_connector_status.
+	 */
 	__u32 connection;
-	__u32 mm_width;  /**< width in millimeters */
-	__u32 mm_height; /**< height in millimeters */
+	/** @mm_width: Width of the connected sink in millimeters. */
+	__u32 mm_width;
+	/** @mm_height: Height of the connected sink in millimeters. */
+	__u32 mm_height;
+	/**
+	 * @subpixel: Subpixel order of the connected sink.
+	 *
+	 * See enum subpixel_order.
+	 */
 	__u32 subpixel;
 
+	/** @pad: Padding, must be zero. */
 	__u32 pad;
 };
 
@@ -497,7 +590,7 @@ struct drm_mode_fb_cmd2 {
 	 * In case of planar formats, this ioctl allows up to 4
 	 * buffer objects with offsets and pitches per plane.
 	 * The pitch and offset order is dictated by the fourcc,
-	 * e.g. NV12 (http://fourcc.org/yuv.php#NV12) is described as:
+	 * e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
 	 *
 	 *   YUV 4:2:0 image with a plane of 8 bit Y samples
 	 *   followed by an interleaved U/V plane containing
@@ -899,26 +992,31 @@ struct drm_format_modifier {
 };
 
 /**
- * struct drm_mode_create_blob - Create New block property
- * @data: Pointer to data to copy.
- * @length: Length of data to copy.
- * @blob_id: new property ID.
+ * struct drm_mode_create_blob - Create New blob property
+ *
  * Create a new 'blob' data property, copying length bytes from data pointer,
  * and returning new blob ID.
  */
 struct drm_mode_create_blob {
-	/** Pointer to data to copy. */
+	/** @data: Pointer to data to copy. */
 	__u64 data;
-	/** Length of data to copy. */
+	/** @length: Length of data to copy. */
 	__u32 length;
-	/** Return: new property ID. */
+	/** @blob_id: Return: new property ID. */
 	__u32 blob_id;
 };
 
 /**
  * struct drm_mode_destroy_blob - Destroy user blob
  * @blob_id: blob_id to destroy
+ *
  * Destroy a user-created blob property.
+ *
+ * User-space can release blobs as soon as they do not need to refer to them by
+ * their blob object ID.  For instance, if you are using a MODE_ID blob in an
+ * atomic commit and you will not make another commit re-using the same ID, you
+ * can destroy the blob as soon as the commit has been issued, without waiting
+ * for it to complete.
  */
 struct drm_mode_destroy_blob {
 	__u32 blob_id;
@@ -926,36 +1024,32 @@ struct drm_mode_destroy_blob {
 
 /**
  * struct drm_mode_create_lease - Create lease
- * @object_ids: Pointer to array of object ids.
- * @object_count: Number of object ids.
- * @flags: flags for new FD.
- * @lessee_id: unique identifier for lessee.
- * @fd: file descriptor to new drm_master file.
+ *
  * Lease mode resources, creating another drm_master.
  */
 struct drm_mode_create_lease {
-	/** Pointer to array of object ids (__u32) */
+	/** @object_ids: Pointer to array of object ids (__u32) */
 	__u64 object_ids;
-	/** Number of object ids */
+	/** @object_count: Number of object ids */
 	__u32 object_count;
-	/** flags for new FD (O_CLOEXEC, etc) */
+	/** @flags: flags for new FD (O_CLOEXEC, etc) */
 	__u32 flags;
 
-	/** Return: unique identifier for lessee. */
+	/** @lessee_id: Return: unique identifier for lessee. */
 	__u32 lessee_id;
-	/** Return: file descriptor to new drm_master file */
+	/** @fd: Return: file descriptor to new drm_master file */
 	__u32 fd;
 };
 
 /**
  * struct drm_mode_list_lessees - List lessees
- * @count_lessees: Number of lessees.
- * @pad: pad.
- * @lessees_ptr: Pointer to lessess.
- * List lesses from a drm_master
+ *
+ * List lesses from a drm_master.
  */
 struct drm_mode_list_lessees {
-	/** Number of lessees.
+	/**
+	 * @count_lessees: Number of lessees.
+	 *
 	 * On input, provides length of the array.
 	 * On output, provides total number. No
 	 * more than the input number will be written
@@ -963,23 +1057,26 @@ struct drm_mode_list_lessees {
 	 * the size and then the data.
 	 */
 	__u32 count_lessees;
+	/** @pad: Padding. */
 	__u32 pad;
 
-	/** Pointer to lessees.
-	 * pointer to __u64 array of lessee ids
+	/**
+	 * @lessees_ptr: Pointer to lessees.
+	 *
+	 * Pointer to __u64 array of lessee ids
 	 */
 	__u64 lessees_ptr;
 };
 
 /**
  * struct drm_mode_get_lease - Get Lease
- * @count_objects: Number of leased objects.
- * @pad: pad.
- * @objects_ptr: Pointer to objects.
- * Get leased objects
+ *
+ * Get leased objects.
  */
 struct drm_mode_get_lease {
-	/** Number of leased objects.
+	/**
+	 * @count_objects: Number of leased objects.
+	 *
 	 * On input, provides length of the array.
 	 * On output, provides total number. No
 	 * more than the input number will be written
@@ -987,22 +1084,22 @@ struct drm_mode_get_lease {
 	 * the size and then the data.
 	 */
 	__u32 count_objects;
+	/** @pad: Padding. */
 	__u32 pad;
 
-	/** Pointer to objects.
-	 * pointer to __u32 array of object ids
+	/**
+	 * @objects_ptr: Pointer to objects.
+	 *
+	 * Pointer to __u32 array of object ids.
 	 */
 	__u64 objects_ptr;
 };
 
 /**
  * struct drm_mode_revoke_lease - Revoke lease
- * @lessee_id: Unique ID of lessee.
- * Revoke lease
  */
 struct drm_mode_revoke_lease {
-	/** Unique ID of lessee
-	 */
+	/** @lessee_id: Unique ID of lessee */
 	__u32 lessee_id;
 };
 
diff --git a/include/drm-uapi/etnaviv_drm.h b/include/drm-uapi/etnaviv_drm.h
index 09d0df8b..af024d90 100644
--- a/include/drm-uapi/etnaviv_drm.h
+++ b/include/drm-uapi/etnaviv_drm.h
@@ -74,6 +74,9 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_NUM_CONSTANTS             0x19
 #define ETNAVIV_PARAM_GPU_NUM_VARYINGS              0x1a
 #define ETNAVIV_PARAM_SOFTPIN_START_ADDR            0x1b
+#define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
+#define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
+#define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
 
 #define ETNA_MAX_PIPES 4
 
diff --git a/include/drm-uapi/exynos_drm.h b/include/drm-uapi/exynos_drm.h
index 293815e3..37eb9b5c 100644
--- a/include/drm-uapi/exynos_drm.h
+++ b/include/drm-uapi/exynos_drm.h
@@ -394,7 +394,7 @@ struct drm_exynos_ioctl_ipp_commit {
 #define DRM_IOCTL_EXYNOS_IPP_COMMIT		DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_IPP_COMMIT, struct drm_exynos_ioctl_ipp_commit)
 
-/* EXYNOS specific events */
+/* Exynos specific events */
 #define DRM_EXYNOS_G2D_EVENT		0x80000000
 #define DRM_EXYNOS_IPP_EVENT		0x80000002
 
diff --git a/include/drm-uapi/lima_drm.h b/include/drm-uapi/lima_drm.h
new file mode 100644
index 00000000..1ec58d65
--- /dev/null
+++ b/include/drm-uapi/lima_drm.h
@@ -0,0 +1,176 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
+/* Copyright 2017-2018 Qiang Yu <yuq825@gmail.com> */
+
+#ifndef __LIMA_DRM_H__
+#define __LIMA_DRM_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+enum drm_lima_param_gpu_id {
+	DRM_LIMA_PARAM_GPU_ID_UNKNOWN,
+	DRM_LIMA_PARAM_GPU_ID_MALI400,
+	DRM_LIMA_PARAM_GPU_ID_MALI450,
+};
+
+enum drm_lima_param {
+	DRM_LIMA_PARAM_GPU_ID,
+	DRM_LIMA_PARAM_NUM_PP,
+	DRM_LIMA_PARAM_GP_VERSION,
+	DRM_LIMA_PARAM_PP_VERSION,
+};
+
+/**
+ * get various information of the GPU
+ */
+struct drm_lima_get_param {
+	__u32 param; /* in, value in enum drm_lima_param */
+	__u32 pad;   /* pad, must be zero */
+	__u64 value; /* out, parameter value */
+};
+
+/*
+ * heap buffer dynamically increase backup memory size when GP task fail
+ * due to lack of heap memory. size field of heap buffer is an up bound of
+ * the backup memory which can be set to a fairly large value.
+ */
+#define LIMA_BO_FLAG_HEAP  (1 << 0)
+
+/**
+ * create a buffer for used by GPU
+ */
+struct drm_lima_gem_create {
+	__u32 size;    /* in, buffer size */
+	__u32 flags;   /* in, buffer flags */
+	__u32 handle;  /* out, GEM buffer handle */
+	__u32 pad;     /* pad, must be zero */
+};
+
+/**
+ * get information of a buffer
+ */
+struct drm_lima_gem_info {
+	__u32 handle;  /* in, GEM buffer handle */
+	__u32 va;      /* out, virtual address mapped into GPU MMU */
+	__u64 offset;  /* out, used to mmap this buffer to CPU */
+};
+
+#define LIMA_SUBMIT_BO_READ   0x01
+#define LIMA_SUBMIT_BO_WRITE  0x02
+
+/* buffer information used by one task */
+struct drm_lima_gem_submit_bo {
+	__u32 handle;  /* in, GEM buffer handle */
+	__u32 flags;   /* in, buffer read/write by GPU */
+};
+
+#define LIMA_GP_FRAME_REG_NUM 6
+
+/* frame used to setup GP for each task */
+struct drm_lima_gp_frame {
+	__u32 frame[LIMA_GP_FRAME_REG_NUM];
+};
+
+#define LIMA_PP_FRAME_REG_NUM 23
+#define LIMA_PP_WB_REG_NUM 12
+
+/* frame used to setup mali400 GPU PP for each task */
+struct drm_lima_m400_pp_frame {
+	__u32 frame[LIMA_PP_FRAME_REG_NUM];
+	__u32 num_pp;
+	__u32 wb[3 * LIMA_PP_WB_REG_NUM];
+	__u32 plbu_array_address[4];
+	__u32 fragment_stack_address[4];
+};
+
+/* frame used to setup mali450 GPU PP for each task */
+struct drm_lima_m450_pp_frame {
+	__u32 frame[LIMA_PP_FRAME_REG_NUM];
+	__u32 num_pp;
+	__u32 wb[3 * LIMA_PP_WB_REG_NUM];
+	__u32 use_dlbu;
+	__u32 _pad;
+	union {
+		__u32 plbu_array_address[8];
+		__u32 dlbu_regs[4];
+	};
+	__u32 fragment_stack_address[8];
+};
+
+#define LIMA_PIPE_GP  0x00
+#define LIMA_PIPE_PP  0x01
+
+#define LIMA_SUBMIT_FLAG_EXPLICIT_FENCE (1 << 0)
+
+/**
+ * submit a task to GPU
+ *
+ * User can always merge multi sync_file and drm_syncobj
+ * into one drm_syncobj as in_sync[0], but we reserve
+ * in_sync[1] for another task's out_sync to avoid the
+ * export/import/merge pass when explicit sync.
+ */
+struct drm_lima_gem_submit {
+	__u32 ctx;         /* in, context handle task is submitted to */
+	__u32 pipe;        /* in, which pipe to use, GP/PP */
+	__u32 nr_bos;      /* in, array length of bos field */
+	__u32 frame_size;  /* in, size of frame field */
+	__u64 bos;         /* in, array of drm_lima_gem_submit_bo */
+	__u64 frame;       /* in, GP/PP frame */
+	__u32 flags;       /* in, submit flags */
+	__u32 out_sync;    /* in, drm_syncobj handle used to wait task finish after submission */
+	__u32 in_sync[2];  /* in, drm_syncobj handle used to wait before start this task */
+};
+
+#define LIMA_GEM_WAIT_READ   0x01
+#define LIMA_GEM_WAIT_WRITE  0x02
+
+/**
+ * wait pending GPU task finish of a buffer
+ */
+struct drm_lima_gem_wait {
+	__u32 handle;      /* in, GEM buffer handle */
+	__u32 op;          /* in, CPU want to read/write this buffer */
+	__s64 timeout_ns;  /* in, wait timeout in absulute time */
+};
+
+/**
+ * create a context
+ */
+struct drm_lima_ctx_create {
+	__u32 id;          /* out, context handle */
+	__u32 _pad;        /* pad, must be zero */
+};
+
+/**
+ * free a context
+ */
+struct drm_lima_ctx_free {
+	__u32 id;          /* in, context handle */
+	__u32 _pad;        /* pad, must be zero */
+};
+
+#define DRM_LIMA_GET_PARAM   0x00
+#define DRM_LIMA_GEM_CREATE  0x01
+#define DRM_LIMA_GEM_INFO    0x02
+#define DRM_LIMA_GEM_SUBMIT  0x03
+#define DRM_LIMA_GEM_WAIT    0x04
+#define DRM_LIMA_CTX_CREATE  0x05
+#define DRM_LIMA_CTX_FREE    0x06
+
+#define DRM_IOCTL_LIMA_GET_PARAM DRM_IOWR(DRM_COMMAND_BASE + DRM_LIMA_GET_PARAM, struct drm_lima_get_param)
+#define DRM_IOCTL_LIMA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_LIMA_GEM_CREATE, struct drm_lima_gem_create)
+#define DRM_IOCTL_LIMA_GEM_INFO DRM_IOWR(DRM_COMMAND_BASE + DRM_LIMA_GEM_INFO, struct drm_lima_gem_info)
+#define DRM_IOCTL_LIMA_GEM_SUBMIT DRM_IOW(DRM_COMMAND_BASE + DRM_LIMA_GEM_SUBMIT, struct drm_lima_gem_submit)
+#define DRM_IOCTL_LIMA_GEM_WAIT DRM_IOW(DRM_COMMAND_BASE + DRM_LIMA_GEM_WAIT, struct drm_lima_gem_wait)
+#define DRM_IOCTL_LIMA_CTX_CREATE DRM_IOR(DRM_COMMAND_BASE + DRM_LIMA_CTX_CREATE, struct drm_lima_ctx_create)
+#define DRM_IOCTL_LIMA_CTX_FREE DRM_IOW(DRM_COMMAND_BASE + DRM_LIMA_CTX_FREE, struct drm_lima_ctx_free)
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __LIMA_DRM_H__ */
diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
index 0b85ed6a..f0758510 100644
--- a/include/drm-uapi/msm_drm.h
+++ b/include/drm-uapi/msm_drm.h
@@ -76,6 +76,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_NR_RINGS   0x07
 #define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
 #define MSM_PARAM_FAULTS     0x09
+#define MSM_PARAM_SUSPENDS   0x0a
 
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
@@ -93,13 +94,12 @@ struct drm_msm_param {
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
 #define MSM_BO_WC            0x00020000
-#define MSM_BO_UNCACHED      0x00040000
+#define MSM_BO_UNCACHED      0x00040000 /* deprecated, use MSM_BO_WC */
+#define MSM_BO_CACHED_COHERENT 0x080000
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
-                              MSM_BO_CACHED | \
-                              MSM_BO_WC | \
-                              MSM_BO_UNCACHED)
+                              MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
 	__u64 size;           /* in */
@@ -217,13 +217,28 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_FENCE_FD_IN   0x40000000 /* enable input fence_fd */
 #define MSM_SUBMIT_FENCE_FD_OUT  0x20000000 /* enable output fence_fd */
 #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB */
+#define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
+#define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
 #define MSM_SUBMIT_FLAGS                ( \
 		MSM_SUBMIT_NO_IMPLICIT   | \
 		MSM_SUBMIT_FENCE_FD_IN   | \
 		MSM_SUBMIT_FENCE_FD_OUT  | \
 		MSM_SUBMIT_SUDO          | \
+		MSM_SUBMIT_SYNCOBJ_IN    | \
+		MSM_SUBMIT_SYNCOBJ_OUT   | \
 		0)
 
+#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
+		MSM_SUBMIT_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_gem_submit_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -236,7 +251,14 @@ struct drm_msm_gem_submit {
 	__u64 bos;            /* in, ptr to array of submit_bo's */
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
-	__u32 queueid;         /* in, submitqueue id */
+	__u32 queueid;        /* in, submitqueue id */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
+	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
+	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
+	__u32 pad;            /*in, reserved for future use, always 0. */
+
 };
 
 /* The normal way to synchronize with the GPU is just to CPU_PREP on
diff --git a/include/drm-uapi/nouveau_drm.h b/include/drm-uapi/nouveau_drm.h
index 9459a6e3..853a3274 100644
--- a/include/drm-uapi/nouveau_drm.h
+++ b/include/drm-uapi/nouveau_drm.h
@@ -110,6 +110,7 @@ struct drm_nouveau_gem_pushbuf {
 	__u64 push;
 	__u32 suffix0;
 	__u32 suffix1;
+#define NOUVEAU_GEM_PUSHBUF_SYNC                                    (1ULL << 0)
 	__u64 vram_available;
 	__u64 gart_available;
 };
diff --git a/include/drm-uapi/panfrost_drm.h b/include/drm-uapi/panfrost_drm.h
index ec19db1e..061e700d 100644
--- a/include/drm-uapi/panfrost_drm.h
+++ b/include/drm-uapi/panfrost_drm.h
@@ -171,6 +171,7 @@ enum drm_panfrost_param {
 	DRM_PANFROST_PARAM_JS_FEATURES15,
 	DRM_PANFROST_PARAM_NR_CORE_GROUPS,
 	DRM_PANFROST_PARAM_THREAD_TLS_ALLOC,
+	DRM_PANFROST_PARAM_AFBC_FEATURES,
 };
 
 struct drm_panfrost_get_param {
diff --git a/include/drm-uapi/virtgpu_drm.h b/include/drm-uapi/virtgpu_drm.h
index f06a789f..b9ec26e9 100644
--- a/include/drm-uapi/virtgpu_drm.h
+++ b/include/drm-uapi/virtgpu_drm.h
@@ -46,6 +46,7 @@ extern "C" {
 #define DRM_VIRTGPU_TRANSFER_TO_HOST 0x07
 #define DRM_VIRTGPU_WAIT     0x08
 #define DRM_VIRTGPU_GET_CAPS  0x09
+#define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -71,6 +72,9 @@ struct drm_virtgpu_execbuffer {
 
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
 #define VIRTGPU_PARAM_CAPSET_QUERY_FIX 2 /* do we have the capset fix */
+#define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
+#define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
+#define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -100,7 +104,7 @@ struct drm_virtgpu_resource_info {
 	__u32 bo_handle;
 	__u32 res_handle;
 	__u32 size;
-	__u32 stride;
+	__u32 blob_mem;
 };
 
 struct drm_virtgpu_3d_box {
@@ -117,6 +121,8 @@ struct drm_virtgpu_3d_transfer_to_host {
 	struct drm_virtgpu_3d_box box;
 	__u32 level;
 	__u32 offset;
+	__u32 stride;
+	__u32 layer_stride;
 };
 
 struct drm_virtgpu_3d_transfer_from_host {
@@ -124,6 +130,8 @@ struct drm_virtgpu_3d_transfer_from_host {
 	struct drm_virtgpu_3d_box box;
 	__u32 level;
 	__u32 offset;
+	__u32 stride;
+	__u32 layer_stride;
 };
 
 #define VIRTGPU_WAIT_NOWAIT 1 /* like it */
@@ -140,6 +148,31 @@ struct drm_virtgpu_get_caps {
 	__u32 pad;
 };
 
+struct drm_virtgpu_resource_create_blob {
+#define VIRTGPU_BLOB_MEM_GUEST             0x0001
+#define VIRTGPU_BLOB_MEM_HOST3D            0x0002
+#define VIRTGPU_BLOB_MEM_HOST3D_GUEST      0x0003
+
+#define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
+#define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
+#define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+	/* zero is invalid blob_mem */
+	__u32 blob_mem;
+	__u32 blob_flags;
+	__u32 bo_handle;
+	__u32 res_handle;
+	__u64 size;
+
+	/*
+	 * for 3D contexts with VIRTGPU_BLOB_MEM_HOST3D_GUEST and
+	 * VIRTGPU_BLOB_MEM_HOST3D otherwise, must be zero.
+	 */
+	__u32 pad;
+	__u32 cmd_size;
+	__u64 cmd;
+	__u64 blob_id;
+};
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
 
@@ -175,6 +208,10 @@ struct drm_virtgpu_get_caps {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_GET_CAPS, \
 	struct drm_virtgpu_get_caps)
 
+#define DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB				\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_RESOURCE_CREATE_BLOB,	\
+		struct drm_virtgpu_resource_create_blob)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/vmwgfx_drm.h b/include/drm-uapi/vmwgfx_drm.h
index 02cab33f..02e91750 100644
--- a/include/drm-uapi/vmwgfx_drm.h
+++ b/include/drm-uapi/vmwgfx_drm.h
@@ -71,6 +71,7 @@ extern "C" {
 #define DRM_VMW_CREATE_EXTENDED_CONTEXT 26
 #define DRM_VMW_GB_SURFACE_CREATE_EXT   27
 #define DRM_VMW_GB_SURFACE_REF_EXT      28
+#define DRM_VMW_MSG                     29
 
 /*************************************************************************/
 /**
@@ -85,6 +86,9 @@ extern "C" {
  *
  * DRM_VMW_PARAM_SM4_1
  * SM4_1 support is enabled.
+ *
+ * DRM_VMW_PARAM_SM5
+ * SM5 support is enabled.
  */
 
 #define DRM_VMW_PARAM_NUM_STREAMS      0
@@ -102,6 +106,7 @@ extern "C" {
 #define DRM_VMW_PARAM_DX               12
 #define DRM_VMW_PARAM_HW_CAPS2         13
 #define DRM_VMW_PARAM_SM4_1            14
+#define DRM_VMW_PARAM_SM5              15
 
 /**
  * enum drm_vmw_handle_type - handle type for ref ioctls
@@ -1132,7 +1137,7 @@ struct drm_vmw_handle_close_arg {
  * svga3d surface flags split into 2, upper half and lower half.
  */
 enum drm_vmw_surface_version {
-	drm_vmw_gb_surface_v1
+	drm_vmw_gb_surface_v1,
 };
 
 /**
@@ -1143,6 +1148,7 @@ enum drm_vmw_surface_version {
  * @svga3d_flags_upper_32_bits: Upper 32 bits of svga3d flags.
  * @multisample_pattern: Multisampling pattern when msaa is supported.
  * @quality_level: Precision settings for each sample.
+ * @buffer_byte_stride: Buffer byte stride.
  * @must_be_zero: Reserved for future usage.
  *
  * Input argument to the  DRM_VMW_GB_SURFACE_CREATE_EXT Ioctl.
@@ -1151,10 +1157,11 @@ enum drm_vmw_surface_version {
 struct drm_vmw_gb_surface_create_ext_req {
 	struct drm_vmw_gb_surface_create_req base;
 	enum drm_vmw_surface_version version;
-	uint32_t svga3d_flags_upper_32_bits;
-	SVGA3dMSPattern multisample_pattern;
-	SVGA3dMSQualityLevel quality_level;
-	uint64_t must_be_zero;
+	__u32 svga3d_flags_upper_32_bits;
+	__u32 multisample_pattern;
+	__u32 quality_level;
+	__u32 buffer_byte_stride;
+	__u32 must_be_zero;
 };
 
 /**
@@ -1213,6 +1220,22 @@ union drm_vmw_gb_surface_reference_ext_arg {
 	struct drm_vmw_surface_arg req;
 };
 
+/**
+ * struct drm_vmw_msg_arg
+ *
+ * @send: Pointer to user-space msg string (null terminated).
+ * @receive: Pointer to user-space receive buffer.
+ * @send_only: Boolean whether this is only sending or receiving too.
+ *
+ * Argument to the DRM_VMW_MSG ioctl.
+ */
+struct drm_vmw_msg_arg {
+	__u64 send;
+	__u64 receive;
+	__s32 send_only;
+	__u32 receive_len;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
