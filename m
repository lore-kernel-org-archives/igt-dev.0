Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D64F47CB6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 18:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE9710E2E7;
	Thu,  5 Mar 2026 18:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEK+6OKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3058910E2E7
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772736875; x=1804272875;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ydhUPrLD6IyHOzoqZ2LEXip1yB7eqyCGpsYbHXOGWnI=;
 b=JEK+6OKMN277sGbNlZmTOjRjIjY2p5DWmTFkJfRiasNzvQn3RryXmUHa
 /Zr1Ha4ShLbvPXQtO8yE7Ab1wbW7bZp0JqxIaqzi8DzUwz4PWQtBZRQmY
 V7flI3erRHpdGgozsEP0YT+27CqXt6q2y23RxYNM0kcuD5eIqoZ2o68GT
 qs/ZyR0sVMhSOkyz4IPGcG5uubC/oHt+U1izGZ2nGuaC/uqeqSLfjSMeN
 CJ28hKfXebDMq+4FDd0i4wHkreyMLWx9zAhR0o/KyjQ7p1kF7rPEXZIa4
 AudixA3+/sbZxhw9EWuT33MLXd3fS3bBJQHI2zYJ8JGtvqkmBbCAZp6ik A==;
X-CSE-ConnectionGUID: 0yqhaMg2RAi0S2e50amOKA==
X-CSE-MsgGUID: LW6HAmhoS7212yoM8wqkXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85308645"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="85308645"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 10:54:34 -0800
X-CSE-ConnectionGUID: m/kfGlQDS0Cq6Ytd91WQjQ==
X-CSE-MsgGUID: YSkHnVgFQ56jyNnQeoGrYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="221631981"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 10:54:32 -0800
From: himanshu.girotra@intel.com
To: matthew.d.roper@intel.com, x.wang@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v4 i-g-t] lib/intel_pat: Cache PAT config for unprivileged
 processes
Date: Fri,  6 Mar 2026 00:24:31 +0530
Message-ID: <20260305185431.6515-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
authoritative PAT source for Xe") changed the Xe PAT lookup to
read from debugfs, which requires root access. Some xe_oa subtests
fork a child process that drops root privileges before performing
GPU operations that internally need the PAT write-back index.
After dropping root, the debugfs read fails.

Fix this by caching the PAT configuration in struct xe_device at
xe_device_get() time. Since xe_device_get() is called while still
root, the cache is available to forked children even after
igt_drop_root(). Tests that open a new fd after forking must call
xe_device_get() explicitly before dropping root to populate the
cache for that fd.

v2: Cache PAT in struct xe_device instead of a global static;
    drop the intel_pat_precache() helper — xe_device_get() already
    populates the cache, so call it directly in xe_oa before
    igt_drop_root() (Ashutosh Dixit)

v3: Use pat_cache pointer, NULL indicates unpopulated cache;
    remove redundant xe_oa.c change (Ashutosh Dixit)

    Add FIXME for multi-GPU (Zbigniew Kempczyński)

v4: nit fixes and use forward declaration in xe_query.h (Ashutosh Dixit)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_pat.c   | 17 +++++++++--------
 lib/xe/xe_query.c | 20 ++++++++++++++++++++
 lib/xe/xe_query.h |  5 +++++
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 8660a2515..9feeeb39d 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -6,6 +6,7 @@
 #include <fcntl.h>
 #include "igt.h"
 #include "intel_pat.h"
+#include "xe/xe_query.h"
 
 /**
  * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
@@ -99,17 +100,17 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 	uint16_t dev_id;
 
 	/*
-	 * For Xe driver, query the kernel's PAT software configuration
-	 * via debugfs. The kernel is the authoritative source for PAT
-	 * indices, accounting for platform-specific workarounds
-	 * (e.g. Wa_16023588340) at runtime.
+	 * For Xe, use the PAT cache stored in struct xe_device.
+	 * xe_device_get() populates the cache while still root; forked
+	 * children that inherit the xe_device can use it post-drop_root().
 	 */
 	if (is_xe_device(fd)) {
-		int32_t parsed = xe_get_pat_sw_config(fd, pat);
+		struct xe_device *xe_dev = xe_device_get(fd);
 
-		igt_assert_f(parsed > 0,
-			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
-			     parsed);
+		igt_assert_f(xe_dev->pat_cache,
+			     "PAT sw_config not available -- "
+			     "debugfs not accessible (missing root or not mounted?)\n");
+		*pat = *xe_dev->pat_cache;
 		return;
 	}
 
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 981d76948..3afca353e 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -21,6 +21,7 @@
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
+#include "intel_pat.h"
 
 #include "xe_query.h"
 #include "xe_ioctl.h"
@@ -235,6 +236,7 @@ static void xe_device_free(struct xe_device *xe_dev)
 	free(xe_dev->mem_regions);
 	free(xe_dev->vram_size);
 	free(xe_dev->eu_stall);
+	free(xe_dev->pat_cache);
 	free(xe_dev);
 }
 
@@ -299,6 +301,24 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
 
+	/*
+	 * Populate the PAT cache while we still have sufficient privileges
+	 * to read debugfs.  Forked children that inherit this xe_device
+	 * (via fork()) will be able to use the cached values even after
+	 * dropping root with igt_drop_root(). pat_cache is left NULL if
+	 * debugfs is not accessible.
+	 *
+	 * FIXME: the cache is keyed by fd; for multi-GPU support this
+	 * should be extended to cache PAT entries by platform version/
+	 * revision instead.
+	 */
+	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
+	igt_assert(xe_dev->pat_cache);
+	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache) <= 0) {
+		free(xe_dev->pat_cache);
+		xe_dev->pat_cache = NULL;
+	}
+
 	/* We may get here from multiple threads, use first cached xe_dev */
 	pthread_mutex_lock(&cache.cache_mutex);
 	prev = find_in_cache_unlocked(fd);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index d7a9f95f9..05e2ad84f 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -20,6 +20,8 @@
 #define XE_DEFAULT_ALIGNMENT           SZ_4K
 #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
 
+struct intel_pat_cache;
+
 struct xe_device {
 	/** @fd: xe fd */
 	int fd;
@@ -74,6 +76,9 @@ struct xe_device {
 
 	/** @dev_id: Device id of xe device */
 	uint16_t dev_id;
+
+	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
+	struct intel_pat_cache *pat_cache;
 };
 
 #define xe_for_each_engine(__fd, __hwe) \
-- 
2.50.1

