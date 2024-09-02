Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA891CD3420
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 09:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8135210E266;
	Mon,  2 Sep 2024 09:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDJjt2qZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9910E265
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725267618; x=1756803618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tb/lWHH5Ur0VnYFzhyoUE0ouJf6ntAJLWxHsr/oYtNA=;
 b=YDJjt2qZ2VB3jGzLTrcojGgNaqtMp8Gy5SUCgtFeyYScpbZ9yHzXDgRE
 b540gST+oD7j7vCPs9KREXXT1bANLZNHKoeGCyN5lnxCsBLadGsBty/Ix
 pT5AOcxleiIoKkta9x2U8d/wTO1TfmINc6pSxw2hBurvqUNrCPYxDwrVw
 DwrwOq0EEL6rNxZyIOZ+7wPa2SVzVj/c1RJIfelLsWoQ4TzhBBONkvQA8
 CEedIvRFtoMM1zFV5K9o3EJutntP4vtnNUPJqdCS/fh4sY6gPegfviMqL
 kQM3RhHni42SWPjRR/CF1aqs9THx2DgTtKOg2Z6evHOnS6fpA4TMxWlml A==;
X-CSE-ConnectionGUID: iAXqxPYhRmW+I9kGP0mJsQ==
X-CSE-MsgGUID: WVLIkE8GR+SvYfvQx5hXDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41316181"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41316181"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:00:18 -0700
X-CSE-ConnectionGUID: LXEEi+N1SS+AiaQcF+uXRw==
X-CSE-MsgGUID: 6wFHiUf1TrK/kk/EnQdzOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64749696"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 02:00:16 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 2/4] tests/intel/kms_pm_dc: Update VRR handling and
 eDP output check
Date: Mon,  2 Sep 2024 14:29:41 +0530
Message-ID: <20240902085943.1496088-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
References: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
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

Enhance the test_deep_pkgc_state function by including the following
changes:
- Remove the unused variable `vrr_supported` to clean up the code.
- Add a check for the eDP connector to ensure proper connector handling.
- Update VRR handling to disable VRR and commit atomic changes.
- Modify the delay calculation for connector modes to ensure proper
  vblank time.
- Remove redundant VRR capability check and skip logic.

v2: Correct indentation and update comments. (Suraj, Jeevan)
v3: Update Commit subject/message. (Kamil)
v4: Update commit subject/message. (Suraj)
v5: Update commit subject/message. (Suraj)
v6: Update TODO comment and commit message. (Suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_pm_dc.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 92b1514ef..2d03ba4c5 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -595,36 +595,49 @@ static void test_deep_pkgc_state(data_t *data)
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
 		/* Check VRR capabilities before setting up */
 		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
 		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			vrr_supported = true;
+			/*
+			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
+			 * when KMD allows for such capability.
+			 */
+			igt_pipe_set_prop_value(display, pipe,
+						IGT_CRTC_VRR_ENABLED, false);
+			igt_assert(igt_display_try_commit_atomic(display,
+								 DRM_MODE_ATOMIC_ALLOW_MODESET,
+								 NULL) == 0);
 			break;
 		}
 	}
-
-	/* Skip the test if no VRR capable output is found */
-	igt_skip_on_f(!vrr_supported,
-		      "No VRR capable output found, skipping the test.\n");
-
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
+	for_each_connector_mode(output) {
+		data->mode = &output->config.connector->modes[j__];
+		delay = (MSEC / (data->mode->vrefresh));
+		/*
+		 * Should be 5ms vblank time required to program higher
+		 * watermark levels
+		 */
+		if (delay >= (5 * MSEC))
+			break;
+	}
 
 	data->output = output;
-	data->mode = igt_output_get_mode(output);
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = (MSEC / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

