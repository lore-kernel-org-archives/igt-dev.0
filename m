Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C47606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+MXmSTO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A2910E6E9;
	Fri, 23 Oct 2026 21:12:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1D10E709
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789406; x=1824325406;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FDOFz2nbfntCMdoCKPad34WjkogxM2UN3DtlNE9tdwc=;
 b=W+MXmSTOkojwJ2hsRuG9bd+Pr08SBVd4trxquJay1JEJ/lWScyE+bF4u
 9SjlKKk0dwisx7Bc8z7gSgELi3NYG1vxQda872lqAISmQHw+vo0a9g8Ud
 fnWBD2dhrolCARNo0OpHUFRLilKARbpV5YkEo8Kbm2hmBULN0DvsMvGpo
 aOe8nwWOrWA2YWsRhntiha1NYnTfCYADxoBhqc41Dsu3XWokANWtn0Ptg
 pV0yRhNer6QGAW/2BNMvY8alnkrbPHpI6XEYRGpyRgiBIJ5J+n16c1Ggs
 R56UHfqhhhCSAUXo5U6/aBsipR3pkwmHYJZmrdRaREErmZmBX7k6G87D7 A==;
X-CSE-ConnectionGUID: fSX7zPXsTNCjKXcO1ZET6Q==
X-CSE-MsgGUID: xMtHCFuBQOGBvKlxTX8ffA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457472"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457472"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:21 -0700
X-CSE-ConnectionGUID: sRJrpu1DTRi6+hDI8s0bhA==
X-CSE-MsgGUID: AmBUZ8qbS+KXk+ftSSOYOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585838"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:19 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:02:45 -0300
Subject: [PATCH i-g-t v3 10/11] lib/intel_pat: Pass xe_device to
 xe_get_pat_config()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_14026539277-v3-10-b8723ececb7f@intel.com>
References: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
In-Reply-To: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.56.0

