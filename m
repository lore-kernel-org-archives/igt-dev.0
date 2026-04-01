Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265C110F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7CD10EE17;
	Wed,  1 Apr 2026 15:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2XUUR/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3EF10E5BD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058313; x=1806594313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t+KhKVcpz217r8RCOmXQ7GghEIRQmMhUkXZ/zAjsFPA=;
 b=g2XUUR/rNSzliRywt1yz250m9SQMa2CHIe44ac6/nGw7k24dCGn/H1Zq
 Nbk+0vJfaHMh20eRibb7qZ5FwwMdEtYKSGmdBtnM22ZCGTUGBwjIs7F/j
 4sE4rsCPpUw+ZucA86L2JtoIAn/dzCmICsv66XPlsuoJ68JQtF81E7Wug
 4eRM0f9nRI8rBEBAxrSdCeNyBqlN0QhwkaCKFythW12GFT9GvF1Vnb0hB
 p8cAN6tEOjAi91AUgpVQnzbEDpS/BrP0nCCCr8bholB5gTNGLivhj6eSQ
 SYTLCNL5Vw8IlZpzyVCz+vH9BpAwI29m31Y7dnwq5ZmaNYq6HegqzjGSp Q==;
X-CSE-ConnectionGUID: FUXNYrVzQOqCvinoDETWKA==
X-CSE-MsgGUID: 8mGMRhiNRYO+AWh4Fa4p4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988968"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:13 -0700
X-CSE-ConnectionGUID: lZPm44PqRQah2rIYErGxSQ==
X-CSE-MsgGUID: tj5Qh4w9SgCKuMiQCO6j9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960087"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:11 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 3/7] lib/igt_kms: Fix max_non_joiner_mode_found
Date: Wed,  1 Apr 2026 21:36:23 +0530
Message-Id: <20260401160627.1338526-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401160627.1338526-1-kunal1.joshi@intel.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
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

Previously the function, instead of giving the highest possible mode the
connector could support, started the check by looking if the mode was
equal to max_pipe_hdisplay. There may be corner cases where a connector never supports the highest mode our source can
drive (e.g. a 4K mode on a 5K-capable platform).

Fix this by iterating all modes and tracking the best one (highest
hdisplay, then highest clock as a tiebreaker) that does not require a
big joiner, as determined by igt_bigjoiner_possible(). This correctly
handles connectors with any max resolution.

v2: Reword commit message (Suraj)

Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit")
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 lib/igt_kms.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 04b1f3972..dbd419a9b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6979,21 +6979,26 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
  * false otherwise.
  */
 bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
-			   int max_dotclock, drmModeModeInfo *mode)
+			       int max_dotclock, drmModeModeInfo *mode)
 {
-	int max_hdisplay = get_max_pipe_hdisplay(drm_fd);
+	bool found = false;
 
 	for (int i = 0; i < connector->count_modes; i++) {
 		drmModeModeInfo *current_mode = &connector->modes[i];
 
-		if (current_mode->hdisplay == max_hdisplay &&
-		    current_mode->clock < max_dotclock) {
+		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
+			continue;
+
+		if (!found ||
+		    current_mode->hdisplay > mode->hdisplay ||
+		    (current_mode->hdisplay == mode->hdisplay &&
+		     current_mode->clock > mode->clock)) {
 			*mode = *current_mode;
-			return true;
+			found = true;
 		}
 	}
 
-	return false;
+	return found;
 }
 
 /* TODO: Move these lib functions to the joiner-specific library file
-- 
2.25.1

