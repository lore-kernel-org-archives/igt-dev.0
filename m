Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54B9C44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8121C10E5AB;
	Mon, 13 Jul 2026 09:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mO/v9dNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D311E10E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932972; x=1815468972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79lR+6KLdBo5Q4uuZeL0M/54piecPDRVu9+pnbyK71E=;
 b=mO/v9dNJME1JG/n4zOYPnubp6R8ejTqaUUi3B7R5/+lt4TFBNHddXX/P
 GVBy/B45WXdbewGAJa+gwzI9drER0YZcnWc+9BR4qPoc7jNnBJiNj8ak0
 fjVkGVU8V5TSmKckbfPOhkeLRvp0mxoEwQYWt5Pe3qmOUFitda6Cnimmi
 MmeelOa3L9kJmogPCWHzFlUXmGWAOX2tUGeBWahO9E5kNSf5gucl+QsQk
 /wLmufQTAYFcDndeukPw2Xw4ZVL82s9X8HuaBV1GP1K46XdfkxiVgOt+s
 UdH/uS7oyEDKEqNs4teFp4sc3ZROf9vU39HrK4cuFx7Yxsg2fpWCh75aV w==;
X-CSE-ConnectionGUID: 5WIAEuKQTyqY/n5r5Udl4Q==
X-CSE-MsgGUID: bjglL47CSdyiuT4cQ102BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081324"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:12 -0700
X-CSE-ConnectionGUID: uEL0a34FTtmqjdvcRLpTYg==
X-CSE-MsgGUID: 8rx4vCzBRDmoFRuzfmspBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385878"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:10 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 05/16] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `suspend`
Date: Mon, 13 Jul 2026 10:55:04 +0200
Message-ID: <20260713085515.463575-6-michal.grzelak@intel.com>
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
 tests/intel/kms_frontbuffer_tracking.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f619f77e72..f5c2a81434 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4655,12 +4655,20 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
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
@@ -4721,7 +4729,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			suspend_subtest(&t);
 		}
-	TEST_MODE_ITER_END
+	}
 
 	t.pipes = PIPE_SINGLE;
 	t.screen = SCREEN_PRIM;
-- 
2.45.2

