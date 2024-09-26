Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E7ECDE004
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 19:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF2310E112;
	Thu, 26 Sep 2024 19:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zswc3Bii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F710E112
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 19:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727379942; x=1758915942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X1EtOmrUrdFMEU87SFBGue+C18831Wy6/A+u8/q0UY4=;
 b=Zswc3BiiPaCCwd8paXbmNHm433Et8IgVRsEcjpj7rZ7ZpjUsZFnggtci
 sqTYUW+UQYDUwrEcUOc5kENijmBVKfXX150MCcePz4xIafzZv0J4zxUBA
 4+YxgCbENwAOvcQnZtqhgi8U3D1nTNboNI/TaY8vWxCOAAYaeoBQSPDS4
 aomNI5ot5HZXaHaLkpL0LAx4G0rsyk3N9A/1wLjK6KIw+Kfg1PR/lKSUs
 03do2HrGxF9xubGx3Q86iU+gc7BoYSXaeuj9sOAErF4pw1w5xGwWYpwDW
 UvapX4El4/b4PKWrjFnUzlpynde2dT0vao/ppRa6QI4nQxfudoTV+TDtA g==;
X-CSE-ConnectionGUID: 9BrU+jy+TuK/vhoawmHm2w==
X-CSE-MsgGUID: FjTNR3EtRk+HwGNFtGfFpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26374529"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26374529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 12:45:41 -0700
X-CSE-ConnectionGUID: TFYLNv8nTAKyW4UTLFeoxg==
X-CSE-MsgGUID: MXelarpeSTSPwX1mPGxU9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72440113"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2024 12:45:40 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_backlight: Remove eDP check for
 backlight
Date: Fri, 27 Sep 2024 01:15:07 +0530
Message-Id: <20240926194507.701146-1-mohammed.thasleem@intel.com>
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

Backlight not only for eDP, it should be used for all internal
connected panel.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 140a95bcc..6f1e24bac 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -292,7 +292,7 @@ igt_main
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
 
 		for_each_connected_output(&display, output) {
-			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			if (!output_is_internal_panel(output))
 				continue;
 
 			if (found)
-- 
2.25.1

