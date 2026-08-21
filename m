Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F12EC5DF87
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EB710E39F;
	Fri, 21 Aug 2026 12:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PV3mOX/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3510E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316527; x=1818852527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZbnHCYaOjEBdxkm3xkMbXotJGxXN5ypVY42IajPl1Qk=;
 b=PV3mOX/Yb7hE74Qh6CFcF+IgdoioBdekfAvcqe7YzHvishxjKxKmcbsX
 aQPl4MJ4nv7mJf3tm0s83VXyaTdVRJ18ks3I6jkq1e7zotxVlpQ8MeqGw
 QL3AEUzoC4Z2EYtISMIjX1bWYZTe+KTZiauRdoVT68V0sksHh+Z6FD8Yn
 VVlZSmEDze+v8PIY0s3v6g1CpofxnfwtmsZBKDO4X3bAhjkgQkoqCMXBH
 63ducWtqAElQhTvtn9T1zKRdWQyNIfaJW/qhMj7S7GrnAfTnz3QSc/zrW
 Tt8l/oSfkj+Uhb6dsAUYVp0u3TkuNgmmAxHikTc6Q0tYbhcPsVCzx/S8O A==;
X-CSE-ConnectionGUID: gp7rN9OhS0OnIL+KAVnUsg==
X-CSE-MsgGUID: 3tr8lc87QKa+K60Kv0ywmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632919"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632919"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:47 -0700
X-CSE-ConnectionGUID: CmpJwJVLRz+3V49aiW6ZJw==
X-CSE-MsgGUID: AphtzhgSS8ug9VyT4Ltxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188355"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:45 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 06/17] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `fliptrack`
Date: Fri, 21 Aug 2026 14:48:23 +0200
Message-ID: <20260821124834.1974029-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
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

