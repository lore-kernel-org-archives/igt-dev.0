Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46366C54736
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 12:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BB810E30C;
	Tue, 27 Aug 2024 12:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pj6lC+bf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4EF10E30D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 12:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724762445; x=1756298445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w7nfm3u5yMZnZrOgHOF2P6k6dOP0CWyhTVY2NN/arUI=;
 b=Pj6lC+bfX4EDiWDLMekThoCHwgAV+p8jo7ztEVe4jMZ1alpxv0fFfmNu
 1LGwLjB34j4sJmlGeMPr2a3vhMA84rPHp5jr7ERoX0bc1uAqLL/IJU0tR
 r8FxlCBvRcPxl8fKOomXFjjWLrcxsJEyeRS81lRGV2INcxCkzszesB1LY
 b41Umc5bQSiW7o4d570CQ8HJiyGpkRuJYaDm/090zmbi9XoKWR2L2EM4l
 TruuK5lGLWokbKQUl51c2JzRSrQ6c1MLewi6XrrKv5T13an43EdCat0CN
 YYqdG7NQMHiVDUF8tEWr+yShfDy42d6M9zAqVrQluLyrrRgGq6Jix74Yh g==;
X-CSE-ConnectionGUID: CPCa16lwRS2ZiuFLNT/hxA==
X-CSE-MsgGUID: 74yPiM+GSFqJDXJI5ucUOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27117245"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="27117245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 05:40:45 -0700
X-CSE-ConnectionGUID: EmAIjfAOTna30l7zeR68Yg==
X-CSE-MsgGUID: ZsHshxSMRCaR4wv6D17DJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62905830"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:40:43 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 1/4] tests/intel/kms_pm_dc: Add time unit macros and
 update delay calculation
Date: Tue, 27 Aug 2024 18:10:15 +0530
Message-ID: <20240827124018.1373304-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
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

This change improves code readability and consistency in time unit
conversions. Replace MSECS with more granular time units: SEC, MSEC,
and USEC. Update the delay calculation in test_deep_pkgc_state to use
the new MSEC macro.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1aef1e02d..2ae9fd2a5 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -93,7 +93,9 @@
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
-#define MSECS (1000000ul)
+#define SEC 1
+#define MSEC (SEC * 1000)
+#define USEC (MSEC * 1000)
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -623,7 +625,7 @@ static void test_deep_pkgc_state(data_t *data)
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
+	delay = (MSEC / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

