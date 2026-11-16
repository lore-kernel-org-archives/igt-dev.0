Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF93606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwYtR4Bi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED6C10EDF6;
	Mon, 16 Nov 2026 09:23:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDF310ED9C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794820921; x=1826356921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=drnjSRUsNUKIytO5G6qt3kki/PoEFquWJmgKBEcB2Sw=;
 b=MwYtR4BiXWvc2xDSytnP0qNl00VDcwUClSKTa/VxYotv8bfm7Kb05QzI
 I2eAkrA3jmeroX+hJjdbfgzEzObEStPLHGGob1nHScGH1hCPHiImRX4RF
 14UAP4iuzFsFMMq5GlxoV5/QB+FsvZL2p2Q1rBqd39IHYGwUMLu4RUG/t
 mQZTr2ajBJoYseIezFA/Xih4JQErGFPhCh1BOZ52wrquoqLLIhc3WRdzi
 R9y7Tple8gpbNe+PmPUz3ocH8neYyjLBcU7qV3+FsYbl+pR4rdFQ56YDf
 q4kcXgM2l/Sw8m+/er5R8pIxuVisCtwMX/TavDrs5Q/hYqetehFqFqaIk A==;
X-CSE-ConnectionGUID: xGQHd+AWTUWfkrwBtP/dGg==
X-CSE-MsgGUID: MwDpGEPAQs+uFyRynGVFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3588161"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208,223";a="3588161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:22:01 -0800
X-CSE-ConnectionGUID: r5bYr2Z8TW6ovSdokhPxdw==
X-CSE-MsgGUID: Fl8ecVjnRFWrk00hqRs9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208,223";a="9660273"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:22:00 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ankit.k.nautiyal@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock limit
 for non-joiner mode selection
Date: Mon, 16 Nov 2026 14:48:32 +0530
Message-ID: <20261116091832.1312335-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116091832.1312335-1-karthik.b.s@intel.com>
References: <20261116091832.1312335-1-karthik.b.s@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From display 30 the kernel limits the single pipe pixel rate without
DSC to the maximum validated frequency, which is below the max dotclock
derived from CDCLK and reported in debugfs (see
intel_max_uncompressed_dotclock()). Above this limit an uncompressed
mode can't be driven by a single pipe.

intel_boundary_non_joiner_mode_found() only checks against the max
dotclock, so on a sink without DSC support it can select a boundary
mode which the kernel drives with joiner.

Add intel_get_max_uncompressed_dotclock() mirroring the kernel limits
and use it in intel_boundary_non_joiner_mode_found(), so that the
selected boundary mode stays on a single pipe irrespective of DSC
support in the sink.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++--
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 915c6a8a2..b28647696 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7207,6 +7207,32 @@ int igt_get_current_cdclk(int fd)
 	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
 }
 
+/**
+ * intel_get_max_uncompressed_dotclock:
+ * @drm_fd: drm file descriptor
+ * @max_dotclock: Max pixel clock frequency
+ *
+ * Get the maximum pixel clock a single pipe supports without DSC. This
+ * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
+ * limit an uncompressed mode can't be driven by a single pipe, so only
+ * modes below it are guaranteed to use a single pipe irrespective of
+ * DSC support in the sink.
+ *
+ * Returns: The maximum uncompressed pixel clock for a single pipe.
+ */
+int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock)
+{
+	int dev_id = intel_get_drm_devid(drm_fd);
+	int limit = max_dotclock;
+
+	if (IS_WILDCATLAKE(dev_id))
+		limit = 937500;
+	else if (intel_display_ver(dev_id) >= 30)
+		limit = 1350000;
+
+	return min(max_dotclock, limit);
+}
+
 /**
  * intel_get_max_pipe_hdisplay:
  * @drm_fd: drm file descriptor
@@ -7340,7 +7366,9 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
  * @mode: libdrm mode to be filled
  *
  * Check if connector supports a mode at the platform's maximum single-pipe
- * hdisplay boundary.
+ * hdisplay boundary. The mode clock must be below the uncompressed single
+ * pipe limit, so that the kernel doesn't fall back to joiner when the sink
+ * doesn't support DSC.
  *
  * Returns: True if a valid non-joiner mode at the boundary is found,
  * false otherwise.
@@ -7349,12 +7377,13 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
 					  int max_dotclock, drmModeModeInfo *mode)
 {
 	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
+	int max_clock = intel_get_max_uncompressed_dotclock(drm_fd, max_dotclock);
 
 	for (int i = 0; i < connector->count_modes; i++) {
 		drmModeModeInfo *current_mode = &connector->modes[i];
 
 		if (current_mode->hdisplay == max_hdisplay &&
-		    current_mode->clock < max_dotclock &&
+		    current_mode->clock < max_clock &&
 		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
 			*mode = *current_mode;
 			return true;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dfcb91e02..c0565479f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1381,6 +1381,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
 			    igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
+int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
 int intel_get_max_pipe_hdisplay(int drm_fd);
 int igt_get_max_cdclk(int fd);
 int igt_get_current_cdclk(int fd);
-- 
2.43.0

