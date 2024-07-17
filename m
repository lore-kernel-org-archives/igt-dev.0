Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B7C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 13:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533B210E172;
	Wed, 17 Jul 2024 13:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gc86eraJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734F010E172
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 13:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224697; x=1752760697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T1EjagECSR7yTYG35QDo2anIxWDX+1e/UVAT75pMGjw=;
 b=Gc86eraJIBZc/c+jBX5eXSZTuBNnxW1c9gsl2J8hxlvSaOH/Me/B+suA
 oPqhrF9ablOMrn5tgbfe5MuWY1+z829rVftHbJYy2NbOsxMhxD+O1FFDK
 VKQ0HBRMBqgqESX6sS7KnXBne1Lo6cfO+v4x61ki/uNOMCQUWTmr24EQd
 OIGdNQKvxhdRwKQdzppBlMOivzVaQGfEt/EF0WHOwudnr1xWjbhpRGstL
 wUH6cgmzEImKGWvVdi2I805dXACBfgGrZyCAGg6DV6+AHC/DxlhfqZRC1
 LbkYKr9iMK4UZVCvG+ojf5MABEnybrVjAxoG+oJk4ser+hNqezWhdnLbI w==;
X-CSE-ConnectionGUID: o1Z/VJ3/Rv6Swdv47pX6cg==
X-CSE-MsgGUID: I5/KpjZFQtuuoZ/xu3fpGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18917305"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18917305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:58:17 -0700
X-CSE-ConnectionGUID: X5UwTwPVRayUK5qQ5VzLpA==
X-CSE-MsgGUID: axgoJjq5RQOkyu65S/Fmjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54919608"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 06:58:15 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/kms_pm_dc:Add basic validation checks
 to achieve deep-pkgc
Date: Wed, 17 Jul 2024 19:32:23 +0530
Message-ID: <20240717140225.640086-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717140225.640086-1-ramanaidu.naladala@intel.com>
References: <20240717140225.640086-1-ramanaidu.naladala@intel.com>
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

Add connector checks and test requirement validations for deep-pkgc

v2: Correct indentation and update comments (Suraj, Jeevan)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e1318bfa6..8fb35a2df 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -592,31 +592,43 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
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
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			igt_skip("No eDP output found, skipping the test.\n");
+		/* DEEP PKG_C_LATENCY can be configured only for fixed refresh rates */
 		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
 		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			vrr_supported = true;
+			igt_pipe_set_prop_value(display, pipe,
+						IGT_CRTC_VRR_ENABLED, false);
+			igt_assert(igt_display_try_commit_atomic(display,
+								 DRM_MODE_ATOMIC_ALLOW_MODESET,
+								 NULL) == 0);
 			break;
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
+		/*
+		 * At least 5ms vblank time required to program higher
+		 * watermark levels
+		 */
+		if (vb_delay > (5 * MSEC))
+			break;
+	}
 
 	data->output = output;
 	data->mode = igt_output_get_mode(output);
-- 
2.43.0

