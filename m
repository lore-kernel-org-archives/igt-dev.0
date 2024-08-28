Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E51C5472D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 04:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7AC10E127;
	Wed, 28 Aug 2024 04:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJs+DfcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81610E127
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 04:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724819582; x=1756355582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VDiLO1iplCH5qt6M+h5E7zyVXJva9ePiNuEJYeFzmHE=;
 b=TJs+DfcSB5J5UKZZE8iZNYiCE3xYM5WIZ1P26Y+XMLVqNU5uRUGm1TXc
 s/gxp6sZtxlVR4G2Nn0SLCHlSTxqhkCqZgaljNkGsdqGbX5yqAigYdkC6
 QRF8Qt9Z5/AqJyxmf0aOJmjx85EitKcG/L2/pIRKGdHMk07ye2FT/WVqz
 9Y3kep1YIXfufCG4Org/cQu01+oo+LiV3zyarImAFHkOKZVWXqamUAehI
 BoS+qHRLDpZ6Nb7KEStH1yEIMnldSyutww9zNU3jzcpYfXGVZaRn9JLO9
 KCr4iulG9CDMrXlneUkBb7KqsEIqJfGb4KVsAPHw+hkHMHuolaWPuFoBK A==;
X-CSE-ConnectionGUID: nBJb5N8/QoGc4oAPQ6mjrA==
X-CSE-MsgGUID: +tw1AwSPTD+0E4gEmjc2Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13253039"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13253039"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 21:33:01 -0700
X-CSE-ConnectionGUID: ZihnKKPMSGuU7IUQa83J3A==
X-CSE-MsgGUID: 6e75OjVzQqSt5yycMomIRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="63799067"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa008.jf.intel.com with ESMTP; 27 Aug 2024 21:33:00 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, bhanuprakash.modem@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/kms_3d: Add more logs to skips/failure
Date: Wed, 28 Aug 2024 10:03:19 +0530
Message-Id: <20240828043319.1012315-1-pranay.samala@intel.com>
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
 tests/kms_3d.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index ad6c45e9b..66c2ddfc1 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -55,7 +55,8 @@ igt_simple_main
 	res = drmModeGetResources(drm_fd);
 	igt_require(res);
 
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
-- 
2.34.1

