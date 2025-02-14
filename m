Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFFDC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 12:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D051110E2B7;
	Fri, 14 Feb 2025 12:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdVDA6SA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A6810E2B7
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739534641; x=1771070641;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+VaghXFpiNMxscwkoyRb1Gl+wiu99FjuSqvobsMxj6E=;
 b=gdVDA6SAxc0wLzqY/PzPnt6N62zHSO7QjEeWxG+9NKorJ5i7RbMNJfQQ
 VPsVcMm9j9WMXz70PTlmkzvJEVFfSuFHtXJ6Xl+yUKgrbWlGwcOgfXciT
 xO4keQsg0OTIvsBub1WeCEUQXYF9taBEBLO/vPqmeRPesXse648JHw/OG
 EPDeiLAkLZpwZPMyz1wC7P4rmtNA4faJ3vSxwpY9JddKAzhjMA1++S7VS
 6cjDQDOJc3tuSXTOu2gp2zooXXTZL7Rn8+b9GpcSw3/PkT4AsFvS51M3z
 xIEQrekB/GvAVP215N94MCy1reQAXt7HSvz0FsgVAXb6hMwAahOo3PVaS w==;
X-CSE-ConnectionGUID: NtZm2hA8RYGkpr4XT1YCtg==
X-CSE-MsgGUID: UdnYdLxFToaZOaGQCOIQcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44209117"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="44209117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 04:04:00 -0800
X-CSE-ConnectionGUID: zflscg96T6q+r0fIXrlUVQ==
X-CSE-MsgGUID: sqEYDDzWT3GRhNI5vm2QMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113419208"
Received: from dut7077atsm.jf.intel.com ([10.75.201.71])
 by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2025 04:04:00 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_multi_tile: Multi-Tile support in IGT
Date: Fri, 14 Feb 2025 12:03:36 +0000
Message-Id: <20250214120336.194806-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Nishit Sharma <nishit.sharma@intel.com>

Added functionality to check Multi-Tile available in system or not. Belonging to each Tile%d
GT%d gathered. Checked GT%d belongs to which tile%d in multi-tile/single-tile platforms.
Added functionality to check if any tile%d not provided by driver or missed.
E.g.tile available in platforms in order tile0, tile1...tileX in serial order, If
tile1 tile2 tile4...tileX populated than will get Warning tile3 not available.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 include/drm-uapi/xe_drm.h   | 169 ++++++++++++--
 lib/igt_sysfs.c             |   3 +-
 lib/xe/xe_query.h           |  50 ++++-
 tests/intel/xe_multi_tile.c | 433 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 5 files changed, 621 insertions(+), 35 deletions(-)
 create mode 100644 tests/intel/xe_multi_tile.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 56163eb91..8b0869ce2 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_DRM_H_
-#define _XE_DRM_H_
+#ifndef _UAPI_XE_DRM_H_
+#define _UAPI_XE_DRM_H_
 
 #include "drm.h"
 
@@ -118,6 +118,12 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 
+enum xe_gt_type {
+        XE_GT_TYPE_UNINITIALIZED,
+        XE_GT_TYPE_MAIN,
+        XE_GT_TYPE_MEDIA,
+};
+
 /**
  * DOC: Xe IOCTL Extensions
  *
@@ -227,6 +233,8 @@ struct drm_xe_ext_set_property {
  *  - %DRM_XE_ENGINE_CLASS_VM_BIND - Kernel only classes (not actual
  *    hardware engine class). Used for creating ordered queues of VM
  *    bind operations.
+ *  - %DRM_XE_ENGINE_CLASS_EXT_DECODE - external decoder class
+ *  - %DRM_XE_ENGINE_CLASS_EXT_ENCODE - external encoder class
  */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
@@ -235,6 +243,8 @@ struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
 #define DRM_XE_ENGINE_CLASS_COMPUTE		4
 #define DRM_XE_ENGINE_CLASS_VM_BIND		5
+#define DRM_XE_ENGINE_CLASS_EXT_DECODE		6
+#define DRM_XE_ENGINE_CLASS_EXT_ENCODE		7
 	/** @engine_class: engine class id */
 	__u16 engine_class;
 	/** @engine_instance: engine instance id */
@@ -266,8 +276,8 @@ struct drm_xe_engine {
 struct drm_xe_query_engines {
 	/** @num_engines: number of engines returned in @engines */
 	__u32 num_engines;
-	/** @pad: MBZ */
-	__u32 pad;
+	/** @num_ext_engines: num_ext_engines: number of engines returned at the end of @engines */
+	__u32 num_ext_engines;
 	/** @engines: The returned engines for this device */
 	struct drm_xe_engine engines[];
 };
@@ -398,6 +408,7 @@ struct drm_xe_query_mem_regions {
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
+ *  - %DRM_XE_QUERY_CONFIG_CXL_DEV_TYPE - CXL device type, 0 means CXL not supported
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
@@ -412,10 +423,96 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
+#define DRM_XE_QUERY_CONFIG_CXL_DEV_TYPE		5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
 
+/**
+ * struct xe_gt - A "Graphics Technology" unit of the GPU
+ *
+ * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
+ * for implementing the graphics, compute, and/or media IP.
+ *
+ */
+struct xe_gt {
+	/** @tile: Backpointer to GT's tile */
+	struct drm_xe_tile *tile;
+
+	/** @info: GT info */
+	struct {
+		/** @info.type: type of GT */
+		enum xe_gt_type type;
+		/** @info.id: Unique ID of this GT within the PCI Device */
+		__u8 id;
+
+		/**
+		 * @gt_count: Number of GT/s available in tile
+		 * 
+		 * */
+		__u8 gt_count;
+	} info;
+};
+
+/**
+ * struct drm_xe_tile - hardware tile structure
+ *
+ */
+struct drm_xe_tile {
+	/** @xe: Backpointer to tile's PCI device */
+	struct xe_device *xe;
+
+	/** @id: ID of the tile */
+	__u8 id;
+
+	/**
+	 * @vram_id: ID of associated TTM VRAM region
+	 *
+	 * For multi-tile platforms not using unified vram, this is same
+	 * as @id.  Otherwise this is always 0 to denote a single unified
+	 * vram region is in use.
+	 */
+	__u8 vram_id;
+
+	/**
+	 * @mis_tile: Flasg to check if tile ID missing or out of order
+	 *
+	 */
+	__u8 mis_tile:1;
+
+	/**
+	 * @gt_count: Number of GT/s available in tile
+	 *
+	 * */
+	__u8 gt_count;
+
+	/**
+	 * @primary_gt: Primary GT
+	 */
+	struct xe_gt *primary_gt;
+
+	/**
+	 * @media_gt: Media GT
+	 *
+	 * Only present on devices with media version >= 13.
+	 */
+	struct xe_gt *media_gt;
+
+	/**
+	 * @faked_gt: Faked GT
+	 *
+	 * Used for operations requiring GT on devices without GT at all.
+	 * TODO: remove when FSW-10725 is done
+	 */
+	struct xe_gt *faked_gt;
+
+	/**
+	 * @gt_list: List of GT descriptors from driver
+	 *
+	 */
+	struct drm_xe_query_gt_list *gt_list;
+};
+
 /**
  * struct drm_xe_gt - describe an individual GT.
  *
@@ -996,6 +1093,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+/* Bits 16-31 are reserved for prelim flags */
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1110,6 +1208,21 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+/* Monitor 128KB contiguous region with 4K sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_128K				0
+/* Monitor 2MB contiguous region with 64KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_2M				1
+/* Monitor 16MB contiguous region with 512KB sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_16M				2
+/* Monitor 64MB contiguous region with 2M sub-granularity */
+#define     DRM_XE_ACC_GRANULARITY_64M				3
+#define DRM_XE_EXEC_QUEUE_EXTENSION_EXT_MEDIA_QUEUE		1
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -1123,7 +1236,13 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
-	/** @flags: MBZ */
+	/*
+	 * When creating exec queue in MSIX platforms, the user can request a unique MSIX interrupt
+	 * for the irq handler. If there is no available MSIX, -EBUSY will be returned.
+	 */
+#define	DRM_XE_EXEC_QUEUE_CREATE_FLAG_UNIQUE_INTERRUPT_HINT (0x1 << 0)
+
+	/** @flags: create queue flags */
 	__u32 flags;
 
 	/** @exec_queue_id: Returned exec queue ID */
@@ -1254,6 +1373,25 @@ struct drm_xe_sync {
 	__u64 reserved[2];
 };
 
+struct drm_xe_ext_media_queue_create {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+	/** @instance_mask: mask of all external decoders and encoders used by the queue */
+	__u64 instance_mask;
+	/** @csm_addr: control shared memory address */
+	__u64 csm_addr;
+	/** @csm_size: control shared memory size */
+	__u64 csm_size;
+	/** cb_base_addr: command buffer base address */
+	__u64 cb_base_addr;
+	/** cb_size: command buffer size */
+	__u64 cb_size;
+	/** doorbell_handle: doorbell handle */
+	__u64 doorbell_handle;
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
  *
@@ -1485,7 +1623,6 @@ struct drm_xe_oa_unit {
 	/** @capabilities: OA capabilities bit-mask */
 	__u64 capabilities;
 #define DRM_XE_OA_CAPS_BASE		(1 << 0)
-#define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
@@ -1635,22 +1772,6 @@ enum drm_xe_oa_property_id {
 	 * to be disabled for the stream exec queue.
 	 */
 	DRM_XE_OA_PROPERTY_NO_PREEMPT,
-
-	/**
-	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
-	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
-	 */
-	DRM_XE_OA_PROPERTY_NUM_SYNCS,
-
-	/**
-	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
-	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
-	 * configuration will wait till input fences signal. Output fences
-	 * will signal after the new OA configuration takes effect. For
-	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
-	 * to the VM bind case.
-	 */
-	DRM_XE_OA_PROPERTY_SYNCS,
 };
 
 /**
@@ -1713,8 +1834,10 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+#include "xe_drm_prelim.h"
+
 #if defined(__cplusplus)
 }
 #endif
 
-#endif /* _XE_DRM_H_ */
+#endif /* _UAPI_XE_DRM_H_ */
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 00d5822fd..37f1716e2 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -234,7 +234,8 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 
 	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
-			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
+			 major(st.st_rdev), minor(st.st_rdev),
+			 xe_gt_get_tile_id(xe_device, gt), gt);
 	else
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
 			 major(st.st_rdev), minor(st.st_rdev), gt);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 30ea5ad41..e325608e0 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -15,27 +15,42 @@
 #include "igt_aux.h"
 #include "igt_list.h"
 #include "igt_sizes.h"
-#include "intel_hwconfig_types.h"
 
 #define XE_DEFAULT_ALIGNMENT           SZ_4K
 #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
 
 struct xe_device {
+#define XE_MAX_TILES_PER_DEVICE		4 
 	/** @fd: xe fd */
 	int fd;
 
 	/** @config: xe configuration */
 	struct drm_xe_query_config *config;
 
-	/** @hwconfig: xe hwconfig table data */
-	uint32_t *hwconfig;
-
-	/** @hwconfig_size: size of hwconfig in bytes */
-	uint32_t hwconfig_size;
-
 	/** @gt_list: gt info */
 	struct drm_xe_query_gt_list *gt_list;
 
+        /** @tiles: device tiles */
+        struct drm_xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
+
+	        /** @info: device info */
+	struct drm_xe_tile_info {
+		/** @info.tile_count: Number of tiles */
+		uint8_t tile_count;
+		/** @info.gt_count: Total number of GTs for entire device */
+		uint8_t gt_count;
+		/** @tile_unvailable: Flag to check if tile is missing or out of order */
+		uint8_t tile_unavailable:1;
+		/** @mis_tile: Tile ID missing or out of order */
+		uint8_t mis_tile_id[XE_MAX_TILES_PER_DEVICE];
+		/** @mis_tile_count: missing TIle ID **/
+		uint8_t mis_tile_count;
+		/** @info.graphics_verx100: graphics IP version */
+		__u32 graphics_verx100;
+		/** @info.media_verx100: media IP version */
+		__u32 media_verx100;
+	} info;
+
 	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
 
@@ -75,20 +90,34 @@ struct xe_device {
 	     ++__class)
 #define xe_for_each_gt(__fd, __gt) \
 	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
-
+#define xe_for_each_tile(tile__, xe__, id__) \
+        for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
+                for_each_if((tile__) = &(xe__)->tiles[(id__)])
+#define xe_for_each_remote_tile(tile__, xe__, id__) \
+        for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
+                for_each_if((tile__) = &(xe__)->tiles[(id__)])
+#define xe_for_each_device_gt(gt__, xe__, id__) \
+	for ((id__) = 0; (id__) < (xe__)->info.gt_count; (id__)++) \
+		for_each_if((gt__) = xe_device_get_gt((xe__), (id__)))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
 
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
-
+#define MEDIA_VER(xe) ((xe)->info.media_verx100 / 100)
 /*
  * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
  * used to declare arrays of drm_xe_engine_class_instance
  */
 #define XE_MAX_ENGINE_INSTANCE	9
 
+/*
+ * Max possible GT per Tile
+ *
+ */
+#define XE_MAX_GT_PER_TILE 2
+
 unsigned int xe_number_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
@@ -115,13 +144,12 @@ uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
-struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
-uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
 
+struct xe_gt *xe_device_get_gt(struct xe_device *xe, uint8_t gt_id);
 #endif	/* XE_QUERY_H */
diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
new file mode 100644
index 000000000..2b3151b7e
--- /dev/null
+++ b/tests/intel/xe_multi_tile.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Authors:
+ *      Nishit Sharma <nishit.sharma@intel.com>
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: Test to verify if multi-tile support available in platform
+ * by verifying Tile IDs and filling internal structs
+ * required to process user requests like getting GT ID
+ * gt%d belongs to which Tile%d
+ * Category: Core
+ * Mega feature: General Core features
+ * Functionality: Tile/GT operations
+ */
+
+/**
+ * SUBTEST: multi-tile-info
+ * Description: Test gathers Tile_ID/s and GT_ID/s and set internal
+ * 		structures required for operations
+ * Test category: functionality test
+ *
+ */
+
+/*
+ * xe_gt_list: Get the list of gt%d, tile%d and count
+ * 	       from driver using IOCTL
+ * @fd: GPU device descriptor
+ *
+ * Function gets the list of gt%d and tile%d available in device
+ * including other information such as gt count, graphics ip version
+ *
+ * Return: Returns drm_xe_query_gt_list pointer which have
+ * 	   list of gt%d and tile%d available
+ */
+struct drm_xe_query_gt_list *xe_gt_list(int fd)
+{
+	struct drm_xe_query_gt_list *gt_list;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	gt_list = malloc(query.size);
+	igt_assert(gt_list);
+
+	query.data = to_user_pointer(gt_list);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	return gt_list;
+}
+/*
+ * xe_gt_alloc: Memory allocation for gt%d and initializing 
+ * 		struct drm_xe_tile as per gt%d
+ * @tile *: Holds gt informations such as GT_ID and Tile_ID
+ *
+ * This allocates memory per GT available on tile and assigns corresponding tile address
+ * to corresponding gt
+ *
+ * Return: Returns gt structure
+ */  
+struct xe_gt *xe_gt_alloc(struct drm_xe_tile *tile)
+{
+	struct xe_gt *gt;
+
+	gt = malloc(sizeof(*gt));
+	igt_assert(gt);
+
+	gt->tile = tile;
+	return gt;
+}
+/**
+ * xe_tile_init - Initialize the tile and allocates memmory for primary GT
+ * @tile: Tile to initialize
+ * @xe: Parent Xe device
+ * @id: Tile ID
+ *
+ * Initializes per-tile resources that don't require any interactions with the
+ * hardware or any knowledge about the Graphics/Media IP version.
+ *
+ * Returns: 0 on success, assert if no memory allocation.
+ */
+int xe_tile_init(struct drm_xe_tile *tile, struct xe_device *xe, uint8_t id)
+{
+	tile->xe = xe;
+	tile->id = id;
+
+	tile->primary_gt = xe_gt_alloc(tile);
+	igt_assert(tile->primary_gt);
+
+	return 0;
+}
+/**
+ * xe_device_get_root_tile: Returns address of root tile
+ * @xe: GPU Device strcuture which holds information about tile
+ * 	available in system
+ *
+ * Return: root tile address
+ */
+struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
+{
+	return &xe->tiles[0];
+}
+/**
+ * xe_tile_get_gt: Return xe_gt address
+ * @tile *: Tile associated with gt
+ * @gt_id: gt%d 
+ *
+ * Returns: Based on gt_id passed xe_gt address returned which
+ * 	    can be media_gt or primary gt 
+ */
+struct xe_gt *xe_tile_get_gt(struct drm_xe_tile *tile, u8 gt_id)
+{
+	igt_assert_f(gt_id <= XE_MAX_GT_PER_TILE, "gt_id greater than defined XE_MAX_GT_PER_TILE");
+
+	return gt_id ? tile->media_gt : tile->primary_gt;
+}
+/**
+ * @xe_dev: GPU device address
+ * @gt_id: gt%d
+ *
+ * Returns: xe_gt address based on media version available in platform
+ */
+struct xe_gt *xe_device_get_gt(struct xe_device *xe_dev, uint8_t gt_id)
+{
+	struct drm_xe_tile *root_tile = xe_device_get_root_tile(xe_dev);
+	struct xe_gt *gt;
+
+	if (MEDIA_VER(xe_dev) >= 13)
+		gt = xe_tile_get_gt(root_tile, gt_id);
+	else
+		gt = xe_dev->tiles[gt_id].primary_gt;
+
+	igt_assert(gt);
+
+	return gt;
+}
+/**
+ * @xe_dev: GPU device structure 
+ * @gt_id: gt%d
+ *
+ * Check gt%d passed available on tile%d or not available
+ *
+ * Return: None
+ */
+static void igt_check_gt_per_tile(struct xe_device *xe_dev, uint8_t gt_id)
+{
+	uint8_t id;
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt;
+
+	xe_for_each_device_gt(gt, xe_dev, id) {
+		tile = gt->tile;
+		if(gt_id == gt->info.id)
+			igt_info("GT ID :%d available in Tile :tile%d\n",
+					gt_id, tile->id);
+		else
+			igt_info("GT ID :%d not available in Tile :tile%d\n",
+					gt_id, tile->id);
+	}
+}
+/**
+ * @xe_dev: GPU device structure
+ * @gt_id: gt%d
+ *
+ * To query gt%d available in tile%d by iterating over list of tiles available
+ *
+ * Returns: 0
+ */
+static uint8_t igt_query_gt_per_tile(struct xe_device *xe_dev, uint8_t gt_id)
+{
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt;
+	
+	xe_for_each_tile(tile, xe_dev, gt_id) {
+		gt = tile->primary_gt;
+		igt_info("Inside GT Id :%d GT type :%d GT count :%d for Tile ID :%d GT count in Tile :%d\n",
+				gt->info.id, gt->info.type, gt->info.gt_count, tile->id, tile->gt_count);
+
+		if(MEDIA_VER(xe_dev) >= 13)
+		{
+			gt = tile->media_gt;
+			igt_info("Inside GT Id :%d GT type :%d GT count :%d for Tile ID :%d GT count in Tile :%d\n",
+					gt->info.id, gt->info.type, gt->info.gt_count, tile->id, tile->gt_count);
+		}
+	}
+
+	return 0;
+}
+/**
+ * igt_show_device_gt: To show gt availale on GPU device
+ * @xe_dev: GPU device structure
+ * @fd: GPU device descriptor
+ *
+ * Show GT%d available on device
+ *
+ * Return: None
+ */
+static void igt_show_device_gt(struct xe_device *xe_dev, int fd)
+{
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt;
+
+	uint8_t id;
+
+	xe_for_each_device_gt(gt, xe_dev, id) {
+		tile = gt->tile;
+		igt_info("GT Id :%d GT type :%d Tile ID :%d\n",
+				gt->info.id, gt->info.type, tile->id);
+	}
+}
+/**
+ * igt_gt_init_per_tile: Initialize xe_gt structure per gt%d and per tile%d
+ * 			Memory allocation for each tile and based on media version
+ * 			if available on device xe_gt structure initialized and assigned
+ * 			to tile%d
+ * @xe_dev: GPU device structure
+ * @fd: GPU device descriptor
+ *
+ * Returns: 0 in case of success or assert
+ */
+static uint8_t igt_gt_init_per_tile(struct xe_device *xe_dev, int fd)
+{
+	uint8_t gt_id = 0;
+	struct drm_xe_tile *tile;
+	struct xe_gt *gt, *prev_gt = NULL, *new_gt;
+	int ip_version, media_version;
+	char name[100];
+
+	igt_info("per Tile initialization\n");
+
+	xe_for_each_tile(tile, xe_dev, gt_id) {
+		int err;
+		err = xe_tile_init(tile, xe_dev, gt_id);
+		igt_assert_eq(err, 0);
+	}
+
+	xe_for_each_tile(tile, xe_dev, gt_id) {
+		gt = tile->primary_gt;
+		new_gt = gt;
+		gt->info.id = xe_dev->info.gt_count++;
+		gt->info.type= XE_GT_TYPE_MAIN;
+		gt->info.gt_count++;
+		tile->gt_count++;
+
+		FILE *file = fopen("/sys/kernel/debug/dri/0/info", "r");
+		igt_assert(file);
+
+		while (fscanf(file, "%s %d", name, &ip_version) == 1) {
+			ip_version = -1;
+		}
+		while (fscanf(file, "%s %d", name, &media_version) == 1) {
+			media_version = -1;
+		}
+
+		fclose(file);
+
+		xe_dev->info.graphics_verx100 = ip_version;
+		xe_dev->info.media_verx100 = media_version;
+
+		if (MEDIA_VER(xe_dev) < 13)
+			continue;
+
+		/*
+		 * Allocate and setup media GT for platforms with standalone
+		 * media.
+		 *
+		 */
+		tile->media_gt = xe_gt_alloc(tile);
+		igt_assert(tile->media_gt);
+		gt->info.type = XE_GT_TYPE_MEDIA;
+		gt->info.id = xe_dev->info.gt_count++;
+		gt->info.gt_count++;
+		tile->gt_count++;
+	}
+
+	return 0;
+}
+/**
+ * igt_check_missing_tile_sysfs: Checking if tile missing or out of order in system
+ * @xe_device: fd of the device
+ * @fd: Device descriptor
+ *
+ * This opens the sysfs tile directory corresponding to device and tile for use
+ * The mis_tile_id[] contains tile%d which is checked with sysfs whether entry is present
+ * or not. E.g. After tile2 user get tile4, tile3 is missing which will be checked in sysfs path  
+ *
+ * Returns: None
+ */
+static void igt_check_missing_tile_sysfs(struct xe_device *xe_dev,
+					 int fd)
+{
+	char path[96];
+
+	igt_info("Checking missing tiles with sysfs\n");
+
+	for(int mis = 0; mis < xe_dev->info.mis_tile_count; mis++) {
+		xe_sysfs_tile_path(fd, xe_dev->info.mis_tile_id[mis], path, sizeof(path));
+	}
+
+	igt_assert_f(xe_dev->info.mis_tile_count < 0, "No Tile entry in sysfs found.");
+}
+/**
+ * igt_check_if_missingtile: Checking if tile missing by iterating over 
+ * 			     filled mis tile array
+ * @xe_dev: GPU device structure
+ * fd: GPU device descriptor
+ *
+ * Returns: None
+ */
+static void igt_check_if_missingtile(struct xe_device *xe_dev, int fd)
+{
+	igt_info("Checking missing/out of order tiles\n");
+
+	for(int i= 0; i < xe_dev->info.mis_tile_count; i++){
+		igt_warn("Tile :%d out of order/missing\n",
+				xe_dev->info.mis_tile_id[i]);
+	}
+}
+/**
+ * igt_get_tile_count: To get count of tile/s available in system,
+ * 		       Getting missing tile and tle count if any
+ * @xe_dev: Device structure
+ * @fd: Device descriptor
+ * gt_list: list of gt%d and relavant information returned from Driver via IOCTL
+ *
+ * Return: Tile count
+ */
+static uint8_t igt_get_tile_count(struct xe_device *xe_dev, int fd,
+			      struct drm_xe_query_gt_list *gt_list)
+{
+	int prev_tile = -1, tile_id;
+	uint8_t tile_mis_count = -1;
+
+	for(int index = 0; index < gt_list->num_gt; index++) {
+		tile_id = gt_list->gt_list[index].tile_id;
+		if(prev_tile != tile_id)
+		{
+			if(++tile_mis_count != tile_id) {
+				xe_dev->info.tile_unavailable = true;
+				xe_dev->info.mis_tile_id[xe_dev->info.mis_tile_count++] = tile_mis_count;
+			}
+			prev_tile = tile_id;
+			xe_dev->info.tile_count++;
+		}
+		xe_dev->info.tile_unavailable = false;
+	}
+
+	return xe_dev->info.tile_count;
+}
+
+igt_main
+{
+	int fd;
+	struct drm_xe_query_gt_list *gt_list;
+	struct xe_device *xe_dev;
+	struct drm_xe_tile *tile;
+	uint8_t gt_count;
+	uint8_t gt_arr[] = {0,1,2,3,4,5,6,7,8};
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_dev = xe_device_get(fd);
+	}
+
+	tile = malloc(sizeof(*tile));
+	igt_assert(tile);
+
+	igt_subtest("multi-tile-info") {
+		igt_require(IS_FS1(intel_get_drm_devid(fd)));
+		/** get gt information from driver using ioctl **/
+		gt_list = xe_gt_list(fd);
+		/** store pointer returned from driver which have gt information **/
+		tile->gt_list = gt_list;
+
+		/** Get tile count, initialize flag to check if any tile missing
+		 * Fill internal struct
+		 */
+		gt_count = igt_get_tile_count(xe_dev, fd, gt_list);
+		igt_assert_neq(gt_count, 0);
+		igt_info("Tiles :%d available in platform\n", gt_count);
+
+		/** check if multi-tile supported in platform */
+		igt_assert_f(xe_dev->info.tile_count > 1,
+				"Multi-Tile not supported in platform :%d\n",
+				xe_dev->info.tile_count);
+
+		/************* Per Tile Initilization ***********/
+		igt_assert_eq(igt_gt_init_per_tile(xe_dev, fd), 0);
+
+		/******** Condition to check if any tile missing/out of order *****/
+		if (xe_dev->info.tile_unavailable)
+			igt_check_if_missingtile(xe_dev, fd);
+
+		/******* Checking missing/out of order tile comparing with sysfs ***/
+		if (xe_dev->info.tile_unavailable)
+			igt_check_missing_tile_sysfs(xe_dev, fd);
+
+		/****** Display GT information on GPU Device  *******/
+		igt_show_device_gt(xe_dev, fd);
+
+		/****** Query GT per Tile *****/
+		igt_query_gt_per_tile(xe_dev, fd);	
+		
+		/***** Checking GT exist, if exist on which tile or doesn't exist ******/
+		for(int gt_id = 0; gt_id < sizeof(gt_arr); gt_id++)
+			igt_check_gt_per_tile(xe_dev, gt_id);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..2cc01aa0c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_exec_reset',
 	'xe_exec_sip',
 	'xe_exec_store',
+	'xe_multi_tile',
 	'xe_exec_threads',
 	'xe_exercise_blt',
 	'xe_fault_injection',
-- 
2.34.1

