Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B9CC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DCD10E7CE;
	Mon, 29 Jun 2026 09:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AM0BQ6WK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54A210E7D5
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724567; x=1814260567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0NU5E0mzRfqQaaFgxU6rQZ1kwZ2lsr2PAWLv6Zqgnc0=;
 b=AM0BQ6WKI6Jqx2UdVzXh8PUM5vgTeP74UsKWnNGWC7//XtUXlrqJA0Sc
 tdrGY7DtsFML62YKLIHPrKKGXfSIfmxcUzxh2UxWOoh/URDjkCtX9ye7J
 DDAx4HFveWoyu/MnX38TdN+az9u2LFx+uPiQALlHBQkGrPPyV0+ivqE1X
 WTf/1nf4HJOoiR9C7de05RlYimkttb3Tk15y5dtS2PZTGddz35Ss5QeJw
 l9A6JSvfQkk/TKRAz8idLL0lRWTJI/6fbQUT4pF7/HsZDbuacHzN/oKei
 iHeCRnlEKF70urOFdWXqSwY0qhKuADF1Hc++C9idPPzZ5OGJfLKqpDQAw A==;
X-CSE-ConnectionGUID: ocU6NHLGSbuh8zS0TbPyVA==
X-CSE-MsgGUID: fQu8+97RT060eHtX1HeT+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94894171"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94894171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:16:07 -0700
X-CSE-ConnectionGUID: 4bzj+0ifSGmll1jf/EOvAw==
X-CSE-MsgGUID: h8jC63srT2mIA57xj65Bww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="247451967"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 02:16:06 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_frontbuffer_tracking: iterate over
 suspend with `for`
Date: Mon, 29 Jun 2026 11:15:59 +0200
Message-ID: <20260629091559.2706720-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260629091559.2706720-1-michal.grzelak@intel.com>
References: <20260629091559.2706720-1-michal.grzelak@intel.com>
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

igt@kms_frontbuffer_tracking introduces TEST_MODE_ITER_BEGIN(t) which
consists of nested for loops. However, most of loops is skipped during
continue statement, thus can be omitted. Thus obfuscates following the
execution of any given codepath. Replace TEST_MODE_ITER_BEGIN(t) for
suspend tests with macro definition and remove skipped for loops.

Cc: Juha-Pekka Heikkilä <juhapekka.heikkila@gmail.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index d38c3969d0..e1f0412ecb 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4647,12 +4647,20 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
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
+
+		if (!opt.show_hidden && t.feature == FEATURE_NONE)
+			continue;
+		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
 			continue;
 
 		igt_subtest_f("%s-modesetfrombusy", feature_str(t.feature))
@@ -4713,7 +4721,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			suspend_subtest(&t);
 		}
-	TEST_MODE_ITER_END
+	}
 
 	t.pipes = PIPE_SINGLE;
 	t.screen = SCREEN_PRIM;
-- 
2.45.2

