Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371D606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kQTYmzGs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB5110E2A8;
	Fri, 23 Oct 2026 21:13:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252C310E2A8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789396; x=1824325396;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=4VRd+7u9yYIePUCSPWspNKwPEdnZmPPuFsdkbHBv7o8=;
 b=kQTYmzGs7clcWdbcZeuWzitqlo+s/WDGaxKP1yC6IRGNrEra8hItM7rV
 FukLgbMKbk+sD75gaw3NKM4xZzLBn/1d7AYpayB5rQBlekephcwIepl3I
 ZKt+JXXMv48uODMXefA0PcINX57d3BTrpJbBTlqiWO3DNMSvD6PtHwxnO
 7doI/XLnoWRRLRqheAWTqOBX7flSmf00dMJYJi9wW1o9vlfKiT7gFyPwZ
 FwhMtfxwqRUg7OniAMgb4kUmaSH0rMWATDaSC+8/AjyUNAVwcnqWQCbYV
 ahwHwNLvSg8k+ROl2RTSUQeoy5vSwLCxHmTbqymfkYPst70CoS9cAGoOK g==;
X-CSE-ConnectionGUID: ogThbaFhT1GKkyU23Fmefg==
X-CSE-MsgGUID: Xj/g115RTourgqwPkU8nDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457463"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457463"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:12 -0700
X-CSE-ConnectionGUID: 7w+1qdOqSE2w4zpCg4tP8g==
X-CSE-MsgGUID: GXnv285vSAqtuyYoLrr48w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585792"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:11 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:39 -0300
Subject: [PATCH i-g-t v3 04/11] lib/xe: Cache workaround information in
 xe_device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-4-b8723ececb7f@intel.com>
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
v3:
  - Drop igt_warn_on() from xe_wa_build_cache(), since build_cache()
    already contains the necessary warning/debug calls.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com> # v2
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_query.c |  6 ++++++
 lib/xe/xe_query.h | 10 ++++++++--
 lib/xe/xe_wa.c    | 47 +++++++++++++++++++++++++++++------------------
 lib/xe/xe_wa.h    |  5 +++++
 4 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a15099cb3be1..daf4063af1af 100644
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
 
@@ -458,6 +462,8 @@ struct xe_device *xe_device_get(int fd)
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
index aaa0003297a4..d133532c01cb 100644
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
@@ -111,7 +111,7 @@ static struct xe_wa_cache *build_cache(int fd)
 	 * workarounds, let's avoid creating noise with igt_warn_on()
 	 * and limit ourselves to use igt_debug_on() here.
 	 */
-	if (igt_debug_on(get_wa_debugfs_dumps(fd, wa_cache))) {
+	if (igt_debug_on(get_wa_debugfs_dumps(fd, gt_mask, wa_cache))) {
 		free_cache(wa_cache);
 
 		return NULL;
@@ -189,22 +189,33 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
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
2.56.0

