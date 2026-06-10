Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6CCCD98C7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 09:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A816010E862;
	Wed, 10 Jun 2026 09:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoyrNneS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCFE10E862
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 09:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781085409; x=1812621409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H9SBo6texWVSsjJ/HCd445p/UI59WKWAJyFcibDtsvU=;
 b=XoyrNneSWfmOZYR47VTY1x0+uTrUneanJ4y4i+qZRxm5yqIruWQXZQY6
 jVfKy/VisFJubY/t4osTNukO6eKdZM6IEmqGNJRiYJBNfGqzX5XCy+k4R
 0G7CbDeuIoPt8Kz6z0zr8jMctI8ly8tRnv88LK7icQCVNIUbYR5Ns9FXC
 ffU0WkBP5/P2YY3l2MsTP8HfIiX8+o8Zl6MeQyO/zJsVo3NqL5egKB+hk
 0HQfBUh6xQNlMlxsnRoW20VOPYQ10AxXoekgnQcdtXqm6OPnyFGVNmyOX
 T2jwuKB+P5gHzMzkx7NfsmHivmR+gdKUXDT6aykzRKLn7AQVLTUJ/HpZj w==;
X-CSE-ConnectionGUID: +Nk5PusdTXa3tm960XBMeg==
X-CSE-MsgGUID: VJykmqhiRKGvMkm+71tKwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="69407362"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="69407362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:56:48 -0700
X-CSE-ConnectionGUID: qWPwKQiKQ6OIZazjzLbMPA==
X-CSE-MsgGUID: v4u0KEKtQR2DoHmsRUUrYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="241990832"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2026 02:56:46 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable calls
 in DC tests
Date: Wed, 10 Jun 2026 15:16:47 +0530
Message-ID: <20260610094647.32373-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608074722.9216-1-mohammed.thasleem@intel.com>
References: <20260608074722.9216-1-mohammed.thasleem@intel.com>
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

Add psr_disable() calls to properly cleanup PSR state
after DC5/DC6 PSR tests complete.

v2: Add psr_disable call to psr & dc3co cleanup functions. (Pranay)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 90df8ee37..2eed70f9a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -191,6 +191,7 @@ static void cleanup_dc_psr(data_t *data)
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit(&data->display);
 	igt_remove_fb(data->drm_fd, &data->fb_white);
+	psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 }
 
 static void cleanup_dc3co_fbs(data_t *data)
@@ -204,6 +205,7 @@ static void cleanup_dc3co_fbs(data_t *data)
 	igt_display_commit(&data->display);
 	igt_remove_fb(data->drm_fd, &data->fb_rgb);
 	igt_remove_fb(data->drm_fd, &data->fb_rgr);
+	psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 }
 
 static void paint_rectangles(data_t *data,
@@ -772,7 +774,6 @@ int igt_main()
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require(!psr_disabled_check(data.debugfs_fd));
 		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);
-		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
 	}
 
 	igt_describe("This test validates negative scenario of DC5 display "
-- 
2.43.0

