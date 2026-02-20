Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913F0C56206
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F14F10E7FF;
	Fri, 20 Feb 2026 15:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIDLFKMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55E10E7F5
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599684; x=1803135684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HPITRwmN8i0/KD6wrTmS/+htMYiX12JtUKstBE8xoMQ=;
 b=bIDLFKMkwxwwkseY6XBMWTzQAOecCUHOpesCU1LMk5g/IJ0GKkAP+ioP
 rp9T3r+RGh36wf4dkiW1rztwSE/kgH3Q+uRaaW8ieyt/1dja1WSZlIEZI
 I4hL0X6CeCb2s1DU+uQTODRKNp/OAw06FalIEKMvbSErzHyakEhIbIpKE
 MI28Mtc0MrCYoEOSaJ+2jXswn39ULaaZFVVdXPjBskI2td4ZqpI27RwwA
 obipI1bSBy/J2pOeazHOkVYbYSPtDSPkQDKfcYgYf5A1ZWu+5+9or5XgL
 XhmlKfHa08lvdCfLyvD7JSQVQPzIA0weLQbDa99IXHRncyUvCkTlCRWHK w==;
X-CSE-ConnectionGUID: ZO4XWLQbS7WAt4J/iA3J+w==
X-CSE-MsgGUID: 3ZYZ6N+ZQ8imt3Mi+easuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72592295"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72592295"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:24 -0800
X-CSE-ConnectionGUID: 9E37rQS3RH6r/Kfvi5MW8g==
X-CSE-MsgGUID: +KqUWtWfSs2EvdThVAud6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219411157"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 07:01:22 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_kms: Fix max_non_joiner_mode_found
Date: Fri, 20 Feb 2026 20:52:38 +0530
Message-Id: <20260220152239.276034-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260220152239.276034-1-kunal1.joshi@intel.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
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

The function previously required hdisplay == max_pipe_hdisplay (5120 on
pre-Gen30), which means it returned false for any connector whose maximum
resolution is below the pipe limit (e.g. a 4K MST output on a 5K-capable
platform).

Fix this by iterating all modes and tracking the best one (highest
hdisplay, then highest clock as a tiebreaker) that does not require a
big joiner, as determined by igt_bigjoiner_possible(). This correctly
handles connectors with any max resolution.

Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit")
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c4879604..c6678b02b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6904,19 +6904,24 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
 			   int max_dotclock, drmModeModeInfo *mode)
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
2.43.0

