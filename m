Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1A2C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7700310E3BF;
	Tue, 21 Jul 2026 19:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahJLtBC6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBC810E3AA
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660442; x=1816196442;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7fGPpGEHZTVjaSGqvIxd/1R1SWVwqCLFKkI1PwwCNXM=;
 b=ahJLtBC65/E34C+Qw8T4f/6aTm6f/bossbduAGmGNwtRPs9fJbkgAtGr
 0bNhZYuLu9+6cWCDk4ohxt6E8aF0GRJ1CvJxz/nB6W/s9r7VxAKuuT6yO
 zonIfeUB2Lj9qZKMMDEkkdAxHXfQJHhcIKiDL0UywsA7kr5gu7aNz3bGR
 v7rbNoy0SH49Gil9m4GbAahVygQz+D/B/MHi3DULfIvdr4xl03sEaCtYF
 7xUNy1WWAFTbaFXHZPOLPrEV2otvvHknwOPF+YGJu0NKwn1zIdoMCXcJH
 /fZIgWsBF/25wzQOZvkXs2ZzmyTtcfREMqnF6+N9omW3fchSebJXwOEA0 w==;
X-CSE-ConnectionGUID: eIQYNOR4SbSulKj+SCMyjQ==
X-CSE-MsgGUID: U0s8qgckQFGu+mwu58hx5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637712"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637712"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:42 -0700
X-CSE-ConnectionGUID: NrWLMUO3RdqoMaqg2a5FFQ==
X-CSE-MsgGUID: AbWaB6IcRnaQ5zef/F9pOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516616"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:40 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 16:00:02 -0300
Subject: [PATCH i-g-t 09/10] lib/intel_pat: Pass xe_device to
 xe_get_pat_config()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-9-0c147eeefefa@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/intel_pat.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 14935e3c4692..ebf5cd428c68 100644
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

