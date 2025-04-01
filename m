Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7BEC36018
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA6D88E26;
	Tue,  1 Apr 2025 09:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiMKPS5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3426910E52D
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743499239; x=1775035239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HM754JgZFKENJYdPgdA9Gz+9yvfs0QAOIwBVk7O+FJI=;
 b=TiMKPS5m/H7v/1+PfsE/C6uHucyXFn4y8vRc8aQRNAkSbw8b29o2210Y
 LI6njrD02Pj8m6yLmHyvI4+Xw1fofBJsKD5RXbDmqUDK2e4C0elJQZ5Yd
 OPfNVV+rcz824qBgQC0s8xq7gvLW/YhsGBkBjFweTGJ2Ke+Ac6EERTjBM
 DIl+um4z+5qfMujMwWD/sdW2YTjq5h1gsTV55ghn0KdpCDpzCGkgx6xq2
 b7iyWZAl8iGwTs7JriL1M3uVNEzhqEnwsAbfRRcDAI6z/4FVMu54lXu0v
 ZhvQ07mBQBUw31MypuIHHW+NIIjWHXSfTEF6hZu+cUDH0pMky60rt9Zrs w==;
X-CSE-ConnectionGUID: gAZYVvoiT2Wecliwxi8UQQ==
X-CSE-MsgGUID: BVO97bJMQ/aNLrohAug2tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62211755"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62211755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:20:29 -0700
X-CSE-ConnectionGUID: Dp786JTHQ8SaS6OGn/Ittg==
X-CSE-MsgGUID: quXlmS+3SESYx3g5pZhxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126166460"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 02:20:27 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 3/5] lib/igt_sysfs: Update new debug mask requested
 by user
Date: Tue,  1 Apr 2025 14:50:13 +0530
Message-Id: <20250401092015.818465-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401092015.818465-1-pranay.samala@intel.com>
References: <20250401092015.818465-1-pranay.samala@intel.com>
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

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index e6058a1dd..0df2ab9fc 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -500,12 +500,14 @@ static void igt_drm_debug_mask_reset_exit_handler(int sig)
 
 /**
  * igt_drm_debug_mask_update:
- * @debug_level: new debug mask to set
+ * @mast_to_set: new debug mask to set
  *
  * This modifies the current drm debug mask to the new value.
  */
-void igt_drm_debug_mask_update(unsigned int new_log_level)
+void igt_drm_debug_mask_update(unsigned int mask_to_set)
 {
+	unsigned int new_debug_mask;
+	static bool debug_mask_read_once = true;
 	char buf[20];
 	int dir;
 
@@ -513,14 +515,20 @@ void igt_drm_debug_mask_update(unsigned int new_log_level)
 	if (dir < 0)
 		return;
 
-	original_debug_mask = igt_drm_debug_mask_get(dir);
-	if (original_debug_mask < 0) {
-		close(dir);
-		return;
+	/* The below flag is used to read the original debug mask only once */
+	if (debug_mask_read_once) {
+		debug_mask_read_once = false;
+		original_debug_mask = igt_drm_debug_mask_get(dir);
+		if (original_debug_mask < 0) {
+			close(dir);
+			return;
+		}
 	}
 
-	igt_debug("Setting DRM debug mask to %d\n", new_log_level);
-	snprintf(buf, sizeof(buf), "%d", new_log_level);
+	new_debug_mask = mask_to_set;
+
+	igt_debug("Setting DRM debug mask to %d\n", new_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
@@ -530,6 +538,7 @@ void igt_drm_debug_mask_update(unsigned int new_log_level)
 	 * if we call this api multiple times
 	 */
 	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
+
 }
 
 /**
-- 
2.34.1

