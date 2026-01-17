Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB12CA5FEB
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 23:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B85710E1BF;
	Sat, 17 Jan 2026 23:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCYLmU/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4810E176
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 23:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768693714; x=1800229714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tNVSPdE/50RBUkJnrnSkmKs1ahq3JGrXJxQialbFzGE=;
 b=WCYLmU/N7c0vjqfyXWdBSCl45fD6NB/TAcUq7pre3uBuUT1AWnk/dOD0
 GJky6f2vk1oRDGAaJkzGqFmh91C2RhMyAc04s3oi1g3jVe8Ri6eyUDzRh
 a649oOn0pz9bE23STOmNXHdi1TD7QiV3oNiXQd4JVp4q9sjG10nbnG6KE
 r/iWSTiPdYQRs1y7se6I8kqut2Gco9iEbAy1CoFOUtJKrWee4RIwHoFIb
 j9REkVwYVYqBfd9C7WjvqddILmpLJDlxgWLqLsUlUvzED9itgVozckZGD
 QGndc0IlAmbTRTSW2LA4bcSQwxmaktyWkm3nGhh0wX7p2BDm5a233sKrk w==;
X-CSE-ConnectionGUID: 0mK6PhesRV+rz5/acR38og==
X-CSE-MsgGUID: pJdI9+7aQAOnWksHifJcEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81073818"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="81073818"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 15:48:33 -0800
X-CSE-ConnectionGUID: EBAJOlZATfq4Mzoj9H/ZAw==
X-CSE-MsgGUID: cqtQihJLSE6TGXQdo5Bp2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205150359"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 15:48:32 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v12 3/4] lib/intel_device_info: allow xe_query to override
 graphics version
Date: Sat, 17 Jan 2026 23:48:19 +0000
Message-ID: <20260117234821.929209-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117234821.929209-1-x.wang@intel.com>
References: <20260117234821.929209-1-x.wang@intel.com>
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

Xe2+ devices expose the graphics major/minor version via the hardware GMD_ID
register. Teach xe_device_get() to pick up ip_ver_{major,minor} from the MAIN
GT and update the cached intel_device_info accordingly.

Add xe_dev_update_graphics_ver() helper and wire it up from xe_query.

v2:
 - make xe_dev_update_graphics_ver() return error and guard NULL cache.
 - assert in xe query path to avoid silently ignoring update failures.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.h     |  1 +
 lib/intel_device_info.c | 32 ++++++++++++++++++++++++++++++++
 lib/xe/xe_query.c       | 13 +++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index cc2225110..18d84f2f4 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -106,6 +106,7 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+int32_t xe_dev_update_graphics_ver(uint16_t devid, unsigned major, unsigned minor);
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e97a8caa0..15f9afdf2 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -738,6 +738,38 @@ igt_destructor
 	intel_device_info_cache_fini();
 }
 
+/**
+ * xe_dev_update_graphics_ver:
+ * @devid: pci device id
+ * @major: new major graphics version
+ * @minor: new minor graphics version
+ *
+ * This function updates the graphics version for Xe devices with the specified
+ * devid, for Xe2+ devices, the graphics major and minor versions can be read
+ * directly from the hardware GMD_ID register.
+ * Returns:
+ * 0 on success, -1 if the cache is not found in the map.
+ */
+int32_t xe_dev_update_graphics_ver(uint16_t devid, unsigned major, unsigned minor)
+{
+	struct intel_device_info *info;
+	uint32_t key = devid;
+	int32_t ret = 0;
+	if (intel_graphics_ver(devid) != IP_VER(major, minor)) {
+		pthread_mutex_lock(&dev.cache_mutex);
+		info = igt_map_search(dev.map, &key);
+		if (info) {
+			info->graphics_ver = major;
+			info->graphics_rel = minor;
+		}
+		else {
+			ret = -1;
+		}
+		pthread_mutex_unlock(&dev.cache_mutex);
+	}
+	return ret;
+}
+
 /**
  * intel_get_device_info:
  * @devid: pci device id
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 981d76948..0033680a7 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -270,6 +270,19 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
+		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
+		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
+			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
+				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
+				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
+			igt_assert_f(!xe_dev_update_graphics_ver(xe_dev->dev_id,
+								 xe_dev->gt_list->gt_list[gt].ip_ver_major,
+								 xe_dev->gt_list->gt_list[gt].ip_ver_minor),
+				     "Failed to update graphics version for dev_id 0x%x\n", xe_dev->dev_id);
+			break;
+		}
+	}
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
-- 
2.43.0

