Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767A3CCD192
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 03:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBB210E6E9;
	Wed, 15 Oct 2025 03:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGbWUWl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5A310E6EA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 03:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760498232; x=1792034232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rf7E0Mw84ExG8BXg+QOvZDHr7/Oixy/HiEy5XO0pRNQ=;
 b=FGbWUWl63i9kORUqzD0yDD46+S3j6EdyJncq0Zq19291mWO7wL9N/rEZ
 Y+/Beom88g9kEdvLrx8DCugU868b69uEqAhNfDrkOXEZ6rFiGG+bwuD5b
 asjZ8QOit52Iby7y57N7vk00Gsi0Nj0TdMtOSnRFTPXErkO77ju55qDJ4
 2dXYgazjdabPZotngeRqGgkBxk7wxBOfVWZrsmwrQAPgo6ky8BbF3T+BI
 737IwnJfQ8it7YQ6FCZlujOn06exVd8n35mlEKmDedLmBysZHkZ5p+JYc
 7tPc+9nH5jZZJP2w+Ua/F4CcsrmfMwfjUjpB9DwRDSnu6rWcBHv+nqBfL A==;
X-CSE-ConnectionGUID: sXFKr9QnSsy5vJyZLFjmeg==
X-CSE-MsgGUID: pxnOneJCSUaWUpzxRWB2Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62577181"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62577181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 20:17:12 -0700
X-CSE-ConnectionGUID: uwh58ajtQQOlf6bAc7va3g==
X-CSE-MsgGUID: 3fD3wy1NTZuTTdg9FteFCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="186302557"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.81])
 by orviesa004.jf.intel.com with ESMTP; 14 Oct 2025 20:17:11 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v6 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Date: Wed, 15 Oct 2025 03:17:08 +0000
Message-ID: <20251015031709.73133-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015031709.73133-1-x.wang@intel.com>
References: <20251015031709.73133-1-x.wang@intel.com>
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

Add intel_device_info support to xe_device to store accurate graphics versions
retrieved from the GMD_ID ioctl. This allows IGT to query the exact IP version
for xe platforms.

Key changes:
- Add intel_device_info field to xe_device structure
- set the graphics versions based on the GMD_ID
- Cache device info in global map indexed by devid for efficient lookup
- Implement xe_device_get_info() to retrieve cached info by devid
- Clean up cached device info entry when xe_device is released

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/xe/xe_query.c | 33 ++++++++++++++++++++++++++++++++-
 lib/xe/xe_query.h |  4 ++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..b7c9a2bec 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -335,6 +335,17 @@ static struct xe_device *find_in_cache(int fd)
 	return xe_dev;
 }
 
+struct intel_device_info *xe_device_get_info(uint32_t devid)
+{
+	struct intel_device_info *xe_dev_info;
+
+	pthread_mutex_lock(&cache.cache_mutex);
+	xe_dev_info = igt_map_search(cache.map, &devid);
+	pthread_mutex_unlock(&cache.cache_mutex);
+
+	return xe_dev_info;
+}
+
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
@@ -379,6 +390,21 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	/*
+	* Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
+	* We should use the hardcoded value for the none GMD_ID platforms (ip_ver_major == 0)
+	*/
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
+		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
+			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
+				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
+				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
+			xe_dev->info.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
+			xe_dev->info.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
+			break;
+		}
+
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
@@ -413,6 +439,7 @@ struct xe_device *xe_device_get(int fd)
 	prev = find_in_cache_unlocked(fd);
 	if (!prev) {
 		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
+		igt_map_insert(cache.map, &xe_dev->dev_id, &xe_dev->info);
 	} else {
 		xe_device_free(xe_dev);
 		xe_dev = prev;
@@ -424,7 +451,11 @@ struct xe_device *xe_device_get(int fd)
 
 static void delete_in_cache(struct igt_map_entry *entry)
 {
-	xe_device_free((struct xe_device *)entry->data);
+	struct xe_device *xe_dev = (struct xe_device *)entry->data;
+	struct igt_map_entry *info_entry = igt_map_search(cache.map, &xe_dev->dev_id);
+
+	igt_map_remove_entry(cache.map, info_entry);
+	xe_device_free(xe_dev);
 }
 
 /**
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f..1a261866f 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -74,6 +74,9 @@ struct xe_device {
 
 	/** @dev_id: Device id of xe device */
 	uint16_t dev_id;
+
+	/** @info: Device information for compatibility with i915 */
+	struct intel_device_info info;
 };
 
 #define xe_for_each_engine(__fd, __hwe) \
@@ -140,6 +143,7 @@ int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 
 struct xe_device *xe_device_get(int fd);
+struct intel_device_info *xe_device_get_info(uint32_t devid);
 void xe_device_put(int fd);
 
 #endif	/* XE_QUERY_H */
-- 
2.43.0

