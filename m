Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9275C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 06:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4254F10E3F8;
	Mon, 14 Jul 2025 06:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYV9VPn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77E710E3F8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 06:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752475038; x=1784011038;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CzIEuRYgshWQWE/Vmr4fa0UtA2ipY0Ta9lDfB9cgBqo=;
 b=BYV9VPn6YUgsSX3aZCTCW3+KcubBDnPJ8SeU/hllO7h4Cwya8FMTGZqm
 oyS6fQCvKSLtTOVfyNIwCY5t0dzDGqGE5Q94u8PUyWLL7QPLt/r4ylMMr
 X09nbBVGIsruGBedpSZgspm8n9ykF8nHj8NexsOsKQzeMhy2HP1+Otr/J
 bjLO/VprYmurszasShFrM5UhtLbEZ4iQFzqfx1daKzA282VTeRDSOxBgC
 /0Q7kvDfmx/E/eF+QaJ7hCb+0oNz2kYr+UgZshLS74ocI5oNW4hoxOUtf
 5Zjo5L9U0uGjsuSsbnM/fp+Y9Y0JndFb57RdOMuHnsIgROhNY5p3BrPG5 Q==;
X-CSE-ConnectionGUID: LWurx3IkR82iGsaWp+bu1w==
X-CSE-MsgGUID: 18susIKrQTCstCtIQm8CIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66016442"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="66016442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 23:37:16 -0700
X-CSE-ConnectionGUID: IPbYVv4MSo6qyNPWa2qMgA==
X-CSE-MsgGUID: adBrAm7RT9+z59I7sYtQVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="157409052"
Received: from dut2943pvc.iind.intel.com ([10.190.215.47])
 by fmviesa008.fm.intel.com with ESMTP; 13 Jul 2025 23:37:15 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.d.roper@intel.com, nishit.sharma@intel.com
Subject: [PATCH i-g-t 1/2] lib/xe: Track valid Tile IDs
Date: Mon, 14 Jul 2025 06:37:14 +0000
Message-ID: <20250714063714.1326873-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

