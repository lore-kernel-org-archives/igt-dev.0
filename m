Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D2CC5518F
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 11:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7710E1A8;
	Fri, 20 Feb 2026 11:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+eFgnqu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009AA10E1A8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771587390; x=1803123390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kBc40lY1jyCtCRlmLeQ0R9hsu9D5LMkVsFxCaCIsmQM=;
 b=C+eFgnquv0QxlpBs0Rylck5DOTyrAqbmdLH39QIalR6jd+ljiFCOpwHH
 2/yc8yDqw0TMGIgg9LZnRSVP1KoETzw7kauvFHSR6Sok7EhWG0Qx7paMv
 f1X/NvgikYieC4H+5bKuOt4w5hs/IdVPt7ncFOSbSUQC1lRWsK04OMkkS
 aQzTK0+QlQrDy4K6kY7K1765BILTYLKe2pUUNERy83ICU+Pb8Ky1EmMSs
 L+o828CwthlE3E/pUousYHsfkt3zVqr9Nyu9WVe3p+3rzzX2/N9SIa+L9
 B+NSR6FOZhJYzLZ95icnsZ/XfAhgA/H4/hDI5e5iHC/wSDml9+PclSuEb w==;
X-CSE-ConnectionGUID: ewvUWpxJQA69cDDtQTSh1Q==
X-CSE-MsgGUID: kE7NWLakQUi+ojHYVCszxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76514983"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="76514983"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:36:30 -0800
X-CSE-ConnectionGUID: aHnDu/yTQkKcbLqRhdmSPg==
X-CSE-MsgGUID: LqeiOAN4TQ2VIZBOWZQ9bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="252512959"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:36:29 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Skip CDCLK bump validation on
 connectors with fixed modes
Date: Fri, 20 Feb 2026 17:15:02 +0530
Message-Id: <20260220114502.469833-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

eDP panels and some other connectors may expose a fixed or very limited
set of modes, often differing only in refresh rate. In such cases, the
computed CDCLK requirement for both low and high refresh modes can end
up identical.

Since no CDCLK recomputation or bump is expected in this scenario,
validating CDCLK bump behavior on such connectors can lead to false
test failures.

Skip CDCLK bump validation on connectors that expose fixed modes
and restrict testing to outputs where mode variation meaningfully
exercises CDCLK recomputation.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index eb8b79c44..84394723a 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -72,6 +72,15 @@ static bool hardware_supported(data_t *data)
 	return false;
 }
 
+static bool has_scaling_mode_prop(data_t *data, igt_output_t *output)
+{
+	return kmstest_get_property(data->drm_fd,
+				    output->id,
+				    DRM_MODE_OBJECT_CONNECTOR,
+				    "scaling mode",
+				    NULL, NULL, NULL);
+}
+
 static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 {
 	__u64 data_rate = (__u64)mode->hdisplay * (__u64)mode->vdisplay * (__u64)mode->vrefresh;
@@ -329,6 +338,26 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	igt_crtc_t *crtc;
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
+                /*
+		 * Some connectors (eg. embedded panels) expose a fixed or
+	         * very limited set of modes, often only differing in refresh
+	         * rate. In such cases, the required CDCLK for both low and
+	         * high refresh modes may end up identical.
+	         *
+	         * Since no CDCLK recomputation or bump is expected for such
+	         * connectors, validating CDCLK bump behavior would lead to
+	         * false negatives.
+	         *
+	         * Skip CDCLK bump validation on connectors exposing fixed
+	         * modes and restrict testing to outputs where mode variation
+		 * can meaningfully exercise CDCLK changes.
+	         */
+		if (!has_scaling_mode_prop(data, output)) {
+			igt_info("Skipping: CDCLK bump validation on %s: "
+				 "connector exposes fixed/limited modes\n", output->name);
+			continue;
+		}
+
 		igt_output_set_crtc(output,
 				    crtc);
 		if (!intel_pipe_output_combo_valid(display)) {
-- 
2.25.1

