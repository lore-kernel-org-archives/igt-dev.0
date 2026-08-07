Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10AEC5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7710E463;
	Fri,  7 Aug 2026 22:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrlnlMwa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE2F10E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142877; x=1817678877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r4+GKIAeAsObLXxL0gNIlXVssCIu7z9jLmwGUIggwpk=;
 b=DrlnlMwamsiA8/Eo5TFe2O0eUDzNj0tP1++we5E02CK1BQGwMMPtN6kQ
 1TU7WyQD+giRNzZ8MWdNpBI9Bt2EV052omLKy1fKddD+3RpICS91sdE1Z
 MoaP6c4lt2EP5g4PWKwa4A/hgC6D4pmjmKRqp0189yJHq2Ka9bbqAgZ3U
 QuRWB5buhc/+XlskMDptRxRVMl/MUlFY+SsEmdvw/idBLKfXkV0LxEGh9
 8Wth/uA+XD57W/UFmuGsfO8zp0exdONLmKeBU/TTgm8YgKzhdiSpwN2yW
 2TMxM7Dkv/KGI6tAQ+XgYJOOh7nerLAxAPjsHEClZ9yaPIMCSAfRJFxqq g==;
X-CSE-ConnectionGUID: qEfKDHiOSlqYdarQrS2ELA==
X-CSE-MsgGUID: Y6DvPvoMTJSEKc9J2B47vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835803"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835803"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:47:57 -0700
X-CSE-ConnectionGUID: xX7NOrb2Q0mhJ1yeW4fkyQ==
X-CSE-MsgGUID: bruaXPf9QT+kQLRYNb58JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655410"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:47:55 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 05/16] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `suspend`
Date: Sat,  8 Aug 2026 00:47:35 +0200
Message-ID: <20260807224746.3554064-6-michal.grzelak@intel.com>
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
- remove blank line (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c2130d76a2..406018c88a 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4626,12 +4626,19 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
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
@@ -4692,7 +4699,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			suspend_subtest(&t);
 		}
-	TEST_MODE_ITER_END
+	}
 
 	t.pipes = PIPE_SINGLE;
 	t.screen = SCREEN_PRIM;
-- 
2.45.2

