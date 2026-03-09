Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC28F3C241
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 12:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212F910E4DF;
	Mon,  9 Mar 2026 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmfTndHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4610E4DF
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773060032; x=1804596032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QrLAIjW4mUeaFCPu0rpc6V07BDn3pTo5QAZzb0scLsc=;
 b=FmfTndHIxqbtnuRU9yyz3IpycMWLnEdF9IRn0tdtuUWaZqLHjuBIk/7b
 6CogP9sF+8xOVLifuzqBirow4Un8/A94rWIHoR4iw7NYlPBKfHX9fCmFJ
 71DTfAXRQgEz5POnq0bTm0bBrtF9qX7dUFOxUp2myATkaG0VKpAM5yHHI
 I+VdMLVjPC8LcJZugbZ9BJMChNNMm+j8IKSFfs11P1WP8/AUYYxQ2NMrj
 2Lf/fCyFwkn0DZbptVZoGhit8+qritY91zwyAgNZ+ecG4iM3xxJlnuQM1
 ZKoQVuAwI7VkFdUheV5GxOzFlmmEGpcBIXsPmO/JQ7cCMx6ewT3my/A+J Q==;
X-CSE-ConnectionGUID: yjCau9zMT7CFFKrQWDItNw==
X-CSE-MsgGUID: iMGi4OfcQou+mIyUGWci1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74125615"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74125615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:31 -0700
X-CSE-ConnectionGUID: 4c3A70hSRzWjUznosEXzQA==
X-CSE-MsgGUID: i9J+mGcvQJWb+0wY7E1wJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224187145"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 2/3] lib/kms: use for_each_crtc() in
 __igt_pipe_populate_outputs()
Date: Mon,  9 Mar 2026 14:40:13 +0200
Message-ID: <b8cfecb0f350f9f1b170d181aae15b06417f5d91.1773059939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773059939.git.jani.nikula@intel.com>
References: <cover.1773059939.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use for_each_crtc() instead of looping pipes in
__igt_pipe_populate_outputs(), in preparation for using CRTC index masks
instead of pipe masks.

Using for_each_crtc() increases clarity in that it only loops valid
CRTCs. Previously, the same was achieved slightly more subtly via the
pipe_mask check.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9326226499a1..4aeeef70eadd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3592,7 +3592,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	unsigned full_pipe_mask = 0, assigned_pipes = 0;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
-	int i, j;
+	int i;
 
 	memset(chosen_outputs, 0,
 	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
@@ -3623,25 +3623,25 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 				continue;
 			}
 
-			for (j = 0; j < igt_display_n_crtcs(display); j++) {
-				bool pipe_assigned = assigned_pipes & (1 << j);
+			for_each_crtc(display, crtc) {
+				bool pipe_assigned = assigned_pipes & (1 << crtc->pipe);
 
-				if (pipe_assigned || !(pipe_mask & (1 << j)))
+				if (pipe_assigned || !(pipe_mask & (1 << crtc->pipe)))
 					continue;
 
 				if (!found) {
 					/* We found an unassigned pipe, use it! */
 					found = true;
-					assigned_pipes |= 1 << j;
-					chosen_outputs[j] = output;
-				} else if (!chosen_outputs[j] ||
-					   output_is_internal_panel(chosen_outputs[j])) {
+					assigned_pipes |= 1 << crtc->pipe;
+					chosen_outputs[crtc->pipe] = output;
+				} else if (!chosen_outputs[crtc->pipe] ||
+					   output_is_internal_panel(chosen_outputs[crtc->pipe])) {
 					/*
 					 * Overwrite internal panel if not
 					 * assigned, external outputs are faster
 					 * to do modesets
 					 */
-					chosen_outputs[j] = output;
+					chosen_outputs[crtc->pipe] = output;
 				}
 			}
 
-- 
2.47.3

