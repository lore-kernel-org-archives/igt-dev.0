Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2870CCD1A5
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 23:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ABF10E53C;
	Mon, 20 Oct 2025 23:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY3mtsX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2DF10E53D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761001976; x=1792537976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=alahBeqNlxcT26v0EUmtdf2nnCW5qVVgUTQKEN4t/yc=;
 b=RY3mtsX8SUaFJ0Qr3cK67iNNcqWb1q2wi5qcczwAdZovAAndNOt7ocOA
 3numCb3TVirvV2HJ4NYpcCUmEd3DXLgkGz6btDOgAE+YKYdWvRioXDVXu
 seRoztWSEFFMDFMoJT9N1/7aWJa5LC2jzWHPDJziVOVvc6Fb32/I07/zL
 ce2HpC1l5PdSDTt8/VJb2dqCK5XSbqpGq00oOxNYysMUz7gT2JD/e1Mmm
 ARpVsbqPKz20Fkv/5PXkc57K4x0vxPcpAJrhFrYs5YvkFI2MH6nwQdJmt
 q/OS9HqsV9A2N+Lp4RG/MPkd8k6IpcLE+CVttOGBy9h4qLAzuju0WKnfQ A==;
X-CSE-ConnectionGUID: iCFeR8pbTWe4ZJ4eEs6KaQ==
X-CSE-MsgGUID: i0aaNAS5RcOVGxXL6ZRG5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73797665"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73797665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:12:56 -0700
X-CSE-ConnectionGUID: xjaeBA9bRlaw7bwtzQZeZQ==
X-CSE-MsgGUID: ZycdR06dSAyyzuDdRjQEOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="220605173"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.81])
 by orviesa001.jf.intel.com with ESMTP; 20 Oct 2025 16:12:56 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v8 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Date: Mon, 20 Oct 2025 23:12:52 +0000
Message-ID: <20251020231253.138842-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020231253.138842-1-x.wang@intel.com>
References: <20251020231253.138842-1-x.wang@intel.com>
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

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_chipset.h |  6 +++++
 lib/xe/xe_query.c   | 53 ++++++++++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_query.h   |  4 ++++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2f6bf788a..2dd214413 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -98,6 +98,12 @@ struct intel_device_info {
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
index a89e0b980..5d8accd47 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -319,6 +319,22 @@ static struct xe_device_cache {
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
@@ -379,6 +395,23 @@ struct xe_device *xe_device_get(int fd)
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
 
+	/*
+	* Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
+	* We should use the hardcoded value for the none GMD_ID platforms (ip_ver_major == 0)
+	*/
+	xe_dev->ipver.devid = 0;
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
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
+
 	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
 		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
@@ -413,6 +446,11 @@ struct xe_device *xe_device_get(int fd)
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
@@ -424,7 +462,15 @@ struct xe_device *xe_device_get(int fd)
 
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
@@ -474,13 +520,18 @@ static void xe_device_destroy_cache(void)
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
index 715b64e2f..4e8ba0372 100644
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
@@ -140,6 +143,7 @@ int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 
 struct xe_device *xe_device_get(int fd);
+struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid);
 void xe_device_put(int fd);
 
 #endif	/* XE_QUERY_H */
-- 
2.43.0

