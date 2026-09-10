Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA80C79FBB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7067110E305;
	Thu, 10 Sep 2026 20:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ie+jtPHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D64B10E2F9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071274; x=1820607274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIXB0mec3V4PS2fCVSphrrZzVtNsbXYwS/RKGN8gHZU=;
 b=ie+jtPHai9q8nCb4r17H7C3dEnzSUze0kaXZbZOQnlx4OITdD412j2vb
 KM65ASGQbHTU01DKR/QbG6IyA4JAaSmQqgRRtrrRcTpxVlq+XqGUGhKGq
 mFP7znJE3ihDhgQJ08/3g1tYOduEmzfIGFnXUMoo96iWFLzXLixTp3108
 /gaN2x9Eviz+AD6WrJpm4eK7QHpbUkiHVshIPHRn4I67sgzvLxA4Xm+f0
 qzph6Gi5KjEm0aYRB8RXyzfyHX4k+7wRnhJRvU7nXcJQILeKeuDB4wMPy
 8pwr2BW5jsoMN3uPf+8qxRB4ewrd54dXUDhdLhrYN8URC0IIK0Z5NAf76 g==;
X-CSE-ConnectionGUID: IPeDzTw/TY2uSXN3VsoRag==
X-CSE-MsgGUID: jy9t9gsMQ42N8wvpcgXvtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657261"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:34 -0700
X-CSE-ConnectionGUID: OxEG8LEmQPC0kyeNIETIaQ==
X-CSE-MsgGUID: nhfuxcaTRzKfvljFPuuEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978200"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:33 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 06/17] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `fliptrack`
Date: Thu, 10 Sep 2026 22:14:02 +0200
Message-ID: <20260910201413.2730574-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910201413.2730574-1-michal.grzelak@intel.com>
References: <20260910201413.2730574-1-michal.grzelak@intel.com>
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

