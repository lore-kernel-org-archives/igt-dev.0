Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F18FC54735
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 12:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FC510E30D;
	Tue, 27 Aug 2024 12:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWWu5W/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB79110E30D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 12:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724762447; x=1756298447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wj0/n8Trt9diwWsdV2SjMz+9CLAoyiGAOPBJZicKM0k=;
 b=YWWu5W/oZcrwokdcLEubDgaCvsOTe5R/cd184J9Aiu9q6YUS3PGyrCHz
 3dyxZKRP0D/W8WpvOeOAtosRGpZQG8QvXELcKp6b10ZMPubDupd2Oeq+V
 8E3Glc5x0gd3Ud1U0tMVYhMk2tR46UWXjxt9TEe0DOVbM7t7d/gXHf59a
 Biu0qyi0VC78nAeWyQRQT9b/ZGwMRRpPiSrpCaq0qGY9BYfYTcFlUVsPo
 8oo/4c9HeRFWYw7V0ZpYVrzbDfN/KmJohcO2U0F5znoODGqm787wvZN73
 /S5N8ZUKjjeLEkQTUhdnQNz/3pcDBgoYilHkKYDV2h0dzcY8Q9Se3aONJ g==;
X-CSE-ConnectionGUID: pim7mXVeRE6xLSoHcYmPxg==
X-CSE-MsgGUID: ezBX/tXdTseZKEAcqKTPgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27117250"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="27117250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 05:40:47 -0700
X-CSE-ConnectionGUID: GSQTLgMBRqa7C1qripJHrA==
X-CSE-MsgGUID: 8MANRoClTM+yc0TUysZT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62905842"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:40:45 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 2/4] tests/intel/kms_pm_dc: Update VRR handling and
 eDP output check
Date: Tue, 27 Aug 2024 18:10:16 +0530
Message-ID: <20240827124018.1373304-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_pm_dc.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 2ae9fd2a5..b9bee3523 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -596,36 +596,50 @@ static void test_deep_pkgc_state(data_t *data)
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

