Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC346EEAA
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 21:59:46 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 17:59:36 -0400
Message-Id: <20211006215936.972661-3-rodrigo.vivi@intel.com>
In-Reply-To: <20211006215936.972661-1-rodrigo.vivi@intel.com>
References: <20211006215936.972661-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] include/drm-uapi: Sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Sync to: 1e3944578b74 ("Merge tag 'amd-drm-next-5.16-2021-09-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next")

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/drm.h        |  14 +-
 include/drm-uapi/drm_fourcc.h | 115 ++++++++-
 include/drm-uapi/drm_mode.h   |  95 +++++++-
 include/drm-uapi/msm_drm.h    |  14 +-
 include/drm-uapi/tegra_drm.h  | 425 ++++++++++++++++++++++++++++++++--
 include/drm-uapi/v3d_drm.h    | 136 +++++++++++
 include/drm-uapi/vmwgfx_drm.h |  41 ++++
 7 files changed, 807 insertions(+), 33 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 398c396f..5e54c3aa 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -629,8 +629,8 @@ struct drm_gem_open {
 /**
  * DRM_CAP_VBLANK_HIGH_CRTC
  *
- * If set to 1, the kernel supports specifying a CRTC index in the high bits of
- * &drm_wait_vblank_request.type.
+ * If set to 1, the kernel supports specifying a :ref:`CRTC index<crtc_index>`
+ * in the high bits of &drm_wait_vblank_request.type.
  *
  * Starting kernel version 2.6.39, this capability is always set to 1.
  */
@@ -1044,6 +1044,16 @@ extern "C" {
 #define DRM_IOCTL_MODE_GETPROPBLOB	DRM_IOWR(0xAC, struct drm_mode_get_blob)
 #define DRM_IOCTL_MODE_GETFB		DRM_IOWR(0xAD, struct drm_mode_fb_cmd)
 #define DRM_IOCTL_MODE_ADDFB		DRM_IOWR(0xAE, struct drm_mode_fb_cmd)
+/**
+ * DRM_IOCTL_MODE_RMFB - Remove a framebuffer.
+ *
+ * This removes a framebuffer previously added via ADDFB/ADDFB2. The IOCTL
+ * argument is a framebuffer object ID.
+ *
+ * Warning: removing a framebuffer currently in-use on an enabled plane will
+ * disable that plane. The CRTC the plane is linked to may also be disabled
+ * (depending on driver capabilities).
+ */
 #define DRM_IOCTL_MODE_RMFB		DRM_IOWR(0xAF, unsigned int)
 #define DRM_IOCTL_MODE_PAGE_FLIP	DRM_IOWR(0xB0, struct drm_mode_crtc_page_flip)
 #define DRM_IOCTL_MODE_DIRTYFB		DRM_IOWR(0xB1, struct drm_mode_fb_dirty_cmd)
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index cd3ce8a8..91b6a0fd 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -373,6 +373,12 @@ extern "C" {
 
 #define DRM_FORMAT_RESERVED	      ((1ULL << 56) - 1)
 
+#define fourcc_mod_get_vendor(modifier) \
+	(((modifier) >> 56) & 0xff)
+
+#define fourcc_mod_is_vendor(modifier, vendor) \
+	(fourcc_mod_get_vendor(modifier) == DRM_FORMAT_MOD_VENDOR_## vendor)
+
 #define fourcc_mod_code(vendor, val) \
 	((((__u64)DRM_FORMAT_MOD_VENDOR_## vendor) << 56) | ((val) & 0x00ffffffffffffffULL))
 
@@ -900,9 +906,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 
 /*
  * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
- * modifiers) denote the category for modifiers. Currently we have only two
- * categories of modifiers ie AFBC and MISC. We can have a maximum of sixteen
- * different categories.
+ * modifiers) denote the category for modifiers. Currently we have three
+ * categories of modifiers ie AFBC, MISC and AFRC. We can have a maximum of
+ * sixteen different categories.
  */
 #define DRM_FORMAT_MOD_ARM_CODE(__type, __val) \
 	fourcc_mod_code(ARM, ((__u64)(__type) << 52) | ((__val) & 0x000fffffffffffffULL))
@@ -1017,6 +1023,109 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 #define AFBC_FORMAT_MOD_USM	(1ULL << 12)
 
+/*
+ * Arm Fixed-Rate Compression (AFRC) modifiers
+ *
+ * AFRC is a proprietary fixed rate image compression protocol and format,
+ * designed to provide guaranteed bandwidth and memory footprint
+ * reductions in graphics and media use-cases.
+ *
+ * AFRC buffers consist of one or more planes, with the same components
+ * and meaning as an uncompressed buffer using the same pixel format.
+ *
+ * Within each plane, the pixel/luma/chroma values are grouped into
+ * "coding unit" blocks which are individually compressed to a
+ * fixed size (in bytes). All coding units within a given plane of a buffer
+ * store the same number of values, and have the same compressed size.
+ *
+ * The coding unit size is configurable, allowing different rates of compression.
+ *
+ * The start of each AFRC buffer plane must be aligned to an alignment granule which
+ * depends on the coding unit size.
+ *
+ * Coding Unit Size   Plane Alignment
+ * ----------------   ---------------
+ * 16 bytes           1024 bytes
+ * 24 bytes           512  bytes
+ * 32 bytes           2048 bytes
+ *
+ * Coding units are grouped into paging tiles. AFRC buffer dimensions must be aligned
+ * to a multiple of the paging tile dimensions.
+ * The dimensions of each paging tile depend on whether the buffer is optimised for
+ * scanline (SCAN layout) or rotated (ROT layout) access.
+ *
+ * Layout   Paging Tile Width   Paging Tile Height
+ * ------   -----------------   ------------------
+ * SCAN     16 coding units     4 coding units
+ * ROT      8  coding units     8 coding units
+ *
+ * The dimensions of each coding unit depend on the number of components
+ * in the compressed plane and whether the buffer is optimised for
+ * scanline (SCAN layout) or rotated (ROT layout) access.
+ *
+ * Number of Components in Plane   Layout      Coding Unit Width   Coding Unit Height
+ * -----------------------------   ---------   -----------------   ------------------
+ * 1                               SCAN        16 samples          4 samples
+ * Example: 16x4 luma samples in a 'Y' plane
+ *          16x4 chroma 'V' values, in the 'V' plane of a fully-planar YUV buffer
+ * -----------------------------   ---------   -----------------   ------------------
+ * 1                               ROT         8 samples           8 samples
+ * Example: 8x8 luma samples in a 'Y' plane
+ *          8x8 chroma 'V' values, in the 'V' plane of a fully-planar YUV buffer
+ * -----------------------------   ---------   -----------------   ------------------
+ * 2                               DONT CARE   8 samples           4 samples
+ * Example: 8x4 chroma pairs in the 'UV' plane of a semi-planar YUV buffer
+ * -----------------------------   ---------   -----------------   ------------------
+ * 3                               DONT CARE   4 samples           4 samples
+ * Example: 4x4 pixels in an RGB buffer without alpha
+ * -----------------------------   ---------   -----------------   ------------------
+ * 4                               DONT CARE   4 samples           4 samples
+ * Example: 4x4 pixels in an RGB buffer with alpha
+ */
+
+#define DRM_FORMAT_MOD_ARM_TYPE_AFRC 0x02
+
+#define DRM_FORMAT_MOD_ARM_AFRC(__afrc_mode) \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_AFRC, __afrc_mode)
+
+/*
+ * AFRC coding unit size modifier.
+ *
+ * Indicates the number of bytes used to store each compressed coding unit for
+ * one or more planes in an AFRC encoded buffer. The coding unit size for chrominance
+ * is the same for both Cb and Cr, which may be stored in separate planes.
+ *
+ * AFRC_FORMAT_MOD_CU_SIZE_P0 indicates the number of bytes used to store
+ * each compressed coding unit in the first plane of the buffer. For RGBA buffers
+ * this is the only plane, while for semi-planar and fully-planar YUV buffers,
+ * this corresponds to the luma plane.
+ *
+ * AFRC_FORMAT_MOD_CU_SIZE_P12 indicates the number of bytes used to store
+ * each compressed coding unit in the second and third planes in the buffer.
+ * For semi-planar and fully-planar YUV buffers, this corresponds to the chroma plane(s).
+ *
+ * For single-plane buffers, AFRC_FORMAT_MOD_CU_SIZE_P0 must be specified
+ * and AFRC_FORMAT_MOD_CU_SIZE_P12 must be zero.
+ * For semi-planar and fully-planar buffers, both AFRC_FORMAT_MOD_CU_SIZE_P0 and
+ * AFRC_FORMAT_MOD_CU_SIZE_P12 must be specified.
+ */
+#define AFRC_FORMAT_MOD_CU_SIZE_MASK 0xf
+#define AFRC_FORMAT_MOD_CU_SIZE_16 (1ULL)
+#define AFRC_FORMAT_MOD_CU_SIZE_24 (2ULL)
+#define AFRC_FORMAT_MOD_CU_SIZE_32 (3ULL)
+
+#define AFRC_FORMAT_MOD_CU_SIZE_P0(__afrc_cu_size) (__afrc_cu_size)
+#define AFRC_FORMAT_MOD_CU_SIZE_P12(__afrc_cu_size) ((__afrc_cu_size) << 4)
+
+/*
+ * AFRC scanline memory layout.
+ *
+ * Indicates if the buffer uses the scanline-optimised layout
+ * for an AFRC encoded buffer, otherwise, it uses the rotation-optimised layout.
+ * The memory layout is the same for all planes.
+ */
+#define AFRC_FORMAT_MOD_LAYOUT_SCAN (1ULL << 8)
+
 /*
  * Arm 16x16 Block U-Interleaved modifier
  *
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 9b6722d4..e4a2570a 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -312,16 +312,48 @@ struct drm_mode_set_plane {
 	__u32 src_w;
 };
 
+/**
+ * struct drm_mode_get_plane - Get plane metadata.
+ *
+ * Userspace can perform a GETPLANE ioctl to retrieve information about a
+ * plane.
+ *
+ * To retrieve the number of formats supported, set @count_format_types to zero
+ * and call the ioctl. @count_format_types will be updated with the value.
+ *
+ * To retrieve these formats, allocate an array with the memory needed to store
+ * @count_format_types formats. Point @format_type_ptr to this array and call
+ * the ioctl again (with @count_format_types still set to the value returned in
+ * the first ioctl call).
+ */
 struct drm_mode_get_plane {
+	/**
+	 * @plane_id: Object ID of the plane whose information should be
+	 * retrieved. Set by caller.
+	 */
 	__u32 plane_id;
 
+	/** @crtc_id: Object ID of the current CRTC. */
 	__u32 crtc_id;
+	/** @fb_id: Object ID of the current fb. */
 	__u32 fb_id;
 
+	/**
+	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
+	 * are created and they receive an index, which corresponds to their
+	 * position in the bitmask. Bit N corresponds to
+	 * :ref:`CRTC index<crtc_index>` N.
+	 */
 	__u32 possible_crtcs;
+	/** @gamma_size: Never used. */
 	__u32 gamma_size;
 
+	/** @count_format_types: Number of formats. */
 	__u32 count_format_types;
+	/**
+	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
+	 * supported by the plane. These formats do not require modifiers.
+	 */
 	__u64 format_type_ptr;
 };
 
@@ -509,22 +541,74 @@ struct drm_mode_get_connector {
  */
 #define DRM_MODE_PROP_ATOMIC        0x80000000
 
+/**
+ * struct drm_mode_property_enum - Description for an enum/bitfield entry.
+ * @value: numeric value for this enum entry.
+ * @name: symbolic name for this enum entry.
+ *
+ * See struct drm_property_enum for details.
+ */
 struct drm_mode_property_enum {
 	__u64 value;
 	char name[DRM_PROP_NAME_LEN];
 };
 
+/**
+ * struct drm_mode_get_property - Get property metadata.
+ *
+ * User-space can perform a GETPROPERTY ioctl to retrieve information about a
+ * property. The same property may be attached to multiple objects, see
+ * "Modeset Base Object Abstraction".
+ *
+ * The meaning of the @values_ptr field changes depending on the property type.
+ * See &drm_property.flags for more details.
+ *
+ * The @enum_blob_ptr and @count_enum_blobs fields are only meaningful when the
+ * property has the type &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK. For
+ * backwards compatibility, the kernel will always set @count_enum_blobs to
+ * zero when the property has the type &DRM_MODE_PROP_BLOB. User-space must
+ * ignore these two fields if the property has a different type.
+ *
+ * User-space is expected to retrieve values and enums by performing this ioctl
+ * at least twice: the first time to retrieve the number of elements, the
+ * second time to retrieve the elements themselves.
+ *
+ * To retrieve the number of elements, set @count_values and @count_enum_blobs
+ * to zero, then call the ioctl. @count_values will be updated with the number
+ * of elements. If the property has the type &DRM_MODE_PROP_ENUM or
+ * &DRM_MODE_PROP_BITMASK, @count_enum_blobs will be updated as well.
+ *
+ * To retrieve the elements themselves, allocate an array for @values_ptr and
+ * set @count_values to its capacity. If the property has the type
+ * &DRM_MODE_PROP_ENUM or &DRM_MODE_PROP_BITMASK, allocate an array for
+ * @enum_blob_ptr and set @count_enum_blobs to its capacity. Calling the ioctl
+ * again will fill the arrays.
+ */
 struct drm_mode_get_property {
-	__u64 values_ptr; /* values and blob lengths */
-	__u64 enum_blob_ptr; /* enum and blob id ptrs */
+	/** @values_ptr: Pointer to a ``__u64`` array. */
+	__u64 values_ptr;
+	/** @enum_blob_ptr: Pointer to a struct drm_mode_property_enum array. */
+	__u64 enum_blob_ptr;
 
+	/**
+	 * @prop_id: Object ID of the property which should be retrieved. Set
+	 * by the caller.
+	 */
 	__u32 prop_id;
+	/**
+	 * @flags: ``DRM_MODE_PROP_*`` bitfield. See &drm_property.flags for
+	 * a definition of the flags.
+	 */
 	__u32 flags;
+	/**
+	 * @name: Symbolic property name. User-space should use this field to
+	 * recognize properties.
+	 */
 	char name[DRM_PROP_NAME_LEN];
 
+	/** @count_values: Number of elements in @values_ptr. */
 	__u32 count_values;
-	/* This is only used to count enum values, not blobs. The _blobs is
-	 * simply because of a historical reason, i.e. backwards compat. */
+	/** @count_enum_blobs: Number of elements in @enum_blob_ptr. */
 	__u32 count_enum_blobs;
 };
 
@@ -1026,6 +1110,9 @@ struct drm_mode_destroy_blob {
  * struct drm_mode_create_lease - Create lease
  *
  * Lease mode resources, creating another drm_master.
+ *
+ * The @object_ids array must reference at least one CRTC, one connector and
+ * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled.
  */
 struct drm_mode_create_lease {
 	/** @object_ids: Pointer to array of object ids (__u32) */
diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
index f0758510..6b8fffc2 100644
--- a/include/drm-uapi/msm_drm.h
+++ b/include/drm-uapi/msm_drm.h
@@ -73,11 +73,19 @@ struct drm_msm_timespec {
 #define MSM_PARAM_MAX_FREQ   0x04
 #define MSM_PARAM_TIMESTAMP  0x05
 #define MSM_PARAM_GMEM_BASE  0x06
-#define MSM_PARAM_NR_RINGS   0x07
+#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
 #define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
 #define MSM_PARAM_FAULTS     0x09
 #define MSM_PARAM_SUSPENDS   0x0a
 
+/* For backwards compat.  The original support for preemption was based on
+ * a single ring per priority level so # of priority levels equals the #
+ * of rings.  With drm/scheduler providing additional levels of priority,
+ * the number of priorities is greater than the # of rings.  The param is
+ * renamed to better reflect this.
+ */
+#define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
+
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
 	__u32 param;          /* in, MSM_PARAM_x */
@@ -304,6 +312,10 @@ struct drm_msm_gem_madvise {
 
 #define MSM_SUBMITQUEUE_FLAGS (0)
 
+/*
+ * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
+ * a lower numeric value is higher priority.
+ */
 struct drm_msm_submitqueue {
 	__u32 flags;   /* in, MSM_SUBMITQUEUE_x */
 	__u32 prio;    /* in, Priority level */
diff --git a/include/drm-uapi/tegra_drm.h b/include/drm-uapi/tegra_drm.h
index 6c07919c..bb1adff0 100644
--- a/include/drm-uapi/tegra_drm.h
+++ b/include/drm-uapi/tegra_drm.h
@@ -1,24 +1,5 @@
-/*
- * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
+/* SPDX-License-Identifier: MIT */
+/* Copyright (c) 2012-2020 NVIDIA Corporation */
 
 #ifndef _TEGRA_DRM_H_
 #define _TEGRA_DRM_H_
@@ -29,6 +10,8 @@
 extern "C" {
 #endif
 
+/* Tegra DRM legacy UAPI. Only enabled with STAGING */
+
 #define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
 #define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
 
@@ -649,8 +632,8 @@ struct drm_tegra_gem_get_flags {
 #define DRM_TEGRA_SYNCPT_READ		0x02
 #define DRM_TEGRA_SYNCPT_INCR		0x03
 #define DRM_TEGRA_SYNCPT_WAIT		0x04
-#define DRM_TEGRA_OPEN_CHANNEL		0x05
-#define DRM_TEGRA_CLOSE_CHANNEL		0x06
+#define DRM_TEGRA_OPEN_CHANNEL	        0x05
+#define DRM_TEGRA_CLOSE_CHANNEL	        0x06
 #define DRM_TEGRA_GET_SYNCPT		0x07
 #define DRM_TEGRA_SUBMIT		0x08
 #define DRM_TEGRA_GET_SYNCPT_BASE	0x09
@@ -674,6 +657,402 @@ struct drm_tegra_gem_get_flags {
 #define DRM_IOCTL_TEGRA_GEM_SET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_SET_FLAGS, struct drm_tegra_gem_set_flags)
 #define DRM_IOCTL_TEGRA_GEM_GET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_GET_FLAGS, struct drm_tegra_gem_get_flags)
 
+/* New Tegra DRM UAPI */
+
+/*
+ * Reported by the driver in the `capabilities` field.
+ *
+ * DRM_TEGRA_CHANNEL_CAP_CACHE_COHERENT: If set, the engine is cache coherent
+ * with regard to the system memory.
+ */
+#define DRM_TEGRA_CHANNEL_CAP_CACHE_COHERENT (1 << 0)
+
+struct drm_tegra_channel_open {
+	/**
+	 * @host1x_class: [in]
+	 *
+	 * Host1x class of the engine that will be programmed using this
+	 * channel.
+	 */
+	__u32 host1x_class;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @context: [out]
+	 *
+	 * Opaque identifier corresponding to the opened channel.
+	 */
+	__u32 context;
+
+	/**
+	 * @version: [out]
+	 *
+	 * Version of the engine hardware. This can be used by userspace
+	 * to determine how the engine needs to be programmed.
+	 */
+	__u32 version;
+
+	/**
+	 * @capabilities: [out]
+	 *
+	 * Flags describing the hardware capabilities.
+	 */
+	__u32 capabilities;
+	__u32 padding;
+};
+
+struct drm_tegra_channel_close {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to close.
+	 */
+	__u32 context;
+	__u32 padding;
+};
+
+/*
+ * Mapping flags that can be used to influence how the mapping is created.
+ *
+ * DRM_TEGRA_CHANNEL_MAP_READ: create mapping that allows HW read access
+ * DRM_TEGRA_CHANNEL_MAP_WRITE: create mapping that allows HW write access
+ */
+#define DRM_TEGRA_CHANNEL_MAP_READ  (1 << 0)
+#define DRM_TEGRA_CHANNEL_MAP_WRITE (1 << 1)
+#define DRM_TEGRA_CHANNEL_MAP_READ_WRITE (DRM_TEGRA_CHANNEL_MAP_READ | \
+					  DRM_TEGRA_CHANNEL_MAP_WRITE)
+
+struct drm_tegra_channel_map {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to which make memory available for.
+	 */
+	__u32 context;
+
+	/**
+	 * @handle: [in]
+	 *
+	 * GEM handle of the memory to map.
+	 */
+	__u32 handle;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @mapping: [out]
+	 *
+	 * Identifier corresponding to the mapping, to be used for
+	 * relocations or unmapping later.
+	 */
+	__u32 mapping;
+};
+
+struct drm_tegra_channel_unmap {
+	/**
+	 * @context: [in]
+	 *
+	 * Channel identifier of the channel to unmap memory from.
+	 */
+	__u32 context;
+
+	/**
+	 * @mapping: [in]
+	 *
+	 * Mapping identifier of the memory mapping to unmap.
+	 */
+	__u32 mapping;
+};
+
+/* Submission */
+
+/**
+ * Specify that bit 39 of the patched-in address should be set to switch
+ * swizzling between Tegra and non-Tegra sector layout on systems that store
+ * surfaces in system memory in non-Tegra sector layout.
+ */
+#define DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT (1 << 0)
+
+struct drm_tegra_submit_buf {
+	/**
+	 * @mapping: [in]
+	 *
+	 * Identifier of the mapping to use in the submission.
+	 */
+	__u32 mapping;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * Information for relocation patching.
+	 */
+	struct {
+		/**
+		 * @target_offset: [in]
+		 *
+		 * Offset from the start of the mapping of the data whose
+		 * address is to be patched into the gather.
+		 */
+		__u64 target_offset;
+
+		/**
+		 * @gather_offset_words: [in]
+		 *
+		 * Offset in words from the start of the gather data to
+		 * where the address should be patched into.
+		 */
+		__u32 gather_offset_words;
+
+		/**
+		 * @shift: [in]
+		 *
+		 * Number of bits the address should be shifted right before
+		 * patching in.
+		 */
+		__u32 shift;
+	} reloc;
+};
+
+/**
+ * Execute `words` words of Host1x opcodes specified in the `gather_data_ptr`
+ * buffer. Each GATHER_UPTR command uses successive words from the buffer.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
+/**
+ * Wait for a syncpoint to reach a value before continuing with further
+ * commands.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
+/**
+ * Wait for a syncpoint to reach a value before continuing with further
+ * commands. The threshold is calculated relative to the start of the job.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT_RELATIVE	2
+
+struct drm_tegra_submit_cmd_gather_uptr {
+	__u32 words;
+	__u32 reserved[3];
+};
+
+struct drm_tegra_submit_cmd_wait_syncpt {
+	__u32 id;
+	__u32 value;
+	__u32 reserved[2];
+};
+
+struct drm_tegra_submit_cmd {
+	/**
+	 * @type: [in]
+	 *
+	 * Command type to execute. One of the DRM_TEGRA_SUBMIT_CMD*
+	 * defines.
+	 */
+	__u32 type;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	union {
+		struct drm_tegra_submit_cmd_gather_uptr gather_uptr;
+		struct drm_tegra_submit_cmd_wait_syncpt wait_syncpt;
+		__u32 reserved[4];
+	};
+};
+
+struct drm_tegra_submit_syncpt {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of the syncpoint that the job will increment.
+	 */
+	__u32 id;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @increments: [in]
+	 *
+	 * Number of times the job will increment this syncpoint.
+	 */
+	__u32 increments;
+
+	/**
+	 * @value: [out]
+	 *
+	 * Value the syncpoint will have once the job has completed all
+	 * its specified syncpoint increments.
+	 *
+	 * Note that the kernel may increment the syncpoint before or after
+	 * the job. These increments are not reflected in this field.
+	 *
+	 * If the job hangs or times out, not all of the increments may
+	 * get executed.
+	 */
+	__u32 value;
+};
+
+struct drm_tegra_channel_submit {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to submit this job to.
+	 */
+	__u32 context;
+
+	/**
+	 * @num_bufs: [in]
+	 *
+	 * Number of elements in the `bufs_ptr` array.
+	 */
+	__u32 num_bufs;
+
+	/**
+	 * @num_cmds: [in]
+	 *
+	 * Number of elements in the `cmds_ptr` array.
+	 */
+	__u32 num_cmds;
+
+	/**
+	 * @gather_data_words: [in]
+	 *
+	 * Number of 32-bit words in the `gather_data_ptr` array.
+	 */
+	__u32 gather_data_words;
+
+	/**
+	 * @bufs_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_buf structures.
+	 */
+	__u64 bufs_ptr;
+
+	/**
+	 * @cmds_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_cmd structures.
+	 */
+	__u64 cmds_ptr;
+
+	/**
+	 * @gather_data_ptr: [in]
+	 *
+	 * Pointer to an array of Host1x opcodes to be used by GATHER_UPTR
+	 * commands.
+	 */
+	__u64 gather_data_ptr;
+
+	/**
+	 * @syncobj_in: [in]
+	 *
+	 * Handle for DRM syncobj that will be waited before submission.
+	 * Ignored if zero.
+	 */
+	__u32 syncobj_in;
+
+	/**
+	 * @syncobj_out: [in]
+	 *
+	 * Handle for DRM syncobj that will have its fence replaced with
+	 * the job's completion fence. Ignored if zero.
+	 */
+	__u32 syncobj_out;
+
+	/**
+	 * @syncpt_incr: [in,out]
+	 *
+	 * Information about the syncpoint the job will increment.
+	 */
+	struct drm_tegra_submit_syncpt syncpt;
+};
+
+struct drm_tegra_syncpoint_allocate {
+	/**
+	 * @id: [out]
+	 *
+	 * ID of allocated syncpoint.
+	 */
+	__u32 id;
+	__u32 padding;
+};
+
+struct drm_tegra_syncpoint_free {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of syncpoint to free.
+	 */
+	__u32 id;
+	__u32 padding;
+};
+
+struct drm_tegra_syncpoint_wait {
+	/**
+	 * @timeout: [in]
+	 *
+	 * Absolute timestamp at which the wait will time out.
+	 */
+	__s64 timeout_ns;
+
+	/**
+	 * @id: [in]
+	 *
+	 * ID of syncpoint to wait on.
+	 */
+	__u32 id;
+
+	/**
+	 * @threshold: [in]
+	 *
+	 * Threshold to wait for.
+	 */
+	__u32 threshold;
+
+	/**
+	 * @value: [out]
+	 *
+	 * Value of the syncpoint upon wait completion.
+	 */
+	__u32 value;
+
+	__u32 padding;
+};
+
+#define DRM_IOCTL_TEGRA_CHANNEL_OPEN DRM_IOWR(DRM_COMMAND_BASE + 0x10, struct drm_tegra_channel_open)
+#define DRM_IOCTL_TEGRA_CHANNEL_CLOSE DRM_IOWR(DRM_COMMAND_BASE + 0x11, struct drm_tegra_channel_close)
+#define DRM_IOCTL_TEGRA_CHANNEL_MAP DRM_IOWR(DRM_COMMAND_BASE + 0x12, struct drm_tegra_channel_map)
+#define DRM_IOCTL_TEGRA_CHANNEL_UNMAP DRM_IOWR(DRM_COMMAND_BASE + 0x13, struct drm_tegra_channel_unmap)
+#define DRM_IOCTL_TEGRA_CHANNEL_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + 0x14, struct drm_tegra_channel_submit)
+
+#define DRM_IOCTL_TEGRA_SYNCPOINT_ALLOCATE DRM_IOWR(DRM_COMMAND_BASE + 0x20, struct drm_tegra_syncpoint_allocate)
+#define DRM_IOCTL_TEGRA_SYNCPOINT_FREE DRM_IOWR(DRM_COMMAND_BASE + 0x21, struct drm_tegra_syncpoint_free)
+#define DRM_IOCTL_TEGRA_SYNCPOINT_WAIT DRM_IOWR(DRM_COMMAND_BASE + 0x22, struct drm_tegra_syncpoint_wait)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/v3d_drm.h b/include/drm-uapi/v3d_drm.h
index 1ce746e2..4104f22f 100644
--- a/include/drm-uapi/v3d_drm.h
+++ b/include/drm-uapi/v3d_drm.h
@@ -38,6 +38,9 @@ extern "C" {
 #define DRM_V3D_GET_BO_OFFSET                     0x05
 #define DRM_V3D_SUBMIT_TFU                        0x06
 #define DRM_V3D_SUBMIT_CSD                        0x07
+#define DRM_V3D_PERFMON_CREATE                    0x08
+#define DRM_V3D_PERFMON_DESTROY                   0x09
+#define DRM_V3D_PERFMON_GET_VALUES                0x0a
 
 #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
 #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
@@ -47,6 +50,12 @@ extern "C" {
 #define DRM_IOCTL_V3D_GET_BO_OFFSET       DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_GET_BO_OFFSET, struct drm_v3d_get_bo_offset)
 #define DRM_IOCTL_V3D_SUBMIT_TFU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_TFU, struct drm_v3d_submit_tfu)
 #define DRM_IOCTL_V3D_SUBMIT_CSD          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CSD, struct drm_v3d_submit_csd)
+#define DRM_IOCTL_V3D_PERFMON_CREATE      DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_CREATE, \
+						   struct drm_v3d_perfmon_create)
+#define DRM_IOCTL_V3D_PERFMON_DESTROY     DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_DESTROY, \
+						   struct drm_v3d_perfmon_destroy)
+#define DRM_IOCTL_V3D_PERFMON_GET_VALUES  DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_VALUES, \
+						   struct drm_v3d_perfmon_get_values)
 
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 
@@ -127,6 +136,11 @@ struct drm_v3d_submit_cl {
 	__u32 bo_handle_count;
 
 	__u32 flags;
+
+	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
+	__u32 perfmon_id;
+
+	__u32 pad;
 };
 
 /**
@@ -195,6 +209,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_TFU,
 	DRM_V3D_PARAM_SUPPORTS_CSD,
 	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
+	DRM_V3D_PARAM_SUPPORTS_PERFMON,
 };
 
 struct drm_v3d_get_param {
@@ -258,6 +273,127 @@ struct drm_v3d_submit_csd {
 	__u32 in_sync;
 	/* Sync object to signal when the CSD job is done. */
 	__u32 out_sync;
+
+	/* ID of the perfmon to attach to this job. 0 means no perfmon. */
+	__u32 perfmon_id;
+};
+
+enum {
+	V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS,
+	V3D_PERFCNT_FEP_VALID_PRIMS,
+	V3D_PERFCNT_FEP_EZ_NFCLIP_QUADS,
+	V3D_PERFCNT_FEP_VALID_QUADS,
+	V3D_PERFCNT_TLB_QUADS_STENCIL_FAIL,
+	V3D_PERFCNT_TLB_QUADS_STENCILZ_FAIL,
+	V3D_PERFCNT_TLB_QUADS_STENCILZ_PASS,
+	V3D_PERFCNT_TLB_QUADS_ZERO_COV,
+	V3D_PERFCNT_TLB_QUADS_NONZERO_COV,
+	V3D_PERFCNT_TLB_QUADS_WRITTEN,
+	V3D_PERFCNT_PTB_PRIM_VIEWPOINT_DISCARD,
+	V3D_PERFCNT_PTB_PRIM_CLIP,
+	V3D_PERFCNT_PTB_PRIM_REV,
+	V3D_PERFCNT_QPU_IDLE_CYCLES,
+	V3D_PERFCNT_QPU_ACTIVE_CYCLES_VERTEX_COORD_USER,
+	V3D_PERFCNT_QPU_ACTIVE_CYCLES_FRAG,
+	V3D_PERFCNT_QPU_CYCLES_VALID_INSTR,
+	V3D_PERFCNT_QPU_CYCLES_TMU_STALL,
+	V3D_PERFCNT_QPU_CYCLES_SCOREBOARD_STALL,
+	V3D_PERFCNT_QPU_CYCLES_VARYINGS_STALL,
+	V3D_PERFCNT_QPU_IC_HIT,
+	V3D_PERFCNT_QPU_IC_MISS,
+	V3D_PERFCNT_QPU_UC_HIT,
+	V3D_PERFCNT_QPU_UC_MISS,
+	V3D_PERFCNT_TMU_TCACHE_ACCESS,
+	V3D_PERFCNT_TMU_TCACHE_MISS,
+	V3D_PERFCNT_VPM_VDW_STALL,
+	V3D_PERFCNT_VPM_VCD_STALL,
+	V3D_PERFCNT_BIN_ACTIVE,
+	V3D_PERFCNT_RDR_ACTIVE,
+	V3D_PERFCNT_L2T_HITS,
+	V3D_PERFCNT_L2T_MISSES,
+	V3D_PERFCNT_CYCLE_COUNT,
+	V3D_PERFCNT_QPU_CYCLES_STALLED_VERTEX_COORD_USER,
+	V3D_PERFCNT_QPU_CYCLES_STALLED_FRAGMENT,
+	V3D_PERFCNT_PTB_PRIMS_BINNED,
+	V3D_PERFCNT_AXI_WRITES_WATCH_0,
+	V3D_PERFCNT_AXI_READS_WATCH_0,
+	V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_0,
+	V3D_PERFCNT_AXI_READ_STALLS_WATCH_0,
+	V3D_PERFCNT_AXI_WRITE_BYTES_WATCH_0,
+	V3D_PERFCNT_AXI_READ_BYTES_WATCH_0,
+	V3D_PERFCNT_AXI_WRITES_WATCH_1,
+	V3D_PERFCNT_AXI_READS_WATCH_1,
+	V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_1,
+	V3D_PERFCNT_AXI_READ_STALLS_WATCH_1,
+	V3D_PERFCNT_AXI_WRITE_BYTES_WATCH_1,
+	V3D_PERFCNT_AXI_READ_BYTES_WATCH_1,
+	V3D_PERFCNT_TLB_PARTIAL_QUADS,
+	V3D_PERFCNT_TMU_CONFIG_ACCESSES,
+	V3D_PERFCNT_L2T_NO_ID_STALL,
+	V3D_PERFCNT_L2T_COM_QUE_STALL,
+	V3D_PERFCNT_L2T_TMU_WRITES,
+	V3D_PERFCNT_TMU_ACTIVE_CYCLES,
+	V3D_PERFCNT_TMU_STALLED_CYCLES,
+	V3D_PERFCNT_CLE_ACTIVE,
+	V3D_PERFCNT_L2T_TMU_READS,
+	V3D_PERFCNT_L2T_CLE_READS,
+	V3D_PERFCNT_L2T_VCD_READS,
+	V3D_PERFCNT_L2T_TMUCFG_READS,
+	V3D_PERFCNT_L2T_SLC0_READS,
+	V3D_PERFCNT_L2T_SLC1_READS,
+	V3D_PERFCNT_L2T_SLC2_READS,
+	V3D_PERFCNT_L2T_TMU_W_MISSES,
+	V3D_PERFCNT_L2T_TMU_R_MISSES,
+	V3D_PERFCNT_L2T_CLE_MISSES,
+	V3D_PERFCNT_L2T_VCD_MISSES,
+	V3D_PERFCNT_L2T_TMUCFG_MISSES,
+	V3D_PERFCNT_L2T_SLC0_MISSES,
+	V3D_PERFCNT_L2T_SLC1_MISSES,
+	V3D_PERFCNT_L2T_SLC2_MISSES,
+	V3D_PERFCNT_CORE_MEM_WRITES,
+	V3D_PERFCNT_L2T_MEM_WRITES,
+	V3D_PERFCNT_PTB_MEM_WRITES,
+	V3D_PERFCNT_TLB_MEM_WRITES,
+	V3D_PERFCNT_CORE_MEM_READS,
+	V3D_PERFCNT_L2T_MEM_READS,
+	V3D_PERFCNT_PTB_MEM_READS,
+	V3D_PERFCNT_PSE_MEM_READS,
+	V3D_PERFCNT_TLB_MEM_READS,
+	V3D_PERFCNT_GMP_MEM_READS,
+	V3D_PERFCNT_PTB_W_MEM_WORDS,
+	V3D_PERFCNT_TLB_W_MEM_WORDS,
+	V3D_PERFCNT_PSE_R_MEM_WORDS,
+	V3D_PERFCNT_TLB_R_MEM_WORDS,
+	V3D_PERFCNT_TMU_MRU_HITS,
+	V3D_PERFCNT_COMPUTE_ACTIVE,
+	V3D_PERFCNT_NUM,
+};
+
+#define DRM_V3D_MAX_PERF_COUNTERS                 32
+
+struct drm_v3d_perfmon_create {
+	__u32 id;
+	__u32 ncounters;
+	__u8 counters[DRM_V3D_MAX_PERF_COUNTERS];
+};
+
+struct drm_v3d_perfmon_destroy {
+	__u32 id;
+};
+
+/*
+ * Returns the values of the performance counters tracked by this
+ * perfmon (as an array of ncounters u64 values).
+ *
+ * No implicit synchronization is performed, so the user has to
+ * guarantee that any jobs using this perfmon have already been
+ * completed  (probably by blocking on the seqno returned by the
+ * last exec that used the perfmon).
+ */
+struct drm_v3d_perfmon_get_values {
+	__u32 id;
+	__u32 pad;
+	__u64 values_ptr;
 };
 
 #if defined(__cplusplus)
diff --git a/include/drm-uapi/vmwgfx_drm.h b/include/drm-uapi/vmwgfx_drm.h
index 02e91750..9078775f 100644
--- a/include/drm-uapi/vmwgfx_drm.h
+++ b/include/drm-uapi/vmwgfx_drm.h
@@ -72,6 +72,9 @@ extern "C" {
 #define DRM_VMW_GB_SURFACE_CREATE_EXT   27
 #define DRM_VMW_GB_SURFACE_REF_EXT      28
 #define DRM_VMW_MSG                     29
+#define DRM_VMW_MKSSTAT_RESET           30
+#define DRM_VMW_MKSSTAT_ADD             31
+#define DRM_VMW_MKSSTAT_REMOVE          32
 
 /*************************************************************************/
 /**
@@ -1236,6 +1239,44 @@ struct drm_vmw_msg_arg {
 	__u32 receive_len;
 };
 
+/**
+ * struct drm_vmw_mksstat_add_arg
+ *
+ * @stat: Pointer to user-space stat-counters array, page-aligned.
+ * @info: Pointer to user-space counter-infos array, page-aligned.
+ * @strs: Pointer to user-space stat strings, page-aligned.
+ * @stat_len: Length in bytes of stat-counters array.
+ * @info_len: Length in bytes of counter-infos array.
+ * @strs_len: Length in bytes of the stat strings, terminators included.
+ * @description: Pointer to instance descriptor string; will be truncated
+ *               to MKS_GUEST_STAT_INSTANCE_DESC_LENGTH chars.
+ * @id: Output identifier of the produced record; -1 if error.
+ *
+ * Argument to the DRM_VMW_MKSSTAT_ADD ioctl.
+ */
+struct drm_vmw_mksstat_add_arg {
+	__u64 stat;
+	__u64 info;
+	__u64 strs;
+	__u64 stat_len;
+	__u64 info_len;
+	__u64 strs_len;
+	__u64 description;
+	__u64 id;
+};
+
+/**
+ * struct drm_vmw_mksstat_remove_arg
+ *
+ * @id: Identifier of the record being disposed, originally obtained through
+ *      DRM_VMW_MKSSTAT_ADD ioctl.
+ *
+ * Argument to the DRM_VMW_MKSSTAT_REMOVE ioctl.
+ */
+struct drm_vmw_mksstat_remove_arg {
+	__u64 id;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1
