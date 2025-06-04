Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ED4C61CE7
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 05:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A5510E231;
	Wed,  4 Jun 2025 05:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AL1O6DUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6717410E231
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 05:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749014634; x=1780550634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=739eYcIMTO5JXhkXecbaxPo9MdUkK8BrH4cCMtST0MM=;
 b=AL1O6DUVO90jG2YmKsDO6A15rm3MKmkfEZEeAVg03D7N/K9HFe/HhAxe
 6xedIvmqAxcBxaCSEbT8sF1iQUKRpIvaU8A3s3KvXYtogV8WJYNXhvuJR
 KpSQ0euZy8qTJyVGtlIO+uX5nPIyEl8kx/EGFsKHRZXWvzQxebYIVTIWH
 YDx/4jHzZxony+Q6GlsvXOJ50g6JOJF31QrPccKLxQOAcOlPgjBfAr5r4
 zr1EGuuW4NdITeoD6uCtek4wVSB/KEo8Y1SAp2V+Qjm+XHsqlEPxm+Dku
 786JfMOKGt2pC2gPeGKVvqnvbwkbsaQLLy2SrnK4lQNBW70t9Zl+fT4DP A==;
X-CSE-ConnectionGUID: /peBZ+RhRRqTrnuTxYBO/g==
X-CSE-MsgGUID: RuJFpnz3SL+769rfeuFo6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54738314"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="54738314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:23:54 -0700
X-CSE-ConnectionGUID: C8jri2m0TIaSdhhhkM3ggQ==
X-CSE-MsgGUID: 0pY1z3dqSbSdtzYFGHkA3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145551512"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2025 22:23:53 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 3/5] lib/igt_sysfs: Update new debug mask requested
 by user
Date: Wed,  4 Jun 2025 11:00:44 +0530
Message-Id: <20250604053046.1702233-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604053046.1702233-1-pranay.samala@intel.com>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
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

These below changes will update the required debug mask passed by the
user as per the requirement. Before setting the debug mask, it stores
the original mask which will be used to restore the debug mask post
test.

To handle nested updated, update flag is being used. Using this flag the
original debug mask will be read only once to ensure while restoring it,
it should be the original value and not the previous value.

v3:
- Refactored for readability and address logical comment.

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index ceb776b8d..427aed4de 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -500,12 +500,14 @@ static void igt_drm_debug_mask_reset_exit_handler(int sig)
 
 /**
  * igt_drm_debug_mask_update:
- * @debug_mask: new debug mask to set
+ * @mask_to_set: new debug mask to set
  *
  * This modifies the current drm debug mask to the new value.
  */
-void igt_drm_debug_mask_update(unsigned int new_mask)
+void igt_drm_debug_mask_update(unsigned int mask_to_set)
 {
+	unsigned int new_debug_mask;
+	static bool debug_mask_read_once = true;
 	char buf[20];
 	int dir;
 
@@ -513,14 +515,19 @@ void igt_drm_debug_mask_update(unsigned int new_mask)
 	if (dir < 0)
 		return;
 
-	saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
-	if (saved_drm_debug_mask < 0) {
-		close(dir);
-		return;
+	/* The below flag is used to read the original debug mask only once */
+	if (debug_mask_read_once) {
+		debug_mask_read_once = false;
+		saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
+		if (saved_drm_debug_mask < 0) {
+			close(dir);
+			return;
+		}
 	}
 
-	igt_debug("Setting DRM debug mask to %d\n", new_mask);
-	snprintf(buf, sizeof(buf), "%d", new_mask);
+	new_debug_mask = mask_to_set;
+	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
-- 
2.34.1

