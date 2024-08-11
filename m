Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472E3C531DA
	for <igt-dev@archiver.kernel.org>; Sun, 11 Aug 2024 20:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17D510E02A;
	Sun, 11 Aug 2024 20:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktEd7X6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154A310E02A
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Aug 2024 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723406675; x=1754942675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRLe8HQQibjWD5sVwz5T4IBoIMapKyZNnrI4kt/Fo4c=;
 b=ktEd7X6xAHR2sUTeoGtiW/pBzB3TVysVkquqKfYam4ROBf7GwMVHy0Ha
 yzVAoA+uSDTIjuEfFbiyvAw58e7xW1aLzW/uvYPVyognkHWqMaOdxhXyz
 TzKrsHAEaEW0+AhifWWIAxZaHWfg3JJo59RBbjX2w89AFXd4hHIA3SgoA
 +YBYBxhTCpFvg9psMhXX6NmC2IG3fbsWY6HMi2E/MUTfta+8K7OaTZu1Z
 su54T5ynhV/Xgvjza2sdtmnZIKT/vy9OeVtUj0pgH1myrhiyP4SMiUTlv
 7h7s4EFtiVGym1rHAQGOt7I+pwyIsv8HJB1YOjlvPqxms9ia/wjmSY4kP w==;
X-CSE-ConnectionGUID: Gx+DYa4QRGeGaEto4R7VBA==
X-CSE-MsgGUID: vkw8epAYTcGFf6XhM6qj3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21364028"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="21364028"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 13:04:35 -0700
X-CSE-ConnectionGUID: mLLQsdFUTmWOa4Uf0KjD/w==
X-CSE-MsgGUID: G8IV2ONWTFahqplTXgv6VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="88712435"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 13:04:34 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 1/4] tests/intel/kms_pm_dc: Update VRR handling and
 eDP output check
Date: Mon, 12 Aug 2024 01:33:56 +0530
Message-ID: <20240811200359.1086166-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
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

It should be enhance the test_deep_pkgc_state function to include
the following changes:
- Removed the unused variable `vrr_supported` to clean up the code.
- Added a check for the eDP connector to ensure proper connector handling.
- Updated VRR handling to disable VRR and commit atomic changes.
- Modified the delay calculation for connector modes to ensure proper
  vblank time.
- Removed redundant VRR capability check and skip logic.

v2: Correct indentation and update comments. (Suraj, Jeevan)
v3: Update Commit subject/message. (Kamil)
v4: Update commit subject/message. (Suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1aef1e02d..367bf4303 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -594,36 +594,52 @@ static void test_deep_pkgc_state(data_t *data)
 	time_t start = time(NULL), duration = 2, delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
-	bool vrr_supported = false, flip = true;
+	bool flip = true;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			igt_skip("No eDP output found, skipping the test.\n");
+
 		/* Check VRR capabilities before setting up */
 		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
 		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			vrr_supported = true;
+			/*
+			 * TODO: Add check for vmin = vmax = flipline if VRR enabled.
+			 * KMD patches still under review. Need to wait till KMD
+			 * patches merge.
+			 */
+			igt_pipe_set_prop_value(display, pipe,
+						IGT_CRTC_VRR_ENABLED, false);
+			igt_assert(igt_display_try_commit_atomic(display,
+								 DRM_MODE_ATOMIC_ALLOW_MODESET,
+								 NULL) == 0);
 			break;
 		}
 	}
 
-	/* Skip the test if no VRR capable output is found */
-	igt_skip_on_f(!vrr_supported,
-		      "No VRR capable output found, skipping the test.\n");
-
 	igt_display_reset(display);
-
 	igt_output_set_pipe(output, pipe);
 
+	for_each_connector_mode(output) {
+		data->mode = &output->config.connector->modes[j__];
+		delay = 1 * (MSECS / (data->mode->vrefresh));
+		/*
+		 * Should be 5ms vblank time required to program higher
+		 * watermark levels
+		 */
+		if (delay >= (5 * MSECS))
+			break;
+	}
+
 	data->output = output;
-	data->mode = igt_output_get_mode(output);
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

