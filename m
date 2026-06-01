Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7DECD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 05:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFCD112DA1;
	Mon,  1 Jun 2026 05:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMtjvYH3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38DA112DA1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 05:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780292067; x=1811828067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AywL3B+k+eP+/JVeLYChTP8WIkvuayufw0HtaWKpUQA=;
 b=VMtjvYH3YmGbFBALPlgwZHwW3rswAU3dB3rh370k4KGQpGgQBj6Kc+FV
 OohsWEOC82GvHymjQyt9DLRZNJ77534u/d01GF8lc6XhRtFbBhanOPBwk
 LB5MvnNwQos9zYwKENNtxaUighi7ZyumI368ybzr1NF7lA8G980udX/J5
 I+2G1FURBlt91n0r1CRN23wT2zeTvDE6WDVWRg21bCGteqdqXbAjxxqj0
 Lk4cZgHnpCOyDF/lU0JVG9JPHAwNd4ZYOxhCCBBhqxJkLm1yZP3m7rLia
 ZeUNEK1ZfCrGdEa5xIo/A8xUhq6DSCl1G5wywxBas2u4rl/MIGOI0d5BV A==;
X-CSE-ConnectionGUID: sBZl814VTsWy3ZcnYK20bg==
X-CSE-MsgGUID: +pliqL+zTVO+fYZP7svyqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103712761"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="103712761"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:34:27 -0700
X-CSE-ConnectionGUID: SzmrlkwCQcm5S+a9XTsY2g==
X-CSE-MsgGUID: pAR/5aN2QCyRbkBDBYdfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243310144"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:34:25 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/kms_joiner_helper: Add
 intel_max_hdisplay_non_joiner_mode_found
Date: Mon,  1 Jun 2026 11:25:43 +0530
Message-Id: <20260601055545.1982351-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601055545.1982351-1-kunal1.joshi@intel.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
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

Introduce an Intel-specific function to find the highest-resolution mode
that doesn't require bigjoiner. This optimizes for display resolution
(hdisplay), using clock as a tiebreaker.

Create independent function for max hdisplay (Karthik)
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_joiner_helper.c | 42 +++++++++++++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index e24d7ce94..9e220be2c 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -183,3 +183,45 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 	}
 	return true;
 }
+
+/**
+ * intel_max_hdisplay_non_joiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Find the mode with maximum hdisplay that does not require bigjoiner.
+ *
+ * Bigjoiner is triggered when EITHER:
+ * - hdisplay > max_pipe_hdisplay (platform's single-pipe width limit)
+ * - clock > max_dotclock (platform's clock limit)
+ *
+ * Prioritizes hdisplay as the primary metric, using clock as a
+ * tiebreaker when multiple modes have identical hdisplay. This is correct for
+ * display testing where maximum supported resolution is the primary concern.
+ *
+ * Returns: true if a valid non-joiner mode exists, false otherwise.
+ */
+bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+					      int max_dotclock, drmModeModeInfo *mode)
+{
+	bool found = false;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
+			continue;
+
+		if (!found ||
+		    current_mode->hdisplay > mode->hdisplay ||
+		    (current_mode->hdisplay == mode->hdisplay &&
+		     current_mode->clock > mode->clock)) {
+			*mode = *current_mode;
+			found = true;
+		}
+	}
+
+	return found;
+}
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
index 6d21e7eb0..90c50e5c6 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/tests/intel/kms_joiner_helper.h
@@ -17,6 +17,8 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				  uint32_t *used_pipes_mask,
 				  uint32_t master_pipes_mask,
 				  uint32_t valid_pipes_mask);
+bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+					      int max_dotclock, drmModeModeInfo *mode);
 
 enum force_joiner_mode {
 	FORCE_JOINER_ENABLE = 0,
-- 
2.25.1

