Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FDCAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 15:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3387F10E25C;
	Tue,  9 Sep 2025 15:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkLuDOoo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20ECE10E25C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757433014; x=1788969014;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RcHbdxupBpliznuRkpLIWGR4q9H3bKJwdWO9RwwR32o=;
 b=LkLuDOooNzQT5VXyX9utK+KBLrEux7ibmKdP1m9T50C2bkUfA6ViGYnV
 4U2Bf4mTMz2338mVqf5BvnM8ZJ5OK3lMaNQyPajx5jD9JNJBFb+1W8KRD
 gvtqmEEGFM/IJWCFwZuSZQId5k5yc1iYHBFqSFUL/Dyw5T9T/voz90Xe6
 n18cfFQkIXa3eTNqqmHOfEx52K5MbOCDKNahA8nG0GE61wzWMorhBb1ul
 8CxqdRc9bNKYSNdlM3/zHHYpVIMKrUMrUCh/kaGoLzSzTfKfF/xRUmAG3
 q0QSlG1usdXUHRDZIwrpJfB1+CAfBgtwsH8Kx6uhOJ+Pge5e3+g0ROR1u w==;
X-CSE-ConnectionGUID: CRbeUh2sQXe/IyOviKKK1g==
X-CSE-MsgGUID: AP11md/8RoiIHq0FnseE3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59832102"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59832102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:50:14 -0700
X-CSE-ConnectionGUID: M5n0FYN4RFydbY1q1mBoQw==
X-CSE-MsgGUID: l55tGCdRTiaAka0r/5s1bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173583154"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2025 08:50:12 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v4 1/1] lib/xe: Track valid Tile IDs
Date: Tue,  9 Sep 2025 15:50:11 +0000
Message-ID: <20250909155011.1376500-1-nishit.sharma@intel.com>
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
GTs in multi-tile platforms. Initially it was assumed
tile_id == gt_id in multi-tile platform and if gt_id = X
passed as input, it was considered tileX.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/igt_sysfs.c   | 19 ++++++++++---------
 lib/xe/xe_query.c | 16 ++++++++++++++++
 lib/xe/xe_query.h |  4 ++++
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 96ca57ed9..3646dbacb 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -226,6 +226,7 @@ int igt_sysfs_open(int device)
 char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 {
 	struct stat st;
+	struct xe_device *xe_dev;
 
 	if (xe_device < 0)
 		return NULL;
@@ -233,12 +234,12 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
 		return NULL;
 
-	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
-		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
-			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
-	else
-		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
-			 major(st.st_rdev), minor(st.st_rdev), gt);
+	xe_dev = xe_device_get(xe_device);
+
+	igt_assert(xe_dev);
+
+	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
+		 major(st.st_rdev), minor(st.st_rdev), xe_get_tile(xe_dev, gt), gt);
 
 	if (!access(path, F_OK))
 		return path;
@@ -307,7 +308,7 @@ char *
 xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
 {
 	struct stat st;
-	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
+	char base_path[96];
 
 	if (xe_device < 0)
 		return NULL;
@@ -315,8 +316,8 @@ xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
 	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
 		return NULL;
 
-	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
-		 major(st.st_rdev), minor(st.st_rdev), tile, gt,
+	xe_sysfs_gt_path(xe_device, gt, base_path, sizeof(base_path));
+	snprintf(path, pathlen, "%s/engines/%s", base_path,
 		 xe_engine_class_short_string(class));
 
 	if (!access(path, F_OK))
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 9b88cce8d..767926123 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -379,6 +379,10 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
+
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->engines = xe_query_engines(fd);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
@@ -545,6 +549,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id)
 	return NULL;
 }
 
+/*
+ * Given a uapi GT ID, lookup the corresponding drm_xe_gt structure in the
+ * GT list and return valid tile_id otherwise invalid.
+ */
+int xe_get_tile(struct xe_device *xe_dev, int gt_id)
+{
+	for (int i = 0; i < xe_dev->gt_list->num_gt; i++)
+		if (xe_dev->gt_list->gt_list[i].gt_id == gt_id)
+			return xe_dev->gt_list->gt_list[i].tile_id;
+
+	return -ENOENT;
+}
 
 /**
  * vram_memory:
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 4b8a6ee77..26535bb74 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -39,6 +39,9 @@ struct xe_device {
 	/** @gt_mask: bitmask of GT IDs */
 	uint64_t gt_mask;
 
+	/** @tile_mask: bitmask of Tile IDs */
+	uint64_t tile_mask;
+
 	/** @memory_regions: bitmask of all memory regions */
 	uint64_t memory_regions;
 
@@ -101,6 +104,7 @@ unsigned int xe_dev_max_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
+int xe_get_tile(struct xe_device *xe_dev, int gt_id);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
 struct drm_xe_engine *xe_engines(int fd);
-- 
2.43.0

