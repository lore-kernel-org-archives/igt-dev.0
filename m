Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D105410E5D8
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 17:43:39 +0000 (UTC)
Date: Thu, 27 Jul 2023 17:43:17 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Message-ID: <20230727174311.327796-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [PATCH v2] drm-uapi: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Fei Yang <fei.yang@intel.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sync with drm-next commit 52920704df878050123dfeb469aa6ab8022547c1.

This is required for:
https://patchwork.freedesktop.org/patch/547602/?series=3D120551&rev=3D4

v2: drop redefinitions from lib/i915/i915_drm_local.h

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/amdgpu_drm.h   | 122 ++++++++++-
 include/drm-uapi/drm.h          |  94 ++++++++
 include/drm-uapi/drm_fourcc.h   |   2 +-
 include/drm-uapi/drm_mode.h     | 163 +++++++++++---
 include/drm-uapi/i915_drm.h     | 377 +++++++++++++++++++++++++-------
 include/drm-uapi/msm_drm.h      |  62 ++++--
 include/drm-uapi/panfrost_drm.h |  55 ++++-
 include/drm-uapi/virtgpu_drm.h  |  35 +++
 include/drm-uapi/vmwgfx_drm.h   |  10 +-
 lib/i915/i915_drm_local.h       |  49 -----
 10 files changed, 780 insertions(+), 189 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 0cbd1540aeac..79b14828d542 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -80,7 +80,7 @@ extern "C" {
  *
  * %AMDGPU_GEM_DOMAIN_GTT=09GPU accessible system memory, mapped into the
  * GPU's virtual address space via gart. Gart memory linearizes non-contig=
uous
- * pages of system memory, allows GPU access system memory in a linezrized
+ * pages of system memory, allows GPU access system memory in a linearized
  * fashion.
  *
  * %AMDGPU_GEM_DOMAIN_VRAM=09Local video memory. For APUs, it is memory
@@ -140,6 +140,24 @@ extern "C" {
  * not require GTT memory accounting
  */
 #define AMDGPU_GEM_CREATE_PREEMPTIBLE=09=09(1 << 11)
+/* Flag that BO can be discarded under memory pressure without keeping the
+ * content.
+ */
+#define AMDGPU_GEM_CREATE_DISCARDABLE=09=09(1 << 12)
+/* Flag that BO is shared coherently between multiple devices or CPU threa=
ds.
+ * May depend on GPU instructions to flush caches explicitly
+ *
+ * This influences the choice of MTYPE in the PTEs on GFXv9 and later GPUs=
 and
+ * may override the MTYPE selected in AMDGPU_VA_OP_MAP.
+ */
+#define AMDGPU_GEM_CREATE_COHERENT=09=09(1 << 13)
+/* Flag that BO should not be cached by GPU. Coherent without having to fl=
ush
+ * GPU caches explicitly
+ *
+ * This influences the choice of MTYPE in the PTEs on GFXv9 and later GPUs=
 and
+ * may override the MTYPE selected in AMDGPU_VA_OP_MAP.
+ */
+#define AMDGPU_GEM_CREATE_UNCACHED=09=09(1 << 14)
=20
 struct drm_amdgpu_gem_create_in  {
 =09/** the requested memory size */
@@ -206,6 +224,8 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_OP_FREE_CTX=092
 #define AMDGPU_CTX_OP_QUERY_STATE=093
 #define AMDGPU_CTX_OP_QUERY_STATE2=094
+#define AMDGPU_CTX_OP_GET_STABLE_PSTATE=095
+#define AMDGPU_CTX_OP_SET_STABLE_PSTATE=096
=20
 /* GPU reset status */
 #define AMDGPU_CTX_NO_RESET=09=090
@@ -225,6 +245,8 @@ union drm_amdgpu_bo_list {
 /* indicate some errors are detected by RAS */
 #define AMDGPU_CTX_QUERY2_FLAGS_RAS_CE   (1<<3)
 #define AMDGPU_CTX_QUERY2_FLAGS_RAS_UE   (1<<4)
+/* indicate that the reset hasn't completed yet */
+#define AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS (1<<5)
=20
 /* Context priority level */
 #define AMDGPU_CTX_PRIORITY_UNSET       -2048
@@ -238,10 +260,18 @@ union drm_amdgpu_bo_list {
 #define AMDGPU_CTX_PRIORITY_HIGH        512
 #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
=20
+/* select a stable profiling pstate for perfmon tools */
+#define AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK  0xf
+#define AMDGPU_CTX_STABLE_PSTATE_NONE  0
+#define AMDGPU_CTX_STABLE_PSTATE_STANDARD  1
+#define AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK  2
+#define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
+#define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
+
 struct drm_amdgpu_ctx_in {
 =09/** AMDGPU_CTX_OP_* */
 =09__u32=09op;
-=09/** For future use, no flags defined so far */
+=09/** Flags */
 =09__u32=09flags;
 =09__u32=09ctx_id;
 =09/** AMDGPU_CTX_PRIORITY_* */
@@ -262,6 +292,11 @@ union drm_amdgpu_ctx_out {
 =09=09=09/** Reset status since the last call of the ioctl. */
 =09=09=09__u32=09reset_status;
 =09=09} state;
+
+=09=09struct {
+=09=09=09__u32=09flags;
+=09=09=09__u32=09_pad;
+=09=09} pstate;
 };
=20
 union drm_amdgpu_ctx {
@@ -514,6 +549,8 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_MTYPE_UC=09=09(4 << 5)
 /* Use Read Write MTYPE instead of default MTYPE */
 #define AMDGPU_VM_MTYPE_RW=09=09(5 << 5)
+/* don't allocate MALL */
+#define AMDGPU_VM_PAGE_NOALLOC=09=09(1 << 9)
=20
 struct drm_amdgpu_gem_va {
 =09/** GEM object handle */
@@ -538,6 +575,10 @@ struct drm_amdgpu_gem_va {
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
@@ -553,6 +594,7 @@ struct drm_amdgpu_gem_va {
 #define AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES=090x07
 #define AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT    0x08
 #define AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL  0x09
+#define AMDGPU_CHUNK_ID_CP_GFX_SHADOW   0x0a
=20
 struct drm_amdgpu_cs_chunk {
 =09__u32=09=09chunk_id;
@@ -669,6 +711,15 @@ struct drm_amdgpu_cs_chunk_data {
 =09};
 };
=20
+#define AMDGPU_CS_CHUNK_CP_GFX_SHADOW_FLAGS_INIT_SHADOW         0x1
+
+struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
+=09__u64 shadow_va;
+=09__u64 csa_va;
+=09__u64 gds_va;
+=09__u64 flags;
+};
+
 /*
  *  Query h/w info: Flag that this is integrated (a.h.a. fusion) GPU
  *
@@ -676,6 +727,7 @@ struct drm_amdgpu_cs_chunk_data {
 #define AMDGPU_IDS_FLAGS_FUSION         0x1
 #define AMDGPU_IDS_FLAGS_PREEMPTION     0x2
 #define AMDGPU_IDS_FLAGS_TMZ            0x4
+#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD 0x8
=20
 /* indicate if acceleration can be working */
 #define AMDGPU_INFO_ACCEL_WORKING=09=090x00
@@ -728,6 +780,18 @@ struct drm_amdgpu_cs_chunk_data {
 =09#define AMDGPU_INFO_FW_DMCUB=09=090x14
 =09/* Subquery id: Query TOC firmware version */
 =09#define AMDGPU_INFO_FW_TOC=09=090x15
+=09/* Subquery id: Query CAP firmware version */
+=09#define AMDGPU_INFO_FW_CAP=09=090x16
+=09/* Subquery id: Query GFX RLCP firmware version */
+=09#define AMDGPU_INFO_FW_GFX_RLCP=09=090x17
+=09/* Subquery id: Query GFX RLCV firmware version */
+=09#define AMDGPU_INFO_FW_GFX_RLCV=09=090x18
+=09/* Subquery id: Query MES_KIQ firmware version */
+=09#define AMDGPU_INFO_FW_MES_KIQ=09=090x19
+=09/* Subquery id: Query MES firmware version */
+=09#define AMDGPU_INFO_FW_MES=09=090x1a
+=09/* Subquery id: Query IMU firmware version */
+=09#define AMDGPU_INFO_FW_IMU=09=090x1b
=20
 /* number of bytes moved for TTM migration */
 #define AMDGPU_INFO_NUM_BYTES_MOVED=09=090x0f
@@ -781,18 +845,15 @@ struct drm_amdgpu_cs_chunk_data {
 =09#define AMDGPU_INFO_SENSOR_STABLE_PSTATE_GFX_SCLK=09=090x8
 =09/* Subquery id: Query GPU stable pstate memory clock */
 =09#define AMDGPU_INFO_SENSOR_STABLE_PSTATE_GFX_MCLK=09=090x9
+=09/* Subquery id: Query GPU peak pstate shader clock */
+=09#define AMDGPU_INFO_SENSOR_PEAK_PSTATE_GFX_SCLK=09=09=090xa
+=09/* Subquery id: Query GPU peak pstate memory clock */
+=09#define AMDGPU_INFO_SENSOR_PEAK_PSTATE_GFX_MCLK=09=09=090xb
 /* Number of VRAM page faults on CPU access. */
 #define AMDGPU_INFO_NUM_VRAM_CPU_PAGE_FAULTS=090x1E
 #define AMDGPU_INFO_VRAM_LOST_COUNTER=09=090x1F
 /* query ras mask of enabled features*/
 #define AMDGPU_INFO_RAS_ENABLED_FEATURES=090x20
-/* query video encode/decode caps */
-#define AMDGPU_INFO_VIDEO_CAPS=09=09=090x21
-=09/* Subquery id: Decode */
-=09#define AMDGPU_INFO_VIDEO_CAPS_DECODE=09=090
-=09/* Subquery id: Encode */
-=09#define AMDGPU_INFO_VIDEO_CAPS_ENCODE=09=091
-
 /* RAS MASK: UMC (VRAM) */
 #define AMDGPU_INFO_RAS_ENABLED_UMC=09=09=09(1 << 0)
 /* RAS MASK: SDMA */
@@ -821,6 +882,14 @@ struct drm_amdgpu_cs_chunk_data {
 #define AMDGPU_INFO_RAS_ENABLED_MP1=09=09=09(1 << 12)
 /* RAS MASK: FUSE */
 #define AMDGPU_INFO_RAS_ENABLED_FUSE=09=09=09(1 << 13)
+/* query video encode/decode caps */
+#define AMDGPU_INFO_VIDEO_CAPS=09=09=090x21
+=09/* Subquery id: Decode */
+=09#define AMDGPU_INFO_VIDEO_CAPS_DECODE=09=090
+=09/* Subquery id: Encode */
+=09#define AMDGPU_INFO_VIDEO_CAPS_ENCODE=09=091
+/* Query the max number of IBs per gang per submission */
+#define AMDGPU_INFO_MAX_IBS=09=09=090x22
=20
 #define AMDGPU_INFO_MMR_SE_INDEX_SHIFT=090
 #define AMDGPU_INFO_MMR_SE_INDEX_MASK=090xff
@@ -972,6 +1041,8 @@ struct drm_amdgpu_info_vbios {
 #define AMDGPU_VRAM_TYPE_DDR4  8
 #define AMDGPU_VRAM_TYPE_GDDR6 9
 #define AMDGPU_VRAM_TYPE_DDR5  10
+#define AMDGPU_VRAM_TYPE_LPDDR4 11
+#define AMDGPU_VRAM_TYPE_LPDDR5 12
=20
 struct drm_amdgpu_info_device {
 =09/** PCI Device ID */
@@ -997,7 +1068,8 @@ struct drm_amdgpu_info_device {
 =09__u32 enabled_rb_pipes_mask;
 =09__u32 num_rb_pipes;
 =09__u32 num_hw_gfx_contexts;
-=09__u32 _pad;
+=09/* PCIe version (the smaller of the GPU and the CPU/motherboard) */
+=09__u32 pcie_gen;
 =09__u64 ids_flags;
 =09/** Starting virtual address for UMDs. */
 =09__u64 virtual_address_offset;
@@ -1044,7 +1116,8 @@ struct drm_amdgpu_info_device {
 =09__u32 gs_prim_buffer_depth;
 =09/* max gs wavefront per vgt*/
 =09__u32 max_gs_waves_per_vgt;
-=09__u32 _pad1;
+=09/* PCIe number of lanes (the smaller of the GPU and the CPU/motherboard=
) */
+=09__u32 pcie_num_lanes;
 =09/* always on cu bitmap */
 =09__u32 cu_ao_bitmap[4][4];
 =09/** Starting high virtual address for UMDs. */
@@ -1055,6 +1128,26 @@ struct drm_amdgpu_info_device {
 =09__u32 pa_sc_tile_steering_override;
 =09/* disabled TCCs */
 =09__u64 tcc_disabled_mask;
+=09__u64 min_engine_clock;
+=09__u64 min_memory_clock;
+=09/* The following fields are only set on gfx11+, older chips set 0. */
+=09__u32 tcp_cache_size;       /* AKA GL0, VMEM cache */
+=09__u32 num_sqc_per_wgp;
+=09__u32 sqc_data_cache_size;  /* AKA SMEM cache */
+=09__u32 sqc_inst_cache_size;
+=09__u32 gl1c_cache_size;
+=09__u32 gl2c_cache_size;
+=09__u64 mall_size;            /* AKA infinity cache */
+=09/* high 32 bits of the rb pipes mask */
+=09__u32 enabled_rb_pipes_mask_hi;
+=09/* shadow area size for gfx11 */
+=09__u32 shadow_size;
+=09/* shadow area base virtual alignment for gfx11 */
+=09__u32 shadow_alignment;
+=09/* context save area size for gfx11 */
+=09__u32 csa_size;
+=09/* context save area base virtual alignment for gfx11 */
+=09__u32 csa_alignment;
 };
=20
 struct drm_amdgpu_info_hw_ip {
@@ -1069,7 +1162,8 @@ struct drm_amdgpu_info_hw_ip {
 =09__u32  ib_size_alignment;
 =09/** Bitmask of available rings. Bit 0 means ring 0, etc. */
 =09__u32  available_rings;
-=09__u32  _pad;
+=09/** version info: bits 23:16 major, 15:8 minor, 7:0 revision */
+=09__u32  ip_discovery_version;
 };
=20
 struct drm_amdgpu_info_num_handles {
@@ -1134,7 +1228,11 @@ struct drm_amdgpu_info_video_caps {
 #define AMDGPU_FAMILY_RV=09=09=09142 /* Raven */
 #define AMDGPU_FAMILY_NV=09=09=09143 /* Navi10 */
 #define AMDGPU_FAMILY_VGH=09=09=09144 /* Van Gogh */
+#define AMDGPU_FAMILY_GC_11_0_0=09=09=09145 /* GC 11.0.0 */
 #define AMDGPU_FAMILY_YC=09=09=09146 /* Yellow Carp */
+#define AMDGPU_FAMILY_GC_11_0_1=09=09=09148 /* GC 11.0.1 */
+#define AMDGPU_FAMILY_GC_10_3_6=09=09=09149 /* GC 10.3.6 */
+#define AMDGPU_FAMILY_GC_10_3_7=09=09=09151 /* GC 10.3.7 */
=20
 #if defined(__cplusplus)
 }
diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 5e54c3aa4c3a..78805ad09636 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -903,6 +903,27 @@ struct drm_syncobj_timeline_wait {
 =09__u32 pad;
 };
=20
+/**
+ * struct drm_syncobj_eventfd
+ * @handle: syncobj handle.
+ * @flags: Zero to wait for the point to be signalled, or
+ *         &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE to wait for a fence to b=
e
+ *         available for the point.
+ * @point: syncobj timeline point (set to zero for binary syncobjs).
+ * @fd: Existing eventfd to sent events to.
+ * @pad: Must be zero.
+ *
+ * Register an eventfd to be signalled by a syncobj. The eventfd counter w=
ill
+ * be incremented by one.
+ */
+struct drm_syncobj_eventfd {
+=09__u32 handle;
+=09__u32 flags;
+=09__u64 point;
+=09__s32 fd;
+=09__u32 pad;
+};
+
=20
 struct drm_syncobj_array {
 =09__u64 handles;
@@ -966,6 +987,19 @@ extern "C" {
 #define DRM_IOCTL_GET_STATS             DRM_IOR( 0x06, struct drm_stats)
 #define DRM_IOCTL_SET_VERSION=09=09DRM_IOWR(0x07, struct drm_set_version)
 #define DRM_IOCTL_MODESET_CTL           DRM_IOW(0x08, struct drm_modeset_c=
tl)
+/**
+ * DRM_IOCTL_GEM_CLOSE - Close a GEM handle.
+ *
+ * GEM handles are not reference-counted by the kernel. User-space is
+ * responsible for managing their lifetime. For example, if user-space imp=
orts
+ * the same memory object twice on the same DRM file description, the same=
 GEM
+ * handle is returned by both imports, and user-space needs to ensure
+ * &DRM_IOCTL_GEM_CLOSE is performed once only. The same situation can hap=
pen
+ * when a memory object is allocated, then exported and imported again on =
the
+ * same DRM file description. The &DRM_IOCTL_MODE_GETFB2 IOCTL is an excep=
tion
+ * and always returns fresh new GEM handles even if an existing GEM handle
+ * already refers to the same memory object before the IOCTL is performed.
+ */
 #define DRM_IOCTL_GEM_CLOSE=09=09DRM_IOW (0x09, struct drm_gem_close)
 #define DRM_IOCTL_GEM_FLINK=09=09DRM_IOWR(0x0a, struct drm_gem_flink)
 #define DRM_IOCTL_GEM_OPEN=09=09DRM_IOWR(0x0b, struct drm_gem_open)
@@ -1006,7 +1040,37 @@ extern "C" {
 #define DRM_IOCTL_UNLOCK=09=09DRM_IOW( 0x2b, struct drm_lock)
 #define DRM_IOCTL_FINISH=09=09DRM_IOW( 0x2c, struct drm_lock)
=20
+/**
+ * DRM_IOCTL_PRIME_HANDLE_TO_FD - Convert a GEM handle to a DMA-BUF FD.
+ *
+ * User-space sets &drm_prime_handle.handle with the GEM handle to export =
and
+ * &drm_prime_handle.flags, and gets back a DMA-BUF file descriptor in
+ * &drm_prime_handle.fd.
+ *
+ * The export can fail for any driver-specific reason, e.g. because export=
 is
+ * not supported for this specific GEM handle (but might be for others).
+ *
+ * Support for exporting DMA-BUFs is advertised via &DRM_PRIME_CAP_EXPORT.
+ */
 #define DRM_IOCTL_PRIME_HANDLE_TO_FD    DRM_IOWR(0x2d, struct drm_prime_ha=
ndle)
+/**
+ * DRM_IOCTL_PRIME_FD_TO_HANDLE - Convert a DMA-BUF FD to a GEM handle.
+ *
+ * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
+ * import, and gets back a GEM handle in &drm_prime_handle.handle.
+ * &drm_prime_handle.flags is unused.
+ *
+ * If an existing GEM handle refers to the memory object backing the DMA-B=
UF,
+ * that GEM handle is returned. Therefore user-space which needs to handle
+ * arbitrary DMA-BUFs must have a user-space lookup data structure to manu=
ally
+ * reference-count duplicated GEM handles. For more information see
+ * &DRM_IOCTL_GEM_CLOSE.
+ *
+ * The import can fail for any driver-specific reason, e.g. because import=
 is
+ * only supported for DMA-BUFs allocated on this DRM device.
+ *
+ * Support for importing DMA-BUFs is advertised via &DRM_PRIME_CAP_IMPORT.
+ */
 #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_ha=
ndle)
=20
 #define DRM_IOCTL_AGP_ACQUIRE=09=09DRM_IO(  0x30)
@@ -1090,8 +1154,38 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER=09DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
=20
+/**
+ * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
+ *
+ * This queries metadata about a framebuffer. User-space fills
+ * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the rest of=
 the
+ * struct as the output.
+ *
+ * If the client is DRM master or has &CAP_SYS_ADMIN, &drm_mode_fb_cmd2.ha=
ndles
+ * will be filled with GEM buffer handles. Fresh new GEM handles are alway=
s
+ * returned, even if another GEM handle referring to the same memory objec=
t
+ * already exists on the DRM file description. The caller is responsible f=
or
+ * removing the new handles, e.g. via the &DRM_IOCTL_GEM_CLOSE IOCTL. The =
same
+ * new handle will be returned for multiple planes in case they use the sa=
me
+ * memory object. Planes are valid until one has a zero handle -- this can=
 be
+ * used to compute the number of planes.
+ *
+ * Otherwise, &drm_mode_fb_cmd2.handles will be zeroed and planes are vali=
d
+ * until one has a zero &drm_mode_fb_cmd2.pitches.
+ *
+ * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will b=
e set
+ * in &drm_mode_fb_cmd2.flags and &drm_mode_fb_cmd2.modifier will contain =
the
+ * modifier. Otherwise, user-space must ignore &drm_mode_fb_cmd2.modifier.
+ *
+ * To obtain DMA-BUF FDs for each plane without leaking GEM handles, user-=
space
+ * can export each handle via &DRM_IOCTL_PRIME_HANDLE_TO_FD, then immediat=
ely
+ * close each unique handle via &DRM_IOCTL_GEM_CLOSE, making sure to not
+ * double-close handles which are specified multiple times in the array.
+ */
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
=20
+#define DRM_IOCTL_SYNCOBJ_EVENTFD=09DRM_IOWR(0xCF, struct drm_syncobj_even=
tfd)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 8db7fd3f743e..6b6235f7a7cd 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -934,7 +934,7 @@ extern "C" {
  * which corresponds to the "generic" kind used for simple single-sample
  * uncompressed color formats on Fermi - Volta GPUs.
  */
-static inline __u64
+static __inline__ __u64
 drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 {
 =09if (!(modifier & 0x10) || (modifier & (0xff << 12)))
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index e4a2570a6058..92d96a2b6763 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -663,41 +663,73 @@ struct drm_mode_fb_cmd {
 #define DRM_MODE_FB_INTERLACED=09(1<<0) /* for interlaced framebuffers */
 #define DRM_MODE_FB_MODIFIERS=09(1<<1) /* enables ->modifer[] */
=20
+/**
+ * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
+ *
+ * This struct holds frame-buffer metadata. There are two ways to use it:
+ *
+ * - User-space can fill this struct and perform a &DRM_IOCTL_MODE_ADDFB2
+ *   ioctl to register a new frame-buffer. The new frame-buffer object ID =
will
+ *   be set by the kernel in @fb_id.
+ * - User-space can set @fb_id and perform a &DRM_IOCTL_MODE_GETFB2 ioctl =
to
+ *   fetch metadata about an existing frame-buffer.
+ *
+ * In case of planar formats, this struct allows up to 4 buffer objects wi=
th
+ * offsets and pitches per plane. The pitch and offset order are dictated =
by
+ * the format FourCC as defined by ``drm_fourcc.h``, e.g. NV12 is describe=
d as:
+ *
+ *     YUV 4:2:0 image with a plane of 8-bit Y samples followed by an
+ *     interleaved U/V plane containing 8-bit 2x2 subsampled colour differ=
ence
+ *     samples.
+ *
+ * So it would consist of a Y plane at ``offsets[0]`` and a UV plane at
+ * ``offsets[1]``.
+ *
+ * To accommodate tiled, compressed, etc formats, a modifier can be specif=
ied.
+ * For more information see the "Format Modifiers" section. Note that even
+ * though it looks like we have a modifier per-plane, we in fact do not. T=
he
+ * modifier for each plane must be identical. Thus all combinations of
+ * different data layouts for multi-plane formats must be enumerated as
+ * separate modifiers.
+ *
+ * All of the entries in @handles, @pitches, @offsets and @modifier must b=
e
+ * zero when unused. Warning, for @offsets and @modifier zero can't be use=
d to
+ * figure out whether the entry is used or not since it's a valid value (a=
 zero
+ * offset is common, and a zero modifier is &DRM_FORMAT_MOD_LINEAR).
+ */
 struct drm_mode_fb_cmd2 {
+=09/** @fb_id: Object ID of the frame-buffer. */
 =09__u32 fb_id;
+=09/** @width: Width of the frame-buffer. */
 =09__u32 width;
+=09/** @height: Height of the frame-buffer. */
 =09__u32 height;
-=09__u32 pixel_format; /* fourcc code from drm_fourcc.h */
-=09__u32 flags; /* see above flags */
+=09/**
+=09 * @pixel_format: FourCC format code, see ``DRM_FORMAT_*`` constants in
+=09 * ``drm_fourcc.h``.
+=09 */
+=09__u32 pixel_format;
+=09/**
+=09 * @flags: Frame-buffer flags (see &DRM_MODE_FB_INTERLACED and
+=09 * &DRM_MODE_FB_MODIFIERS).
+=09 */
+=09__u32 flags;
=20
-=09/*
-=09 * In case of planar formats, this ioctl allows up to 4
-=09 * buffer objects with offsets and pitches per plane.
-=09 * The pitch and offset order is dictated by the fourcc,
-=09 * e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
-=09 *
-=09 *   YUV 4:2:0 image with a plane of 8 bit Y samples
-=09 *   followed by an interleaved U/V plane containing
-=09 *   8 bit 2x2 subsampled colour difference samples.
-=09 *
-=09 * So it would consist of Y as offsets[0] and UV as
-=09 * offsets[1].  Note that offsets[0] will generally
-=09 * be 0 (but this is not required).
-=09 *
-=09 * To accommodate tiled, compressed, etc formats, a
-=09 * modifier can be specified.  The default value of zero
-=09 * indicates "native" format as specified by the fourcc.
-=09 * Vendor specific modifier token.  Note that even though
-=09 * it looks like we have a modifier per-plane, we in fact
-=09 * do not. The modifier for each plane must be identical.
-=09 * Thus all combinations of different data layouts for
-=09 * multi plane formats must be enumerated as separate
-=09 * modifiers.
+=09/**
+=09 * @handles: GEM buffer handle, one per plane. Set to 0 if the plane is
+=09 * unused. The same handle can be used for multiple planes.
 =09 */
 =09__u32 handles[4];
-=09__u32 pitches[4]; /* pitch for each plane */
-=09__u32 offsets[4]; /* offset of each plane */
-=09__u64 modifier[4]; /* ie, tiling, compress */
+=09/** @pitches: Pitch (aka. stride) in bytes, one per plane. */
+=09__u32 pitches[4];
+=09/** @offsets: Offset into the buffer in bytes, one per plane. */
+=09__u32 offsets[4];
+=09/**
+=09 * @modifier: Format modifier, one per plane. See ``DRM_FORMAT_MOD_*``
+=09 * constants in ``drm_fourcc.h``. All planes must use the same
+=09 * modifier. Ignored unless &DRM_MODE_FB_MODIFIERS is set in @flags.
+=09 */
+=09__u64 modifier[4];
 };
=20
 #define DRM_MODE_FB_DIRTY_ANNOTATE_COPY 0x01
@@ -802,6 +834,11 @@ struct drm_color_ctm {
 =09/*
 =09 * Conversion matrix in S31.32 sign-magnitude
 =09 * (not two's complement!) format.
+=09 *
+=09 * out   matrix    in
+=09 * |R|   |0 1 2|   |R|
+=09 * |G| =3D |3 4 5| x |G|
+=09 * |B|   |6 7 8|   |B|
 =09 */
 =09__u64 matrix[9];
 };
@@ -846,7 +883,7 @@ struct hdr_metadata_infoframe {
 =09 */
 =09struct {
 =09=09__u16 x, y;
-=09=09} display_primaries[3];
+=09} display_primaries[3];
 =09/**
 =09 * @white_point: White Point of Colorspace Data.
 =09 * These are coded as unsigned 16-bit values in units of
@@ -857,7 +894,7 @@ struct hdr_metadata_infoframe {
 =09 */
 =09struct {
 =09=09__u16 x, y;
-=09=09} white_point;
+=09} white_point;
 =09/**
 =09 * @max_display_mastering_luminance: Max Mastering Display Luminance.
 =09 * This value is coded as an unsigned 16-bit value in units of 1 cd/m2,
@@ -903,12 +940,31 @@ struct hdr_output_metadata {
 =09};
 };
=20
+/**
+ * DRM_MODE_PAGE_FLIP_EVENT
+ *
+ * Request that the kernel sends back a vblank event (see
+ * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when th=
e
+ * page-flip is done.
+ */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
+/**
+ * DRM_MODE_PAGE_FLIP_ASYNC
+ *
+ * Request that the page-flip is performed as soon as possible, ie. with n=
o
+ * delay due to waiting for vblank. This may cause tearing to be visible o=
n
+ * the screen.
+ */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
 #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
 #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
 =09=09=09=09   DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
+/**
+ * DRM_MODE_PAGE_FLIP_FLAGS
+ *
+ * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
+ */
 #define DRM_MODE_PAGE_FLIP_FLAGS (DRM_MODE_PAGE_FLIP_EVENT | \
 =09=09=09=09  DRM_MODE_PAGE_FLIP_ASYNC | \
 =09=09=09=09  DRM_MODE_PAGE_FLIP_TARGET)
@@ -1002,11 +1058,53 @@ struct drm_mode_destroy_dumb {
 =09__u32 handle;
 };
=20
-/* page-flip flags are valid, plus: */
+/**
+ * DRM_MODE_ATOMIC_TEST_ONLY
+ *
+ * Do not apply the atomic commit, instead check whether the hardware supp=
orts
+ * this configuration.
+ *
+ * See &drm_mode_config_funcs.atomic_check for more details on test-only
+ * commits.
+ */
 #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
+/**
+ * DRM_MODE_ATOMIC_NONBLOCK
+ *
+ * Do not block while applying the atomic commit. The &DRM_IOCTL_MODE_ATOM=
IC
+ * IOCTL returns immediately instead of waiting for the changes to be appl=
ied
+ * in hardware. Note, the driver will still check that the update can be
+ * applied before retuning.
+ */
 #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
+/**
+ * DRM_MODE_ATOMIC_ALLOW_MODESET
+ *
+ * Allow the update to result in temporary or transient visible artifacts =
while
+ * the update is being applied. Applying the update may also take signific=
antly
+ * more time than a page flip. All visual artifacts will disappear by the =
time
+ * the update is completed, as signalled through the vblank event's timest=
amp
+ * (see struct drm_event_vblank).
+ *
+ * This flag must be set when the KMS update might cause visible artifacts=
.
+ * Without this flag such KMS update will return a EINVAL error. What kind=
 of
+ * update may cause visible artifacts depends on the driver and the hardwa=
re.
+ * User-space that needs to know beforehand if an update might cause visib=
le
+ * artifacts can use &DRM_MODE_ATOMIC_TEST_ONLY without
+ * &DRM_MODE_ATOMIC_ALLOW_MODESET to see if it fails.
+ *
+ * To the best of the driver's knowledge, visual artifacts are guaranteed =
to
+ * not appear when this flag is not set. Some sinks might display visual
+ * artifacts outside of the driver's control.
+ */
 #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
=20
+/**
+ * DRM_MODE_ATOMIC_FLAGS
+ *
+ * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
+ * &drm_mode_atomic.flags.
+ */
 #define DRM_MODE_ATOMIC_FLAGS (\
 =09=09DRM_MODE_PAGE_FLIP_EVENT |\
 =09=09DRM_MODE_PAGE_FLIP_ASYNC |\
@@ -1112,7 +1210,8 @@ struct drm_mode_destroy_blob {
  * Lease mode resources, creating another drm_master.
  *
  * The @object_ids array must reference at least one CRTC, one connector a=
nd
- * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled.
+ * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled. Alternatively=
,
+ * the lease can be completely empty.
  */
 struct drm_mode_create_lease {
 =09/** @object_ids: Pointer to array of object ids (__u32) */
diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a0876ee41323..0a5c81445528 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -280,7 +280,16 @@ enum drm_i915_pmu_engine_sample {
 #define I915_PMU_ENGINE_SEMA(class, instance) \
 =09__I915_PMU_ENGINE(class, instance, I915_SAMPLE_SEMA)
=20
-#define __I915_PMU_OTHER(x) (__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x))
+/*
+ * Top 4 bits of every non-engine counter are GT id.
+ */
+#define __I915_PMU_GT_SHIFT (60)
+
+#define ___I915_PMU_OTHER(gt, x) \
+=09(((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
+=09((__u64)(gt) << __I915_PMU_GT_SHIFT))
+
+#define __I915_PMU_OTHER(x) ___I915_PMU_OTHER(0, x)
=20
 #define I915_PMU_ACTUAL_FREQUENCY=09__I915_PMU_OTHER(0)
 #define I915_PMU_REQUESTED_FREQUENCY=09__I915_PMU_OTHER(1)
@@ -290,6 +299,12 @@ enum drm_i915_pmu_engine_sample {
=20
 #define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
=20
+#define __I915_PMU_ACTUAL_FREQUENCY(gt)=09=09___I915_PMU_OTHER(gt, 0)
+#define __I915_PMU_REQUESTED_FREQUENCY(gt)=09___I915_PMU_OTHER(gt, 1)
+#define __I915_PMU_INTERRUPTS(gt)=09=09___I915_PMU_OTHER(gt, 2)
+#define __I915_PMU_RC6_RESIDENCY(gt)=09=09___I915_PMU_OTHER(gt, 3)
+#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)=09___I915_PMU_OTHER(gt, 4)
+
 /* Each region is a minimum of 16k, and there are at most 255 of them.
  */
 #define I915_NR_TEX_REGIONS 255=09/* table size 2k - maximum due to use
@@ -645,6 +660,23 @@ typedef struct drm_i915_irq_wait {
  */
 #define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP=09(1ul << 5)
=20
+/*
+ * Query the status of HuC load.
+ *
+ * The query can fail in the following scenarios with the listed error cod=
es:
+ *  -ENODEV if HuC is not present on this platform,
+ *  -EOPNOTSUPP if HuC firmware usage is disabled,
+ *  -ENOPKG if HuC firmware fetch failed,
+ *  -ENOEXEC if HuC firmware is invalid or mismatched,
+ *  -ENOMEM if i915 failed to prepare the FW objects for transfer to the u=
C,
+ *  -EIO if the FW transfer or the FW authentication failed.
+ *
+ * If the IOCTL is successful, the returned parameter will be set to one o=
f the
+ * following values:
+ *  * 0 if HuC firmware load is not complete,
+ *  * 1 if HuC firmware is loaded and fully authenticated,
+ *  * 2 if HuC firmware is loaded and authenticated for clear media only
+ */
 #define I915_PARAM_HUC_STATUS=09=09 42
=20
 /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to opt-out =
of
@@ -755,16 +787,48 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_OA_TIMESTAMP_FREQUENCY 57
=20
+/*
+ * Query the status of PXP support in i915.
+ *
+ * The query can fail in the following scenarios with the listed error cod=
es:
+ *     -ENODEV =3D PXP support is not available on the GPU device or in th=
e
+ *               kernel due to missing component drivers or kernel configs=
.
+ *
+ * If the IOCTL is successful, the returned parameter will be set to one o=
f
+ * the following values:
+ *     1 =3D PXP feature is supported and is ready for use.
+ *     2 =3D PXP feature is supported but should be ready soon (pending
+ *         initialization of non-i915 system dependencies).
+ *
+ * NOTE: When param is supported (positive return values), user space shou=
ld
+ *       still refer to the GEM PXP context-creation UAPI header specs to =
be
+ *       aware of possible failure due to system state machine at the time=
.
+ */
+#define I915_PARAM_PXP_STATUS=09=09 58
+
 /* Must be kept compact -- no holes and well documented */
=20
-typedef struct drm_i915_getparam {
+/**
+ * struct drm_i915_getparam - Driver parameter query structure.
+ */
+struct drm_i915_getparam {
+=09/** @param: Driver parameter to query. */
 =09__s32 param;
-=09/*
+
+=09/**
+=09 * @value: Address of memory where queried value should be put.
+=09 *
 =09 * WARNING: Using pointers instead of fixed-size u64 means we need to w=
rite
 =09 * compat32 code. Don't repeat this mistake.
 =09 */
 =09int *value;
-} drm_i915_getparam_t;
+};
+
+/**
+ * typedef drm_i915_getparam_t - Driver parameter query structure.
+ * See struct drm_i915_getparam.
+ */
+typedef struct drm_i915_getparam drm_i915_getparam_t;
=20
 /* Ioctl to set kernel params:
  */
@@ -1245,76 +1309,119 @@ struct drm_i915_gem_exec_object2 {
 =09__u64 rsvd2;
 };
=20
+/**
+ * struct drm_i915_gem_exec_fence - An input or output fence for the execb=
uf
+ * ioctl.
+ *
+ * The request will wait for input fence to signal before submission.
+ *
+ * The returned output fence will be signaled after the completion of the
+ * request.
+ */
 struct drm_i915_gem_exec_fence {
-=09/**
-=09 * User's handle for a drm_syncobj to wait on or signal.
-=09 */
+=09/** @handle: User's handle for a drm_syncobj to wait on or signal. */
 =09__u32 handle;
=20
+=09/**
+=09 * @flags: Supported flags are:
+=09 *
+=09 * I915_EXEC_FENCE_WAIT:
+=09 * Wait for the input fence before request submission.
+=09 *
+=09 * I915_EXEC_FENCE_SIGNAL:
+=09 * Return request completion fence as output
+=09 */
+=09__u32 flags;
 #define I915_EXEC_FENCE_WAIT            (1<<0)
 #define I915_EXEC_FENCE_SIGNAL          (1<<1)
 #define __I915_EXEC_FENCE_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_SIGNAL << 1))
-=09__u32 flags;
 };
=20
-/*
- * See drm_i915_gem_execbuffer_ext_timeline_fences.
- */
-#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
-
-/*
+/**
+ * struct drm_i915_gem_execbuffer_ext_timeline_fences - Timeline fences
+ * for execbuf ioctl.
+ *
  * This structure describes an array of drm_syncobj and associated points =
for
  * timeline variants of drm_syncobj. It is invalid to append this structur=
e to
  * the execbuf if I915_EXEC_FENCE_ARRAY is set.
  */
 struct drm_i915_gem_execbuffer_ext_timeline_fences {
+#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
+=09/** @base: Extension link. See struct i915_user_extension. */
 =09struct i915_user_extension base;
=20
 =09/**
-=09 * Number of element in the handles_ptr & value_ptr arrays.
+=09 * @fence_count: Number of elements in the @handles_ptr & @value_ptr
+=09 * arrays.
 =09 */
 =09__u64 fence_count;
=20
 =09/**
-=09 * Pointer to an array of struct drm_i915_gem_exec_fence of length
-=09 * fence_count.
+=09 * @handles_ptr: Pointer to an array of struct drm_i915_gem_exec_fence
+=09 * of length @fence_count.
 =09 */
 =09__u64 handles_ptr;
=20
 =09/**
-=09 * Pointer to an array of u64 values of length fence_count. Values
-=09 * must be 0 for a binary drm_syncobj. A Value of 0 for a timeline
-=09 * drm_syncobj is invalid as it turns a drm_syncobj into a binary one.
+=09 * @values_ptr: Pointer to an array of u64 values of length
+=09 * @fence_count.
+=09 * Values must be 0 for a binary drm_syncobj. A Value of 0 for a
+=09 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+=09 * binary one.
 =09 */
 =09__u64 values_ptr;
 };
=20
+/**
+ * struct drm_i915_gem_execbuffer2 - Structure for DRM_I915_GEM_EXECBUFFER=
2
+ * ioctl.
+ */
 struct drm_i915_gem_execbuffer2 {
-=09/**
-=09 * List of gem_exec_object2 structs
-=09 */
+=09/** @buffers_ptr: Pointer to a list of gem_exec_object2 structs */
 =09__u64 buffers_ptr;
+
+=09/** @buffer_count: Number of elements in @buffers_ptr array */
 =09__u32 buffer_count;
=20
-=09/** Offset in the batchbuffer to start execution from. */
+=09/**
+=09 * @batch_start_offset: Offset in the batchbuffer to start execution
+=09 * from.
+=09 */
 =09__u32 batch_start_offset;
-=09/** Bytes used in batchbuffer from batch_start_offset */
+
+=09/**
+=09 * @batch_len: Length in bytes of the batch buffer, starting from the
+=09 * @batch_start_offset. If 0, length is assumed to be the batch buffer
+=09 * object size.
+=09 */
 =09__u32 batch_len;
+
+=09/** @DR1: deprecated */
 =09__u32 DR1;
+
+=09/** @DR4: deprecated */
 =09__u32 DR4;
+
+=09/** @num_cliprects: See @cliprects_ptr */
 =09__u32 num_cliprects;
+
 =09/**
-=09 * This is a struct drm_clip_rect *cliprects if I915_EXEC_FENCE_ARRAY
-=09 * & I915_EXEC_USE_EXTENSIONS are not set.
+=09 * @cliprects_ptr: Kernel clipping was a DRI1 misfeature.
+=09 *
+=09 * It is invalid to use this field if I915_EXEC_FENCE_ARRAY or
+=09 * I915_EXEC_USE_EXTENSIONS flags are not set.
 =09 *
 =09 * If I915_EXEC_FENCE_ARRAY is set, then this is a pointer to an array
-=09 * of struct drm_i915_gem_exec_fence and num_cliprects is the length
-=09 * of the array.
+=09 * of &drm_i915_gem_exec_fence and @num_cliprects is the length of the
+=09 * array.
 =09 *
 =09 * If I915_EXEC_USE_EXTENSIONS is set, then this is a pointer to a
-=09 * single struct i915_user_extension and num_cliprects is 0.
+=09 * single &i915_user_extension and num_cliprects is 0.
 =09 */
 =09__u64 cliprects_ptr;
+
+=09/** @flags: Execbuf flags */
+=09__u64 flags;
 #define I915_EXEC_RING_MASK              (0x3f)
 #define I915_EXEC_DEFAULT                (0<<0)
 #define I915_EXEC_RENDER                 (1<<0)
@@ -1332,10 +1439,6 @@ struct drm_i915_gem_execbuffer2 {
 #define I915_EXEC_CONSTANTS_REL_GENERAL (0<<6) /* default */
 #define I915_EXEC_CONSTANTS_ABSOLUTE =09(1<<6)
 #define I915_EXEC_CONSTANTS_REL_SURFACE (2<<6) /* gen4/5 only */
-=09__u64 flags;
-=09__u64 rsvd1; /* now used for context info */
-=09__u64 rsvd2;
-};
=20
 /** Resets the SO write offset registers for transform feedback on gen7. *=
/
 #define I915_EXEC_GEN7_SOL_RESET=09(1<<8)
@@ -1438,9 +1541,23 @@ struct drm_i915_gem_execbuffer2 {
  * drm_i915_gem_execbuffer_ext enum.
  */
 #define I915_EXEC_USE_EXTENSIONS=09(1 << 21)
-
 #define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
=20
+=09/** @rsvd1: Context id */
+=09__u64 rsvd1;
+
+=09/**
+=09 * @rsvd2: in and out sync_file file descriptors.
+=09 *
+=09 * When I915_EXEC_FENCE_IN or I915_EXEC_FENCE_SUBMIT flag is set, the
+=09 * lower 32 bits of this field will have the in sync_file fd (input).
+=09 *
+=09 * When I915_EXEC_FENCE_OUT flag is set, the upper 32 bits of this
+=09 * field will have the out sync_file fd (output).
+=09 */
+=09__u64 rsvd2;
+};
+
 #define I915_EXEC_CONTEXT_ID_MASK=09(0xffffffff)
 #define i915_execbuffer2_set_context_id(eb2, context) \
 =09(eb2).rsvd1 =3D context & I915_EXEC_CONTEXT_ID_MASK
@@ -1820,19 +1937,58 @@ struct drm_i915_gem_context_create {
 =09__u32 pad;
 };
=20
+/**
+ * struct drm_i915_gem_context_create_ext - Structure for creating context=
s.
+ */
 struct drm_i915_gem_context_create_ext {
-=09__u32 ctx_id; /* output: id of new context*/
+=09/** @ctx_id: Id of the created context (output) */
+=09__u32 ctx_id;
+
+=09/**
+=09 * @flags: Supported flags are:
+=09 *
+=09 * I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS:
+=09 *
+=09 * Extensions may be appended to this structure and driver must check
+=09 * for those. See @extensions.
+=09 *
+=09 * I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE
+=09 *
+=09 * Created context will have single timeline.
+=09 */
 =09__u32 flags;
 #define I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS=09(1u << 0)
 #define I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE=09(1u << 1)
 #define I915_CONTEXT_CREATE_FLAGS_UNKNOWN \
 =09(-(I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE << 1))
+
+=09/**
+=09 * @extensions: Zero-terminated chain of extensions.
+=09 *
+=09 * I915_CONTEXT_CREATE_EXT_SETPARAM:
+=09 * Context parameter to set or query during context creation.
+=09 * See struct drm_i915_gem_context_create_ext_setparam.
+=09 *
+=09 * I915_CONTEXT_CREATE_EXT_CLONE:
+=09 * This extension has been removed. On the off chance someone somewhere
+=09 * has attempted to use it, never re-use this extension number.
+=09 */
 =09__u64 extensions;
+#define I915_CONTEXT_CREATE_EXT_SETPARAM 0
+#define I915_CONTEXT_CREATE_EXT_CLONE 1
 };
=20
+/**
+ * struct drm_i915_gem_context_param - Context parameter to set or query.
+ */
 struct drm_i915_gem_context_param {
+=09/** @ctx_id: Context id */
 =09__u32 ctx_id;
+
+=09/** @size: Size of the parameter @value */
 =09__u32 size;
+
+=09/** @param: Parameter to set or query */
 =09__u64 param;
 #define I915_CONTEXT_PARAM_BAN_PERIOD=090x1
 /* I915_CONTEXT_PARAM_NO_ZEROMAP has been removed.  On the off chance
@@ -1975,10 +2131,26 @@ struct drm_i915_gem_context_param {
  *
  * -ENODEV: feature not available
  * -EPERM: trying to mark a recoverable or not bannable context as protect=
ed
+ * -ENXIO: A dependency such as a component driver or firmware is not yet
+ *         loaded so user space may need to attempt again. Depending on th=
e
+ *         device, this error may be reported if protected context creatio=
n is
+ *         attempted very early after kernel start because the internal ti=
meout
+ *         waiting for such dependencies is not guaranteed to be larger th=
an
+ *         required (numbers differ depending on system and kernel config)=
:
+ *            - ADL/RPL: dependencies may take up to 3 seconds from kernel=
 start
+ *                       while context creation internal timeout is 250 mi=
lisecs
+ *            - MTL: dependencies may take up to 8 seconds from kernel sta=
rt
+ *                   while context creation internal timeout is 250 milise=
cs
+ *         NOTE: such dependencies happen once, so a subsequent call to cr=
eate a
+ *         protected context after a prior successful call will not experi=
ence
+ *         such timeouts and will not return -ENXIO (unless the driver is =
reloaded,
+ *         or, depending on the device, resumes from a suspended state).
+ * -EIO: The firmware did not succeed in creating the protected context.
  */
 #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
=20
+=09/** @value: Context parameter value to be set or queried */
 =09__u64 value;
 };
=20
@@ -2129,7 +2301,7 @@ struct i915_context_engines_load_balance {
=20
 =09__u64 mbz64; /* reserved for future use; must be zero */
=20
-=09struct i915_engine_class_instance engines[0];
+=09struct i915_engine_class_instance engines[];
 } __attribute__((packed));
=20
 #define I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(name__, N__) struct { \
@@ -2167,7 +2339,7 @@ struct i915_context_engines_bond {
 =09__u64 flags; /* all undefined flags must be zero */
 =09__u64 mbz64[4]; /* reserved for future use; must be zero */
=20
-=09struct i915_engine_class_instance engines[0];
+=09struct i915_engine_class_instance engines[];
 } __attribute__((packed));
=20
 #define I915_DEFINE_CONTEXT_ENGINES_BOND(name__, N__) struct { \
@@ -2294,7 +2466,7 @@ struct i915_context_engines_parallel_submit {
 =09 * length =3D width (i) * num_siblings (j)
 =09 * index =3D j + i * num_siblings
 =09 */
-=09struct i915_engine_class_instance engines[0];
+=09struct i915_engine_class_instance engines[];
=20
 } __attribute__((packed));
=20
@@ -2369,7 +2541,7 @@ struct i915_context_param_engines {
 #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engine=
s_load_balance */
 #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond *=
/
 #define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_eng=
ines_parallel_submit */
-=09struct i915_engine_class_instance engines[0];
+=09struct i915_engine_class_instance engines[];
 } __attribute__((packed));
=20
 #define I915_DEFINE_CONTEXT_PARAM_ENGINES(name__, N__) struct { \
@@ -2377,23 +2549,29 @@ struct i915_context_param_engines {
 =09struct i915_engine_class_instance engines[N__]; \
 } __attribute__((packed)) name__
=20
+/**
+ * struct drm_i915_gem_context_create_ext_setparam - Context parameter
+ * to set or query during context creation.
+ */
 struct drm_i915_gem_context_create_ext_setparam {
-#define I915_CONTEXT_CREATE_EXT_SETPARAM 0
+=09/** @base: Extension link. See struct i915_user_extension. */
 =09struct i915_user_extension base;
+
+=09/**
+=09 * @param: Context parameter to set or query.
+=09 * See struct drm_i915_gem_context_param.
+=09 */
 =09struct drm_i915_gem_context_param param;
 };
=20
-/* This API has been removed.  On the off chance someone somewhere has
- * attempted to use it, never re-use this extension number.
- */
-#define I915_CONTEXT_CREATE_EXT_CLONE 1
-
 struct drm_i915_gem_context_destroy {
 =09__u32 ctx_id;
 =09__u32 pad;
 };
=20
-/*
+/**
+ * struct drm_i915_gem_vm_control - Structure to create or destroy VM.
+ *
  * DRM_I915_GEM_VM_CREATE -
  *
  * Create a new virtual memory address space (ppGTT) for use within a cont=
ext
@@ -2403,20 +2581,23 @@ struct drm_i915_gem_context_destroy {
  * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM i=
s
  * returned in the outparam @id.
  *
- * No flags are defined, with all bits reserved and must be zero.
- *
  * An extension chain maybe provided, starting with @extensions, and termi=
nated
  * by the @next_extension being 0. Currently, no extensions are defined.
  *
  * DRM_I915_GEM_VM_DESTROY -
  *
- * Destroys a previously created VM id, specified in @id.
+ * Destroys a previously created VM id, specified in @vm_id.
  *
  * No extensions or flags are allowed currently, and so must be zero.
  */
 struct drm_i915_gem_vm_control {
+=09/** @extensions: Zero-terminated chain of extensions. */
 =09__u64 extensions;
+
+=09/** @flags: reserved for future usage, currently MBZ */
 =09__u32 flags;
+
+=09/** @vm_id: Id of the VM created or to be destroyed */
 =09__u32 vm_id;
 };
=20
@@ -2631,6 +2812,25 @@ enum drm_i915_perf_property_id {
 =09 */
 =09DRM_I915_PERF_PROP_POLL_OA_PERIOD,
=20
+=09/**
+=09 * Multiple engines may be mapped to the same OA unit. The OA unit is
+=09 * identified by class:instance of any engine mapped to it.
+=09 *
+=09 * This parameter specifies the engine class and must be passed along
+=09 * with DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE.
+=09 *
+=09 * This property is available in perf revision 6.
+=09 */
+=09DRM_I915_PERF_PROP_OA_ENGINE_CLASS,
+
+=09/**
+=09 * This parameter specifies the engine instance and must be passed alon=
g
+=09 * with DRM_I915_PERF_PROP_OA_ENGINE_CLASS.
+=09 *
+=09 * This property is available in perf revision 6.
+=09 */
+=09DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE,
+
 =09DRM_I915_PERF_PROP_MAX /* non-ABI */
 };
=20
@@ -3392,27 +3592,13 @@ struct drm_i915_gem_create_ext {
 =09 *
 =09 * The (page-aligned) allocated size for the object will be returned.
 =09 *
-=09 * DG2 64K min page size implications:
-=09 *
-=09 * On discrete platforms, starting from DG2, we have to contend with GT=
T
-=09 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
-=09 * objects.  Specifically the hardware only supports 64K or larger GTT
-=09 * page sizes for such memory. The kernel will already ensure that all
-=09 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger pag=
e
-=09 * sizes underneath.
-=09 *
-=09 * Note that the returned size here will always reflect any required
-=09 * rounding up done by the kernel, i.e 4K will now become 64K on device=
s
-=09 * such as DG2. The kernel will always select the largest minimum
-=09 * page-size for the set of possible placements as the value to use whe=
n
-=09 * rounding up the @size.
-=09 *
-=09 * Special DG2 GTT address alignment requirement:
+=09 * On platforms like DG2/ATS the kernel will always use 64K or larger
+=09 * pages for I915_MEMORY_CLASS_DEVICE. The kernel also requires a
+=09 * minimum of 64K GTT alignment for such objects.
 =09 *
-=09 * The GTT alignment will also need to be at least 2M for such objects.
-=09 *
-=09 * Note that due to how the hardware implements 64K GTT page support, w=
e
-=09 * have some further complications:
+=09 * NOTE: Previously the ABI here required a minimum GTT alignment of 2M
+=09 * on DG2/ATS, due to how the hardware implemented 64K GTT page support=
,
+=09 * where we had the following complications:
 =09 *
 =09 *   1) The entire PDE (which covers a 2MB virtual address range), must
 =09 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
@@ -3421,12 +3607,10 @@ struct drm_i915_gem_create_ext {
 =09 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
 =09 *   objects.
 =09 *
-=09 * To keep things simple for userland, we mandate that any GTT mappings
-=09 * must be aligned to and rounded up to 2MB. The kernel will internally
-=09 * pad them out to the next 2MB boundary. As this only wastes virtual
-=09 * address space and avoids userland having to copy any needlessly
-=09 * complicated PDE sharing scheme (coloring) and only affects DG2, this
-=09 * is deemed to be a good compromise.
+=09 * However on actual production HW this was completely changed to now
+=09 * allow setting a TLB hint at the PTE level (see PS64), which is a lot
+=09 * more flexible than the above. With this the 2M restriction was
+=09 * dropped where we now only require 64K.
 =09 */
 =09__u64 size;
=20
@@ -3496,9 +3680,13 @@ struct drm_i915_gem_create_ext {
 =09 *
 =09 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
 =09 * struct drm_i915_gem_create_ext_protected_content.
+=09 *
+=09 * For I915_GEM_CREATE_EXT_SET_PAT usage see
+=09 * struct drm_i915_gem_create_ext_set_pat.
 =09 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
 #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
+#define I915_GEM_CREATE_EXT_SET_PAT 2
 =09__u64 extensions;
 };
=20
@@ -3613,6 +3801,43 @@ struct drm_i915_gem_create_ext_protected_content {
 =09__u32 flags;
 };
=20
+/**
+ * struct drm_i915_gem_create_ext_set_pat - The
+ * I915_GEM_CREATE_EXT_SET_PAT extension.
+ *
+ * If this extension is provided, the specified caching policy (PAT index)=
 is
+ * applied to the buffer object.
+ *
+ * Below is an example on how to create an object with specific caching po=
licy:
+ *
+ * .. code-block:: C
+ *
+ *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
+ *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
+ *              .pat_index =3D 0,
+ *      };
+ *      struct drm_i915_gem_create_ext create_ext =3D {
+ *              .size =3D PAGE_SIZE,
+ *              .extensions =3D (uintptr_t)&set_pat_ext,
+ *      };
+ *
+ *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
+ *      if (err) ...
+ */
+struct drm_i915_gem_create_ext_set_pat {
+=09/** @base: Extension link. See struct i915_user_extension. */
+=09struct i915_user_extension base;
+=09/**
+=09 * @pat_index: PAT index to be set
+=09 * PAT index is a bit field in Page Table Entry to control caching
+=09 * behaviors for GPU accesses. The definition of PAT index is
+=09 * platform dependent and can be found in hardware specifications,
+=09 */
+=09__u32 pat_index;
+=09/** @rsvd: reserved for future use */
+=09__u32 rsvd;
+};
+
 /* ID of the protected content session managed by i915 when PXP is active =
*/
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
=20
diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
index 6b8fffc28a50..6c34272a13fd 100644
--- a/include/drm-uapi/msm_drm.h
+++ b/include/drm-uapi/msm_drm.h
@@ -67,16 +67,25 @@ struct drm_msm_timespec {
 =09__s64 tv_nsec;         /* nanoseconds */
 };
=20
-#define MSM_PARAM_GPU_ID     0x01
-#define MSM_PARAM_GMEM_SIZE  0x02
-#define MSM_PARAM_CHIP_ID    0x03
-#define MSM_PARAM_MAX_FREQ   0x04
-#define MSM_PARAM_TIMESTAMP  0x05
-#define MSM_PARAM_GMEM_BASE  0x06
-#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
-#define MSM_PARAM_PP_PGTABLE 0x08  /* =3D> 1 for per-process pagetables, e=
lse 0 */
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
+#define MSM_PARAM_PP_PGTABLE 0x08  /* RO: Deprecated, always returns zero =
*/
+#define MSM_PARAM_FAULTS     0x09  /* RO */
+#define MSM_PARAM_SUSPENDS   0x0a  /* RO */
+#define MSM_PARAM_SYSPROF    0x0b  /* WO: 1 preserves perfcntrs, 2 also di=
sables suspend */
+#define MSM_PARAM_COMM       0x0c  /* WO: override for task->comm */
+#define MSM_PARAM_CMDLINE    0x0d  /* WO: override for task cmdline */
+#define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
+#define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (by=
tes) */
=20
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -90,6 +99,8 @@ struct drm_msm_param {
 =09__u32 pipe;           /* in, MSM_PIPE_x */
 =09__u32 param;          /* in, MSM_PARAM_x */
 =09__u64 value;          /* out (get_param) or in (set_param) */
+=09__u32 len;            /* zero for non-pointer params */
+=09__u32 pad;            /* must be zero */
 };
=20
 /*
@@ -126,6 +137,8 @@ struct drm_msm_gem_new {
 #define MSM_INFO_GET_IOVA=090x01   /* get iova, returned by value */
 #define MSM_INFO_SET_NAME=090x02   /* set the debug name (by pointer) */
 #define MSM_INFO_GET_NAME=090x03   /* get debug name, returned by pointer =
*/
+#define MSM_INFO_SET_IOVA=090x04   /* set the iova, passed by value */
+#define MSM_INFO_GET_FLAGS=090x05   /* get the MSM_BO_x flags */
=20
 struct drm_msm_gem_info {
 =09__u32 handle;         /* in */
@@ -138,8 +151,13 @@ struct drm_msm_gem_info {
 #define MSM_PREP_READ        0x01
 #define MSM_PREP_WRITE       0x02
 #define MSM_PREP_NOSYNC      0x04
+#define MSM_PREP_BOOST       0x08
=20
-#define MSM_PREP_FLAGS       (MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NO=
SYNC)
+#define MSM_PREP_FLAGS       (MSM_PREP_READ | \
+=09=09=09      MSM_PREP_WRITE | \
+=09=09=09      MSM_PREP_NOSYNC | \
+=09=09=09      MSM_PREP_BOOST | \
+=09=09=09      0)
=20
 struct drm_msm_gem_cpu_prep {
 =09__u32 handle;         /* in */
@@ -168,7 +186,11 @@ struct drm_msm_gem_cpu_fini {
  */
 struct drm_msm_gem_submit_reloc {
 =09__u32 submit_offset;  /* in, offset from submit_bo */
+#ifdef __cplusplus
+=09__u32 _or;            /* in, value OR'd with result */
+#else
 =09__u32 or;             /* in, value OR'd with result */
+#endif
 =09__s32 shift;          /* in, amount of left shift (can be negative) */
 =09__u32 reloc_idx;      /* in, index of reloc_bo buffer */
 =09__u64 reloc_offset;   /* in, offset from start of reloc_bo */
@@ -209,10 +231,12 @@ struct drm_msm_gem_submit_cmd {
 #define MSM_SUBMIT_BO_READ             0x0001
 #define MSM_SUBMIT_BO_WRITE            0x0002
 #define MSM_SUBMIT_BO_DUMP             0x0004
+#define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
=20
 #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
 =09=09=09=09=09MSM_SUBMIT_BO_WRITE | \
-=09=09=09=09=09MSM_SUBMIT_BO_DUMP)
+=09=09=09=09=09MSM_SUBMIT_BO_DUMP | \
+=09=09=09=09=09MSM_SUBMIT_BO_NO_IMPLICIT)
=20
 struct drm_msm_gem_submit_bo {
 =09__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
@@ -227,6 +251,7 @@ struct drm_msm_gem_submit_bo {
 #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB =
*/
 #define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
 #define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
+#define MSM_SUBMIT_FENCE_SN_IN   0x02000000 /* userspace passes in seqno f=
ence */
 #define MSM_SUBMIT_FLAGS                ( \
 =09=09MSM_SUBMIT_NO_IMPLICIT   | \
 =09=09MSM_SUBMIT_FENCE_FD_IN   | \
@@ -234,6 +259,7 @@ struct drm_msm_gem_submit_bo {
 =09=09MSM_SUBMIT_SUDO          | \
 =09=09MSM_SUBMIT_SYNCOBJ_IN    | \
 =09=09MSM_SUBMIT_SYNCOBJ_OUT   | \
+=09=09MSM_SUBMIT_FENCE_SN_IN   | \
 =09=090)
=20
 #define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. *=
/
@@ -253,7 +279,7 @@ struct drm_msm_gem_submit_syncobj {
  */
 struct drm_msm_gem_submit {
 =09__u32 flags;          /* MSM_PIPE_x | MSM_SUBMIT_x */
-=09__u32 fence;          /* out */
+=09__u32 fence;          /* out (or in with MSM_SUBMIT_FENCE_SN_IN flag) *=
/
 =09__u32 nr_bos;         /* in, number of submit_bo's */
 =09__u32 nr_cmds;        /* in, number of submit_cmd's */
 =09__u64 bos;            /* in, ptr to array of submit_bo's */
@@ -269,6 +295,11 @@ struct drm_msm_gem_submit {
=20
 };
=20
+#define MSM_WAIT_FENCE_BOOST=090x00000001
+#define MSM_WAIT_FENCE_FLAGS=09( \
+=09=09MSM_WAIT_FENCE_BOOST | \
+=09=090)
+
 /* The normal way to synchronize with the GPU is just to CPU_PREP on
  * a buffer if you need to access it from the CPU (other cmdstream
  * submission from same or other contexts, PAGE_FLIP ioctl, etc, all
@@ -278,7 +309,7 @@ struct drm_msm_gem_submit {
  */
 struct drm_msm_wait_fence {
 =09__u32 fence;          /* in */
-=09__u32 pad;
+=09__u32 flags;          /* in, bitmask of MSM_WAIT_FENCE_x */
 =09struct drm_msm_timespec timeout;   /* in */
 =09__u32 queueid;         /* in, submitqueue id */
 };
@@ -333,9 +364,7 @@ struct drm_msm_submitqueue_query {
 };
=20
 #define DRM_MSM_GET_PARAM              0x00
-/* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
- */
 #define DRM_MSM_GEM_NEW                0x02
 #define DRM_MSM_GEM_INFO               0x03
 #define DRM_MSM_GEM_CPU_PREP           0x04
@@ -351,6 +380,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
=20
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM=
_GET_PARAM, struct drm_msm_param)
+#define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM=
_SET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM=
_GEM_NEW, struct drm_msm_gem_new)
 #define DRM_IOCTL_MSM_GEM_INFO         DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM=
_GEM_INFO, struct drm_msm_gem_info)
 #define DRM_IOCTL_MSM_GEM_CPU_PREP     DRM_IOW (DRM_COMMAND_BASE + DRM_MSM=
_GEM_CPU_PREP, struct drm_msm_gem_cpu_prep)
diff --git a/include/drm-uapi/panfrost_drm.h b/include/drm-uapi/panfrost_dr=
m.h
index 061e700dd06c..9f231d40a146 100644
--- a/include/drm-uapi/panfrost_drm.h
+++ b/include/drm-uapi/panfrost_drm.h
@@ -84,14 +84,14 @@ struct drm_panfrost_wait_bo {
 =09__s64 timeout_ns;=09/* absolute */
 };
=20
+/* Valid flags to pass to drm_panfrost_create_bo */
 #define PANFROST_BO_NOEXEC=091
 #define PANFROST_BO_HEAP=092
=20
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BO=
s.
  *
- * There are currently no values for the flags argument, but it may be
- * used in a future extension.
+ * The flags argument is a bit mask of PANFROST_BO_* flags.
  */
 struct drm_panfrost_create_bo {
 =09__u32 size;
@@ -224,6 +224,57 @@ struct drm_panfrost_madvise {
 =09__u32 retained;       /* out, whether backing store still exists */
 };
=20
+/* Definitions for coredump decoding in user space */
+#define PANFROSTDUMP_MAJOR 1
+#define PANFROSTDUMP_MINOR 0
+
+#define PANFROSTDUMP_MAGIC 0x464E4150 /* PANF */
+
+#define PANFROSTDUMP_BUF_REG 0
+#define PANFROSTDUMP_BUF_BOMAP (PANFROSTDUMP_BUF_REG + 1)
+#define PANFROSTDUMP_BUF_BO (PANFROSTDUMP_BUF_BOMAP + 1)
+#define PANFROSTDUMP_BUF_TRAILER (PANFROSTDUMP_BUF_BO + 1)
+
+/*
+ * This structure is the native endianness of the dumping machine, tools c=
an
+ * detect the endianness by looking at the value in 'magic'.
+ */
+struct panfrost_dump_object_header {
+=09__u32 magic;
+=09__u32 type;
+=09__u32 file_size;
+=09__u32 file_offset;
+
+=09union {
+=09=09struct {
+=09=09=09__u64 jc;
+=09=09=09__u32 gpu_id;
+=09=09=09__u32 major;
+=09=09=09__u32 minor;
+=09=09=09__u64 nbos;
+=09=09} reghdr;
+
+=09=09struct {
+=09=09=09__u32 valid;
+=09=09=09__u64 iova;
+=09=09=09__u32 data[2];
+=09=09} bomap;
+
+=09=09/*
+=09=09 * Force same size in case we want to expand the header
+=09=09 * with new fields and also keep it 512-byte aligned
+=09=09 */
+
+=09=09__u32 sizer[496];
+=09};
+};
+
+/* Registers object, an array of these */
+struct panfrost_dump_registers {
+=09__u32 reg;
+=09__u32 value;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/virtgpu_drm.h b/include/drm-uapi/virtgpu_drm.=
h
index b9ec26e9c646..7b158fcb02b4 100644
--- a/include/drm-uapi/virtgpu_drm.h
+++ b/include/drm-uapi/virtgpu_drm.h
@@ -47,12 +47,15 @@ extern "C" {
 #define DRM_VIRTGPU_WAIT     0x08
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
+#define DRM_VIRTGPU_CONTEXT_INIT 0x0b
=20
 #define VIRTGPU_EXECBUF_FENCE_FD_IN=090x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT=090x02
+#define VIRTGPU_EXECBUF_RING_IDX=090x04
 #define VIRTGPU_EXECBUF_FLAGS  (\
 =09=09VIRTGPU_EXECBUF_FENCE_FD_IN |\
 =09=09VIRTGPU_EXECBUF_FENCE_FD_OUT |\
+=09=09VIRTGPU_EXECBUF_RING_IDX |\
 =09=090)
=20
 struct drm_virtgpu_map {
@@ -61,6 +64,7 @@ struct drm_virtgpu_map {
 =09__u32 pad;
 };
=20
+/* fence_fd is modified on success if VIRTGPU_EXECBUF_FENCE_FD_OUT flag is=
 set. */
 struct drm_virtgpu_execbuffer {
 =09__u32 flags;
 =09__u32 size;
@@ -68,6 +72,8 @@ struct drm_virtgpu_execbuffer {
 =09__u64 bo_handles;
 =09__u32 num_bo_handles;
 =09__s32 fence_fd; /* in/out fence fd (see VIRTGPU_EXECBUF_FENCE_FD_IN/OUT=
) */
+=09__u32 ring_idx; /* command ring index (see VIRTGPU_EXECBUF_RING_IDX) */
+=09__u32 pad;
 };
=20
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
@@ -75,6 +81,8 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB =
*/
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable *=
/
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource shari=
ng  */
+#define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
+#define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capab=
ility set ids */
=20
 struct drm_virtgpu_getparam {
 =09__u64 param;
@@ -173,6 +181,29 @@ struct drm_virtgpu_resource_create_blob {
 =09__u64 blob_id;
 };
=20
+#define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
+#define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
+#define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
+struct drm_virtgpu_context_set_param {
+=09__u64 param;
+=09__u64 value;
+};
+
+struct drm_virtgpu_context_init {
+=09__u32 num_params;
+=09__u32 pad;
+
+=09/* pointer to drm_virtgpu_context_set_param array */
+=09__u64 ctx_set_params;
+};
+
+/*
+ * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is i=
n
+ * effect.  The event size is sizeof(drm_event), since there is no additio=
nal
+ * payload.
+ */
+#define VIRTGPU_EVENT_FENCE_SIGNALED 0x90000000
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 =09DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
=20
@@ -212,6 +243,10 @@ struct drm_virtgpu_resource_create_blob {
 =09DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_RESOURCE_CREATE_BLOB,=09\
 =09=09struct drm_virtgpu_resource_create_blob)
=20
+#define DRM_IOCTL_VIRTGPU_CONTEXT_INIT=09=09=09=09=09\
+=09DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,=09=09\
+=09=09struct drm_virtgpu_context_init)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/vmwgfx_drm.h b/include/drm-uapi/vmwgfx_drm.h
index 9078775feb51..26549c86a91f 100644
--- a/include/drm-uapi/vmwgfx_drm.h
+++ b/include/drm-uapi/vmwgfx_drm.h
@@ -1,6 +1,6 @@
 /*************************************************************************=
*
  *
- * Copyright =C2=A9 2009-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright =C2=A9 2009-2022 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -92,6 +92,12 @@ extern "C" {
  *
  * DRM_VMW_PARAM_SM5
  * SM5 support is enabled.
+ *
+ * DRM_VMW_PARAM_GL43
+ * SM5.1+GL4.3 support is enabled.
+ *
+ * DRM_VMW_PARAM_DEVICE_ID
+ * PCI ID of the underlying SVGA device.
  */
=20
 #define DRM_VMW_PARAM_NUM_STREAMS      0
@@ -110,6 +116,8 @@ extern "C" {
 #define DRM_VMW_PARAM_HW_CAPS2         13
 #define DRM_VMW_PARAM_SM4_1            14
 #define DRM_VMW_PARAM_SM5              15
+#define DRM_VMW_PARAM_GL43             16
+#define DRM_VMW_PARAM_DEVICE_ID        17
=20
 /**
  * enum drm_vmw_handle_type - handle type for ref ioctls
diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 0f47578c636d..af0176500d5a 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -26,55 +26,6 @@ extern "C" {
 #define DRM_I915_PERF_PROP_OA_ENGINE_CLASS=099
 #define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE=0910
=20
-/*
- * Top 4 bits of every non-engine counter are GT id.
- */
-#define __I915_PMU_GT_SHIFT (60)
-
-#define ___I915_PMU_OTHER(gt, x) \
-=09(((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
-=09((__u64)(gt) << __I915_PMU_GT_SHIFT))
-
-#define __I915_PMU_ACTUAL_FREQUENCY(gt)=09=09___I915_PMU_OTHER(gt, 0)
-#define __I915_PMU_REQUESTED_FREQUENCY(gt)=09___I915_PMU_OTHER(gt, 1)
-#define __I915_PMU_INTERRUPTS(gt)=09=09___I915_PMU_OTHER(gt, 2)
-#define __I915_PMU_RC6_RESIDENCY(gt)=09=09___I915_PMU_OTHER(gt, 3)
-#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)=09___I915_PMU_OTHER(gt, 4)
-
-#define I915_GEM_CREATE_EXT_SET_PAT 2
-
-/**
- * struct drm_i915_gem_create_ext_set_pat - The
- * I915_GEM_CREATE_EXT_SET_PAT extension.
- *
- * If this extension is provided, the specified caching policy (PAT index)=
 is
- * applied to the buffer object.
- *
- * Below is an example on how to create an object with specific caching po=
licy:
- *
- * .. code-block:: C
- *
- *=09struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
- *=09=09.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
- *=09=09.pat_index =3D 0,
- *=09};
- *=09struct drm_i915_gem_create_ext create_ext =3D {
- *=09=09.size =3D PAGE_SIZE,
- *=09=09.extensions =3D (uintptr_t)&set_pat_ext,
- *=09};
- *
- *=09int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
- *=09if (err) ...
- */
-struct drm_i915_gem_create_ext_set_pat {
-=09/** @base: Extension link. See struct i915_user_extension. */
-=09struct i915_user_extension base;
-=09/** @pat_index: PAT index to be set */
-=09__u32 pat_index;
-=09/** @rsvd: reserved for future use */
-=09__u32 rsvd;
-};
-
 #if defined(__cplusplus)
 }
 #endif
--=20
2.41.0

