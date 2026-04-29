Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DFFFF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 10:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0B710EF2A;
	Wed, 29 Apr 2026 10:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVUrqAmo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762B10EF27
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777456805; x=1808992805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLGpDfPEi9Ey6HeOnZ0jyev4yjQmmWDFR1I2vqWBNaY=;
 b=kVUrqAmoEJN9WE4B+Om66W7Syaba12CP2pzLX6Oi0ee0e/LbHfy+cFjt
 plPvg9tfxJZAbHIGOLp9ZLMxr278MXqvv3LautpRz9lbuAH3NrE2fO5SB
 k5g1e2D0rBrJbORdCUfd67DZSuFZObrTQJihp8yZTXLD/Fv7AM4CHNAvp
 snssaToArrP2x09WUHyE7KuuKhl/rkEGmn803VWWzOzkFOyaBaKy0vR3g
 gjj++59Kr0rrMzzjRgauAx1rwozINcz9Mbw+VSw9AMm8Q8KzuZLi5gITr
 w3nl4GZrQcylU0j+yoAPD7ZaTU+A6hiptrQ+NQVMLKrvMkveXHVNnagwH g==;
X-CSE-ConnectionGUID: qpmq+K/ZQ/KWgVIPnka86Q==
X-CSE-MsgGUID: 7CdtUTFqTYCHVOJVl73l+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82237144"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82237144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:00:05 -0700
X-CSE-ConnectionGUID: 02YsJvkjQCWuWfqXbf17XA==
X-CSE-MsgGUID: If/Ct/r1SI6OSUv2KjiWUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="231572367"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:00:04 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Add MST bandwidth-fitting support
 and helpers
Date: Wed, 29 Apr 2026 15:51:24 +0530
Message-ID: <20260429102125.2313449-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429102125.2313449-1-sowmiya.s@intel.com>
References: <20260429102125.2313449-1-sowmiya.s@intel.com>
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
index 2efdfb85f..b6582fcbe 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2744,6 +2744,7 @@ static void igt_output_reset(igt_output_t *output)
 {
 	output->pending_crtc = NULL;
 	output->use_override_mode = false;
+	output->bw_fit_applied = false;
 	memset(&output->override_mode, 0, sizeof(output->override_mode));
 
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, 0);
@@ -5376,6 +5377,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 		int ret;
 
 		igt_output_override_mode(output, mode);
+		output->bw_fit_applied = true;
 
 		if (__override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, base + 1))
 			return true;
@@ -5445,6 +5447,11 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
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
@@ -5465,6 +5472,36 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
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
index fcbb6a5ad..f8ba1a11e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -506,6 +506,7 @@ typedef struct {
 
 	/* bitmask of changed properties */
 	uint64_t changed;
+	bool bw_fit_applied;
 
 	uint32_t props[IGT_NUM_CONNECTOR_PROPS];
 	uint64_t values[IGT_NUM_CONNECTOR_PROPS];
@@ -1286,6 +1287,7 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 uint64_t igt_get_writeback_fb_id(igt_output_t *output);
 void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
 void igt_get_and_wait_out_fence(igt_output_t *output);
+void igt_require_mst_link_bw(igt_display_t *display);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
-- 
2.48.1

