Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3155C3DA7F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 10:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888710E95A;
	Fri, 26 Jul 2024 10:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzwJovhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87C10E95A
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 10:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721988233; x=1753524233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJi+G4UfX/TfcXvsaOy/4+lqB8fwoKfulpLb8nSWPzc=;
 b=bzwJovhfc8ZsTI2Fa0sG1b1ICeVvAexaei9g4+GyXB6eVw20yrNJfhEI
 R4kZUFYsOWJVSC5aCkxjVPn4J0hxRYfeCJsARe1XCd39Dfe/KFxsD8VvD
 V2uekUkFXtP0hJoCKQgIrjbnl2NS+nJrpA5hdVfUSwaEk4NQrUrX+Yv3e
 O6fEbJo1+3GdzgRogzTOe3OWCtNUsuCin1CurTQ/glSFuG9XkACmAAqT6
 ixr9ReSHfBZBGqn/xrtPDpYDLIfxuk32cYG+8KNh/vA2PhzPlzAdStWLr
 oCz+45bJ+lzPu+eQCExPtBCbuyy2RS9l1OEZPpXrHEzbvSdXxY0TBUVGf Q==;
X-CSE-ConnectionGUID: YAqP124bRZKxfgXacCnlLw==
X-CSE-MsgGUID: aWokCzpwT/e8ehP/BgYsPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22689728"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="22689728"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 03:03:53 -0700
X-CSE-ConnectionGUID: Ul2qF6+WSUCp8gfF6/6hdw==
X-CSE-MsgGUID: d4QTkTaNQEWGfeahL+Z69Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58008665"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 03:03:50 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com, kamil.konieczny@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 1/4] tests/intel/kms_pm_dc: Update
 test_deep_pkgc_state function
Date: Fri, 26 Jul 2024 15:37:48 +0530
Message-ID: <20240726100751.918038-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
References: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
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

Enhanced the test_deep_pkgc_state function to includes the
following changes:
- Removed the unused variable `vrr_supported` to clean up the code.
- Added a check for the eDP connector to ensure proper connector handling.
- Implemented a check to ensure frame time is not less than 5ms.
- Added logic to disable VRR if VRR is enabled.

v2: Correct indentation and update comments. (Suraj, Jeevan)
v3: Update Commit subject/message. (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e1318bfa6..3d37d4a25 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -595,31 +595,43 @@ static void test_deep_pkgc_state(data_t *data)
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
+		delay = 1 * (MSECS / (data->mode->vrefresh));
+		/*
+		 * At least 5ms vblank time required to program higher
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
-- 
2.43.0

