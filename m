Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FCEC7EE2D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 06:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22D010E48C;
	Thu, 29 Aug 2024 06:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF5cN31P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F46110E48C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 06:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724914353; x=1756450353;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMUtvWz/aZjoahGj3VZgm8I+xVp3IYSveYucDXAepyk=;
 b=PF5cN31PUUm827Ei3MUXTlNaG3YQu/deDt4lm9BpADzofKRQee6Rk19N
 8GsM/f2M87/OGdDLRYiMHLv6yfUez32rgKtEkm3ov8vN525w2wJXcp++H
 wIZjvBTodX2Od7vsvIYR3uYowMAiNheezueXLOiqcbYPVBPUCZuCxg8T7
 4jRjGFgSTBVAQ/NYXab1nM1PkWRK7XetMaaQdVl9AWYfSWghDGkgnpqkY
 CRRVru1gQBhO4CPajBp6d2L3Y3mMRy8//0oqTm/jL/C3jh3QdS0WDJDgm
 EiBXIa5+QJA8IQ7Bk3nyHQID5nwGdALPgx1AExa1lH+K5WZzZnLhZnC5Z A==;
X-CSE-ConnectionGUID: D6o8C6o4SqqjpPLFlfJVwQ==
X-CSE-MsgGUID: WK6ZeOMvR6GFraaBtbqosg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="46002878"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="46002878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 23:52:33 -0700
X-CSE-ConnectionGUID: T4lwvD+eRUCyHSHZQD6jNw==
X-CSE-MsgGUID: PoJ8eBCQTvGY2M9z9OTHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="67844724"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 28 Aug 2024 23:52:32 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, bhanuprakash.modem@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4] tests/kms_3d: Add more logs to skips/failure
Date: Thu, 29 Aug 2024 12:22:52 +0530
Message-Id: <20240829065252.1014292-1-pranay.samala@intel.com>
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

