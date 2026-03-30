Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4561061B05
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B424910E1F4;
	Mon, 30 Mar 2026 14:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zr5l4ZCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3D310E1F4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774881654; x=1806417654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ShGgO5p1anE4OLqQKsp29ZsMqzkC3R6oRM7bRrkfYTw=;
 b=Zr5l4ZCB1YSenkVCrZfFHjk0brBnimhJzCnfsUj5gwPW8lvGwR4nRb5q
 UxDdhlPCAurT5Iu8eN4Ah6JFFpgbmhVOpXaf3B4AijopunLoCQ0bKLqpg
 fgAY3oKMc5xaj+yKaeMwUnm/9Doytr1wlBclD+d5tAw3lbP1DQQNVYKXN
 AMza3Gtkj+EutGZZCq/PmrjH4DhJdR7UrJiEfNuo9uFs7UB5XICoEGmXf
 34sePMZPvSIsS8F/ufNaHrLGrk6ha0O/xoV96VqKOMVHo3FgKnsjSivgf
 YjSJHzeYoU/FfYsKZefVDP5gBFPF96XxmCXUaJddp+bKfm1uD9ff5ETB9 Q==;
X-CSE-ConnectionGUID: dpH3tIsIQCeMYtpz2c8hew==
X-CSE-MsgGUID: igsw+e7/TWOT87+SFEu8dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75771098"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75771098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:47 -0700
X-CSE-ConnectionGUID: Nr8hNudrTNOyJ4Vu0G4K2Q==
X-CSE-MsgGUID: 7Ncw5cXHQgqD/qDKC6H/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="264013335"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:46 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v4 2/5] lib/intel_pat: Expose getter of PAT registers
Date: Mon, 30 Mar 2026 16:40:35 +0200
Message-ID: <20260330144032.1954771-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
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

Kernel exposes two debugfs files (per gt) which describe PAT configuration
- pat_sw_config and pat. First contain table which is written to PAT
registers whereas second one returns tables via registers access.

Add possibility to parse second file which might be handy for tests
which wants to verify register state.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_pat.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 lib/intel_pat.h |  1 +
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 2693228a73..f1f5644dce 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -8,6 +8,11 @@
 #include "intel_pat.h"
 #include "xe/xe_query.h"
 
+enum xe_pat_config {
+	PAT_SW_CONFIG,
+	PAT_HW_CONFIG
+};
+
 /**
  * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
  * from debugfs
@@ -19,7 +24,8 @@
  * Returns: The number of PAT entries successfully read on success, or a negative error
  *          code on failure
  */
-int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
+static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cache,
+				 int gt, enum xe_pat_config pat_config)
 {
 	char *line = NULL;
 	size_t line_len = 0;
@@ -29,7 +35,11 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
 	FILE *dbgfs_file = NULL;
 	char config[64];
 
-	snprintf(config, sizeof(config), "gt%d/pat_sw_config", gt);
+	if (pat_config == PAT_SW_CONFIG)
+		snprintf(config, sizeof(config), "gt%d/pat_sw_config", gt);
+	else
+		snprintf(config, sizeof(config), "gt%d/pat", gt);
+
 	dbgfs_fd = igt_debugfs_open(drm_fd, config, O_RDONLY);
 	if (dbgfs_fd < 0)
 		return dbgfs_fd;
@@ -100,6 +110,38 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
 	return parsed;
 }
 
+/**
+ * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
+ * from debugfs
+ *
+ * @drm_fd: DRM device fd to use with igt_debugfs_open
+ * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
+ * @gt: gt id number
+ *
+ * Returns: The number of PAT entries successfully read on success, or a negative error
+ *          code on failure
+ */
+int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
+{
+	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_SW_CONFIG);
+}
+
+/**
+ * xe_get_pat_hw_config - Helper to read PAT (Page Attribute Table)
+ * configuration programmed in PAT registers from debugfs.
+ *
+ * @drm_fd: DRM device fd to use with igt_debugfs_open
+ * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
+ * @gt: gt id number
+ *
+ * Returns: The number of PAT entries successfully read on success, or a negative error
+ *          code on failure
+ */
+int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
+{
+	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
+}
+
 /*
  * Hardcoded PAT indices for Xe platforms, used as a fallback when the
  * kernel doesn't expose gt0/pat_sw_config in debugfs.
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index a658c6ffeb..a31b60e86e 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -38,5 +38,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
 uint8_t intel_get_pat_idx_uc_comp(int fd);
 
 int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
+int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 
 #endif /* INTEL_PAT_H */
-- 
2.43.0

