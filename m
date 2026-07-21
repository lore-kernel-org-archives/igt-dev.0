Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D78CC4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC9D10E3BF;
	Tue, 21 Jul 2026 19:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXcaC6DR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FECD10E3AA
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660441; x=1816196441;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5wjvKlB663izZRj4Tod0TQrR+HE1MemN3XS/ZjmKQ78=;
 b=GXcaC6DRtpwn+sidzyY07h+yPn+bT7ZSs2HN7Rdx6s3URm7UNIC0Xnwl
 2oa2gPhNitgwf9stMQLNt/F89kbl5D2ebZ6e4+RtKq5EKT5oFkHzhJ15U
 BKaQSv456wTV3R21i0uIYdyeSk7/lafhiGGKYrlZS1l37IwV45THBH93/
 GcA8i0gUkP1mhvqqkDEvJwyShgPliathT7xXvxRaQvqmK7U5ZKrkYC3Fp
 Pq8j4sXMfy1SFxtYplOflThKBultjzR2T6evITbi0QXFt4nDfU7xsFWeP
 msAuGN3lzuRJPsX2FH5jNDWoHBguZFO5UCWY25yuFpw8pwhG1peOosThz Q==;
X-CSE-ConnectionGUID: BFMIUSeHSvCTajlAv5girQ==
X-CSE-MsgGUID: VruqAFg7SXewQVLJBqltOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637709"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637709"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:41 -0700
X-CSE-ConnectionGUID: w/Lzs7c4TsacfU6aqF8FWw==
X-CSE-MsgGUID: QZP81vkXQsK9NjL/OaRc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516605"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:39 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 16:00:01 -0300
Subject: [PATCH i-g-t 08/10] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-8-0c147eeefefa@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/intel_pat.c   | 27 ++++++++++++++++++++++++++-
 lib/intel_pat.h   |  5 +++++
 lib/xe/xe_query.c |  9 ++-------
 lib/xe/xe_query.h |  4 +---
 4 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 2f35bb77249f..14935e3c4692 100644
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
index a31b60e86e2a..fc9ef9b650bf 100644
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
@@ -40,4 +42,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd);
 int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 
+void intel_pat_build_xe_cache(struct xe_device *xe_dev);
+void intel_pat_free_xe_cache(struct xe_device *xe_dev);
+
 #endif /* INTEL_PAT_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index ea095b207534..aa81db45a41a 100644
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
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index f70476945dee..82f72314f072 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -20,8 +20,6 @@
 #define XE_DEFAULT_ALIGNMENT           SZ_4K
 #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
 
-struct intel_pat_cache;
-
 struct xe_device {
 	/** @fd: xe fd */
 	int fd;
@@ -78,7 +76,7 @@ struct xe_device {
 	uint16_t dev_id;
 
 	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
-	struct intel_pat_cache *pat_cache;
+	void *pat_cache;
 
 	/** @wa_cache: cached data for xe_wa() and related functions. */
 	void *wa_cache;

-- 
2.55.0

