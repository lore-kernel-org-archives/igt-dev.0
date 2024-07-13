Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FBFC3DA42
	for <igt-dev@archiver.kernel.org>; Sat, 13 Jul 2024 07:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C86D10E072;
	Sat, 13 Jul 2024 07:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIso4EWi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A521610E072
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Jul 2024 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720855363; x=1752391363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bZzwTU4BVORwcABnMY5FEXZAHyWxS63fHDEUca1+M6k=;
 b=CIso4EWiFt/RirSg1g62Nowg1xiPq5gdwebc7YidbGFEyR4pVWIP7rDF
 2HvdN/aLTtcj3U8891buYC0r6EkchetadqLsIs5Ef5wrhnvk13/jU1/U0
 BhPu3iWK0hdgcrvUx1RuHmtcCKoXywYiQeEABWwHRMjloMOewgAbEOeov
 qNLqh3gn/NjmvZqFNzrcPZt4FyyXTFjqkd2JQdpLVS8KixCl4xxDZ/DFE
 T9EuswSmr6TFJCKHq4hIWEoHZAJjGmBQnXu/6OXnjCN6aEMXBE2bMeirv
 sXdD1M8Uj2N+0LTPXFNfEH+bqUMJXlzcplaggMLgyxZE9/DZulualyzhM w==;
X-CSE-ConnectionGUID: 1FEi7ggwSmmqGLxHIOcU8g==
X-CSE-MsgGUID: HIDJ8Co6RYab7ZxEAP9o+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22067013"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; d="scan'208";a="22067013"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 00:22:42 -0700
X-CSE-ConnectionGUID: LeNSKr8XQiiFmbHoDdDs+g==
X-CSE-MsgGUID: hdBDn8ReRbuEZg084w4GcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; d="scan'208";a="48861340"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 00:22:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc:Add basic checks achive
 deep-pkgc
Date: Sat, 13 Jul 2024 12:56:45 +0530
Message-ID: <20240713072646.551590-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
References: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
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

This patch will add the connector checks and test requirement
checks for deep-pkgc

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e1318bfa6..bca5bfa58 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -592,31 +592,46 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, delay;
+	time_t start = time(NULL), duration = 2, vb_delay, delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
-	bool vrr_supported = false, flip = true;
+	bool flip = true;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		/* Check VRR capabilities before setting up */
+		/* Deep-Pkgc is a power feature it will support only on eDP
+		 * and low power pipes so add a check for the eDP connector
+		 */
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			igt_skip("No eDP output found, skipping the test.\n");
+		/* DEEP PKG_C_LATENCY can be configured only for fixed refresh rates.
+		 * It will be support NON-VRR or VRR with Vmax=Vmin=Flipline.
+		 * Disable the VRR if panel supports VRR.
+		 */
 		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
 		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			vrr_supported = true;
-			break;
+			igt_pipe_set_prop_value(display, pipe,
+					IGT_CRTC_VRR_ENABLED, false);
+			igt_assert(igt_display_try_commit_atomic(display,
+						DRM_MODE_ATOMIC_ALLOW_MODESET,
+						NULL) == 0);
 		}
 	}
 
-	/* Skip the test if no VRR capable output is found */
-	if (!vrr_supported)
-		igt_skip("No VRR capable output found, skipping the test.\n");
-
 	igt_display_reset(display);
-
 	igt_output_set_pipe(output, pipe);
+	for_each_connector_mode(output) {
+		data->mode = &output->config.connector->modes[j__];
+		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
+		/* At least 5ms vblank time required to program higher
+		 * watermark levels
+		 */
+		if (vb_delay >  5000)
+			break;
+	}
 
 	data->output = output;
 	data->mode = igt_output_get_mode(output);
-- 
2.43.0

