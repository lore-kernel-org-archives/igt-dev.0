Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E8C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629BF10E066;
	Mon, 29 Jun 2026 09:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Szo8I24H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E80D10E066
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782723804; x=1814259804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c23v8qH1nA00B712zpnYF+pDGlTVmNi6+cLdHguucNI=;
 b=Szo8I24HLVcQ4ho1pWh7QCVkMy6BZOWC1uHU9KY/mlwbO+tnz5HuTRot
 GQG/GhSyhfaLtzpRzJlSzR52xotec0z4DVkLHXOaYm0vtWV4gmaQ34PJ/
 tsKqOThODbU5Jd7/Zh3QA5Rm4X6rA6dKrLrtkswK8aTgt4xpI3BOMqQHN
 ec3Kp6WpjeBV0mCDalIKDwExCsNAGIcXizlhvfK9brFYziwjbcjyRsr8m
 /9RY+iesi9odUxWLg8Zr7eI6g+IC4K8N8GbBIu2RoPeCSS6SqlRDzVC6t
 lrOf6lpzobjc5x4KetizW+FUal0viLhKhsCcF4yaNEadL1avPQalVPFri A==;
X-CSE-ConnectionGUID: 4gbBTgSjQCKeKEhDgAAw0w==
X-CSE-MsgGUID: wAriSfDiQa6Xi6lN80mctg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94793454"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94793454"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:24 -0700
X-CSE-ConnectionGUID: TnwWN9A0SYG3nt6Nl76A9A==
X-CSE-MsgGUID: wqeQyLaWRlq9+uawZfeLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281988773"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:23 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 1/3] lib/igt_kms: Add MST bandwidth-fitting support
 and helpers
Date: Mon, 29 Jun 2026 14:56:09 +0530
Message-ID: <20260629092611.298235-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629092611.298235-1-sowmiya.s@intel.com>
References: <20260629092611.298235-1-sowmiya.s@intel.com>
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
v3: Apply mst bw fit for shared link (Kunal)
    Remove unused variable (Kunal)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_kms.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 75 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e82d32130..fceca2a1b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5472,6 +5472,80 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 	return true;
 }
 
+/**
+ * igt_outputs_share_mst_link:
+ * @output_a: first output
+ * @output_b: second output
+ *
+ * Returns: true if both outputs are active DP-MST streams that share the
+ * same upstream link, i.e. their root connector IDs (as encoded in the
+ * MST PATH property) are equal.  Returns false if either output is not an
+ * active MST stream or if they are rooted at different connectors.
+ */
+static bool igt_outputs_share_mst_link(igt_output_t *output_a,
+				       igt_output_t *output_b)
+{
+	if (!output_a->pending_crtc || !igt_check_output_is_dp_mst(output_a))
+		return false;
+
+	if (!output_b->pending_crtc || !igt_check_output_is_dp_mst(output_b))
+		return false;
+
+	return igt_get_dp_mst_connector_id(output_a) ==
+	       igt_get_dp_mst_connector_id(output_b);
+}
+
+/**
+ * igt_require_mst_link_bw:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * When two or more DP-MST streams share the same upstream link (i.e. they
+ * are both rooted at the same MST hub), a joint atomic commit may be
+ * rejected by the driver if the combined stream bandwidth exceeds the link
+ * capacity.  This function detects that situation by comparing the root
+ * connector ID embedded in each output's MST PATH property and, when two
+ * or more active outputs share the same root, calls igt_fit_modes_in_bw()
+ * to select mode overrides that satisfy the shared-link BW budget.  The
+ * test is skipped if no valid combination can be found.
+ *
+ * TODO: Extend this function to proactively detect outputs that share a
+ * DP tunnel (USB4/Thunderbolt) and trigger igt_fit_modes_in_bw() for
+ * those too.
+ */
+void igt_require_mst_link_bw(igt_display_t *display)
+{
+	igt_output_t *mst_outputs[IGT_MAX_PIPES];
+	int n_mst = 0;
+	igt_output_t *output;
+	bool shared_link = false;
+	int i, j;
+
+	/* Collect all active MST outputs in one pass. */
+	for_each_output(display, output) {
+		if (output->pending_crtc && igt_check_output_is_dp_mst(output))
+			mst_outputs[n_mst++] = output;
+	}
+
+	/* Need at least two MST outputs before a shared-link is possible. */
+	if (n_mst < 2)
+		return;
+
+	/* Check every pair for a shared upstream root connector. */
+	for (i = 0; i < n_mst && !shared_link; i++)
+		for (j = i + 1; j < n_mst; j++)
+			if (igt_outputs_share_mst_link(mst_outputs[i],
+						       mst_outputs[j])) {
+				shared_link = true;
+				break;
+			}
+
+	if (!shared_link)
+		return;
+
+	igt_require_f(igt_fit_modes_in_bw(display),
+		      "No valid mode combination fits available MST link BW\n");
+}
+
 /**
  * igt_crtc_refresh:
  * @crtc: CRTC to refresh
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3df3ba866..f5aff5008 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1370,6 +1370,7 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 uint64_t igt_get_writeback_fb_id(igt_output_t *output);
 void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
 void igt_get_and_wait_out_fence(igt_output_t *output);
+void igt_require_mst_link_bw(igt_display_t *display);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
-- 
2.51.0

