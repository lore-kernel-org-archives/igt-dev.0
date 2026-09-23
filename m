Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3E1C98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD29610E11F;
	Wed, 23 Sep 2026 21:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTBzR5In";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E24710F1E2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199714; x=1821735714;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CY2T7A37SVO0jGMch/zEJGD71pyhM0QQuOUDMV7fTGg=;
 b=LTBzR5InaOLpFQ3ciVgLyplPraFpCbfgLKlsRxHpTEiWSkf0cL7jIsxt
 0gsM8oY3hIKx/9x31wAidZw5PxZD9KMjrHC0DUw9DhR+j5TNL3uwmySFG
 lZAblfWtmnDuYrI7LPMpi13KAUVVZbIEGGvMlM0tmMCmy5VrlsnlpfJoM
 sYmNGKgvuooT9l3Mmtglzqg7W0xnTuPwuZ8Vnjh2arP2slIxuM9ZhtmFd
 2FQ9gt65Uy+Qqiz9EDj+l+0kUTyatplprr1+c4goT+xXGSD/BLMTK4SSb
 rIf9lFru6lkobZkMPbZT+a+O6GO3wUNyZr/HGF2qLEMgBLsZRN82ayR/g A==;
X-CSE-ConnectionGUID: 4hxVYdiZRX6aup+SYTcWqA==
X-CSE-MsgGUID: m+J4Qs7xQ82nqw0ie69NjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445403"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445403"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:53 -0700
X-CSE-ConnectionGUID: CaGAU+V7Qzu/AyUViDJHWA==
X-CSE-MsgGUID: +afCQFStSh297xI3bl+C8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907699"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:44 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:11 -0300
Subject: [PATCH i-g-t v2 04/11] lib/xe: Cache workaround information in
 xe_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-4-528b575299d2@intel.com>
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

One existing inconvenience with xe_wa() is that it needs to dump from
debugfs every time it is called.  A more concerning issue is that the
dump will fail if xe_wa() is called from a context without the
required privileges.

We currently have only one user of xe_wa(), but shortly we will have
another user that will need to check for a certain workaround in a
non-root user context (in test cases that use igt_drop_root()).

Let's resolve those issues by ensuring that xe_device_get() caches the
workaround information.  Tests that need to check for workarounds in
underprivileged context will need to make sure to call xe_device_get()
before dropping privileges.

Note that this change also requires us to introduce and use thew new
macro xe_for_each_gt_from_mask() to avoid infinite recursion that
would happen if we were to use xe_for_each_gt(), as the latter would
call xe_device_get() again.

v2:
  - Add note clarifying the need of the new macro
    xe_for_each_gt_from_mask().
  - Use a struct xe_wa_cache type instead of having struct xe_device
    declaring wa_cache as a void pointer.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_query.c |  6 ++++++
 lib/xe/xe_query.h | 10 ++++++++--
 lib/xe/xe_wa.c    | 48 ++++++++++++++++++++++++++++++------------------
 lib/xe/xe_wa.h    |  5 +++++
 4 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 91ffc36e6425..d2c4329aa317 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -28,6 +28,7 @@
 
 #include "xe_query.h"
 #include "xe_ioctl.h"
+#include "xe_wa.h"
 
 /**
  * xe_query_device_may_fail:
@@ -377,6 +378,9 @@ static void xe_device_free(struct xe_device *xe_dev)
 	free(xe_dev->vram_size);
 	free(xe_dev->eu_stall);
 	free(xe_dev->pat_cache);
+
+	xe_wa_free_cache(xe_dev);
+
 	free(xe_dev);
 }
 
@@ -441,6 +445,8 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
 
+	xe_wa_build_cache(xe_dev);
+
 	/*
 	 * Populate the PAT cache while we still have sufficient privileges
 	 * to read debugfs.  Forked children that inherit this xe_device
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 59330d80fd1b..c50df0e34320 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -21,6 +21,7 @@
 #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
 
 struct intel_pat_cache;
+struct xe_wa_cache;
 
 struct xe_device {
 	/** @fd: xe fd */
@@ -80,6 +81,9 @@ struct xe_device {
 	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
 	struct intel_pat_cache *pat_cache;
 
+	/** @wa_cache: cached data for xe_wa() and related functions. */
+	struct xe_wa_cache *wa_cache;
+
 	/**
 	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
 	 * UINT16_MAX if not available (older kernel).
@@ -99,10 +103,12 @@ struct xe_device {
 #define xe_for_each_engine_class(__class) \
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
-#define xe_for_each_gt(__fd, __gt) \
-	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
+#define xe_for_each_gt_from_mask(__gt_mask, __gt) \
+	for (uint64_t igt_unique(__mask) = __gt_mask; \
 	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
 	     igt_unique(__mask) &= ~(1ull << __gt))
+#define xe_for_each_gt(__fd, __gt) \
+	xe_for_each_gt_from_mask(xe_device_get(__fd)->gt_mask, __gt)
 #define xe_for_each_tile(__fd, __tile) \
 	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
 	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index 93b97c7c1476..59064219cd96 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -30,18 +30,18 @@ static void free_wa_debugfs_dumps(struct xe_wa_cache *wa_cache)
 	}
 }
 
-static int get_wa_debugfs_count(int fd)
+static int get_wa_debugfs_count(int fd, uint64_t gt_mask)
 {
 	int gt;
 	int count = 1; /* Device workarounds */
 
-	xe_for_each_gt(fd, gt)
+	xe_for_each_gt_from_mask(gt_mask, gt)
 		count++;
 
 	return count;
 }
 
-static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
+static int get_wa_debugfs_dumps(int fd, uint64_t gt_mask, struct xe_wa_cache *wa_cache)
 {
 	int gt;
 	int debugfs_fd;
@@ -57,7 +57,7 @@ static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
 	if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
 		goto err;
 
-	xe_for_each_gt(fd, gt) {
+	xe_for_each_gt_from_mask(gt_mask, gt) {
 		char name[32];
 
 		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
@@ -90,12 +90,12 @@ static void free_cache(struct xe_wa_cache *wa_cache)
 	free(wa_cache);
 }
 
-static struct xe_wa_cache *build_cache(int fd)
+static struct xe_wa_cache *build_cache(int fd, uint64_t gt_mask)
 {
 	struct xe_wa_cache *wa_cache;
 	int num_dumps;
 
-	num_dumps = get_wa_debugfs_count(fd);
+	num_dumps = get_wa_debugfs_count(fd, gt_mask);
 	wa_cache = calloc(1, sizeof(*wa_cache) + num_dumps * sizeof(wa_cache->dumps[0]));
 
 	if (igt_warn_on(!wa_cache))
@@ -103,7 +103,7 @@ static struct xe_wa_cache *build_cache(int fd)
 
 	wa_cache->num_dumps = num_dumps;
 
-	if (igt_warn_on(get_wa_debugfs_dumps(fd, wa_cache))) {
+	if (igt_warn_on(get_wa_debugfs_dumps(fd, gt_mask, wa_cache))) {
 		free_cache(wa_cache);
 
 		return NULL;
@@ -181,22 +181,34 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
  */
 int xe_wa(int fd, const char *wa)
 {
-	struct xe_wa_cache *wa_cache = build_cache(fd);
-	int ret;
+	struct xe_wa_cache *wa_cache = xe_device_get(fd)->wa_cache;
 
 	if (igt_warn_on(!wa_cache))
 		return -1;
 
-	ret = 0;
+	for (int i = 0; i < wa_cache->num_dumps; i++)
+		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa))
+			return 1;
 
-	for (int i = 0; i < wa_cache->num_dumps; i++) {
-		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa)) {
-			ret = 1;
-			break;
-		}
-	}
+	return 0;
+}
 
-	free_cache(wa_cache);
+/**
+ * xe_wa_build_cache: Build cached data for xe_wa().
+ * @xe_dev: Xe device where the cache will be stashed.
+ */
+void xe_wa_build_cache(struct xe_device *xe_dev)
+{
+	xe_dev->wa_cache = build_cache(xe_dev->fd, xe_dev->gt_mask);
+	igt_warn_on(!xe_dev->wa_cache);
+}
 
-	return ret;
+/**
+ * xe_wa_free_cache: Free cached data that was built with xe_wa_build_cache().
+ * @xe_dev: Xe device where the cached data is stashed.
+ */
+void xe_wa_free_cache(struct xe_device *xe_dev)
+{
+	free_cache(xe_dev->wa_cache);
+	xe_dev->wa_cache = NULL;
 }
diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
index 4ff897196545..f0a826553df8 100644
--- a/lib/xe/xe_wa.h
+++ b/lib/xe/xe_wa.h
@@ -6,6 +6,11 @@
 #ifndef XE_WA_H
 #define XE_WA_H
 
+struct xe_device;
+
 int xe_wa(int fd, const char *wa);
 
+void xe_wa_build_cache(struct xe_device *xe_dev);
+void xe_wa_free_cache(struct xe_device *xe_dev);
+
 #endif /* XE_WA_H */

-- 
2.55.0

