Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123DFD64073
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 04:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DD310EAEC;
	Wed, 17 Dec 2025 04:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jr8QhjxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A75B10EAEC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 04:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765946113; x=1797482113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6tq0ZBuAy7/HMMc17pYnsRBr8OepT1CFeb+1u0lll+E=;
 b=Jr8QhjxBlUVwkzRCTn6qbecU3Yl5YUARZUpLAkJ1Phkhq2bnlFQGGqrt
 erO60li2k/unmye6uGBpzOiDLg4po0ogRX3jr/Hrf+wgNNNHuSi2laT44
 3rgDRDpq26izCMjfkGm/NXPBnHTEdMQe5UJENDPoUrmdD0FIaWcB/ufk2
 Q0FujJ0qHAMXag3ObtYfree6Aj64H7Y/L1rzV+kmk+WvFA61BfytXIN7D
 CMylc7LVv3rVMjq8YXwPaEWgcW4cLYz79NWndm2u5X4g7LbUmNFIFwwni
 jSAXo2im3x6HYe2JsYN1E5lVT+8iUMP0/HL9icMxLxPSOX8JFHNhpvZQX Q==;
X-CSE-ConnectionGUID: rpCeM+5YQPWXiOaxPF8jug==
X-CSE-MsgGUID: +uO+nkaNTiKPfK0vofoqVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85291436"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="85291436"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 20:35:12 -0800
X-CSE-ConnectionGUID: M2cNDFPsS7O33del1bSe9Q==
X-CSE-MsgGUID: 9galuaNSSD+Lyq1FDDztjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198196634"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 20:35:11 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v9 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Date: Wed, 17 Dec 2025 04:34:49 +0000
Message-ID: <20251217043450.241761-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217043450.241761-1-x.wang@intel.com>
References: <20251217043450.241761-1-x.wang@intel.com>
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

This allows IGT to query the exact IP version for xe platforms.

Key changes:
- Add xe_device_ipver field to xe_device structure
- set the graphics versions based on the GMD_ID
- Cache device ipver in global map indexed by devid for efficient lookup
- Implement xe_ipver_cache_lookup() to retrieve cached ipver by devid
- Clean up cached device ipver when xe_device is released

V2:
- add new struct xe_device_ipver to hold the ipver info
- separate cache map to eliminate collision (Roper, Matthew D)
- changed function name to xe_ipver_cache_lookup() to avoid
  confusion (Roper, Matthew D)

V3:
- optimize the coding style. (Summers, Stuart)

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.h |  6 +++++
 lib/xe/xe_query.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_query.h   |  4 ++++
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index cc2225110..424811f7c 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -100,6 +100,12 @@ struct intel_device_info {
 	const char *codename;
 };
 
+struct xe_device_ipver {
+	uint32_t devid;
+	uint16_t graphics_ver;
+	uint16_t graphics_rel;
+};
+
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
 
 const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 981d76948..823a29f2d 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -210,6 +210,22 @@ static struct xe_device_cache {
 	struct igt_map *map;
 } cache;
 
+static struct xe_ipver_cache {
+	pthread_mutex_t mutex;
+	struct igt_map *map;
+} xe_ipver;
+
+struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
+{
+	struct xe_device_ipver *ipver;
+
+	pthread_mutex_lock(&xe_ipver.mutex);
+	ipver = igt_map_search(xe_ipver.map, &devid);
+	pthread_mutex_unlock(&xe_ipver.mutex);
+
+	return ipver;
+}
+
 static struct xe_device *find_in_cache_unlocked(int fd)
 {
 	return igt_map_search(cache.map, &fd);
@@ -270,6 +286,24 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	/*
+	 * Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
+	 * We should use the hardcoded value for the non-GMD_ID platforms (ip_ver_major == 0)
+	 */
+	xe_dev->ipver.devid = 0;
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
+		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
+		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
+			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
+				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
+				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
+			xe_dev->ipver.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
+			xe_dev->ipver.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
+			xe_dev->ipver.devid = xe_dev->dev_id;
+			break;
+		}
+	}
+
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
@@ -304,6 +338,11 @@ struct xe_device *xe_device_get(int fd)
 	prev = find_in_cache_unlocked(fd);
 	if (!prev) {
 		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
+		if (xe_dev->ipver.devid) {
+			pthread_mutex_lock(&xe_ipver.mutex);
+			igt_map_insert(xe_ipver.map, &xe_dev->ipver.devid, &xe_dev->ipver);
+			pthread_mutex_unlock(&xe_ipver.mutex);
+		}
 	} else {
 		xe_device_free(xe_dev);
 		xe_dev = prev;
@@ -315,7 +354,15 @@ struct xe_device *xe_device_get(int fd)
 
 static void delete_in_cache(struct igt_map_entry *entry)
 {
-	xe_device_free((struct xe_device *)entry->data);
+	struct xe_device *xe_dev = (struct xe_device *)entry->data;
+
+	if (xe_dev->ipver.devid) {
+		pthread_mutex_lock(&xe_ipver.mutex);
+		igt_map_remove(xe_ipver.map, &xe_dev->ipver.devid, NULL);
+		pthread_mutex_unlock(&xe_ipver.mutex);
+	}
+
+	xe_device_free(xe_dev);
 }
 
 /**
@@ -365,13 +412,18 @@ static void xe_device_destroy_cache(void)
 	pthread_mutex_lock(&cache.cache_mutex);
 	igt_map_destroy(cache.map, delete_in_cache);
 	pthread_mutex_unlock(&cache.cache_mutex);
+	pthread_mutex_lock(&xe_ipver.mutex);
+	igt_map_destroy(xe_ipver.map, NULL);
+	pthread_mutex_unlock(&xe_ipver.mutex);
 }
 
 static void xe_device_cache_init(void)
 {
 	pthread_mutex_init(&cache.cache_mutex, NULL);
+	pthread_mutex_init(&xe_ipver.mutex, NULL);
 	xe_device_destroy_cache();
 	cache.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
+	xe_ipver.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
 }
 
 #define xe_dev_FN(_NAME, _FIELD, _TYPE) \
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index d7a9f95f9..19690cff3 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -74,6 +74,9 @@ struct xe_device {
 
 	/** @dev_id: Device id of xe device */
 	uint16_t dev_id;
+
+	/** @ipver: Device ip version */
+	struct xe_device_ipver ipver;
 };
 
 #define xe_for_each_engine(__fd, __hwe) \
@@ -181,6 +184,7 @@ static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
 }
 
 struct xe_device *xe_device_get(int fd);
+struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid);
 void xe_device_put(int fd);
 
 int xe_query_eu_count(int fd, int gt);
-- 
2.43.0

