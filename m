Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D41CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 15:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1229C10E495;
	Mon, 18 Aug 2025 15:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3kA89W5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F76010E495
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755532682; x=1787068682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cpdDB+dYj3ZeVTs40G5h+od2D6VIJlmGZ2lDdajRjhI=;
 b=S3kA89W5Apx2+nAkYhHvHN6b2r8YwlVk5ebyKSiZYvUlnHBNlEdYshNP
 6b+PEdxf81Uap8m6yIKRvlPR/Aszh0xfM0YHgpdzKJl23YI2pApwlaudy
 QCMgHcz1QIpTjIfjS3XvTMo85MHEKLvPJ7tsTku9CowGF/P5jDkF5S7w0
 U8hmTXNynbhjK4DoDXeaJVCGo+58hlQRVIdWHdqeShfBGwtDDGz55/iZm
 OafcGSSj8jbtMVv7NPX4Bkl0ChZrpyjgXijhjs+9mfEZCyo0Cz3cn6XhE
 +IUdSF/Btl80mdNVsyV009yaGNtbdXdrWgut/ZFwcQqjUjUZrg9qiQO7i w==;
X-CSE-ConnectionGUID: okIBwNc4ROusQjFV0TKJQA==
X-CSE-MsgGUID: OJ0HL+AySnOGvDofWSPZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69134616"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="69134616"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:58:02 -0700
X-CSE-ConnectionGUID: 05MwVjz9SFq889r0StBBNw==
X-CSE-MsgGUID: pxJC3lwZSHKz3gUv5+/5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166781686"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 08:58:00 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 matthew.brost@intel.com, nishit.sharma@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 1/1] lib/xe: Track valid Tile IDs
Date: Mon, 18 Aug 2025 15:57:57 +0000
Message-ID: <20250818155757.92515-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818155757.92515-1-nishit.sharma@intel.com>
References: <20250818155757.92515-1-nishit.sharma@intel.com>
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
 lib/igt_sysfs.c   | 29 +++++++++++++++------
 lib/xe/xe_query.c | 66 +++++++++++++++++++++++++----------------------
 lib/xe/xe_query.h |  1 +
 3 files changed, 57 insertions(+), 39 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 96ca57ed9..c31d1477a 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -233,9 +233,14 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
 	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
 		return NULL;
 
-	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
+	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device))) {
+		struct xe_device *xe_dev = xe_device_get(xe_device);
+
+		igt_assert(xe_dev);
+
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
-			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
+			 major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev, gt), gt);
+	}
 	else
 		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
 			 major(st.st_rdev), minor(st.st_rdev), gt);
@@ -306,8 +311,8 @@ bool xe_sysfs_gt_has_node(int xe_device, int gt, const char *node)
 char *
 xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
 {
+	int tile;
 	struct stat st;
-	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
 
 	if (xe_device < 0)
 		return NULL;
@@ -315,9 +320,16 @@ xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
 	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
 		return NULL;
 
-	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
-		 major(st.st_rdev), minor(st.st_rdev), tile, gt,
-		 xe_engine_class_short_string(class));
+	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device))) {
+		struct xe_device *xe_dev = xe_device_get(xe_device);
+
+		igt_assert(xe_dev);
+
+		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
+			 major(st.st_rdev), minor(st.st_rdev), drm_xe_get_tile(xe_dev, gt), gt);
+	} else
+		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
+			 major(st.st_rdev), minor(st.st_rdev), 0, gt, xe_engine_class_short_string(class));
 
 	if (!access(path, F_OK))
 		return path;
@@ -506,6 +518,7 @@ void igt_drm_debug_mask_reset_exit_handler(int sig)
  */
 void igt_drm_debug_mask_update(unsigned int mask_to_set)
 {
+	unsigned int new_debug_mask;
 	static bool debug_mask_read_once = true;
 	char buf[20];
 	int dir;
@@ -524,8 +537,8 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
 		}
 	}
 
-	igt_debug("Setting DRM debug mask to %d\n", mask_to_set);
-	snprintf(buf, sizeof(buf), "%d", mask_to_set);
+	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3b8a682f8..d522bc8fc 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -160,32 +160,6 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
 	return mem_regions;
 }
 
-static struct drm_xe_query_eu_stall *xe_query_eu_stall_new(int fd)
-{
-	struct drm_xe_query_eu_stall *query_eu_stall;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
-		.size = 0,
-		.data = 0,
-	};
-
-	/* Support older kernels where this uapi is not yet available */
-	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
-		return NULL;
-	igt_assert_neq(query.size, 0);
-
-	query_eu_stall = malloc(query.size);
-	igt_assert(query_eu_stall);
-
-	query.data = to_user_pointer(query_eu_stall);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	VG(VALGRIND_MAKE_MEM_DEFINED(query_eu_stall, query.size));
-
-	return query_eu_stall;
-}
-
 static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
 {
 	struct drm_xe_query_oa_units *oa_units;
@@ -343,7 +317,6 @@ static void xe_device_free(struct xe_device *xe_dev)
 	free(xe_dev->engines);
 	free(xe_dev->mem_regions);
 	free(xe_dev->vram_size);
-	free(xe_dev->eu_stall);
 	free(xe_dev);
 }
 
@@ -379,19 +352,22 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
+
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->engines = xe_query_engines(fd);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
-	xe_dev->eu_stall = xe_query_eu_stall_new(fd);
 	xe_dev->oa_units = xe_query_oa_units_new(fd);
 
 	/*
 	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
 	 * the allocation is large enough to hold the highest GT ID
 	 */
-	max_gt = igt_fls(xe_dev->gt_mask) - 1;
-	xe_dev->vram_size = calloc(max_gt + 1, sizeof(*xe_dev->vram_size));
-	xe_dev->visible_vram_size = calloc(max_gt + 1, sizeof(*xe_dev->visible_vram_size));
+	max_gt = ffsll(xe_dev->gt_mask) - 1;
+	xe_dev->vram_size = calloc(max_gt, sizeof(*xe_dev->vram_size));
+	xe_dev->visible_vram_size = calloc(max_gt, sizeof(*xe_dev->visible_vram_size));
 
 	for (int idx = 0; idx < xe_dev->gt_list->num_gt; idx++) {
 		struct drm_xe_gt *gt = &xe_dev->gt_list->gt_list[idx];
@@ -545,6 +521,18 @@ const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id)
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
@@ -726,6 +714,22 @@ xe_dev_FN(xe_number_engines, engines->num_engines, unsigned int);
  */
 xe_dev_FN(xe_has_vram, has_vram, bool);
 
+/*
+ * To check whether multi-tile supported in platform
+ * Function takes device descriptior and xe_device
+ * structure pointer
+ */
+static int
+is_multitile_plat(struct xe_device *xe_dev)
+{
+	int gt_id;
+
+	xe_for_each_gt(xe_dev->fd, gt_id)
+		if (xe_dev->gt_list->gt_list[gt_id].tile_id > 0)
+			return true;
+	return false;
+}
+
 /**
  * xe_vram_size:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index cc54ec956..ca6249b0d 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -101,6 +101,7 @@ unsigned int xe_dev_max_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
+uint32_t drm_xe_get_tile(struct xe_device *xe_dev, int gt_id);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
 struct drm_xe_engine *xe_engines(int fd);
-- 
2.43.0

