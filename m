Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5701BF8DFEA
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0500710E992;
	Fri, 17 Apr 2026 08:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OywVW0xV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A824810E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415432; x=1807951432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uLMMNzusGk19iXwoM3VxEcRll3lRuOeplimmSpksg6E=;
 b=OywVW0xVrk7vQjFVOwWuAuzM0YgV/6eJOnU8buSbXaLPhI30PrbY73wq
 EATSRFJS6kUxbwSfPAknbe3YpBPdTAKtgYWfvkY496akIP9+5afPQw+N2
 YGKM5KWIJgJLUcyOZtM+PM+zfSIbRpodAkk9jBr9Hsd1CyW3xKxOAzxSy
 oks3mEYnTkemyESD1lUxD6PlInXH7PQpRIabP1cpTeviOG1msd9NgC+6r
 MelUASJKy/HRn0zdLhttfG6j4alMDTbhXWo8y731TbZRzLoob1YYuVgQb
 39EJx96HIc7kcN8jh4MZqdaneJx29AeiPLnx6WI9m6JBc3YtE/h4aV3WC A==;
X-CSE-ConnectionGUID: Ei6ocBooQgG/O/V/btVL5Q==
X-CSE-MsgGUID: tmUlwIxUQgm4hsCgkem4Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308443"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:52 -0700
X-CSE-ConnectionGUID: 3SyYPksATPuLwSpdQa15cg==
X-CSE-MsgGUID: aeDi5s9FS6yXILEc8l4FcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361741"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:51 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 4/7] Revert "tests/intel/kms_pm_dc: Update VRR handling and
 eDP output check"
Date: Fri, 17 Apr 2026 14:05:03 +0530
Message-ID: <20260417083506.33404-5-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

This reverts commit e08151940f034f976632d99798f2097b2ee5e04e.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 3f93a2a82..91c9cebf2 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -541,7 +541,7 @@ static void test_deep_pkgc_state(data_t *data)
 	time_t start = time(NULL), duration = 2, delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
-	bool flip = true;
+	bool vrr_supported = false, flip = true;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
@@ -549,42 +549,29 @@ static void test_deep_pkgc_state(data_t *data)
 	drmModeModeInfo *mode;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-			igt_skip("No eDP output found, skipping the test.\n");
 		/* Check VRR capabilities before setting up */
 		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
 		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			/*
-			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
-			 * when KMD allows for such capability.
-			 */
-			igt_pipe_set_prop_value(display, pipe,
-						IGT_CRTC_VRR_ENABLED, false);
-			igt_assert(igt_display_try_commit_atomic(display,
-								 DRM_MODE_ATOMIC_ALLOW_MODESET,
-								 NULL) == 0);
+			vrr_supported = true;
 			break;
 		}
 	}
+
+	/* Skip the test if no VRR capable output is found */
+	igt_skip_on_f(!vrr_supported,
+		      "No VRR capable output found, skipping the test.\n");
+
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, crtc);
-	for_each_connector_mode(output, mode) {
-		data->mode = mode;
-		delay = (MSEC / (data->mode->vrefresh));
-		/*
-		 * Should be 5ms vblank time required to program higher
-		 * watermark levels
-		 */
-		if (delay >= (5 * MSEC))
-			break;
-	}
+	igt_output_set_pipe(output, pipe);
 
 	data->output = output;
+	data->mode = igt_output_get_mode(output);
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+	delay = (MSEC / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

