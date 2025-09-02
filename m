Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDB0CA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 08:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D391810E5D4;
	Tue,  2 Sep 2025 08:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/rnhkX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9410E5D4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756801101; x=1788337101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i8u+HZMPLhxyTquWuGiUtgAK7nrlzX+jVZbeiXVT1+Y=;
 b=T/rnhkX4RFkCxXbuJ/p3aPcpNEwR+HFUdEbXwio62uA0zpj+uKcHkhlQ
 ImGCIU1arBXk1pC+NAw0D0DoxgYVOLwfiJp0VH1Z+Gd+wySLc0WOrO4z9
 97NglbSCfftf+AJ5O3+PJLLxwCYBXsLVSrc+RM3QEktBLKrrIrZzwxwI3
 IY+pU5RNou7eRODWyuy5XyYERkyggCtgMGLcVok9dJI1NW7kI4q72bVEF
 NVnpXo2tuyjlRxUk1w3kqf095Q1POLuMn+wbCil8+5ZBFveNugQ4QpgHb
 BusI+Wf4t7mT35y4jJdtdHoXbcLW98XNlguRlPyd3oUr+cP17aN7KSycH Q==;
X-CSE-ConnectionGUID: I/JHKFCMTaqLjXbpyclSnQ==
X-CSE-MsgGUID: nQg/oEl0QnupKqnoLWLs+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59012667"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59012667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 01:18:21 -0700
X-CSE-ConnectionGUID: vKdZj0GSRSe+nd1QXS9RmQ==
X-CSE-MsgGUID: gPi5M8PzRG6z96/OetxZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175338236"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 02 Sep 2025 01:18:19 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, karthik.b.s@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4
 restriction for ADL+
Date: Tue,  2 Sep 2025 14:00:23 +0530
Message-ID: <20250902083023.104886-1-uma.shankar@intel.com>
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
WA:22010751166

Relax the restriction for the same.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 061e996cc..a97001770 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3496,8 +3496,8 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	do_assertions(DONT_ASSERT_CRC);
 
 	/*
-	 * On gen >= 9 HW, FBC is not enabled on a plane with a Y offset
-	 * that isn't divisible by 4, because it causes FIFO underruns.
+	 * On gen >= 9 and till gen12 HW, FBC is not enabled on a plane with
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

