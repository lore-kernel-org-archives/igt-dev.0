Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1732ED637DC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 03:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A7F10E274;
	Thu, 14 Nov 2024 03:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TweSiy9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2A510E26A
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 03:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731554457; x=1763090457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GWosg89jys/tPANJ88Q8lwnX58dtlZHI/HEm7lyJvqE=;
 b=TweSiy9Kp6ev0YcKs8oHeAOvYE1/VDF1YvBJdy4tUo2fm3Lo7DgLw4GN
 mu6FB8JFQIxLsA9+x5vVO4Fp4788FqPhgBUNwlPayCJDJMIb7NE6zDrqV
 t3+Xb8d4Hi5To0Q1gR4fJ8oFePUaC24zC2gQ/4wiCoSsTmOQ96V3bNFfK
 0NwkIIIRJjDvjuFGNbXQp5LV63n3qYSc6R+l5/1OCHG2qZlV+nnbsFKu1
 6RbN33zlCBJN5gect0810htPkuhgiwBoXgfha9BfrjmbItJMShArv3nM3
 wKjUGsOJ/hrDr4WOaXVt6qc3Xi4M0XzSxLjg5ez2CvPCTlcI5unSG6iPj g==;
X-CSE-ConnectionGUID: pUAOD/rISpmUp5huj5Z/XQ==
X-CSE-MsgGUID: ygb5hQfyQNWEw2dvnEY5BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42088908"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="42088908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 19:20:56 -0800
X-CSE-ConnectionGUID: 1lP6UqPoSWOoMGLHOdKuJw==
X-CSE-MsgGUID: hHnHNpvfTPGTwvEbEYIxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="119003155"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2024 19:17:17 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@intel.com,
 swati2.sharma@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v7] tests/kms_3d: Add more logs to skips/failure
Date: Thu, 14 Nov 2024 08:47:53 +0530
Message-Id: <20241114031753.1859302-1-pranay.samala@intel.com>
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

v2: Remove CRTC log for fail/skip (Bhanu)

v3: Add check for connector connection

v4: Remove check for connector connection (Bhanu)

v5: Rebasing and sending other version

v6: Remove igt_info for connector support (Bhanu)

v7: Add Reviewed by statement in commit message (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_3d.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index ad6c45e9b..8e9e9929c 100644
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
-- 
2.34.1

