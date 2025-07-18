Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40092C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 05:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D730D10E112;
	Fri, 18 Jul 2025 05:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMue2L5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779F010E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752817753; x=1784353753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CzIEuRYgshWQWE/Vmr4fa0UtA2ipY0Ta9lDfB9cgBqo=;
 b=DMue2L5SOus8sMpvfnojcBVPqXK9jUEtHmbU+lCo3g3rn32O2Db9tzL2
 wOOJB3CfekmkCUYABYuQLE5E7q5OCViCzNMUFfMzbvs6u7eCmrKC/BuQL
 S9b4+gz0C4LIIwIUiUFwm1CVhSFzOuMXyhRB+roSQuHN/3qU2/yL3mjRU
 jvTeYO+ZuV6QKXRofzgqKceLovM2zyU8r/X4vZp7wPsTDY5kU003G7IR6
 fyIRLB7PoN0cZ2Jam1ysJEY7XgFa0ptzgkNvpCbNpqkneBjfug9AY2/Y7
 Z8zuJ+fRLsa5eiaQgWbFxjYqFzBThYFcPBiTxhfIGR0Y3kdkGi2qNMv79 g==;
X-CSE-ConnectionGUID: 6hwD6tbuT2eSVuDzCKqkEQ==
X-CSE-MsgGUID: kPEwStH4Q2ygocFC3QtHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55230250"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="55230250"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 22:49:13 -0700
X-CSE-ConnectionGUID: oVsTbfQPQAWp+FBWuQGbfA==
X-CSE-MsgGUID: KRoSNcQeS7u1Uz1UiEiSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="158058883"
Received: from dut2943pvc.iind.intel.com ([10.190.215.47])
 by orviesa007.jf.intel.com with ESMTP; 17 Jul 2025 22:49:11 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 nishit.sharma@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 1/2] lib/xe: Track valid Tile IDs
Date: Fri, 18 Jul 2025 05:49:07 +0000
Message-ID: <20250718054908.1502234-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718054908.1502234-1-nishit.sharma@intel.com>
References: <20250718054908.1502234-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Iterating drm_xe_gt structure to get valid tile ID instead
of assuming tile_id == gt_id and finding sysfs path for
GTS in multi-tile platforms. Initially it was assumed
tile_id == gt_id in multi-tile platform and if gt_id = X
passed, it was considered tileX.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/igt_sysfs.c   |  4 +++-
 lib/xe/xe_query.c | 12 ++++++++++++
 lib/xe/xe_query.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index aec157b5b..af80e91ee 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -226,6 +226,8 @@ int igt_sysfs_open(int device)
 char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 {
 	struct stat st;
+	struct xe_device *xe_dev = xe_device_get(xe_device);
+	igt_assert(xe_dev);
 
 	if (xe_device < 0)
 		return NULL;
@@ -235,7 +237,7 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 
 	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
-			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
+			 major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev, gt), gt);
 	else
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
 			 major(st.st_rdev), minor(st.st_rdev), gt);
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3d628cb3f..70ce625d0 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -517,6 +517,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id)
 	return NULL;
 }
 
+/*
+ * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in the
+ * GT list and return valid tile_id.
+ */
+uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id)
+{
+	for (int i = 0; i < xe_dev->gt_list->num_gt; i++)
+		if (xe_dev->gt_list->gt_list[i].gt_id == gt_id)
+			return xe_dev->gt_list->gt_list[i].tile_id;
+
+	return -1;
+}
 
 /**
  * vram_memory:
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index ca0b3235e..6ff8576b9 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -98,6 +98,7 @@ unsigned int xe_dev_max_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
+uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
 struct drm_xe_engine *xe_engines(int fd);
-- 
2.43.0

