Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7272BD2E010
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 03:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B42C10E718;
	Wed, 23 Oct 2024 03:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhK7Q1by";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CD210E179
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 03:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729653525; x=1761189525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GQFmdh4v4Vkm4fJTfjL6bgynLk5mTgKCHcUd3gFfetE=;
 b=UhK7Q1byNkyZvEIBnZp7RyIjbZRdIKmpJ4QCM8/9BM8/WZkECLXTLEQ7
 RQDSJnvYGuB6lUllVx6iFO8t33ZDulKXk2tRzrIrTFO9nQNSu882OnMzD
 D/YAjJDb2qgVkstcJCC8AiWd72cjs71+0jKjdWySXeVKMOb1LJC40cYY1
 B000i8dJ/twFU+i6qpmBoa5nALj8Zd4BZ2ghE3IS8Va6Wt+Kub1XQdfXp
 dH6SUuyVpwoAR9YZMZ+5YhBNUlpvi3SEinm4XyoKhGsHcjVv373AWHPHc
 7g6TO3BAiRkpbPt+X3OumacxcEByWvcylSKWmnGBuLsq9LBmEAQymCPsJ g==;
X-CSE-ConnectionGUID: JzrbM0JYQRysiwoW63I7Yg==
X-CSE-MsgGUID: msa2TZEfTZS8MsTfrPcIYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33144593"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="33144593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 20:18:44 -0700
X-CSE-ConnectionGUID: mphKF7RdQxakldk+PxuBIw==
X-CSE-MsgGUID: wir+mXKRSWGlRcEPK0FWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80404686"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 20:18:42 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: Skip Async flips on joiner
 output
Date: Wed, 23 Oct 2024 08:46:20 +0530
Message-Id: <20241023031620.3632362-1-santhosh.reddy.guddati@intel.com>
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

Async flips are disallowed with joiner, but the test commit still
goes through and causes failures. Update the tests to skip on
joiner outputs.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..37075bb4a 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -686,18 +686,32 @@ static data_t data;
 igt_main
 {
 	int i;
+	int max_dotclock = 0;
+	drmModeModeInfo mode;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
 		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP),
 			      "Async Flip is not supported\n");
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		for_each_connected_output(&data.display, data.output) {
+			drmModeConnector *connector = data.output->config.connector;
+
+			igt_skip_on_f(
+			    bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode) ||
+			    ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode) ||
+			    igt_has_force_joiner_debugfs(data.drm_fd, data.output->name),
+			    "Skipping test on output %s as async flip disallowed with joiner mode\n",
+			    data.output->name
+			);
+		}
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
-- 
2.34.1

