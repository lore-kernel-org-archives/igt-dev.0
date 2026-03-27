Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8520B10BA42C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 05:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B05F10E1A2;
	Fri, 27 Mar 2026 05:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DalZpRgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CEE10E1A2
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 05:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774588936; x=1806124936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k/oVYEqOuTg6K75Lv9Fx3mB6E2zI3mEaZb1sO1dO3/s=;
 b=DalZpRgxxjkYPRzyRMW7PJ4PvdFGnbtSi8U4iX2u798+CiiPmE6l6HrX
 e+yHncO0yVa+gmyqtw8/fq8shhQGFFbA5q9R5pBrDawLrWfy1OSl91Exb
 Q7ul0CTiGs1EW3Dppg2H2UINbIBbf0pgK8ef5VKm6xUA42HAO2zXQTjym
 h4BI04e/dbTt/VA0F8JM+5RXY3LezzS5cshYwhpG4x07nQVIBpVrfEn++
 yLiJdP8x6tJ38kkEQZ5qwPtxVHKLlZNVmnEUD6QfiSZhsYUDwnmNxWxZ9
 A2ChOHuGpY4Algzam50svzuG4YvW50WSweekGtUThyHYkKplIQd46XFmH g==;
X-CSE-ConnectionGUID: I0QimTxIR3OmjfqZQB548Q==
X-CSE-MsgGUID: fRb7jnrjRPKOu4ZCad3jTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85964284"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="85964284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 22:22:15 -0700
X-CSE-ConnectionGUID: uxMpz91AQjWUNAhFJkX9PA==
X-CSE-MsgGUID: A15Gl1bLRYSxBMSI/H2XVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="225224668"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa008.jf.intel.com with ESMTP; 26 Mar 2026 22:22:14 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, francois.dugast@intel.com,
 matthew.auld@intel.com
Subject: [PATCH i-g-t] lib/intel_pat: add hardcoded PAT fallback for older
 kernels
Date: Fri, 27 Mar 2026 10:52:12 +0530
Message-ID: <20260327052212.27431-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

When IGT runs on kernels that lack the gt0/pat_sw_config debugfs entry
(commit "drm/xe: expose PAT software config to debugfs"), the PAT cache
is NULL and intel_get_pat_idx() hits a fatal assertion.  This breaks
basic tests like xe_exec_basic on stock distro kernels (e.g. Ubuntu
25.10).

Add xe_pat_fallback() with hardcoded PAT indices matching the kernel's
xe_pat_init_early() for platforms up to Crescent Island (xe3p XPC).
When the debugfs is unavailable, the fallback provides correct values
instead of crashing.  Newer platforms (xe3p LPG and beyond) are not
covered because their kernel support arrived after the debugfs entry
was already in place.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_pat.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index b202a6241..71633b314 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -97,6 +97,62 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
 	return parsed;
 }
 
+/*
+ * Hardcoded PAT indices for Xe platforms, used as a fallback when the
+ * kernel doesn't expose gt0/pat_sw_config in debugfs.
+ *
+ * Covers platforms up to Crescent Island (xe3p XPC) that have Xe driver
+ * support in current stable kernels.  Anything newer must run a kernel
+ * that provides the pat_sw_config debugfs entry.
+ *
+ * TODO: drop this fallback once stable kernels ship with pat_sw_config.
+ */
+static bool xe_pat_fallback(int fd, struct intel_pat_cache *pat)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+
+	pat->uc_comp = XE_PAT_IDX_INVALID;
+
+	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
+		/* Xe3p XPC (GFX ver 35.11): no WT, no compression */
+		pat->uc = 3;
+		pat->wt = 3;   /* No WT on XPC; use UC */
+		pat->wb = 2;
+		pat->max_index = 31;
+	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
+		   intel_get_device_info(dev_id)->graphics_ver == 20) {
+		/* Xe2 / Xe3: GFX ver 20 / 30 */
+		pat->uc = 3;
+		pat->wt = 15;
+		pat->wb = 2;
+		pat->uc_comp = 12;
+		pat->max_index = 31;
+
+		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
+		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
+			pat->max_index -= 4;
+	} else if (IS_METEORLAKE(dev_id)) {
+		pat->uc = 2;
+		pat->wt = 1;
+		pat->wb = 3;
+		pat->max_index = 3;
+	} else if (IS_PONTEVECCHIO(dev_id)) {
+		pat->uc = 0;
+		pat->wt = 2;
+		pat->wb = 3;
+		pat->max_index = 7;
+	} else if (IS_DG2(dev_id) || intel_graphics_ver(dev_id) <= IP_VER(12, 10)) {
+		pat->uc = 3;
+		pat->wt = 2;
+		pat->wb = 0;
+		pat->max_index = 3;
+	} else {
+		return false;
+	}
+
+	return true;
+}
+
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id;
@@ -105,14 +161,26 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 	 * For Xe, use the PAT cache stored in struct xe_device.
 	 * xe_device_get() populates the cache while still root; forked
 	 * children that inherit the xe_device can use it post-drop_root().
+	 *
+	 * Fall back to hardcoded values when the kernel lacks the
+	 * pat_sw_config debugfs. Platforms newer than Crescent Island
+	 * must have the debugfs available.
 	 */
 	if (is_xe_device(fd)) {
 		struct xe_device *xe_dev = xe_device_get(fd);
 
-		igt_assert_f(xe_dev->pat_cache,
-			     "PAT sw_config not available -- "
-			     "debugfs not accessible (missing root or not mounted?)\n");
-		*pat = *xe_dev->pat_cache;
+		if (xe_dev->pat_cache) {
+			*pat = *xe_dev->pat_cache;
+		} else if (xe_pat_fallback(fd, pat)) {
+			igt_info("PAT sw_config debugfs not available, "
+				 "using hardcoded fallback\n");
+		} else {
+			igt_assert_f(false,
+				     "PAT sw_config not available and no "
+				     "hardcoded fallback for this platform -- "
+				     "kernel with 'drm/xe: expose PAT software "
+				     "config to debugfs' required\n");
+		}
 		return;
 	}
 
-- 
2.50.1

