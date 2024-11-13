Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4941D637A0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 17:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8503310E111;
	Wed, 13 Nov 2024 17:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaUVRQ49";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E0F10E111
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731519707; x=1763055707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8brX04qPLOzzGeJA/+XdVMOuyJxiK0cEdHwirKZXGqo=;
 b=VaUVRQ49YqXuUbsGTQtcJCvSy0EcWxp3OU0OJ5Y0u7LY/MTAExJaKM0f
 BNZZ77mJ2fqgvsHQl/eokI4qzidD88+ujNUVU6AbH1VuRAeBXUOSHC+L1
 lGAZgcN6HnWljSqqScH+yAivcCggSivar44QG2DRaI1VI/RpiZYV7JVsN
 IyLZJv0VpJdUxHLnzz8AkoIsdbAr/+8UJrUE0V6yT2F3xXhHO3mqwCbWn
 ltc6ydOFqQpZHpNre8qD8bfBVfWEvwLzsu7a9qjJELB+GntNxDLtmazQV
 d4H3TMCRO7ifB0wuH6qRJiq3E5A4xjpttjaBYp2PKvnyysZ6NyRFc6nwD A==;
X-CSE-ConnectionGUID: Avk2sx2cQTieAqpjZrEPbQ==
X-CSE-MsgGUID: oca/UtVORkSKlFP2GlYWSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53970263"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53970263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:41:46 -0800
X-CSE-ConnectionGUID: A2f5RJHrRJucrWN9elaAtA==
X-CSE-MsgGUID: RkjiHIjDR5CFXvUV5LZaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="118753633"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by orviesa002.jf.intel.com with ESMTP; 13 Nov 2024 09:41:46 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Add skip condition for bmg
 platform
Date: Wed, 13 Nov 2024 23:11:18 +0530
Message-Id: <20241113174118.158849-1-mohammed.thasleem@intel.com>
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

FBC test isn't supported on bmg, skip the test on this platform.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 35df9be3b..e20fde777 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -54,7 +54,7 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
 #endif
 
 typedef struct {
-	int drm_fd;
+	int drm_fd, devid;
 	int debugfs_fd;
 	igt_display_t display;
 	drmModeModeInfo *mode;
@@ -345,6 +345,9 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		igt_require(data.display.is_atomic);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		igt_require_f(!IS_BATTLEMAGE(data.devid),
+			     "FBC isn't supported on BMG\n");
 
 		data.bops = buf_ops_create(data.drm_fd);
 		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
-- 
2.25.1

