Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DDBE7E0C2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3419910E14D;
	Mon,  9 Feb 2026 10:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBPm42xU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD76E10E14D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770633549; x=1802169549;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0lDAsfjwfqsuMZjxAqcmn/Wq4df2Rj2fHUu4FHGyw8U=;
 b=FBPm42xUIQXvcCJHI1rCYApof4V76XXblRvBVXqqHUbxMPO61ul4wXi9
 3Sx4oxhZNWe+x4CSBBCXI5pyR5vqvsbDCr0ruRbm3JFftNtW+9LA83U7s
 /PXJPtD/iZL8ol8l32XB8dnda7zE8FBI0IdaobNkBtx5mdpu7lJ9EVo10
 Q4YcCFg93A4QElQNCy6XeFzYWXYbjHGPe+bGR2CZEAvRqcyz/U4cZkDrN
 Oh5Uu3HA5orhGNeeOO6ikX9KOpyaSJyEw18vW2Ig964PMQR1g6lEejwdX
 /P07S0yerxW7xyoV1mJU6qhLbSZFts4BoU54+KctQc6yK+FJbZYtBoeiw Q==;
X-CSE-ConnectionGUID: d9pBve9ORG29XF0j7PwwTg==
X-CSE-MsgGUID: RBzNwlGaRsWpP8c6enuAWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82067755"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="82067755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:39:09 -0800
X-CSE-ConnectionGUID: bzixDBjJRiOqCofrc5tRMw==
X-CSE-MsgGUID: 7T9Cl+O4RW+lRCnrib1hmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="210734060"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 02:39:07 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ankit.k.nautiyal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_content_protection: Fix multi outputs
 using same pipe
Date: Mon,  9 Feb 2026 16:04:45 +0530
Message-Id: <20260209103445.1468369-1-santhosh.reddy.guddati@intel.com>
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

dp-mst subtests fails with both outputs trying to use pipe A.

The test finds a free CRTC and this CRTC is not being used and instead
uses a hard coded pipe with igt_output_set_crtc.

Fix by using the found CRTC directly and remove unused pipe variable.

Fixes: 4122d450aef2 ("tests/kms: Convert to for_each_crtc(), part 4")

V2: Add fixes tag and fix commit subject (Kunal)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 40f9c418d..d2bbea351 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -867,15 +867,12 @@ test_content_protection_mst(int content_type)
 	igt_output_t *output;
 	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
 	igt_crtc_t *crtc;
-	enum pipe pipe;
 	bool pipe_found;
 	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
 
 	for_each_crtc(display, crtc)
 		max_pipe++;
 
-	pipe = PIPE_A;
-
 	for_each_connected_output(display, output) {
 		if (!output_is_dp_mst(output, dp_mst_outputs))
 			continue;
@@ -891,8 +888,7 @@ test_content_protection_mst(int content_type)
 
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+		igt_output_set_crtc(output, crtc);
 		prepare_modeset_on_mst_output(output, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
-- 
2.34.1

