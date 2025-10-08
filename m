Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67013CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A74910E8D9;
	Wed,  8 Oct 2025 21:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJTzzy3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EB610E8DB
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759957361; x=1791493361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Ou9X+WuSJomM646baTYIXEqkeNc1s93Cl2r312h03s=;
 b=hJTzzy3fEfDNu8Q8HNoUB4Xg/27PDjoW8X7/1/Paiw1Yrlxzaq1/AC9y
 aFmjhnSASFLjFPXpCgSTgvo3lSugZzhwHrXGfa9Gr85T9D11JdSLZBcWy
 C1tPjssSlDysPOAwAsaIXXwXSAa9zQr+MKCAmrFVlOPDNKl1/MGuQuVq0
 UMEzqczV0DaBvsEuxP1FuiPeSXu5/+Y+1wTKca3GtZj9S4N1CkTzTvyob
 zRFpebi1rGFemWeDt4U4BZkutlw6buuF7xKPxDDpJ91ccgljxvg0qQHB6
 x2Zcu35S7++C9urAskjzFoSN1TxKrGV02mr7A8vZQrxTvyH+8wjWE5luB w==;
X-CSE-ConnectionGUID: 1nEyeTNyQEKKI6T2rEHt4g==
X-CSE-MsgGUID: LuUSTDcUQ6C8ZATWp8tJNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61867749"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61867749"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:02:40 -0700
X-CSE-ConnectionGUID: 5SKb0LUoR1ijDUiKOygGmg==
X-CSE-MsgGUID: GU+2MY8zST20VdYKTH67Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184920007"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2025 14:02:40 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe devices
Date: Wed,  8 Oct 2025 21:02:31 +0000
Message-ID: <20251008210236.396859-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008210236.396859-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
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
 lib/intel_chipset.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_chipset.h |  3 +++
 lib/xe/xe_query.c   | 19 ++++++++++++++
 lib/xe/xe_query.h   |  3 +++
 4 files changed, 88 insertions(+)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede2..890b1e3fa 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -189,3 +189,66 @@ intel_check_pch(void)
 		return;
 	}
 }
+
+/**
+ * intel_query_device_info:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns device information structure for device @fd. For i915 devices,
+ * falls back to i915 device info lookup. This function caches the result
+ * per file descriptor for performance.
+ */
+const struct intel_device_info *intel_query_device_info(int fd)
+{
+	static __thread int cached_fd = -1;
+	static __thread const struct intel_device_info *cached_info;
+	struct xe_device *xe_dev;
+
+	if (cached_fd == fd)
+		goto out;
+
+	if (is_i915_device(fd)) {
+		cached_info = intel_get_device_info(intel_get_drm_devid(fd));
+	} else {
+		xe_dev = xe_device_get(fd);
+		if (!xe_dev)
+			return NULL;
+		cached_info = &xe_dev->info;
+	}
+
+	cached_fd = fd;
+
+out:
+	return cached_info;
+}
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
+	const struct intel_device_info *info = intel_query_device_info(fd);
+
+	return info ? info->graphics_ver : 0;
+}
+
+/**
+ * intel_query_graphics_ver:
+ * @fd: open i915/xe drm file descriptor
+ *
+ * Returns graphics IP version for device @fd. For i915 devices,
+ * falls back to i915 graphics version lookup.
+ */
+unsigned intel_query_graphics_ver(int fd)
+{
+	const struct intel_device_info *info = intel_query_device_info(fd);
+
+	if (!info)
+		return 0;
+
+	return IP_VER(info->graphics_ver, info->graphics_rel);
+}
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2f6bf788a..8f3ea0ce5 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -104,6 +104,9 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+const struct intel_device_info *intel_query_device_info(int fd);
+unsigned intel_query_gen(int fd);
+unsigned intel_query_graphics_ver(int fd);
 
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

