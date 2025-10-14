Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E9CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 06:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1087510E54B;
	Tue, 14 Oct 2025 06:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R08gAlG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BF010E549
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760424092; x=1791960092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNtp4X4VAQo3LGnbuBSVOeUy4T84YONsM2FmoDQaoO0=;
 b=R08gAlG3NeKN/P5saotnn2qM8bRKpWVk8B7ulz3hmMFwLtx2FR4yC4Ks
 ZTptv5+zzVrQWPMHzN/xN0Xl46pbf12Vtg7bETpQReN7Y7boxKRoiUFsS
 CfGLOQvGOV71QoIEZePgBvT+KBNhiod62nStWqMri+WTLIUEpLXw0t+H9
 wWduVLlBwnm3o/PvXJU0/OEDc6yikCTmiUgPlN6Sp9NWph8DjAyG6TnqV
 U7HN3tgwcCU2o5zSqrPBi0DjuUejROZesV7/fY8pC9XnQzQ4ljpvmmh+w
 01sYYolqKJeOJWDvU1Tn7yB456KE4Ve0l9qKGb011ThemWqQwR/AjNMv4 w==;
X-CSE-ConnectionGUID: IepeRU3qRWSvLPhUbrCJug==
X-CSE-MsgGUID: OtGfcORFTSu4LOBAsUcZlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="88038269"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="88038269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:41:32 -0700
X-CSE-ConnectionGUID: 0KJYBw0eT1KArIwuKFVqjg==
X-CSE-MsgGUID: 2pjzt4egSDOizbwT+Ny/MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="205496571"
Received: from fmbmgg31rpls058.fm.intel.com (HELO DUT6304BMGFRD.fm.intel.com)
 ([10.36.21.81])
 by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 23:41:32 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v4 1/2] lib/xe: Add runtime device info with graphics_rel from
 GMD_ID
Date: Tue, 14 Oct 2025 06:41:27 +0000
Message-ID: <20251014064128.36139-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014064128.36139-1-x.wang@intel.com>
References: <20251014064128.36139-1-x.wang@intel.com>
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

Add intel_device_info support to xe_device to store accurate runtime
device information retrieved from the GMD_ID ioctl. This allows IGT to
query the exact IP version including the minor revision (graphics_rel)
for xe platforms.

Key changes:
- Add intel_device_info field to xe_device structure
- Populate device info from static PCI table initially
- Override graphics_rel with runtime ip_ver_minor from main GT for
  GMD_ID platforms (where ip_ver_major != 0)
- Cache device info in global map indexed by devid for efficient lookup
- Implement xe_device_get_info() to retrieve cached info by devid
- Clean up cached device info entry when xe_device is released

For non-GMD_ID platforms (DG2, ADL, ATSM), the hardcoded graphics_rel
value from PCI table is preserved.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/xe/xe_query.c | 32 ++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..74e1aacf9 100644
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
@@ -375,9 +386,26 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 
+	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id), sizeof(xe_dev->info));
+
 	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
+	/*
+	* Set graphics_rel based on the main GT's ip_ver_minor. We should
+	* use the hardcoded value for the none GMD_ID (ip_ver_major == 0)
+	* platforms (e.g. DG2,ADL,ATSM)
+	*/
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
+		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
+			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
+				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
+				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
+			igt_assert(xe_dev->info.graphics_ver == xe_dev->gt_list->gt_list[gt].ip_ver_major);
+			xe_dev->info.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
+			break;
+		}
 
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
@@ -413,6 +441,7 @@ struct xe_device *xe_device_get(int fd)
 	prev = find_in_cache_unlocked(fd);
 	if (!prev) {
 		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
+		igt_map_insert(cache.map, &xe_dev->dev_id, &xe_dev->info);
 	} else {
 		xe_device_free(xe_dev);
 		xe_dev = prev;
@@ -424,6 +453,9 @@ struct xe_device *xe_device_get(int fd)
 
 static void delete_in_cache(struct igt_map_entry *entry)
 {
+	struct xe_device *xe_dev = (struct xe_device *)entry->data;
+	struct igt_map_entry *entry_info = igt_map_search(cache.map, &xe_dev->dev_id);
+	igt_map_remove_entry(cache.map, entry_info);
 	xe_device_free((struct xe_device *)entry->data);
 }
 
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

