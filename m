Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2E9C61CE5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 05:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B0C10E6BD;
	Wed,  4 Jun 2025 05:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXI4oZWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEAB10E231
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 05:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749014628; x=1780550628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysRuHUOIj4UGpcRJ+a0ieUGoMpi5MQCQ3Aj+ktPqTBo=;
 b=eXI4oZWvmgCGR3Hv5JQXdQ4BMnEieW6dbqAoXV4ZIP/47aHxni3wT+pS
 jtVUpz1RyXtq5VdniqiEmYMOKTwI8tY9l2+hJ74Fys0OB4Tx3+wCdxyxG
 1dV+tsYdBjD8z6Dtt2Uru+wkvNNtqGJjGmEapWF/P8G7wmnvtET9jGDxA
 vE8yEbd9F3zL84bq0TcLeoJYYXOawfXYwCrquaZpd1a0H3nTjSDu/a3/t
 SKTSkgLMfyGTGF0RjLr6LQyid/ieH9/5g9gOKR0+rSulEJ7gamWbTHnhi
 2HeZO0pchdOI78s80CfPB0pOUplS/1yOzNY1GjsATUq4qe+iAzgW7IWjR A==;
X-CSE-ConnectionGUID: f39mEO0MTPqTZzbpB2dkrQ==
X-CSE-MsgGUID: qTVRX5fxRMeVtDd73eC89A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54738309"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="54738309"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:23:48 -0700
X-CSE-ConnectionGUID: hIsOac4yQHeKlZ3BaxIc+w==
X-CSE-MsgGUID: Re6UWgh4SUqEo3XQxodnEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145551493"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2025 22:23:47 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 1/5] lib/igt_sysfs: Usage of Original debug mask to
 read/reset
Date: Wed,  4 Jun 2025 11:00:42 +0530
Message-Id: <20250604053046.1702233-2-pranay.samala@intel.com>
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

Original debug mask holds the mask before the test and will be
used to reset the debug mask post test.

v3:
- Refactored for readability and address logical comment.

v4:
- Improve variable name for debug mask saving (Kunal)

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2ba96ca7f..b7ca1f2b6 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -443,7 +443,7 @@ int igt_sysfs_drm_module_params_open(void)
 	return open(path, O_RDONLY);
 }
 
-static int log_level = -1;
+static int saved_drm_debug_mask = -1;
 
 /**
  * igt_drm_debug_level_get:
@@ -458,8 +458,8 @@ int igt_drm_debug_level_get(int dir)
 {
 	char buf[20];
 
-	if (log_level >= 0)
-		return log_level;
+	if (saved_drm_debug_mask >= 0)
+		return saved_drm_debug_mask;
 
 	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
 		return -1;
@@ -479,15 +479,15 @@ void igt_drm_debug_level_reset(void)
 	char buf[20];
 	int dir;
 
-	if (log_level < 0)
+	if (saved_drm_debug_mask < 0)
 		return;
 
 	dir = igt_sysfs_drm_module_params_open();
 	if (dir < 0)
 		return;
 
-	igt_debug("Resetting DRM debug level to %d\n", log_level);
-	snprintf(buf, sizeof(buf), "%d", log_level);
+	igt_debug("Resetting DRM debug level to %d\n", saved_drm_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", saved_drm_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
@@ -513,8 +513,8 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir < 0)
 		return;
 
-	log_level = igt_drm_debug_level_get(dir);
-	if (log_level < 0) {
+	saved_drm_debug_mask = igt_drm_debug_level_get(dir);
+	if (saved_drm_debug_mask < 0) {
 		close(dir);
 		return;
 	}
-- 
2.34.1

