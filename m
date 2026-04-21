Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071CCF327A3
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 05:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7E910E17D;
	Tue, 21 Apr 2026 05:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQ590eje";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D9010E17D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 05:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776750612; x=1808286612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SF2KHZrtH/W9VZTmK/r0zhwmPauNjxPNJXTAPQAYf4w=;
 b=HQ590ejeoYIzhNW321GRcOhNzgheJvUp52j67wvw+sS//eUohuCQKnNf
 TM4CYSF23Cd1nxvLnSCkctUyWIQ/mwpSF3wWNX5Z+srLUY5Uh932vfYvP
 1lrt+vj5T1gMUrk1U9X+Bdb9mqUALadsmQemlEsCQ4DxiY9e5KRNY/5me
 mebNdtLoT5IBwwPu64UWiYEhT/QrWpoQiQ2qmHKOq5RqCu6JbJnBrXovB
 2Q23tP4vqc/nnmsN0wOWroA4P+DJuCRnzaN82qgmI7ZYXkqdD1ETMW0Zz
 49jMXCqjTufTXCccp23Ho9xb4mqX+4DpLaE8kMO3powLRwZAXG1NOHUyM g==;
X-CSE-ConnectionGUID: a0ozE71ZRe6n/9PTRVZsdg==
X-CSE-MsgGUID: 7fwMYy4sRbWNd5pxfqozfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81288125"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="81288125"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 22:50:12 -0700
X-CSE-ConnectionGUID: HOLpq4xKTOKpx/ohuxlEsA==
X-CSE-MsgGUID: BK/tFFRdQleFIKIp/P4xfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="225449833"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 22:50:09 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Add MST bandwidth-fitting support
 and helpers
Date: Tue, 21 Apr 2026 11:41:13 +0530
Message-ID: <20260421061114.2262809-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421061114.2262809-1-sowmiya.s@intel.com>
References: <20260421061114.2262809-1-sowmiya.s@intel.com>
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

Add helpers to handle shared-link DP bandwidth fitting for
MST/daisy-chain configurations.

On MST hubs/daisy-chains multiple streams share one DP link
and a joint atomic commit can be rejected unless modes are
chosen to fit the link BW. This will centralizes MST detection
and fitting so tests can request fitting only when required.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d758b63c..0c7965954 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2744,6 +2744,7 @@ static void igt_output_reset(igt_output_t *output)
 {
 	output->pending_crtc = NULL;
 	output->use_override_mode = false;
+	output->bw_fit_applied = false;
 	memset(&output->override_mode, 0, sizeof(output->override_mode));
 
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, 0);
@@ -3227,6 +3228,15 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	igt_display_reset_outputs(display);
 
+	/* Detect MST outputs after they are fully initialized */
+	for (i = 0; i < display->n_outputs; i++) {
+		if (display->outputs[i].config.connector &&
+		    igt_check_output_is_dp_mst(&display->outputs[i])) {
+			display->needs_bw_fit = true;
+			break;
+		}
+	}
+
 out:
 	LOG_UNINDENT(display);
 
@@ -5372,6 +5382,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 		int ret;
 
 		igt_output_override_mode(output, mode);
+		output->bw_fit_applied = true;
 
 		if (__override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, base + 1))
 			return true;
@@ -5441,6 +5452,9 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 {
 	int ret;
 
+	for (int i = 0; i < display->n_outputs; i++)
+		display->outputs[i].bw_fit_applied = false;
+
 	if (display->is_atomic)
 		ret = igt_display_try_commit_atomic(display,
 						    DRM_MODE_ATOMIC_TEST_ONLY |
@@ -5461,6 +5475,25 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 	return true;
 }
 
+void igt_display_fit_bw(igt_display_t *display)
+{
+	int active_mst = 0;
+
+	if (!display->needs_bw_fit)
+		return;
+	for (int i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+
+		if (output->pending_crtc &&
+		    igt_check_output_is_dp_mst(output))
+			active_mst++;
+	}
+	if (active_mst < 2)
+		return;
+	igt_require_f(igt_fit_modes_in_bw(display),
+		      "No valid mode combination fits available MST link BW\n");
+}
+
 /**
  * igt_crtc_refresh:
  * @crtc: CRTC to refresh
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index fcbb6a5ad..5c60e7bb4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -506,6 +506,7 @@ typedef struct {
 
 	/* bitmask of changed properties */
 	uint64_t changed;
+	bool bw_fit_applied;
 
 	uint32_t props[IGT_NUM_CONNECTOR_PROPS];
 	uint64_t values[IGT_NUM_CONNECTOR_PROPS];
@@ -536,6 +537,7 @@ struct _igt_display {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+	bool needs_bw_fit;
 };
 
 typedef struct {
@@ -1286,6 +1288,7 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 uint64_t igt_get_writeback_fb_id(igt_output_t *output);
 void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
 void igt_get_and_wait_out_fence(igt_output_t *output);
+void igt_display_fit_bw(igt_display_t *display);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
-- 
2.43.0

