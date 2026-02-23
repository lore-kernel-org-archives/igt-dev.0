Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1CEEA4FD5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D8210E3D1;
	Mon, 23 Feb 2026 15:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzIKo9b5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5381310E3D1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771860820; x=1803396820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JC6P9dQVLA2M30VUwS2IwmHP7Ky0s6toP/y61OESO9w=;
 b=dzIKo9b5d8vQYL50BC/V7T5ZuIIvuffj8QeCeTYV+3iaI9Xf9xX9wk6P
 jHckuHQjbQNLgAge2Wzymq7skIi+pamEj/g3FehqMmWVC0Aw/McXgKvd4
 7fgFe7GRp3943QrMLmtiD08hqoIpFjFqQA83oN7mCxIDc6vp5g8scOTyP
 SSsDyK3C4DHX0Ka+TahJU+DRWOrcPYqS0R7nIFMGDd2BiG80y5wdCaS8z
 IT88bA5E28rk0BW5o+Cj4hTqaVM0C81Au0ldFe8KnmWDCA4ZDI3TlNqAi
 2FGN4SkU028DILobXDeikfhi5X5t1+x/ifE6XYssDRiYwD6MZXnWkGKQg A==;
X-CSE-ConnectionGUID: xLSZUTXVTyaHbx/LwigwrQ==
X-CSE-MsgGUID: kl4rmivhRUKL0i3YNQvUig==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73036375"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="73036375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:33:40 -0800
X-CSE-ConnectionGUID: FgAxrfp6RBeVduYm7Gcl/g==
X-CSE-MsgGUID: 3eSMmmwxQoCjNpWRLg97kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214821458"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:33:39 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, animesh.manna@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Avoid LOBF debugfs loss by checking
 during active display
Date: Mon, 23 Feb 2026 21:04:23 +0530
Message-ID: <20260223153423.2728601-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Adjusts the placement of LOBF‑related checks so they run while the
display pipeline is still active. Previously, these checks were
executed after the display had already begun shutting down, causing
the debug information to become unavailable and resulting in false
failures.

Now checks are moved to a stage where the panel and link remain
enabled, ensuring consistent access to LOBF telemetry.
Initialization and cleanup of supporting resources are also
streamlined to avoid repeated setup and teardown during execution.

Fixes: 546803560a7a ("tests/kms_vrr: extend lobf test for supported connectors")

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index f500d7a59..569000fee 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -903,6 +903,16 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	prepare_test(data, output, crtc);
 	data->flag |= flags;
 
+	if (flags & TEST_LINK_OFF) {
+		if (!igt_has_lobf_debugfs(data->drm_fd, output))
+			igt_skip("i915_edp_lobf_status not present for %s\n",
+				 igt_output_name(output));
+
+		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
+		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
+			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+	}
+
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
 		 output->name, igt_crtc_name(crtc), data->range.min,
 		 data->range.max);
@@ -998,7 +1008,6 @@ static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
-	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
 
 	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
 	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
@@ -1012,18 +1021,6 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
-	if (flags & TEST_LINK_OFF) {
-		if (!igt_has_lobf_debugfs(data->drm_fd, output)) {
-			igt_info("i915_edp_lobf_status not present for %s\n",
-				 igt_output_name(output));
-			return false;
-		}
-
-		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
-			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
-	}
-
 	/* Reset output */
 	igt_display_reset(&data->display);
 
@@ -1057,7 +1054,6 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 
 	data->range.min = data->switch_modes[LOW_RR_MODE].vrefresh;
 
-	close(data->debugfs_fd);
 	return true;
 }
 
@@ -1168,6 +1164,7 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 
@@ -1243,6 +1240,7 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 	}
 
 	igt_fixture() {
+		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

