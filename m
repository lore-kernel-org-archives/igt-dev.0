Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A70FD0620
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD79710E327;
	Wed, 11 Mar 2026 06:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwuuwSzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB3D10E327
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773210208; x=1804746208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IZ6juhF3ogBCf16OW6GkBHEu9Cr4V+me5911o38n05s=;
 b=bwuuwSzXP8mCGkqIgTZYmGKzx2elclnMeA45py7fNM63rSfgDK5wG1iP
 kxUp3WzF8kQxiyTTKi1yYJ1OoJPy202WW5aIR/RG7p5/JKjxWqjNw5d/R
 4iOICunPoiMhUuLGASCUHk1dbD+N0q6y4Oz+EnlVQt/lLW4AcTjQBPh+8
 7fsHds6UmMf5Km/4qn0ZVKwA9ceezIgfx7E2f/sDvYWSSC95aNLsv3I/8
 wS0WeQEVu41mWV+g6sjU7qfkdmu+YvYeIm3Nejtbc5qATNETDjly09mTA
 NcFntg83yo6Gy1WvL895f6oQCswJuzdvN8o8NcSmo1Zk8/wOeX+FEnpr6 g==;
X-CSE-ConnectionGUID: wbp+Ij5+TSS6x+BwDl7fZw==
X-CSE-MsgGUID: hDimfXXURiumLIN62UAY9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77875561"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77875561"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:23:27 -0700
X-CSE-ConnectionGUID: 1nWxkaqqRaSWn3z85BkNbg==
X-CSE-MsgGUID: pfiCUB10SZmvEgjMUpLuFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220309073"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa009.jf.intel.com with ESMTP; 10 Mar 2026 23:23:15 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v5 2/4] lib/intel: add fd-based graphics IP version query
 helpers
Date: Tue, 10 Mar 2026 23:23:07 -0700
Message-ID: <20260311062311.1623823-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311062311.1623823-1-x.wang@intel.com>
References: <20260311062311.1623823-1-x.wang@intel.com>
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

Add two new functions to query the graphics IP version from a DRM
device fd:

  unsigned intel_gfx_ver(int fd)
  unsigned intel_gfx_ver_major(int fd)

intel_gfx_ver() returns the full IP version encoded as
IP_VER(major, minor), replacing the role of the pciid-based
intel_graphics_ver_from_pciid(). intel_gfx_ver_major() returns
only the major version, replacing the role of intel_gen_from_pciid().

For Xe devices both functions query the graphics IP version directly
from the kernel via the GT query interface (drm_xe_gt.ip_ver_major /
ip_ver_minor), avoiding any PCI ID table lookup. For other devices they
fall back to intel_graphics_ver_from_pciid() / intel_gen_from_pciid()
using the device ID obtained via intel_get_drm_devid(fd).

The new fd-based names differ from the legacy pciid-based names so that
any remaining call sites that mistakenly pass a devid instead of an fd
will produce a build failure rather than silently computing wrong
results through implicit integer conversion.

To support the Xe path, export xe_get_main_gt(int fd) from xe_query,
which returns a pointer to the first MAIN GT descriptor from the
cached Xe device query result.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.c     | 43 +++++++++++++++++++++++++++++++++++++++++
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 12 ++++++------
 lib/xe/xe_query.c       | 25 ++++++++++++++++++++++++
 lib/xe/xe_query.h       |  1 +
 5 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede2..835c4ab34 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -189,3 +189,46 @@ intel_check_pch(void)
 		return;
 	}
 }
+
+/**
+ * intel_gfx_ver:
+ * @fd: drm device fd
+ *
+ * Returns the graphics IP version for the device identified by @fd, encoded
+ * as IP_VER(major, minor).  For Xe devices the value is read directly from
+ * the kernel via the GT query interface.  For other devices it falls back to
+ * a PCI ID table lookup.
+ *
+ * Returns:
+ * The graphics IP version.
+ */
+unsigned intel_gfx_ver(int fd)
+{
+	const struct drm_xe_gt *main_gt = xe_get_main_gt(fd);
+
+	if (main_gt && main_gt->ip_ver_major)
+		return IP_VER(main_gt->ip_ver_major, main_gt->ip_ver_minor);
+
+	return intel_graphics_ver_from_pciid(intel_get_drm_devid(fd));
+}
+
+/**
+ * intel_gfx_ver_major:
+ * @fd: drm device fd
+ *
+ * Returns the graphics IP major version for the device identified by @fd.
+ * For Xe devices the value is read directly from the kernel via the GT query
+ * interface.  For other devices it falls back to a PCI ID table lookup.
+ *
+ * Returns:
+ * The graphics IP major version.
+ */
+unsigned intel_gfx_ver_major(int fd)
+{
+	const struct drm_xe_gt *main_gt = xe_get_main_gt(fd);
+
+	if (main_gt && main_gt->ip_ver_major)
+		return main_gt->ip_ver_major;
+
+	return intel_gen_from_pciid(intel_get_drm_devid(fd));
+}
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 4a9b7bef1..0e48c248a 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -106,6 +106,8 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen_from_pciid(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver_from_pciid(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+unsigned intel_gfx_ver(int fd);
+unsigned intel_gfx_ver_major(int fd);
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index ba16975f5..c0fde6182 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -742,14 +742,14 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid)
  * intel_gen_from_pciid:
  * @devid: pci device id
  *
- * Computes the Intel GFX generation for the given device id.
+ * Intel graphics IP major version for the given device id.
  *
- * Deprecated: Prefer the fd-based intel_gen() where a DRM device fd is
- * available. Use this function only in contexts where no fd is accessible,
+ * Deprecated: Prefer the fd-based intel_gfx_ver_major() where a DRM device fd
+ * is available. Use this function only in contexts where no fd is accessible,
  * e.g. when the DRM driver is not loaded or in cross-environment tools.
  *
  * Returns:
- * The GFX generation on successful lookup, -1u on failure.
+ * The major version of the graphics IP on successful lookup, -1u on failure.
  */
 unsigned intel_gen_from_pciid(uint16_t devid)
 {
@@ -760,9 +760,9 @@ unsigned intel_gen_from_pciid(uint16_t devid)
  * intel_graphics_ver_from_pciid:
  * @devid: pci device id
  *
- * Computes the Intel graphics IP version for the given device id.
+ * Intel graphics IP version for the given device id.
  *
- * Deprecated: Prefer the fd-based intel_graphics_ver() where a DRM device fd
+ * Deprecated: Prefer the fd-based intel_gfx_ver() where a DRM device fd
  * is available. Use this function only in contexts where no fd is accessible,
  * e.g. when the DRM driver is not loaded or in cross-environment tools.
  *
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3afca353e..23f57bf1f 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -903,6 +903,31 @@ bool xe_is_main_gt(int fd, int gt)
 	return xe_gt_type(fd, gt) == DRM_XE_QUERY_GT_TYPE_MAIN;
 }
 
+/**
+ * xe_get_main_gt:
+ * @fd: xe device fd
+ *
+ * Returns a pointer to the drm_xe_gt descriptor of the first MAIN GT found
+ * for device @fd, or NULL if none is found.
+ */
+const struct drm_xe_gt *xe_get_main_gt(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+
+	if (xe_dev) {
+		for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
+			const struct drm_xe_gt *gt = &xe_dev->gt_list->gt_list[i];
+
+			if (gt->type == DRM_XE_QUERY_GT_TYPE_MAIN)
+				return gt;
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * xe_gt_to_tile_id:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 05e2ad84f..aab4a64a8 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -158,6 +158,7 @@ bool xe_has_media_gt(int fd);
 uint16_t xe_gt_type(int fd, int gt);
 bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
+const struct drm_xe_gt *xe_get_main_gt(int fd);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
-- 
2.43.0

