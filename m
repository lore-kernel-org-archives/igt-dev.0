Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74FCD35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7C910ED8A;
	Wed,  1 Apr 2026 11:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J49umCI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908F910ED24
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043343; x=1806579343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7laW6yH71LcZHJEmQyeyOnWTRIQj9/mp0UrDOIdlObQ=;
 b=J49umCI2BI5psRgr4czoYnU8FP0R/f39Q1POa62bMDXr7WnHHHeWEecl
 CxySEa3NWoTpPGmpnGP4NslctSV+IWqJcdsoZy5aP7HWvP7cv45Q1ATdi
 4KIMnjmDcMxhe9zUOGpn+dQrBN9Ioskz0jOyv0uKOrx+jimvc8+iTn17p
 MBSfD61qSbEiCZtVc7IYroc/8+Dl8lK47vu9DH6vJzVTgZ/uPUiicGzYn
 JSpb0K6YFS+Q5qxTZEGD+C2JgK8AsUCUYv2UQkpZM6oNzNZkPP1rVZSy3
 hO9q2/tX/mMjgf/FPtj1vr/E9Tu6w2RyDseaEIiIgIp2Ukez18XRLWxTD Q==;
X-CSE-ConnectionGUID: 0DyM0HhvTlis1jJOXS0qVg==
X-CSE-MsgGUID: nPzPHWdxTh2jvBlTYdM+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78669799"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78669799"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:35:42 -0700
X-CSE-ConnectionGUID: 8Pxklg0WRRa2WjNSZRQ4GA==
X-CSE-MsgGUID: zNAVldluTLmkILVfHbeqkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228263472"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:34:25 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_kms: Fix max_non_joiner_mode_found
Date: Wed,  1 Apr 2026 17:25:39 +0530
Message-Id: <20260401115542.1074290-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401115542.1074290-1-kunal1.joshi@intel.com>
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
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
2.48.1

