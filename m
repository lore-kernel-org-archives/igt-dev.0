Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5D2C5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DE510E3E1;
	Fri,  7 Aug 2026 22:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLjipnWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FED10E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142878; x=1817678878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h4m6Ddxvye1co/Ipze7Lxq9NfEk0rF4ESVmnCHPssXk=;
 b=nLjipnWMgh1zdMP2QedIhB4nr1cNm7lBCh9Ep2U0jQ+U4L6p0E2trtX7
 Hr8UMQ2UPscA/X7BVASayNJLkx05b3i3HiJgoblpJfF+HiyNy0O5Msq8p
 J2RzJ3kKXih6x0kHi/kjZ9eCr/5w0IIcqthxiiRu0E2sNR9/TrRy626ui
 TBIGGem2Rbr066dbnnAqwaBatu8Re4gVCb1/uio3QzzLuWrB+b5b4riKX
 OTnnpGAvjDHrCXGD24AMUZHYvCfoGO8ZgE1tn2ux0MeaXuD7TbsFqTdqj
 x0CINQmYAjSFmH+e6Tiru+nfbIyd+q90dV4TE3IlT5KUG4o5EWDlFxmP3 g==;
X-CSE-ConnectionGUID: LJCtWiNUSSGI48X9qtvCSg==
X-CSE-MsgGUID: g/jdmBGIRFOQnD1jTV2FFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835805"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835805"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:47:58 -0700
X-CSE-ConnectionGUID: CdHWh/hETL+unNCR10IkBg==
X-CSE-MsgGUID: SAXDjUSZT1KebqA9D95qiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655418"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:47:57 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 06/16] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `fliptrack`
Date: Sat,  8 Aug 2026 00:47:36 +0200
Message-ID: <20260807224746.3554064-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260807224746.3554064-1-michal.grzelak@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

igt@kms_frontbuffer_tracking uses TEST_MODE_ITER_BEGIN(t) which consists
of nested for loops. However many loops can be omitted due to continue
statements. This obfuscates following the execution of any given
codepath. Replace TEST_MODE_ITER_BEGIN(t) for fliptrack tests with macro
definition and remove loops that are skipped.

v1->v2
- indent for-loops (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 44 ++++++++++++++++----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 406018c88a..6266297553 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4482,23 +4482,35 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			}
 	TEST_MODE_ITER_END
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.plane != PLANE_PRI ||
-		    t.screen != SCREEN_PRIM ||
-		    t.method != IGT_DRAW_MMAP_GTT ||
-		    (t.feature & FEATURE_FBC) == 0)
-			continue;
+	t.format = FORMAT_DEFAULT;
+	t.flip = FLIP_PAGEFLIP;
+	t.tiling = opt.tiling;
+	t.plane = PLANE_PRI;
+	t.screen = SCREEN_PRIM;
+	t.method = IGT_DRAW_MMAP_GTT;
 
-		igt_subtest_f("%s-%s-%s-fliptrack-%s",
-			      feature_str(t.feature),
-			      pipes_str(t.pipes),
-			      fbs_str(t.fbs),
-			      igt_draw_get_method_name(t.method))
-		{
-			igt_require(igt_draw_supports_method(drm.fd, t.method));
-			fliptrack_subtest(&t, FLIP_PAGEFLIP);
-		}
-	TEST_MODE_ITER_END
+	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
+		for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
+			for (t.fbs = 0; t.fbs < FBS_COUNT; t.fbs++) {
+				if (!opt.show_hidden && t.feature == FEATURE_NONE)
+					continue;
+				if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
+					continue;
+				if ((t.feature & FEATURE_FBC) == 0)
+					continue;
+
+				igt_subtest_f("%s-%s-%s-fliptrack-%s",
+					      feature_str(t.feature),
+					      pipes_str(t.pipes),
+					      fbs_str(t.fbs),
+					      igt_draw_get_method_name(t.method))
+				{
+					igt_require(igt_draw_supports_method(drm.fd, t.method));
+					fliptrack_subtest(&t, FLIP_PAGEFLIP);
+				}
+					}
+			}
+	}
 
 	TEST_MODE_ITER_BEGIN(t)
 		if (t.screen == SCREEN_OFFSCREEN ||
-- 
2.45.2

