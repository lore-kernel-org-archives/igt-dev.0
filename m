Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE276C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 17:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748F710E224;
	Wed,  3 Jul 2024 17:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsK6gnVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD010E299
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 17:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720026571; x=1751562571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WFs1Ugu1n5C661YTjYyFwc0Fxh4ghalmYqFBXEmKGgM=;
 b=WsK6gnVXYmX0ENmTSr2VW1JcfW0t5IJM1GtTEVukQbtU5LxXWU/rzkOS
 Tc3BLTP/3eXHj4t5szIVt52WkQ8DfaH7VNRm52C474wXONQIhmmFZgWO7
 jmvgvdoZfJOGJgpndYiyYb6deJrPLicPiWLwanUo0Pewk/tXbrWDtc8Ny
 MEm+VkMJ06gHe6Y82AuNxKNtqu5+tXtBsr89fwwO5PaQ4tC4ckiIQC9/I
 BEqAzMEI6/YyhDrbk7ImsFd9fi4uZBGMg0+TklmUGMxxd91VbJWE+rCvR
 /VLwNSBBjQOTUUX4LCNBwEde3Fb9SMoBioVz6wKebJ2WJvqSsyht2K3hA w==;
X-CSE-ConnectionGUID: D0NvxHEKSCa+HzNbMwEybg==
X-CSE-MsgGUID: ZVrGKh9HS5OZoatuF1eyBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17108836"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17108836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 10:09:30 -0700
X-CSE-ConnectionGUID: q7nBgVdyTXeYBRkmT8PpTg==
X-CSE-MsgGUID: HyqPnDFRTIq1kp1qJoHaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46104817"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 10:09:28 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Modified the deep-pkgc subtest.
 Changes: 1. Added checks to avoid connector failures. 2. Added vblank wait to
 sync with frame time.
Date: Wed,  3 Jul 2024 22:43:39 +0530
Message-ID: <20240703171339.381480-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e1318bfa6..b92478d50 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, delay;
+	time_t start = time(NULL), duration = 4, vb_delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool vrr_supported = false, flip = true;
@@ -602,6 +602,12 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_output_t *output = NULL;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+
+		/* check for the eDP connector */
+		if(output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		{
+			igt_skip("No eDP output found, skipping the test.\n");
+		}
 		/* Check VRR capabilities before setting up */
 		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
 		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
@@ -618,28 +624,46 @@ static void test_deep_pkgc_state(data_t *data)
 
 	igt_output_set_pipe(output, pipe);
 
+	for_each_connector_mode(output)
+	{
+		data->mode = &output->config.connector->modes[j__];
+		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
+		/* At least 5ms vblank time required to program higher
+		 * watermark level
+		*/
+		if(vb_delay >  5000)
+		{
+			break;
+		}
+	}
+
+
 	data->output = output;
 	data->mode = igt_output_get_mode(output);
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
+	/* Waiting for the vblank to sync the frame time */
+	igt_wait_for_vblank_count(data->drm_fd,data->display.pipes[pipe].crtc_offset,1);
+
+	usleep(5000);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
-
+		usleep(vb_delay);
 		cur_val = read_pkgc_counter(data->debugfs_root_fd);
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
-		usleep(delay);
+
+		usleep(5000);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0

