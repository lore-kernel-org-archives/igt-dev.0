Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19150C9830D
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA310F1E7;
	Wed, 23 Sep 2026 21:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkKU++f2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019F810F1DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199716; x=1821735716;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=W3bRo4AzOuihMHj+5xc7/6H0rgMx2jDz7DAgU29jAGE=;
 b=jkKU++f2dD8o8zWJHzTsru9PENNAhMckEUwU3mHy2kEtfqZUepc6efzC
 Ku6f+vARGqThpR/HP+ka33UE9jINxXxI5kZ1FoSPHnkVieV/KS/0c1VMo
 +BluHQ7aj7xo+kdTMXNqKBKuUOudRj4Nfj3eztSJsIMY88BpMy3/O6h24
 86LnOoN5uXuo72s3zrWirEl+k6QRbf1N5gHQJIq/JGk/7K5BtS1qJ+77z
 StzITYlGVzvN1C+URkvAkEwyB6xgs/6AANxPvP9jNYd2LGRgLYl5lx+GU
 tSO0QTGgyfWNqMuengeEQiXeVzuZriBaAjYmZ0xv1KtdAjWgDaMUVL/JQ Q==;
X-CSE-ConnectionGUID: 3QeqIIaYSBaHrGeA7QlX0w==
X-CSE-MsgGUID: rXhl8FuwSCO/7j9b4ImVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445421"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445421"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:56 -0700
X-CSE-ConnectionGUID: fW25dPwJS5SRn29a4Ih86A==
X-CSE-MsgGUID: VwWYa6r8QLOU/CK7E2z5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907737"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:52 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:17 -0300
Subject: [PATCH i-g-t v2 10/11] lib/intel_pat: Pass xe_device to
 xe_get_pat_config()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-wa_14026539277-v2-10-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

In an upcoming change, we will need to check for a workaround as part
of xe_get_pat_config().  Since xe_get_pat_config() also gets called
during xe_device_get(), we will need to use xe_wa_from_cache() instead
of the regular xe_wa() function.  In preparation for that, make sure
that xe_get_pat_config() gets called with the xe_device struct instead
of the drm file descriptor.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/intel_pat.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index db0f057cbd1e..6808eaa9b77e 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -24,7 +24,7 @@ enum xe_pat_config {
  * Returns: The number of PAT entries successfully read on success, or a negative error
  *          code on failure
  */
-static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cache,
+static int32_t xe_get_pat_config(struct xe_device *xe_dev, struct intel_pat_cache *xe_pat_cache,
 				 int gt, enum xe_pat_config pat_config)
 {
 	char *line = NULL;
@@ -40,7 +40,7 @@ static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cach
 	else
 		snprintf(config, sizeof(config), "gt%d/pat", gt);
 
-	dbgfs_fd = igt_debugfs_open(drm_fd, config, O_RDONLY);
+	dbgfs_fd = igt_debugfs_open(xe_dev->fd, config, O_RDONLY);
 	if (dbgfs_fd < 0)
 		return dbgfs_fd;
 	dbgfs_file = fdopen(dbgfs_fd, "r");
@@ -125,7 +125,9 @@ static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cach
  */
 int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
 {
-	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_SW_CONFIG);
+	struct xe_device *xe_dev = xe_device_get(drm_fd);
+
+	return xe_get_pat_config(xe_dev, xe_pat_cache, gt, PAT_SW_CONFIG);
 }
 
 /**
@@ -141,7 +143,9 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
  */
 int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
 {
-	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
+	struct xe_device *xe_dev = xe_device_get(drm_fd);
+
+	return xe_get_pat_config(xe_dev, xe_pat_cache, gt, PAT_HW_CONFIG);
 }
 
 void intel_pat_build_xe_cache(struct xe_device *xe_dev)
@@ -151,7 +155,7 @@ void intel_pat_build_xe_cache(struct xe_device *xe_dev)
 	pat_cache = calloc(1, sizeof(*pat_cache));
 	igt_assert(pat_cache);
 
-	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
+	if (igt_debug_on(xe_get_pat_config(xe_dev, pat_cache, 0, PAT_SW_CONFIG) <= 0)) {
 		free(pat_cache);
 		return;
 	}

-- 
2.55.0

