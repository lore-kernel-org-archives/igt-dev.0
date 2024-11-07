Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E5FD5AE7C
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 09:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1506810E7DE;
	Thu,  7 Nov 2024 09:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+q2belc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3035A10E7DE
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730973574; x=1762509574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NT7KWiLme2RMthkw78jADp7nOsQj9h8m4MqcuGIPuMQ=;
 b=k+q2belcZAdnzbk/VroXOP6mqCJbw1gLWxXKaqkxXDLHRdqBq4HRexHb
 d4979Yi1QX7ooj8HHFOdI7m2HzZ/ky157qeRrDIDwD30nwXgiWtPZ6uI3
 Y8JfZpCJ13xJx8O9mXACg2rzOsZVkfv+pFVkPHr7wrzrHcAHK8sHs11+Q
 jzh6PS5huuxAwOSU9/TAEBviEFlVXQwN+m/vmt/U8SfJJ2wFThP4iiito
 HahR7wqX5l4yorcfysax9SR5tyKGM4Jj3AUvGBNfOFff+OEyOq1E1li2Y
 HF3QJhxsiaxErWKKxKmVrcWqqAIDtMtI2EGkLWaRkJdGI8DGgnYRdmwww Q==;
X-CSE-ConnectionGUID: qA+BobCNRliE3zaKlKA2Dw==
X-CSE-MsgGUID: zKAlb1ZxRIWWr8EOuffBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30212911"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="30212911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 01:59:34 -0800
X-CSE-ConnectionGUID: 39Lc01WlSVW2N1z8OF+1sA==
X-CSE-MsgGUID: AZPKjvDGSKSh9L5fIwD+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="108286983"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2024 01:59:32 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6] tests/kms_3d: Add more logs to skips/failure
Date: Thu,  7 Nov 2024 15:30:07 +0530
Message-Id: <20241107100007.1842771-1-pranay.samala@intel.com>
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

