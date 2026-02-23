Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012C4EF5861
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 04:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E46710E129;
	Mon, 23 Feb 2026 04:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X80ajzfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1263410E129
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 04:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771819300; x=1803355300;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9s15Qpd71Cvg3fAunIfeoz0O3K7j8heKtYvAE63rVmU=;
 b=X80ajzfHqWzpI769jXmIZfhj3WQ52PjKYtS+r1DK4wVI7Kt/7lZDIQlX
 xeB/n5ocIIC1NzLGfUtdMBlVFn0yLAfJXXp3ANCBwaGkYwUy/cfIrpKWH
 bVTtzyRlNf2OuS/Sng+knmU9aC7vlP18HdKuf3c4j6JaFxjwqCIsRkda9
 UXTfHc8YItlDvkpaTkspFAlw2ahXiLTyPvyqoy7iMAv1BtoMzzwauAX84
 CuEZ5FzawagHqZIEJdnTTZPiLPPubjA95TMoaq7q6jtvghFC7RGFNgLDg
 fVBx3dSPS1A2uRPqVIhp7vErUCI0ziVAX+0Rj61TlklqJeOb3ebmSc6h7 Q==;
X-CSE-ConnectionGUID: yvA6a2wQRY6Emh1RT5VZwA==
X-CSE-MsgGUID: GgUHHdtrRR+xhfJ3pfwr8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90394523"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; d="scan'208";a="90394523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:01:40 -0800
X-CSE-ConnectionGUID: Jz5txn+lR/mvC1ml+lePbg==
X-CSE-MsgGUID: dOVYNcwyTua07GYkk1aQdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; d="scan'208";a="213837366"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2026 20:01:38 -0800
From: himanshu.girotra@intel.com
To: matthew.d.roper@intel.com, x.wang@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_pat: use kernel debugfs as authoritative PAT
 source for Xe
Date: Mon, 23 Feb 2026 09:31:36 +0530
Message-ID: <20260223040137.19588-1-himanshu.girotra@intel.com>
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

IGT should treat the kernel as authoritative for PAT configuration
rather than replicating platform-specific logic and workaround
adjustments in hardcoded tables, which is error-prone as PAT layouts
vary across platforms.

For Xe devices, query pat_sw_config from debugfs instead of using
hardcoded PAT indices. Remove the Xe-only hardcoded entries and
retain the i915 fallback for older platforms.

Drop the now-redundant max_index assert in pat_sanity().

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_pat.c      | 37 ++++++++++++++++++++-----------------
 tests/intel/xe_pat.c |  1 -
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 9815efc18..8660a2515 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -96,24 +96,27 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
 
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint16_t dev_id;
+
+	/*
+	 * For Xe driver, query the kernel's PAT software configuration
+	 * via debugfs. The kernel is the authoritative source for PAT
+	 * indices, accounting for platform-specific workarounds
+	 * (e.g. Wa_16023588340) at runtime.
+	 */
+	if (is_xe_device(fd)) {
+		int32_t parsed = xe_get_pat_sw_config(fd, pat);
+
+		igt_assert_f(parsed > 0,
+			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
+			     parsed);
+		return;
+	}
 
-	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
-		pat->uc = 3;
-		pat->wb = 2;
-		pat->max_index = 31;
-	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
-		   intel_get_device_info(dev_id)->graphics_ver == 20) {
-		pat->uc = 3;
-		pat->wt = 15; /* Compressed + WB-transient */
-		pat->wb = 2;
-		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
-		pat->max_index = 31;
-
-		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
-		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
-			pat->max_index -= 4;
-	} else if (IS_METEORLAKE(dev_id)) {
+	/* i915 fallback: hardcoded PAT indices */
+	dev_id = intel_get_drm_devid(fd);
+
+	if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
 		pat->wt = 1;
 		pat->wb = 3;
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 21547c84e..53b0f5213 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -144,7 +144,6 @@ static void pat_sanity(int fd)
 	} else {
 		has_wt = true;
 	}
-	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
 	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
 	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
 	if (has_wt)
-- 
2.50.1

