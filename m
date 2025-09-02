Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C38CA0FFE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 08:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F91E10E5D7;
	Tue,  2 Sep 2025 08:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFoByuj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBDD10E5D7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756801300; x=1788337300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i8u+HZMPLhxyTquWuGiUtgAK7nrlzX+jVZbeiXVT1+Y=;
 b=cFoByuj1dULuMmYwyM8TrZ+J2FpuZ7cLtNJcUJslrfEyb8zPk8is+4Cb
 +tx8a/s54ais2nnGna67vBBhdTwydm92AJM7lZ9EC4KJY8Lvy5KFPyxr9
 dd7r1QA4jIDSO4LpQkBXM4UF7VKgIUdPYptysYCCd6CYmxofPBpfTUxJ+
 Psxg90N6EHJMbh4TnPFsAFz0C5CB1D2p30tZbOjrySySIyv/I413Na93u
 kZdW8Lf1GsM5y7ML5W1Uuzo3i1EuFN0u1zb9939xcXlUnE25QK47jE0/Z
 iWFoPbo4PMVuINwAK5R0cwkIUwo82XlxZXqq7oBN5EO+GNzT1mk+K+V2X g==;
X-CSE-ConnectionGUID: XcGe0A8dR5O1pV8NMyzKnQ==
X-CSE-MsgGUID: NJP7NtGPS1O0cYYJv/RVvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62893859"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62893859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 01:21:40 -0700
X-CSE-ConnectionGUID: mLxWz0UxQkSWCoypWv95GQ==
X-CSE-MsgGUID: NNvWgKccQna7sGT90zZiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171581623"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2025 01:21:38 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, karthik.b.s@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC modulo
 4 restriction for ADL+
Date: Tue,  2 Sep 2025 14:03:42 +0530
Message-ID: <20250902083342.104956-1-uma.shankar@intel.com>
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

