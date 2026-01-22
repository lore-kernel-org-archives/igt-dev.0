Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32953C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 07:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB5310E8FA;
	Thu, 22 Jan 2026 07:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEnoxwmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE92F10E8F4
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769066138; x=1800602138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dGRVCogwFWyrtZCwnhH0zkNUbQG44KYDlSfnNgDg0h0=;
 b=aEnoxwmB5A9AyAXmZqKI6XEg2BxRDpxa8EFjkPTTxsppPzZC/rQE/RJe
 VAyj5d5S0ESG16f7hRyadisuB69m5arpo1zNe4JCo35o3GAVTBqviCEzk
 CAsx0ghch5ifVP7gpDMzjFuaCcILi0BDfPgy2MDc+a7NoMPrWgkQQYzxq
 Up6XG8iHvKF24vTV83uFLbpMDi2RahvNaNRrNIVTBrMGMDjTrIgVPpfw6
 7+3U6HWgylnZDJlStPv9zlO1zdYpkeNOsIIJSxKXi1okBj4tZvWRUM5Zl
 PHxOgHNm/bAxPcXCl7jzYY7/sv5/IYWwnVj0HWF/btwtitWPl1xAMLaYc A==;
X-CSE-ConnectionGUID: mlSVoh+2SCmeRiI/93PvdA==
X-CSE-MsgGUID: C3mqDIFzT/WkOtTN1/WLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80925725"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80925725"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 23:15:37 -0800
X-CSE-ConnectionGUID: yLEwPjejTZuDrzg64r8yOw==
X-CSE-MsgGUID: P9M51602RvW7B1k6qH37Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206265593"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2026 23:15:37 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH v2 2/3] lib/intel: add fd-based intel_gen/intel_graphics_ver
 via Xe query
Date: Thu, 22 Jan 2026 07:15:29 +0000
Message-ID: <20260122071530.1629046-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122071530.1629046-1-x.wang@intel.com>
References: <20260122071530.1629046-1-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add fd‑based intel_gen() and intel_graphics_ver() that prefer Xe query
ip_ver_{major,minor} from the main GT, falling back to PCI ID legacy mapping.
Export xe_get_main_gt() to access main GT data from the cached query info.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_chipset.h |  2 ++
 lib/xe/xe_query.c   | 25 ++++++++++++++++++++++
 lib/xe/xe_query.h   |  1 +
 4 files changed, 79 insertions(+)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede2..3e2d7a19c 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -127,6 +127,57 @@ static uint32_t __i915_get_drm_devid(int fd)
 	return devid;
 }
 
+/**
+ * intel_graphics_ver:
+ * @fd: Open DRM device file descriptor
+ *
+ * Returns the graphics/IP version encoded with IP_VER(major, minor).
+ *
+ * The function prefers the modern XE path: if a main GT is available via
+ * xe_get_main_gt() and it reports a non-zero ip_ver_major, the version is
+ * constructed from main_gt->ip_ver_major and main_gt->ip_ver_minor.
+ *
+ * If XE information is unavailable, it falls back to the legacy path by reading
+ * the DRM device ID with intel_get_drm_devid() and translating it via
+ * intel_graphics_ver_legacy().
+ *
+ * Return: Encoded IP version (IP_VER(major, minor)).
+ */
+unsigned intel_graphics_ver(int fd)
+{
+	uint16_t devid;
+	const struct drm_xe_gt* main_gt = xe_get_main_gt(fd);
+
+	if (main_gt && main_gt->ip_ver_major)
+		return IP_VER(main_gt->ip_ver_major, main_gt->ip_ver_minor);
+
+	devid = intel_get_drm_devid(fd);
+	return intel_graphics_ver_legacy(devid);
+}
+
+/**
+ * intel_gen:
+ * @fd: DRM device file descriptor.
+ *
+ * Attempts to determine the graphics "generation" by querying the Xe driver for
+ * the main GT IP version major. If unavailable (e.g., not an Xe device or no IP
+ * version reported), falls back to retrieving the DRM device ID and mapping it
+ * to a legacy graphics version.
+ *
+ * Return: The graphics generation/major IP version for the device.
+ */
+unsigned intel_gen(int fd)
+{
+	uint16_t devid;
+	const struct drm_xe_gt* main_gt = xe_get_main_gt(fd);
+
+	if (main_gt && main_gt->ip_ver_major)
+		return main_gt->ip_ver_major;
+
+	devid = intel_get_drm_devid(fd);
+	return intel_gen_legacy(devid);
+}
+
 /**
  * intel_get_drm_devid:
  * @fd: open i915/xe drm file descriptor
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index fb360268d..59edf70ea 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -106,6 +106,8 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen_legacy(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver_legacy(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+unsigned intel_gen(int fd);
+unsigned intel_graphics_ver(int fd);
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 981d76948..742e48c11 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -931,6 +931,31 @@ uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile)
 	return gt_id;
 }
 
+/**
+ * xe_get_main_gt:
+ * @fd: xe device fd
+ *
+ * Returns pointer to main GT data structure for given xe device @fd.
+ */
+const struct drm_xe_gt* xe_get_main_gt(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+
+	if (xe_dev) {
+		for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
+			const struct drm_xe_gt *gt_data = &xe_dev->gt_list->gt_list[i];
+
+			if (gt_data->type == DRM_XE_QUERY_GT_TYPE_MAIN) {
+				return gt_data;
+			}
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * xe_hwconfig_lookup_value:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index d7a9f95f9..bbf6bf9b6 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -160,6 +160,7 @@ uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute);
 void *xe_query_device_may_fail(int fd, uint32_t type, uint32_t *size);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
+const struct drm_xe_gt* xe_get_main_gt(int fd);
 
 /**
  * xe_query_device:
-- 
2.43.0

