Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62587C02199
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 15:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2610E8B1;
	Thu,  6 Feb 2025 15:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abyh4Jb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586B810E8B1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738856648; x=1770392648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bh9jrySGm7JNmvzMk3nhXEWLG1L3wWacYt6vKpoqAhk=;
 b=abyh4Jb/P0ZzE0Nto+3hZF3hhN55+gQ0QN03UvRHmrTmYy1+xdTLCYrE
 mMJZqbTndTqqfuX2oWap5UmVFZVnqwPHU0e8uijPQQhWGIi6fv8l9k+Qy
 5+go9TnAHfio3zWkGNT/0wOUx/31eSLHSiTQF6tIwY/0gVnKMCdv/QSW5
 Uj7OcEEIYTTK9wZf6+8VZgiqyNOInwZ6IYnoo+7v88/BpVLHJmqgBjW5m
 prfrwSpD8zyhkmPHS65JKnj3+Xr+RArMFGMWFW+9vyuN9KulVI7rHerr1
 Rr0JmN7OTU/hawMsBK4pzsga6brc5LUh72mVN8WTcMl6FYAXqhPxdSOF0 w==;
X-CSE-ConnectionGUID: ZcPsx2pZSsWtUNUEovJb8Q==
X-CSE-MsgGUID: UfeUz7UFQ22VKr9zhtejvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39161592"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39161592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:44:08 -0800
X-CSE-ConnectionGUID: Mp8J7QZZRUuMoX77Nj52MQ==
X-CSE-MsgGUID: S+PCSfGzS2KibGW5Q5jaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116435956"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:44:07 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
Date: Thu,  6 Feb 2025 21:29:47 +0530
Message-Id: <20250206155947.973010-1-jeevan.b@intel.com>
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

Ensure all outputs are checked before skipping the test, preventing
premature exits when an eDP is available later.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 9551cc6b9..aaf057b68 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -640,30 +640,39 @@ static void test_deep_pkgc_state(data_t *data)
 	time_t delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
-	bool flip = true;
+	bool flip = true, edp_found = false;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-			igt_skip("No eDP output found, skipping the test.\n");
-		/* Check VRR capabilities before setting up */
-		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			/*
-			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
-			 * when KMD allows for such capability.
-			 */
-			igt_pipe_set_prop_value(display, pipe,
-						IGT_CRTC_VRR_ENABLED, false);
-			igt_assert(igt_display_try_commit_atomic(display,
-								 DRM_MODE_ATOMIC_ALLOW_MODESET,
-								 NULL) == 0);
+		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+			edp_found = true;
 			break;
 		}
 	}
+
+	igt_require_f(edp_found, "No eDP output found, skipping the test.\n");
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+			/* Check VRR capabilities before setting up */
+			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
+				/*
+				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
+				 * when KMD allows for such capability.
+				 */
+				igt_pipe_set_prop_value(display, pipe,
+							IGT_CRTC_VRR_ENABLED, false);
+				igt_assert(igt_display_try_commit_atomic(display,
+									 DRM_MODE_ATOMIC_ALLOW_MODESET,
+									 NULL) == 0);
+				break;
+			}
+		}
+	}
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-- 
2.25.1

