Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19780C88E41
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB24E10E2FE;
	Thu, 10 Sep 2026 20:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9nWwcaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C0E10E2E3
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071273; x=1820607273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qshCXrMbby8h04edfUIHohapgjEo6kef8BQ/EuFBMCA=;
 b=h9nWwcaR0jiGvDsBQ0Yf90qv7jAyUWcLJlgiNgTaV8zJ/Nhgd4dSi/xy
 jc49r+zf+zxbFJXY9AcVHH5XVPxb3/vnZm7xAC2Bj1x26xFfR5yJyVfQy
 G6aoMnpQw+7FNIYJ7JGymPHv1okX7PfW0VZajwFPUy9ssivW6qI8t3U9n
 20oWcyR0AvM83Kh6pRKoW3i0MN6djpWl3gsTK9a58ipYOUR6R6dS26EQf
 Ts6+SgqvEwpFrHBAiwZ3aGlLbV7cI50xd5L7JKE8dFSVvhsHs4UQuRlxJ
 S67FfdqK01Q97xYqqZLnOUw4+YQqPK6TgzMpzfmGeiBudD0IdDTrYagR2 Q==;
X-CSE-ConnectionGUID: dx5fdyNjTlG5V5pb1xOC3A==
X-CSE-MsgGUID: T086SxzbTouvXD+q2ohyyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657260"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657260"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:32 -0700
X-CSE-ConnectionGUID: sv4O8CUrRhqi1ietvQIz5g==
X-CSE-MsgGUID: edH6z2ZRSPypW60R68wi0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978195"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:31 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 05/17] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `suspend`
Date: Thu, 10 Sep 2026 22:14:01 +0200
Message-ID: <20260910201413.2730574-6-michal.grzelak@intel.com>
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

v1->v2
- remove blank line (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index dd7d3188fe..dc8ef069b8 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4646,12 +4646,19 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 		}
 	TEST_MODE_ITER_END
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.pipes != PIPE_SINGLE ||
-		    t.screen != SCREEN_PRIM ||
-		    t.plane != PLANE_PRI ||
-		    t.fbs != FBS_INDIVIDUAL ||
-		    t.method != IGT_DRAW_BLT)
+	t.format = FORMAT_DEFAULT;
+	t.flip = FLIP_PAGEFLIP;
+	t.tiling = opt.tiling;
+	t.pipes = PIPE_SINGLE;
+	t.screen = SCREEN_PRIM;
+	t.plane = PLANE_PRI;
+	t.fbs = FBS_INDIVIDUAL;
+	t.method = IGT_DRAW_BLT;
+
+	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
+		if (!opt.show_hidden && t.feature == FEATURE_NONE)
+			continue;
+		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
 			continue;
 
 		igt_subtest_f("%s-modesetfrombusy", feature_str(t.feature))
@@ -4712,7 +4719,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			suspend_subtest(&t);
 		}
-	TEST_MODE_ITER_END
+	}
 
 	t.pipes = PIPE_SINGLE;
 	t.screen = SCREEN_PRIM;
-- 
2.45.2

