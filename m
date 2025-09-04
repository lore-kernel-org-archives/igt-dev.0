Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1C1CA1015
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 09:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7E510E9CD;
	Thu,  4 Sep 2025 09:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNBxA5Aw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8401E10E9CC
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756977635; x=1788513635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8gwnRj7+dNoE4IQEmZ2Qaxfnu1t/RzVPVkUSMo6tWRI=;
 b=XNBxA5AwmhxrlEsBuqs/mZPMuUG1SO8D7LUng0Aj4juwhSqDcjN4xSg+
 YowuJGT3sVfz9H1cP8XPNjLXqMJC/2YUSsZu7hWHEeAC+WN7inG/JfXvz
 r9V7rziAEpmP73JZrW8CN9P+UQcOLKRefxRQKcUhhU9NIWksSpH0aGoHZ
 D3lvYKs5QsQ0+aGuwBt3vWjZ+xRLPjQtslgKFdpNeTFF2ee06/w/rgrGY
 fllTEPsM59Q+/Ci11Kln/O6qg1zbCn61M7iP0Mz72E3ZvlNweQCaIlbYr
 Oaytp0IrxHa/BOWsXVXjS4Z0DWYMGXsWqXVh0ulBvdg4b7FIcrDqj4/f1 Q==;
X-CSE-ConnectionGUID: eDR7RaLvQrqrazn+PlwQdA==
X-CSE-MsgGUID: 4JCIr1aWRgayCClnj3upgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70014904"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="70014904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:20:35 -0700
X-CSE-ConnectionGUID: XK4lo9G3TiysMDpPd6NDbQ==
X-CSE-MsgGUID: rrS9StlIQ5uk62AHjfbJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172296168"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2025 02:20:33 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, karthik.b.s@intel.com,
 jonathan.cavitt@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v3, i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4
 restriction for ADL-P+
Date: Thu,  4 Sep 2025 15:02:37 +0530
Message-ID: <20250904093237.300400-1-uma.shankar@intel.com>
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

WA:22010751166 does not apply past display version 12.  Or, in
other words, the FBC restriction where FBC is disabled for
non-modulo 4 plane sizes (including plane size + yoffset) is fixed
from display version 13 and onwards. Relax the restriction for the same.

v3: Dropped redundant comment from commit message

v2: Updated comments for clarity (Jonathan Cavitt)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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

