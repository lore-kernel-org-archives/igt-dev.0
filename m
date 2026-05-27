Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316C7CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 13:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC7F896E9;
	Wed, 27 May 2026 13:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnA4eoJF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96451896E9
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779888586; x=1811424586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sYem6OtCH16S6im4qbDJG9g2bwB7m/I3qoOXeJlPzMQ=;
 b=HnA4eoJFWE3aWF8mVjEl2I7mpcIQZ9StP9OYCet4VVIbQGDXZZncJeLV
 8XKFIZdCxzekQ7ksQuliSNndG8LfoyULNTICdS//n1j+s7EV5mXkxyMkT
 E7NtUdVAO+s5aBOxzi15MeQ83WGKK+OXgXyYWXlIk9vNYxl4qaAZw1vTQ
 WEPEGIObIPQN0DmZkopjQDuCZfFilekblesF70MK9ic4VQNasyEDOnKrK
 KezYE5+j0+4589N5cI94GDdLY/k2PT42BqxsS8RgCHw+Lo3427x7iekQ1
 c9Lz9cAEAc5gCH9Mk/li/DEVyNGhPYT+s+PGvl5kBtx2PgrFeGB2091dR Q==;
X-CSE-ConnectionGUID: V0UDZp7fRwujcOj1niwneA==
X-CSE-MsgGUID: xjfBspVtT9qR96msP3ihdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80567414"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80567414"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:29:46 -0700
X-CSE-ConnectionGUID: iaihQ2AlTPGqNhPVbCbyTw==
X-CSE-MsgGUID: f0ny9gn6S+2sBsR2u6qtwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242079805"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:29:44 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 1/3] lib/igt_kms: Add MST bandwidth-fitting support
 and helpers
Date: Wed, 27 May 2026 19:21:06 +0530
Message-ID: <20260527135109.3291120-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527135109.3291120-1-sowmiya.s@intel.com>
References: <20260527135109.3291120-1-sowmiya.s@intel.com>
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

v2: Remove the flag used for caching values and update the
function name to better describe its functionality (Jani)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_kms.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e20307923..639a5f80b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2746,6 +2746,7 @@ static void igt_output_reset(igt_output_t *output)
 {
 	output->pending_crtc = NULL;
 	output->use_override_mode = false;
+	output->bw_fit_applied = false;
 	memset(&output->override_mode, 0, sizeof(output->override_mode));
 
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, 0);
@@ -5384,6 +5385,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 		int ret;
 
 		igt_output_override_mode(output, mode);
+		output->bw_fit_applied = true;
 
 		if (__override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, base + 1))
 			return true;
@@ -5453,6 +5455,11 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 {
 	int ret;
 
+	igt_output_t *output;
+
+	for_each_output(display, output)
+		output->bw_fit_applied = false;
+
 	if (display->is_atomic)
 		ret = igt_display_try_commit_atomic(display,
 						    DRM_MODE_ATOMIC_TEST_ONLY |
@@ -5473,6 +5480,36 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 	return true;
 }
 
+/**
+ * igt_require_mst_link_bw:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * When two or more DP-MST streams share the same upstream link, a joint
+ * atomic commit may be rejected by the driver if the combined stream
+ * bandwidth exceeds the link capacity.  This function detects that
+ * situation and, when found, calls igt_fit_modes_in_bw() to select mode
+ * overrides that satisfy the shared-link BW budget.  The test is skipped
+ * if no valid combination can be found.  No-op when fewer than two active
+ * MST streams are present.
+ */
+void igt_require_mst_link_bw(igt_display_t *display)
+{
+	igt_output_t *output;
+	int active_mst = 0;
+
+	for_each_output(display, output) {
+		if (output->pending_crtc &&
+			igt_check_output_is_dp_mst(output))
+			active_mst++;
+	}
+
+	if (active_mst < 2)
+		return;
+
+	igt_require_f(igt_fit_modes_in_bw(display),
+			  "No valid mode combination fits available MST link BW\n");
+}
+
 /**
  * igt_crtc_refresh:
  * @crtc: CRTC to refresh
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2a3099de..eab4dfded 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -508,6 +508,7 @@ typedef struct {
 
 	/* bitmask of changed properties */
 	uint64_t changed;
+	bool bw_fit_applied;
 
 	uint32_t props[IGT_NUM_CONNECTOR_PROPS];
 	uint64_t values[IGT_NUM_CONNECTOR_PROPS];
@@ -1293,6 +1294,7 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 uint64_t igt_get_writeback_fb_id(igt_output_t *output);
 void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
 void igt_get_and_wait_out_fence(igt_output_t *output);
+void igt_require_mst_link_bw(igt_display_t *display);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
-- 
2.48.1

