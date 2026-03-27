Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C18D10ED679
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 13:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60D010EE79;
	Fri, 27 Mar 2026 13:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og956zrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2193E10EE77
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617992; x=1806153992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6mIsm5z/X5tiZx3GX10XUnjDLxvV8OebM4RDuEJTJ8=;
 b=Og956zrRnuu294mdrmbAFPxIpiIXm+aieKqFssuVjtY9NU1ej4znEXpX
 63tDpzMxnAA6GtOF3FsuHE+95JWO9MZJ9YDPWHBPPmSW4mD6wWehSgfde
 /PiAfugCCQO7PPi322jvEaXMFfqPKNtQ/E9gVFTqQM1XSw+/uXbyhQUZL
 4rMM825Ff0+jUctnsyeJ4sO/aN8pWFXTg5Gt9SoHt39B3FGamOo8iqX/h
 Zfux9zIvqXK9sZA/Ljuv2EftNQnU5pmo1gZ1vaUeBVSjTm8KFry7zwyBl
 F7Dc1j1E8MpdAomSjM7/mykYETJ93c3koVapHqEf/1plTz8oKaLe4zwqC w==;
X-CSE-ConnectionGUID: MULw4wLCQMaH4Jn6apMvIA==
X-CSE-MsgGUID: fHoc7UtaSg+dXl8G66okwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75582206"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75582206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:26:31 -0700
X-CSE-ConnectionGUID: uJQD2CdRTIayNeT2Yxfv7A==
X-CSE-MsgGUID: 9/V+/aDBQ2WDWnYKS9vpTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="225567581"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:26:30 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v2 2/3] lib/intel_pat: Expose getter of PAT registers
Date: Fri, 27 Mar 2026 14:26:20 +0100
Message-ID: <20260327132617.974862-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327132617.974862-5-zbigniew.kempczynski@intel.com>
References: <20260327132617.974862-5-zbigniew.kempczynski@intel.com>
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
index 2bbea46f71..164a6579bb 100644
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
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id;
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

