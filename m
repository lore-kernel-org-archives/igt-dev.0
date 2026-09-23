Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283BBC98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207910E11F;
	Wed, 23 Sep 2026 21:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGiXLP8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354510F1DF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199715; x=1821735715;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wWkw5u52wx+A5HHsOL9A7tK4Gb0RV9hKZSWEldVqbg0=;
 b=fGiXLP8ww5hU1h2R9y9TRgLWmWP7xKnQUXa/vZlAytkWgxo0wwnTa3/P
 DFkqyvtzoIVz1wSgzmFzGE1vorOYQsgdxIitUntYe3qL/wi4XKfs4/M+z
 bBR4wLExfXOwq2Twqsu/caQvcLIKOQfT5xLiIR2W74dy/FzXsZwlm5VcY
 CKryKRTyKbkiPzlhwXxrswpWYhSwVLExyLRUokbxHtKN7Bgwi1dRDlvV4
 eBIsjYHdNF6GYF5utdpYLmZV9chekxbUihKJ1BkQfQ1YQAzCBJBZahS2p
 v++KWCruvi/JGEZqSfhjGQID2hlymhkpSiZk218xNNuPuQYKbN0zUZSCb g==;
X-CSE-ConnectionGUID: fC9ZE+wIQy6gEIJ7l/Qnxw==
X-CSE-MsgGUID: fzG8Rdt1RS2V9f2dD3Zbpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445419"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445419"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:55 -0700
X-CSE-ConnectionGUID: c5/VRHJmRNWhS4Mo3bQDiw==
X-CSE-MsgGUID: bPiZnGiEQDGz0knZI4PA7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907726"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:51 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:16 -0300
Subject: [PATCH i-g-t v2 09/11] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-9-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

Currently xe_device_get() manages the PAT cached information
information by itself, by doing the necessary memory
allocation/deallocation and calling xe_get_pat_sw_config() to
initialize the cached information.

Such management is arguably better suited to be implemented as part of
the intel_pat module and encapsulated such that xe_query doesn't need
to know the details.

We will introduce changes that will require an extra logic for
initializing the cache and having such encapsulation makes it much
easier to implement.  Since we will touch this area, take this
opportunity to move the existing management to intel_pat.

v2:
  - Don't use void pointer as type of pat_cache. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/intel_pat.c   | 27 ++++++++++++++++++++++++++-
 lib/intel_pat.h   |  5 +++++
 lib/xe/xe_query.c |  9 ++-------
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index da7ba1e51b16..db0f057cbd1e 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -144,6 +144,31 @@ int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
 	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
 }
 
+void intel_pat_build_xe_cache(struct xe_device *xe_dev)
+{
+	struct intel_pat_cache *pat_cache;
+
+	pat_cache = calloc(1, sizeof(*pat_cache));
+	igt_assert(pat_cache);
+
+	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
+		free(pat_cache);
+		return;
+	}
+
+	xe_dev->pat_cache = pat_cache;
+}
+
+void intel_pat_free_xe_cache(struct xe_device *xe_dev)
+{
+	if (!xe_dev->pat_cache)
+		return;
+
+	free(xe_dev->pat_cache);
+
+	xe_dev->pat_cache = NULL;
+}
+
 /*
  * Hardcoded PAT indices for Xe platforms, used as a fallback when the
  * kernel doesn't expose gt0/pat_sw_config in debugfs.
@@ -217,7 +242,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 		struct xe_device *xe_dev = xe_device_get(fd);
 
 		if (xe_dev->pat_cache) {
-			*pat = *xe_dev->pat_cache;
+			*pat = *((struct intel_pat_cache *)xe_dev->pat_cache);
 		} else if (xe_pat_fallback(fd, pat)) {
 			igt_info("PAT sw_config debugfs not available, "
 				 "using hardcoded fallback\n");
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index 52a61e8d25fb..fc8fa3fa9f45 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -13,6 +13,8 @@
 #define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
 #define XE_PAT_MAX_ENTRIES 32
 
+struct xe_device;
+
 struct xe_pat_entry {
 	uint32_t pat;
 	bool rsvd;
@@ -42,4 +44,7 @@ bool intel_has_pat_wt(int fd);
 int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 
+void intel_pat_build_xe_cache(struct xe_device *xe_dev);
+void intel_pat_free_xe_cache(struct xe_device *xe_dev);
+
 #endif /* INTEL_PAT_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index d2c4329aa317..e7945c8923db 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -377,8 +377,8 @@ static void xe_device_free(struct xe_device *xe_dev)
 	free(xe_dev->mem_regions);
 	free(xe_dev->vram_size);
 	free(xe_dev->eu_stall);
-	free(xe_dev->pat_cache);
 
+	intel_pat_free_xe_cache(xe_dev);
 	xe_wa_free_cache(xe_dev);
 
 	free(xe_dev);
@@ -458,12 +458,7 @@ struct xe_device *xe_device_get(int fd)
 	 * should be extended to cache PAT entries by platform version/
 	 * revision instead.
 	 */
-	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
-	igt_assert(xe_dev->pat_cache);
-	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache, 0) <= 0) {
-		free(xe_dev->pat_cache);
-		xe_dev->pat_cache = NULL;
-	}
+	intel_pat_build_xe_cache(xe_dev);
 
 	/* We may get here from multiple threads, use first cached xe_dev */
 	pthread_mutex_lock(&cache.cache_mutex);

-- 
2.55.0

