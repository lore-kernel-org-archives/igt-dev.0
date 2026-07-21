Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2C4C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1807310E3CC;
	Tue, 21 Jul 2026 19:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpoxRUjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6440210E3AA
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660437; x=1816196437;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=QHFdcQzpQeynJZg+/Ok/pQGw1HHOcRXPQ5MRYgGTp/E=;
 b=KpoxRUjEwnxD95CDgR4Jaxa8zxFSIYD4539SdkE0Xr3EH4tCVXtfpaJK
 rZ+jyFZTyT6kuMEBAjbuUArUf1nJ+UDWR8DCE0GVWb+SJl1nEcl9HTYF/
 o4rKcxREaoKG+XD2VI2p7uiK6GprqCSuMwVCI6cdyTbSzg4nort8+q3wp
 KlBFUcft8tMmAoF1EmjEQq9hS+T+9WXStjf92JNfpUZ1l01qYeI0mCLap
 sKRnP9dAhyOgmcK7YE1kNxq9cjdmZNKmzZIyqug2If4ZLtNNUtvcNe6W5
 N6evKhIJGqbcgkGxNPr2Swk9uUzqj2rg3tnha3QQvL/MwCkI1UcuWgshy Q==;
X-CSE-ConnectionGUID: lq2e3RGDRmGhbla59cJr4g==
X-CSE-MsgGUID: HnHm/L+RRmKJNzp/G1+WXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637697"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637697"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:37 -0700
X-CSE-ConnectionGUID: lY2KwFgkQ/CfF+D2mnPZeQ==
X-CSE-MsgGUID: RHzLtrcmRyWGLHgOf3MyMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516573"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:35 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 15:59:57 -0300
Subject: [PATCH i-g-t 04/10] lib/xe: Cache workaround information in xe_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-4-0c147eeefefa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_query.c |  6 ++++++
 lib/xe/xe_query.h |  9 +++++++--
 lib/xe/xe_wa.c    | 37 ++++++++++++++++++++++++++++---------
 lib/xe/xe_wa.h    |  5 +++++
 4 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 68e60ddc75a2..ea095b207534 100644
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
index 59330d80fd1b..f70476945dee 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -80,6 +80,9 @@ struct xe_device {
 	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
 	struct intel_pat_cache *pat_cache;
 
+	/** @wa_cache: cached data for xe_wa() and related functions. */
+	void *wa_cache;
+
 	/**
 	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
 	 * UINT16_MAX if not available (older kernel).
@@ -99,10 +102,12 @@ struct xe_device {
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
index e4e1b0bb7972..0f4d2edc0795 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -22,14 +22,14 @@ static void free_wa_debugfs_dumps(char **dumps)
 	free(dumps);
 }
 
-static char **get_wa_debugfs_dumps(int fd)
+static char **get_wa_debugfs_dumps(int fd, uint64_t gt_mask)
 {
 	char **dumps;
 	int gt;
 	int debugfs_fd;
 	int count = 1; /* Device workarounds */
 
-	xe_for_each_gt(fd, gt)
+	xe_for_each_gt_from_mask(gt_mask, gt)
 		count++;
 
 	dumps = calloc(count + 1, sizeof(*dumps));
@@ -45,7 +45,7 @@ static char **get_wa_debugfs_dumps(int fd)
 	if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
 		goto err;
 
-	xe_for_each_gt(fd, gt) {
+	xe_for_each_gt_from_mask(gt_mask, gt) {
 		char name[32];
 
 		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
@@ -112,17 +112,36 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
  */
 int xe_wa(int fd, const char *wa)
 {
-	char **dumps = get_wa_debugfs_dumps(fd);
-	int ret = 0;
+	char **dumps = xe_device_get(fd)->wa_cache;
 
 	if (igt_warn_on(!dumps))
 		return -1;
 
 	for (char **dump = dumps; *dump; dump++)
-		if ((ret = debugfs_dump_has_wa(*dump, wa)))
-			break;
+		if (debugfs_dump_has_wa(*dump, wa))
+			return 1;
 
-	free_wa_debugfs_dumps(dumps);
+	return 0;
+}
+
+/**
+ * xe_wa_build_cache: Build cached data for xe_wa().
+ * @xe_dev: Xe device where the cache will be stashed.
+ */
+void xe_wa_build_cache(struct xe_device *xe_dev)
+{
+	xe_dev->wa_cache = get_wa_debugfs_dumps(xe_dev->fd, xe_dev->gt_mask);
+}
+
+/**
+ * xe_wa_free_cache: Free cached data that was built with xe_wa_build_cache().
+ * @xe_dev: Xe device where the cached data is stashed.
+ */
+void xe_wa_free_cache(struct xe_device *xe_dev)
+{
+	if (!xe_dev->wa_cache)
+		return;
 
-	return ret;
+	free_wa_debugfs_dumps(xe_dev->wa_cache);
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

