Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251E8C44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C846710E414;
	Mon, 13 Jul 2026 09:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBVmQff1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8C610E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932973; x=1815468973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRyQHS2TNFneGA+aksbJTv7HZJhzHa/ulq4YyYIxVYs=;
 b=TBVmQff1DihSPsxQiY6jtXTxZ5nleOn03TcHyOoKTFocWFnBdrSywmOr
 zBhQqGVRBSMPizJEFstsnr5emZgWAYTYuPZYGZDcP68QUeBNdWudNLNB+
 zetW0cpam4MkoZBtE8KDxVLWQr3zEFRo39OOSeabK7IdWZ5W/oulB9I8j
 Nci+d0/djbJfs+rO2KAoQQeCp4sl1beCf65hP8FWjnbiJu5UC5DXbDjRf
 vZBZwXZ7GSfPRr1SiuaSNbCaCH0dEDgKjvSIeqJdVpGO8r0+PGxOeCo9O
 5sE9Rvydgkwn86RSRx6LMCp7m3g2pzt6g1G12UtRUKMLtyyTQtlhv/F0E g==;
X-CSE-ConnectionGUID: JAt3UY7IRpW6XzIJww3S4Q==
X-CSE-MsgGUID: 0Hi9x3FEQ7W+wo+eAgJmSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081325"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081325"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:13 -0700
X-CSE-ConnectionGUID: h0uKSoa4Qcmlab008pU/xQ==
X-CSE-MsgGUID: kIqw+SqySjGxleZPP+V1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385888"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:11 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 06/16] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `fliptrack`
Date: Mon, 13 Jul 2026 10:55:05 +0200
Message-ID: <20260713085515.463575-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
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

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f5c2a81434..c41f97bd34 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4511,11 +4511,21 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
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
+	for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
+	for (t.fbs = 0; t.fbs < FBS_COUNT; t.fbs++) {
+		if (!opt.show_hidden && t.feature == FEATURE_NONE)
+			continue;
+		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
+			continue;
+		if ((t.feature & FEATURE_FBC) == 0)
 			continue;
 
 		igt_subtest_f("%s-%s-%s-fliptrack-%s",
@@ -4527,7 +4537,9 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			fliptrack_subtest(&t, FLIP_PAGEFLIP);
 		}
-	TEST_MODE_ITER_END
+			}
+		}
+	}
 
 	TEST_MODE_ITER_BEGIN(t)
 		if (t.screen == SCREEN_OFFSCREEN ||
-- 
2.45.2

