Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1422ECA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 09:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB08A10E25F;
	Mon,  2 Sep 2024 09:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyXaj7zO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAEF10E25F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725267616; x=1756803616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=spa5MNigcHm3qfnL1UzgYIMZFesgW0KjoHEIAy+2kZ4=;
 b=eyXaj7zO5gGt0lK2Sp0boZy4JGsLOZu2G9GhE714ryhu/p7XcZGiz1+7
 +rJhsQUOghc5uQ7lHxH09ybpWHTgPc+NdCa5odbspHVbaoHV1snsu7Sol
 ldYXZJOcYVV0iNKEkzy9S/vqUCYBhasCacH7NxUmTymPkwQkNDB0BlQBB
 mDI3Mf98ToZvtWh/JHIVixA3Jn51sgvKhKml953fzJfXyamDpN0No39WY
 7fvxGmnlKqoNGJHUPxaOWx2lMD+b8FTK5pBWZ/CWFsVFBsKMKMOpbVsEo
 rk2UjFDijq2OdR4FF6TVeWFawMOVFE2twh70pMr+sW0/1zKTFFSvDdveY w==;
X-CSE-ConnectionGUID: YLg+3x+hRAm7/4rLCqNzMQ==
X-CSE-MsgGUID: ignIVsSbT8WYaZMgLEhUiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41316176"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41316176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:00:16 -0700
X-CSE-ConnectionGUID: zmcjPuetRF2PDTjj39u+qA==
X-CSE-MsgGUID: 6TmwwyJaQpaOiO5pu8sXXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64749675"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 02:00:14 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 1/4] tests/intel/kms_pm_dc: Add time unit macros and
 update delay calculation
Date: Mon,  2 Sep 2024 14:29:40 +0530
Message-ID: <20240902085943.1496088-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
References: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
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
conversions. Replace MSECS with more granular time units: SEC and
MSEC. Update the delay calculation in test_deep_pkgc_state to use
the new MSEC macro.

v1: Remove unused USEC macro. (Suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_pm_dc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1aef1e02d..92b1514ef 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -93,7 +93,8 @@
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
-#define MSECS (1000000ul)
+#define SEC 1
+#define MSEC (SEC * 1000)
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -623,7 +624,7 @@ static void test_deep_pkgc_state(data_t *data)
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
+	delay = (MSEC / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

