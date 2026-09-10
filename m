Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F16C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E286B10E27F;
	Thu, 10 Sep 2026 19:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOWAWBbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11DA10E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066759; x=1820602759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIXB0mec3V4PS2fCVSphrrZzVtNsbXYwS/RKGN8gHZU=;
 b=lOWAWBbHHX2IJn5h/ISry6Rid4NoQwUg3W6zZ0dBTBb19ngswWbISkb3
 M+UkWfGieA5dUgkdGsp1tiap/GYQc0GPcG/H2YY9NKgAdE/fX4Tn+GAg/
 GpC01a3oerCtv4X1hhBFEdK33/WYYkLAv9LNfSS1Sam/3uEZOTvsKVf2W
 /YAJIguxE21e5rTh9Ufye6kfZJq5lqlMNzSZgGt/przhS+8h7U83R5ZXS
 W8di03h/p6VBwri2aqPMM7cwYiO+E92GMnqn0wYnET2trMYcien+taRFT
 y/yU3718KLvXyRb6CLehTutn5ms/aucJv/Y6PC5KNdg9Jl9sqxzYAntnC w==;
X-CSE-ConnectionGUID: 1dlmpQjCRTq6G+jZO57y5w==
X-CSE-MsgGUID: /EInoW0STVqO8IAbdeWjIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400082"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:19 -0700
X-CSE-ConnectionGUID: tsWNU2sfRFeI0c/jxpglxg==
X-CSE-MsgGUID: KyVVG7wMShOGkeojRcHp4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199483"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:18 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 06/17] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `fliptrack`
Date: Thu, 10 Sep 2026 20:58:51 +0200
Message-ID: <20260910185902.2728276-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910185902.2728276-1-michal.grzelak@intel.com>
References: <20260910185902.2728276-1-michal.grzelak@intel.com>
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

v2->v3
- identation cleanups (Mohammed)
- pull conditions after first loop (Mohammed)

v1->v2
- indent for-loops (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 40 +++++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index dc8ef069b8..9faae7d3fd 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4502,23 +4502,35 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			}
 	TEST_MODE_ITER_END
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.plane != PLANE_PRI ||
-		    t.screen != SCREEN_PRIM ||
-		    t.method != IGT_DRAW_MMAP_GTT ||
-		    (t.feature & FEATURE_FBC) == 0)
+	t.format = FORMAT_DEFAULT;
+	t.flip = FLIP_PAGEFLIP;
+	t.tiling = opt.tiling;
+	t.plane = PLANE_PRI;
+	t.screen = SCREEN_PRIM;
+	t.method = IGT_DRAW_MMAP_GTT;
+
+	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
+		if (!opt.show_hidden && t.feature == FEATURE_NONE)
+			continue;
+		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
+			continue;
+		if ((t.feature & FEATURE_FBC) == 0)
 			continue;
 
-		igt_subtest_f("%s-%s-%s-fliptrack-%s",
-			      feature_str(t.feature),
-			      pipes_str(t.pipes),
-			      fbs_str(t.fbs),
-			      igt_draw_get_method_name(t.method))
-		{
-			igt_require(igt_draw_supports_method(drm.fd, t.method));
-			fliptrack_subtest(&t, FLIP_PAGEFLIP);
+		for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
+			for (t.fbs = 0; t.fbs < FBS_COUNT; t.fbs++) {
+				igt_subtest_f("%s-%s-%s-fliptrack-%s",
+					      feature_str(t.feature),
+					      pipes_str(t.pipes),
+					      fbs_str(t.fbs),
+					      igt_draw_get_method_name(t.method))
+				{
+					igt_require(igt_draw_supports_method(drm.fd, t.method));
+					fliptrack_subtest(&t, FLIP_PAGEFLIP);
+				}
+			}
 		}
-	TEST_MODE_ITER_END
+	}
 
 	TEST_MODE_ITER_BEGIN(t)
 		if (t.screen == SCREEN_OFFSCREEN ||
-- 
2.45.2

