Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A168CF33813
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 08:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5312210E40B;
	Tue, 17 Mar 2026 08:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFfcH1cA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB4210E40B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 08:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773736655; x=1805272655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0y1fYQYDGrZ3zqDM8AFRGwXo1VDP/4rt3IgpXWHj9GY=;
 b=NFfcH1cAWdl/3pbOp2KsjbPbaFTRHXjGMES3Vryw+VRNH0H+OHablfID
 TucTu2r5V+O/8HzXtfj9+KxWGEFxTJUAIQ9iy51tfCS77Hea8h6RyPJl9
 nf8FE0vsK/1+r/mnZkp8mAmqAfYWiIphJi8c60ozlO+v6xWzwips3iPxl
 EJ4hA3Thsrumh/SKGflQEz1i84LV1bPddxPLEq9ORJ6rVYKX3syPLA9Dy
 unAGKPvco4QQtoSAgNtOwJ+a1tT+RksYhJ5GJ2nyMigYs0CXgqtVvRu7G
 OqZbu+CE5U4VyHHslOD0vDQw7MiJJKIvIAwbKeALOmP3D2rzNT7lmR421 g==;
X-CSE-ConnectionGUID: v4TO4qywTRm0pTVnHpvuuw==
X-CSE-MsgGUID: Vbsy2FumRPCi1/KhN5PIvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="97372011"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="97372011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 01:37:35 -0700
X-CSE-ConnectionGUID: YHr+vEnjRq6VCHiZn7QftA==
X-CSE-MsgGUID: 2Q+MzfoIRpG61DSqZXd8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222143657"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:37:33 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Date: Tue, 17 Mar 2026 14:06:03 +0530
Message-ID: <20260317083603.63589-1-jeevan.b@intel.com>
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

Replace NULL with data->output in PSR function calls and update the
log to include the output name when PSR is not supported.

v2: Replace NULL with data->output in all PSR helpers.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_dirtyfb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index b85e09346..b5de63350 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -120,8 +120,8 @@ static bool check_support(data_t *data)
 			return false;
 		}
 		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
-				      PSR_MODE_1, NULL)) {
-			igt_info("Output doesn't support PSR\n");
+				      PSR_MODE_1, data->output)) {
+			igt_info("Output %s doesn't support PSR\n", igt_output_name(data->output));
 			return false;
 		}
 		return true;
@@ -150,7 +150,7 @@ static void enable_feature(data_t *data)
 		intel_fbc_enable(&data->display);
 		break;
 	case FEATURE_PSR:
-		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
+		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, data->output);
 		break;
 	case FEATURE_DRRS:
 		intel_drrs_enable(data->crtc);
@@ -173,7 +173,7 @@ static void check_feature_enabled(data_t *data)
 		break;
 	case FEATURE_PSR:
 		igt_require(!psr_disabled_check(data->debugfs_fd));
-		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1, NULL),
+		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data->output),
 			     "PSR still disabled\n");
 		break;
 	case FEATURE_DRRS:
@@ -217,8 +217,8 @@ static void disable_features(data_t *data)
 {
 	intel_fbc_disable(&data->display);
 
-	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
-		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, data->output))
+		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
 
 	intel_drrs_disable(data->crtc);
 }
-- 
2.43.0

