Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CE8D2E9C7
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 12:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8300110E5E5;
	Tue, 12 Nov 2024 12:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCXs71qI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A1C10E5D7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731415994; x=1762951994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6IWRliIKF/To/YnGQVGDPz04EckWLuUnCeukWW2j17w=;
 b=PCXs71qIEAYXCSBAunwK1q8K3cB7KBt9BUfc7x2J7W/MQyn2AIco3WwP
 ZCWuNiuXiBmVjZkcyVUftJ3clul0TKgYNMnuM1xFgdlwQ4U809CQ16Vs2
 /qZuvmfPqs57v+BIqWWTh8cXcvlunW4H3Gdf77PBg2l0V3Ugli8yt8lMY
 czG+egk97+5+jl19Gi6TrfCWjNFMxnKfYVVQdkKuUNJWRFVTETCSpzA10
 u5CxOla9TDSqTN9VxZkFkEf9C8dM8FEsE666JP44qD7yzPzLqCszh4TWo
 mDge9Za+iLN6xDH5Q6Pw4o+K0gkMlurKwPPSR9Ypx+8sXIlj6mE5/+0c/ Q==;
X-CSE-ConnectionGUID: ECGVvruzRzKJ13i6UukvZg==
X-CSE-MsgGUID: 6MTmAYYKQ8223rQV6Syrvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31103152"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31103152"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 04:53:14 -0800
X-CSE-ConnectionGUID: x1vqeP4oT66l+Z9Yf71mqQ==
X-CSE-MsgGUID: 0U6wmNaiTiG+bRmr7I/3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87868231"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 04:53:12 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_color: fix data->output
Date: Tue, 12 Nov 2024 18:26:02 +0530
Message-Id: <20241112125602.1451660-1-swati2.sharma@intel.com>
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

data->output at dynamic subtest is getting overwritten by some
other output.

For ex:
    Starting dynamic subtest: pipe-C-eDP-1
    pipe-C-DP-1: (Max dot-clock: 1305600 KHz), force joiner: No
	7680x4320: 30 1030250 7680 7710 7720 7880 4320 4323 4328 4368 0x48 0x9
    pipe-C: Last pipe couldn't be used as a Bigjoiner Primary.
    Test requirement not met in function run_ctm_tests_for_pipe, file
    ../tests/kms_color.c:827:
    Test requirement: pipe_output_combo_valid(data, p)
    Last errno: 2, No such file or directory
    Dynamic subtest pipe-C-eDP-1: SKIP (0.001s)

Here, eDP-1 at dynamic subtest is getting overwritten by DP-1
leading to false results.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3362
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d642f561d..4b71d3dd3 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -760,10 +760,6 @@ static void test_setup(data_t *data, enum pipe p)
 					  data->primary->pipe->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_display_require_output_on_pipe(&data->display, p);
-	data->output = igt_get_single_output_for_pipe(&data->display, p);
-	igt_require(data->output);
-
 	igt_display_reset(&data->display);
 }
 
-- 
2.25.1

