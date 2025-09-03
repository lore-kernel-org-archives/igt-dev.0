Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82A8CA100C
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 07:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739A010E431;
	Wed,  3 Sep 2025 07:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiwIUdoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F4C10E452
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885642; x=1788421642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YeQL8vAZgEA0dxOWtHsWdkYnmxr9mhztZ0qhLw06Pck=;
 b=kiwIUdoA5NgWaALKm0praCEXq/EOidwRpCUGVwZbi9zsXVRmRfe5qY+v
 n49RyzPFnXLzB+8O8nK0qvSXWmPXSDBapjcnABwdW2G9BPC4Ee0Y5giM8
 yrxIU8htLzg7yas3VNnclh7tB4apZNbX+viQFCG1lsg/EPRrZjkAzl4aN
 ip2Ff0eDuwFUaHWkl5asl69ujjwSjp5jPJ3+ZDyYmz4ldeklhIbLc9tcu
 7HivXUQAd3sMUmIKdSX48OgR2g1qkyPG6ep/1ck9axtVm/NZz5cBs4EZd
 B6z5oLmBaYSd0d6buYpVXhQx9r7isH/E2qJktrA4HpBucf8vtlV079A7K Q==;
X-CSE-ConnectionGUID: +yB8sWd8RUC103YzQpuTqw==
X-CSE-MsgGUID: 8Q1gHG0GRsm3gbrpm/QgGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62832783"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="62832783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:47:22 -0700
X-CSE-ConnectionGUID: LcDrRainTrWR5Y492pFFAQ==
X-CSE-MsgGUID: jIq7/Eb2StOHd9/ViLLR3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170792716"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa010.jf.intel.com with ESMTP; 03 Sep 2025 00:47:21 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, karthik.b.s@intel.com,
 jonathan.cavitt@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v2 i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4
 restriction for ADL-P+
Date: Wed,  3 Sep 2025 13:29:24 +0530
Message-ID: <20250903075924.282801-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
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

FBC restriction where FBC is disabled for non-modulo 4 plane size
(including plane size + yoffset) is fixed from ADL onwards in h/w.

WA:22010751166 does not apply past display version 12.  Or, in
other words, the FBC restriction where FBC is disabled for
non-modulo 4 plane sizes (including plane size + yoffset) is fixed
from display version 13 and onwards. Relax the restriction for the same.

v2: Updated comments for clarity (Jonathan Cavitt)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 061e996cc..a29da1d43 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3496,8 +3496,8 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	do_assertions(DONT_ASSERT_CRC);
 
 	/*
-	 * On gen >= 9 HW, FBC is not enabled on a plane with a Y offset
-	 * that isn't divisible by 4, because it causes FIFO underruns.
+	 * For display versions 9 through 12, FBC is not enabled on a plane with
+	 * a Y offset that isn't divisible by 4, because it causes FIFO underruns.
 	 *
 	 * Check that FBC is disabled.
 	 */
@@ -3505,7 +3505,7 @@ static void scaledprimary_subtest(const struct test_mode *t)
 			    reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
 	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
 	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
-	do_assertions(DONT_ASSERT_CRC | (gen >= 9 ? ASSERT_FBC_DISABLED : 0));
+	do_assertions(DONT_ASSERT_CRC | ((gen >= 9 && gen <= 12) ? ASSERT_FBC_DISABLED : 0));
 
 	/* Back to the good and old blue fb. */
 	igt_plane_set_fb(reg->plane, old_fb);
-- 
2.42.0

