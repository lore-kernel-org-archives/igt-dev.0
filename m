Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58712C5475C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 09:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1051310E4F3;
	Wed, 28 Aug 2024 09:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="die7uu13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BF110E4F3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724837224; x=1756373224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f4jiAcxyuChl4vbrVjXpC7HXZymV27318T8oqN+fj1Y=;
 b=die7uu13qp4gEtRgXtSLSMrM65Hb+wbhciKN4NvtDicT/f1xXsOVTimE
 ZkFujTqtncjDNWtcgMFC7wrpxEJ00b8K4s2YutdfD6+MbqmyXIC4At+CO
 +WBUOqHn5S8BtRMJ0tI0qJNLIhHYS5/57geropqizahxvnQ0JN5cM+5Uw
 oCDoW5GSMQYbnUVd5d+aEcMYTlxNzmTIcWl8fhgrTmh+FsSuqnZ+44NVm
 WjGWUlUQ4IC6HrC89cICRq9YBccGwjo44d1BKTh2O2Xccc1vknwKkbb+F
 kDWTJTdBrhfjETvuDaxFmFhpCZSLtqLaz45iarWyjiKHMZZGB1Q1ywHQE w==;
X-CSE-ConnectionGUID: X9sJvUjPTg+pI48V5rfQPg==
X-CSE-MsgGUID: jUeLyEIBR++gAWbIFJHfhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48741817"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="48741817"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:27:03 -0700
X-CSE-ConnectionGUID: F2ZRjKXSTqynzzPjp5ry8w==
X-CSE-MsgGUID: dBZM0BvQT8acVqg1zWNTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67315861"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa003.fm.intel.com with ESMTP; 28 Aug 2024 02:27:02 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, bhanuprakash.modem@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3] tests/kms_3d: Add more logs to skips/failure
Date: Wed, 28 Aug 2024 14:57:22 +0530
Message-Id: <20240828092722.1013397-1-pranay.samala@intel.com>
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
 tests/kms_3d.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index ad6c45e9b..e1c024066 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -55,17 +55,19 @@ igt_simple_main
 	res = drmModeGetResources(drm_fd);
 	igt_require(res);
 
-	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0);
+	igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
+		     "Failed to enable STEREO_3D capability.\n");
 
 	/* find an hdmi connector */
 	for (int i = 0; i < res->count_connectors; i++) {
 		connector = drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
-		if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)
+		if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA &&
+		    connector->connection == DRM_MODE_CONNECTED)
 			break;
 		drmModeFreeConnector(connector);
 		connector = NULL;
 	}
-	igt_require(connector);
+	igt_require_f(connector, "No HDMI connector found.\n");
 
 	kmstest_unset_all_crtcs(drm_fd, res);
 
@@ -85,7 +87,7 @@ igt_simple_main
 			mode_count++;
 	}
 
-	igt_assert(mode_count);
+	igt_assert_f(mode_count, "3D modes not detected.\n");
 
 	/* set 3D modes */
 	igt_info("Testing:\n");
@@ -95,8 +97,12 @@ igt_simple_main
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

