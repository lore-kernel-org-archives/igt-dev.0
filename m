Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF2C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 06:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD78910E128;
	Mon,  5 Aug 2024 06:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEPdzt54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE5510E129
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722840421; x=1754376421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kSjSIB8iZS982wGQe07ebx+jIvsx5aYsSENITYcT6as=;
 b=fEPdzt54kbhfgyBYczOKguQOdRGorxMQN2UHYYBD2+stPQbp3Ep9lyYM
 bw9lfYfrWPIK3GZtL0435b/SGcHa7mfYr6nuYc2IAAF8wMlOpU5QxaJav
 mwys6qeacEXrh6JZxFSbhQj+ENr46kF19ZbJZQVPxiKe4Di7r40UUFTOn
 13go8Ty3LCVV+1SYJ8VfUZxfQJL29gj92uc6S1PWIggJpvzPn186dW0d3
 8VMFbE/d9bxwuTk74tXrWPMhiSp1Vr0gCoCx0VGMMNObtAHb3Csp+aJFd
 6TiIeGb7rzYSdTeGhaJ/tziR6bv2tRtDjdKH1xZWHt/+8HRwMMwMemh0K Q==;
X-CSE-ConnectionGUID: tK6xO+XkSW+mdxgY6Q1GWQ==
X-CSE-MsgGUID: g8RJinMlRTesYImUGChUHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31413522"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="31413522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:47:00 -0700
X-CSE-ConnectionGUID: G5JZb9pBRTGolZIQmH2VHg==
X-CSE-MsgGUID: NlBNsJR7R92129Q+CO+maw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="60431055"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2024 23:46:59 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_3d: Add more logs to skips/failure
Date: Mon,  5 Aug 2024 12:17:12 +0530
Message-Id: <20240805064712.970488-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Having some logs for test failures and skips would
make debugging much easier.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_3d.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index ad6c45e9b..f79fa62da 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -53,9 +53,10 @@ igt_simple_main
 	drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 	res = drmModeGetResources(drm_fd);
-	igt_require(res);
+	igt_require_f(res, "Failed to get list of a DRM device's major resources\n");
 
-	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0);
+	igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
+		     "Failed to enable STEREO_3D capability\n");
 
 	/* find an hdmi connector */
 	for (int i = 0; i < res->count_connectors; i++) {
@@ -65,7 +66,7 @@ igt_simple_main
 		drmModeFreeConnector(connector);
 		connector = NULL;
 	}
-	igt_require(connector);
+	igt_require_f(connector, "Unable to get HDMI Connector\n");
 
 	kmstest_unset_all_crtcs(drm_fd, res);
 
@@ -85,7 +86,7 @@ igt_simple_main
 			mode_count++;
 	}
 
-	igt_assert(mode_count);
+	igt_assert_f(mode_count, "3D modes not detected\n");
 
 	/* set 3D modes */
 	igt_info("Testing:\n");
@@ -95,8 +96,10 @@ igt_simple_main
 		int crtc_mask = -1;
 		int ret;
 
-		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
+		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)) {
+			igt_info("%i: Doesn't support 3D MASK\n", res->connectors[i]);
 			continue;
+		}
 
 		/* create a configuration */
 		ret = kmstest_get_connector_config(drm_fd, connector_id,
@@ -120,7 +123,7 @@ igt_simple_main
 				     &connector->connector_id, 1,
 				     &connector->modes[i]);
 
-		igt_assert(ret == 0);
+		igt_assert_f(ret == 0, "Unable to set CRTC\n");
 	}
 
 	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
-- 
2.34.1

