Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3889ACA5FA2
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 17:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA68210E949;
	Mon, 28 Sep 2026 17:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIqMzIaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E18C10E949
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790616437; x=1822152437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bq0fwKTXPZ3kmSh/ywGBI6CWTEku8bZ0N5pALL+3eS0=;
 b=KIqMzIajaLpPcOEuRtXf5x/zYZCc4EAzxMNqlLlC3LbrOgS6Rjr7eaaZ
 CLWqsAtRhzxbIlzpW7ukc4PIJP9uozc4U5tGXfvuGQhyokx8fjhskMj3y
 L381KtcHhFrAeb5I6hHiF0LzXJOCS72vU0kFQHIDoT0tSTvYWwGeWQ5xJ
 Os8KE3qPM/HOTHbz7BB6gcUOAqQxW6mgwqZ+IJ0LQlXe3qoikZPFcJhpg
 lBUj2wcm+Sca8fkHcGygG07JB6wo4fHQzXh0KoQ2hPQOZoA5CloVIUloT
 EjpYquDRr+nHpzs+1IwZo/2os7pQKlbHfqKy4SeZBS/vm6BrRtSWZR3Do w==;
X-CSE-ConnectionGUID: YYzXo6cMQA24kJceIseCiQ==
X-CSE-MsgGUID: /HOZLB5aQvKs2H6h5ZFC2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="78889476"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78889476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:27:16 -0700
X-CSE-ConnectionGUID: IyL+jLanS7q6qi/Atz9rAg==
X-CSE-MsgGUID: Z6pzJhcOTIWSXG/1a0Ik2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274616957"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2026 10:27:15 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v14 3/4] lib/intel_device_info: allow xe_query to
 override graphics version
Date: Mon, 28 Sep 2026 10:27:06 -0700
Message-ID: <20260928172713.1341060-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928172713.1341060-1-x.wang@intel.com>
References: <20260928172713.1341060-1-x.wang@intel.com>
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

Platforms with GMD_ID report the graphics IP major/minor version in
hardware, and xe exposes it via ip_ver_{major,minor} of the MAIN GT in
the GT list query. The static PCI-ID table cannot describe this
reliably, since devices sharing a PCI device ID may report different
IP versions.

Teach xe_device_get() to pick up the IP version from the MAIN GT and
update the cached intel_device_info via a new
xe_dev_update_graphics_ver() helper.

The cache is keyed by PCI device ID, so a system with multiple GPUs
sharing a device ID but reporting different IP versions is not
supported; the last probed device wins. This is considered unlikely in
practice.

v2:
 - make xe_dev_update_graphics_ver() return error and guard NULL cache.
 - assert in xe query path to avoid silently ignoring update failures.
v3:
 - return -ENOENT instead of -1 and fix coding style.
 - document the devid keying and the lockless readers.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.h     |  1 +
 lib/intel_device_info.c | 43 +++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.c       | 17 ++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 1f02932e4a..d71eeb4370 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -110,6 +110,7 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
+int xe_dev_update_graphics_ver(uint16_t devid, unsigned int major, unsigned int minor);
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 3f9dd42db1..9201ca806c 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -5,6 +5,7 @@
 #include "igt_map.h"
 
 #include <ctype.h>
+#include <errno.h>
 #include <pthread.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -774,6 +775,48 @@ static const struct intel_device_info *devinfo_table_lookup(uint16_t devid)
 	return (const struct intel_device_info *)intel_device_match[i].match_data;
 }
 
+/**
+ * xe_dev_update_graphics_ver:
+ * @devid: pci device id
+ * @major: new major graphics version
+ * @minor: new minor graphics version
+ *
+ * Updates the cached graphics version of the device with the specified @devid.
+ * On Xe platforms with GMD_ID, the graphics major and minor versions are read
+ * from the hardware and override the values from the static PCI-ID table.
+ *
+ * The cache is keyed by @devid, so all devices sharing a PCI device ID share
+ * one entry; with several such devices reporting different IP versions, the
+ * last update wins.
+ *
+ * Readers of intel_get_device_info() do not take the cache lock. This is fine
+ * because the entry is only written when a device is first probed by
+ * xe_device_get(), and only if the version actually changes.
+ *
+ * Returns:
+ * 0 on success, -ENOENT if there is no cache entry for @devid.
+ */
+int xe_dev_update_graphics_ver(uint16_t devid, unsigned int major, unsigned int minor)
+{
+	struct intel_device_info *info;
+	int ret = 0;
+
+	if (intel_graphics_ver(devid) == IP_VER(major, minor))
+		return 0;
+
+	pthread_mutex_lock(&devinfo_cache.mutex);
+	info = devinfo_cache_search(devid);
+	if (info) {
+		info->graphics_ver = major;
+		info->graphics_rel = minor;
+	} else {
+		ret = -ENOENT;
+	}
+	pthread_mutex_unlock(&devinfo_cache.mutex);
+
+	return ret;
+}
+
 /**
  * intel_get_device_info:
  * @devid: pci device id
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 91ffc36e64..a15099cb3b 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -412,6 +412,23 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	/* On GMD_ID platforms, the MAIN GT reports the graphics IP version */
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
+		const struct drm_xe_gt *gt_info = &xe_dev->gt_list->gt_list[gt];
+
+		if (gt_info->type != DRM_XE_QUERY_GT_TYPE_MAIN || !gt_info->ip_ver_major)
+			continue;
+
+		igt_debug("GMD_ID graphics IP version %u.%02u for dev_id 0x%x\n",
+			  gt_info->ip_ver_major, gt_info->ip_ver_minor, xe_dev->dev_id);
+		igt_assert_f(!xe_dev_update_graphics_ver(xe_dev->dev_id,
+							 gt_info->ip_ver_major,
+							 gt_info->ip_ver_minor),
+			     "Failed to update graphics version for dev_id 0x%x\n",
+			     xe_dev->dev_id);
+		break;
+	}
+
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
-- 
2.43.0

