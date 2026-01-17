Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5FDC98314
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 07:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F2110E24D;
	Sat, 17 Jan 2026 07:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBhrftCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95E310E043
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768634156; x=1800170156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Babs+VaXncY6VAhtVBdBJebsv+6s3PpwfGgWGPblJQk=;
 b=cBhrftCvi1jvsY0kzoLjvqJy0mqIU9/+Q8CWaphb5l6Hv/Wgo/pN80Ci
 xk63LlvB7TgBiy+UMI5N1M7/QtRaD8EbXi86UIrYznJdfAkggRxfcyFLX
 uvvbl6k7ULDFBXKQVD3PaCBOGj2OzMhLehOwfg1HpmVVA/efOIUk+y99z
 3KREiMLHx8i7P7T3g2flYQQUJqW+hPCjKUnIbDldbi+IylQFUVdStTPev
 5wbm49wom/ZkxKep/4BKlBJtubci1Akvx+t/laK4FSoWOnubOfa46+BZU
 LD0z5xPAsWZkJEphamvTSx7BT1b2dCxLjJtT7cWu4zA/mlAzXdzwHebWP Q==;
X-CSE-ConnectionGUID: LHGrxhsYT62Ube4hnaVAxg==
X-CSE-MsgGUID: H01WjCLvT/uR+O/eBPBiXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73786310"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="73786310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 23:15:55 -0800
X-CSE-ConnectionGUID: QbIc/TThT/+ekg6IqPM6Vg==
X-CSE-MsgGUID: eqkqU2trTgmnObBi2zaROQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="205842660"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 23:15:55 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH 3/4] lib/intel_device_info: allow xe_query to override
 graphics version
Date: Sat, 17 Jan 2026 07:14:58 +0000
Message-ID: <20260117071459.892532-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117071459.892532-1-x.wang@intel.com>
References: <20260117071459.892532-1-x.wang@intel.com>
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

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.h     |  1 +
 lib/intel_device_info.c | 23 +++++++++++++++++++++++
 lib/xe/xe_query.c       | 12 ++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index cc2225110..5006b8283 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -106,6 +106,7 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+void xe_dev_update_graphics_ver(uint16_t devid, unsigned major, unsigned minor);
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e97a8caa0..7ae2a642a 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -738,6 +738,29 @@ igt_destructor
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
+ */
+void xe_dev_update_graphics_ver(uint16_t devid, unsigned major, unsigned minor)
+{
+	struct intel_device_info *info;
+	uint32_t key = devid;
+	if (intel_graphics_ver(devid) != IP_VER(major, minor)) {
+		pthread_mutex_lock(&dev.cache_mutex);
+		info = igt_map_search(dev.map, &key);
+		info->graphics_ver = major;
+		info->graphics_rel = minor;
+		pthread_mutex_unlock(&dev.cache_mutex);
+	}
+}
+
 /**
  * intel_get_device_info:
  * @devid: pci device id
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 981d76948..da094dab5 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -270,6 +270,18 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
+		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
+		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
+			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
+				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
+				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
+			xe_dev_update_graphics_ver(xe_dev->dev_id,
+						   xe_dev->gt_list->gt_list[gt].ip_ver_major,
+						   xe_dev->gt_list->gt_list[gt].ip_ver_minor);
+			break;
+		}
+	}
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
-- 
2.43.0

