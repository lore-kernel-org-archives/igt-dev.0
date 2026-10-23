Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D27606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D74qMyLE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6891D10E11E;
	Fri, 23 Oct 2026 21:11:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B8310E54B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789404; x=1824325404;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ZorkuHf5tMZcjLWrxqc1XcJVP1ISsO8vr45nOboDbtM=;
 b=D74qMyLEALcknBInaiNo+Usl1aiAIXuWs0/Gj8IALXvRu9Qob/IEOVQt
 epMjMM1Z7VyE6JQcQesRBiTJdWOC4gdOmbnhSxt6gptQPF8WCu+dtEmlw
 +kILtcCRsEM9eWfgx3DLBdkUOeu/jk1sAN8cAh0ebYrbIPWkFnfzFYv6r
 Px5MigXhDPQTXtkxq6AN2bnLw+k/IS2J8IJc4guVfZRCnfM0r/hW+ozWe
 2HxgDh12EcvA12+TFFTTxdBnY/ZuZ+DXECfbUs0gMrPx6U1G4zXmZr2U0
 Sk/w4WdsIxtOl00gNOjE7lPn4MnlDg/2fPRQ1pErAsaT/Vf0coOF3Bl1o w==;
X-CSE-ConnectionGUID: wqbVQiQpQhixNpRqCC19CA==
X-CSE-MsgGUID: yUy0MkIkR+6jiizwFwrjRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457471"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457471"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:19 -0700
X-CSE-ConnectionGUID: o85gW28oRRmHZVwThK+97A==
X-CSE-MsgGUID: 5G/8SnQ8Tsq15MPASVN+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585829"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:18 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:44 -0300
Subject: [PATCH i-g-t v3 09/11] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-9-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
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
index daf4063af1af..2566d02fcccf 100644
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
@@ -475,12 +475,7 @@ struct xe_device *xe_device_get(int fd)
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
2.56.0

