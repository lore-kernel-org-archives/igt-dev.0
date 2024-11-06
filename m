Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B27D44D42
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 10:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489F110E199;
	Wed,  6 Nov 2024 10:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7y8jlN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056D710E199
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730889349; x=1762425349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g9R3fns4RvbdBcs5ICKS9Qppos1aFq8A3YcjP4GJA18=;
 b=K7y8jlN6OudzoowdScfcLuTByRzfyR7HD0ayz57RutpO5NgiS6TTbT9p
 SncWLH7cBqhs9fdu/SHWhkBnvSwVu4VgafIh1HbNgA8qdBoPb0l53YYdF
 /byQxYUdXdOahuSwlJONIQFwyr8s7Yl5EHx1H8I7Xq7JsScTh0IfzLoKx
 wKcTmOm607ggGsJTPJSGP+f8VOx/sqvF1GvOJ/2j81bIULriW4PZesLqP
 XoR0am2aNSKVClt/qv/GMoGqeNDEAi5cEe6dPl3wJsz4UP6QqJlyu06OR
 0l14n8IEXBtVwXNvdegSFmgzf4GQOF0MquwnEnyWeWKMRCFoA4/rXKSpC w==;
X-CSE-ConnectionGUID: q2sRjY4kQ+KfP0PPhIlghA==
X-CSE-MsgGUID: eHyfAK9QRLWgVJtGy4syxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34607286"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="34607286"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 02:35:48 -0800
X-CSE-ConnectionGUID: mKvLCTm7TpqFM28NHLbucw==
X-CSE-MsgGUID: 9NlZoXtxTte9BkDaCTmiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84588259"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa006.jf.intel.com with ESMTP; 06 Nov 2024 02:35:46 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_3d: Add more logs to skips/failure
Date: Wed,  6 Nov 2024 16:06:22 +0530
Message-Id: <20241106103622.1840431-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_3d.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index ad6c45e9b..f1726b71e 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -55,7 +55,8 @@ igt_simple_main
 	res = drmModeGetResources(drm_fd);
 	igt_require(res);
 
-	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0);
+	igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
+		     "Failed to enable STEREO_3D capability.\n");
 
 	/* find an hdmi connector */
 	for (int i = 0; i < res->count_connectors; i++) {
@@ -65,7 +66,7 @@ igt_simple_main
 		drmModeFreeConnector(connector);
 		connector = NULL;
 	}
-	igt_require(connector);
+	igt_require_f(connector, "No HDMI connector found.\n");
 
 	kmstest_unset_all_crtcs(drm_fd, res);
 
@@ -85,7 +86,7 @@ igt_simple_main
 			mode_count++;
 	}
 
-	igt_assert(mode_count);
+	igt_assert_f(mode_count, "3D modes not detected.\n");
 
 	/* set 3D modes */
 	igt_info("Testing:\n");
@@ -95,8 +96,12 @@ igt_simple_main
 		int crtc_mask = -1;
 		int ret;
 
-		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
+		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)) {
+			igt_info("%s-%d: Doesn't support 3D MASK.\n",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
 			continue;
+		}
 
 		/* create a configuration */
 		ret = kmstest_get_connector_config(drm_fd, connector_id,
-- 
2.34.1

