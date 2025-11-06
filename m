Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEF2CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 15:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED53710E92F;
	Thu,  6 Nov 2025 15:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bgxdt238";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5C110E92F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762442931; x=1793978931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QM57t3c4xsnaBAud1b55Vy27B7LYwG36RR+v7RPe69Y=;
 b=Bgxdt238h9rUckgMB351Ww1WarKJ0BnRr6Bwdg3AOzhC3U7DKnm9altr
 SzPLCsEefyaA2iVxokGbG8drEKUohRCrO8VS4shp7zwsmKSdbit3DsRlV
 WckKfIX0M70SDO9xVmrrlW2zIjDM7gwejJrAZMdhNbQ7gDpep25JZeNfR
 oNNOACWLtoTddhHkbgRoz8309LsXllM0G9ISBVQ+ExtZD6Nde532vivIt
 gyQgzIKouFrqKvcOfJSHjNmFExMzTQcOjb5B9dUNJ3BhdnwsebfLOK7V6
 B6yUFoYPnQp4noaEQhPojwXU0eAoGCuPSmTAGWADOfvnAlKAGahrLemK6 w==;
X-CSE-ConnectionGUID: GjQR5mL6R9OwGvqyAyPASA==
X-CSE-MsgGUID: ogLF77pJRN6ncWvASB1W0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75698736"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75698736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:28:51 -0800
X-CSE-ConnectionGUID: UnmWvmo7Q5y5wijvv+PK7A==
X-CSE-MsgGUID: PdEpfbx1TsGiggU/RgJn2w==
X-ExtLoop1: 1
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:28:49 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/6] lib/xe/xe_query: Add tile helpers and iteration
 macro
Date: Thu,  6 Nov 2025 16:28:07 +0100
Message-ID: <20251106152811.1997614-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106152811.1997614-1-marcin.bernatowicz@linux.intel.com>
References: <20251106152811.1997614-1-marcin.bernatowicz@linux.intel.com>
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add helpers for tile-level access:
 - xe_tiles_count(): return number of tiles
 - xe_tile_get_main_gt_id(): get MAIN GT ID for a tile
 - xe_for_each_tile(): iterate over tiles via tile_mask

v2: Add missing colon in function doc (Lukasz)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_query.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  6 ++++++
 2 files changed, 51 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..8e3e05fd3 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -515,6 +515,22 @@ unsigned int xe_dev_max_gt(int fd)
 	return igt_fls(xe_dev->gt_mask) - 1;
 }
 
+/**
+ * xe_tiles_count:
+ * @fd: xe device fd
+ *
+ * Return number of tiles for xe device fd.
+ */
+uint8_t xe_tiles_count(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	return igt_hweight(xe_dev->tile_mask);
+}
+
 /**
  * all_memory_regions:
  * @fd: xe device fd
@@ -995,6 +1011,35 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
 	return xe_dev->gt_list->gt_list[gt].tile_id;
 }
 
+/**
+ * xe_tile_get_main_gt_id:
+ * @fd: xe device fd
+ * @tile: tile id
+ *
+ * Returns main GT ID for given @tile.
+ */
+uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile)
+{
+	struct xe_device *xe_dev;
+	int gt_id = -1;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
+		const struct drm_xe_gt *gt_data = &xe_dev->gt_list->gt_list[i];
+
+		if (gt_data->tile_id == tile && gt_data->type == DRM_XE_QUERY_GT_TYPE_MAIN) {
+			gt_id = gt_data->gt_id;
+			break;
+		}
+	}
+
+	igt_assert_f(gt_id >= 0, "No main GT found for tile %d\n", tile);
+
+	return gt_id;
+}
+
 /**
  * xe_hwconfig_lookup_value:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f..bcdfb54b0 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -86,6 +86,10 @@ struct xe_device {
 	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
 	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
 	     igt_unique(__mask) &= ~(1ull << __gt))
+#define xe_for_each_tile(__fd, __tile) \
+	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
+	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
+	     igt_unique(__mask) &= ~(1ull << __tile))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
@@ -101,6 +105,7 @@ struct xe_device {
 
 unsigned int xe_number_gt(int fd);
 unsigned int xe_dev_max_gt(int fd);
+uint8_t xe_tiles_count(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
@@ -135,6 +140,7 @@ uint16_t xe_gt_type(int fd, int gt);
 bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
+uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
-- 
2.43.0

