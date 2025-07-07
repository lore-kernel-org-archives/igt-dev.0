Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC8BC83F09
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 03:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE3910E303;
	Mon,  7 Jul 2025 03:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSYzV6z/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CDD10E306
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 03:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751858726; x=1783394726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDMi3v3W2Xjb+RE1VXJkbQP9F3Kwh/WSuv/W+PUpCI4=;
 b=lSYzV6z/6eEn833jITXVK00k1csHp92F/D++Mk/af3Byy6TSPx1CJttv
 +WPV7BeJ+jrEhZPc0ycoRAvZZsgQoeMHDj3h0b5Gb/Du/v6v65UFwIaxV
 btZ/pNTLvq3roxt6fFq1Te6/0iXh/AsvP0jbElJzEYRYNpC+xFGZ/U0pg
 dg+pDTnio8VgmnMKei9ueNZKFqbCoBCR5zvYns4dEBckImxpKPP6Zj7rU
 phi2P3dkFU5c244TLfIA8LAwTX7paaobqdXvnHdyhTg/QTwuwGpziqo4Y
 5C9pj5Mju/xnkDDSc6AZ0xx5j97zabM9RXtu+Mz08S/Kx5Bm6zKFdJbwz g==;
X-CSE-ConnectionGUID: Q2Esdn9nSPSZIc7g+OKExg==
X-CSE-MsgGUID: 4ISBzycKRkq+1ND00CBAgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65134987"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65134987"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:25:26 -0700
X-CSE-ConnectionGUID: QWRmJnNbT9inUbaAGdIpPw==
X-CSE-MsgGUID: x827OdyWSE2VOKDw21Sjew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="192288764"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 20:25:24 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 3/5] lib/igt_sysfs: Update new debug mask requested
 by user
Date: Mon,  7 Jul 2025 09:02:44 +0530
Message-Id: <20250707033246.751156-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707033246.751156-1-pranay.samala@intel.com>
References: <20250707033246.751156-1-pranay.samala@intel.com>
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
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_sysfs.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2863f537a..5693747a2 100644
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
 
@@ -513,14 +515,18 @@ void igt_drm_debug_mask_update(unsigned int new_mask)
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
+	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
-- 
2.34.1

