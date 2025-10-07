Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC73CCA470
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 23:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552CC10E70E;
	Tue,  7 Oct 2025 23:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zt6CADL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E684310E70E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 23:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759879597; x=1791415597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t/u52IqBtBLff9fcF/YPmDg/2msKXWsTbxld3fPF75M=;
 b=Zt6CADL+8UsF83dYEShU1Mz1HPwm4Ewwn+RhEPhZCUV7kNSuw8Li+cYw
 BaAbrUFa/xb3X/oWMdQ1jKTLo/B0b+vRFMg3ntEN4ql9ZMHbqdGyjLvNX
 yCGNhFnE8mxK5oXYQLNtiURntiWek2fQFKifCdotwUn+rIo1sIpQJwhAT
 FQ22OnAcd6p8OFM9YMTQ0gG+OmZN91gCJvyYAO9Sq0Z251EIyI2AVqa6F
 Q3Rl3E6wvGa4zxzqUUmzXp9pUAKYovBdIAxjME5z4pwxa7NIndcJP73hR
 ZXKIyWQeaU0bVHGnIrAP//FkJwJyN7HJmCklHasZ1GBXthQWHdkJtG7Oa Q==;
X-CSE-ConnectionGUID: iSxC0mbUQhaOSHUBrF2nug==
X-CSE-MsgGUID: JnQ5pSfOQIuq8FcjL+uKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="79717926"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="79717926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 16:26:37 -0700
X-CSE-ConnectionGUID: QPuTvtClSGaUyCQHOfZoRA==
X-CSE-MsgGUID: VqSpK2TcQHKmt7EnwDgKXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="179882158"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by orviesa009.jf.intel.com with ESMTP; 07 Oct 2025 16:26:36 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 1/6] lib: Add runtime device info query APIs for xe devices
Date: Tue,  7 Oct 2025 23:26:01 +0000
Message-ID: <20251007232606.363629-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007232606.363629-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251007232606.363629-1-x.wang@intel.com>
MIME-Version: 1.0
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

Introduce new APIs to query device information at runtime for xe devices:
- intel_query_gen(int fd): Get graphics generation
- intel_query_graphics_ver(int fd): Get combined graphics version
- intel_query_device_info(int fd): Get device info structure

For xe devices, graphics versions (both major and minor) can be
accurately determined by retrieving GMD_ID via IOCTL, rather than
relying on static intel_device_match table. Different device instances
of the same type may have different graphics_rel (minor version) values.

Implementation details:
- xe_device struct now includes intel_device_info for compatibility
- graphics_rel is populated from GMD_ID's ip_ver_minor at runtime
- For non-GMD_ID platforms (ip_ver_major == 0), hardcoded values are preserved
- New APIs fall back to traditional devid-based lookup for i915 devices

This infrastructure enables accurate device capability detection and
avoids issues when adding new device IDs with varying graphics_rel values.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_chipset.h |  3 +++
 lib/xe/xe_query.c   | 19 +++++++++++++++
 lib/xe/xe_query.h   |  3 +++
 4 files changed, 81 insertions(+)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede2..4b1cb3b97 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -189,3 +189,59 @@ intel_check_pch(void)
 		return;
 	}
 }
+
+/**
+ * intel_query_gen:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns gen IP version for device @fd. For i915 devices,
+ * falls back to i915 graphics version lookup.
+ */
+unsigned intel_query_gen(int fd)
+{
+	struct xe_device *xe_dev;
+
+	if (is_i915_device(fd))
+		return intel_gen(intel_get_drm_devid(fd));
+
+	xe_dev = xe_device_get(fd);
+
+	return xe_dev->info.graphics_ver;
+}
+/**
+ * intel_query_graphics_ver:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns graphics IP version for device @fd. For i915 devices,
+ * falls back to i915 graphics version lookup.
+ */
+unsigned intel_query_graphics_ver(int fd)
+{
+	struct xe_device *xe_dev;
+
+	if (is_i915_device(fd))
+		return intel_graphics_ver(intel_get_drm_devid(fd));
+
+	xe_dev = xe_device_get(fd);
+
+	return IP_VER(xe_dev->info.graphics_ver, xe_dev->info.graphics_rel);
+}
+
+/**
+ * intel_query_device_info:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns device information structure for device @fd. For i915 devices,
+ * falls back to i915 device info lookup.
+ */
+const struct intel_device_info *intel_query_device_info(int fd)
+{
+	struct xe_device *xe_dev;
+
+	if (is_i915_device(fd))
+		return intel_get_device_info(intel_get_drm_devid(fd));
+
+	xe_dev = xe_device_get(fd);
+
+	return &xe_dev->info;
+}
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2f6bf788a..61bdc1084 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -104,6 +104,9 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+unsigned intel_query_gen(int fd);
+unsigned intel_query_graphics_ver(int fd);
+const struct intel_device_info *intel_query_device_info(int fd);
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..3caeecf20 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -20,6 +20,7 @@
 
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
+#include "igt_core.h"
 #include "igt_map.h"
 
 #include "xe_query.h"
@@ -375,10 +376,28 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 
+	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id), sizeof(xe_dev->info));
+
 	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	/*
+	* Set graphics_rel based on the main GT's ip_ver_minor. We should
+	* use the hardcoded value for the none GMD_ID (ip_ver_major == 0)
+	* platforms (e.g. DG2,ADL,ATSM)
+	*/
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
+		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
+			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
+				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
+				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
+			igt_assert(xe_dev->info.graphics_ver == xe_dev->gt_list->gt_list[gt].ip_ver_major);
+			xe_dev->info.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
+			break;
+		}
+
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f..eefeb47dc 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -74,6 +74,9 @@ struct xe_device {
 
 	/** @dev_id: Device id of xe device */
 	uint16_t dev_id;
+
+	/** @info: Device information for compatibility with i915 */
+	struct intel_device_info info;
 };
 
 #define xe_for_each_engine(__fd, __hwe) \
-- 
2.43.0

