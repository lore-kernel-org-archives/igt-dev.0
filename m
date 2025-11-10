Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887B0CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA910E300;
	Mon, 10 Nov 2025 19:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aK4fQJY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87A410E2F8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802707; x=1794338707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5rNxbPA2HP3HAbjrQXAM/gqkcr1QIXJMIQpa4ZWunS0=;
 b=aK4fQJY/4qf4Lr0vu/pA8fybhqUY1X7lIml0qLbR4+H9AkdkO8nbzPN9
 jvKMLGKOil6WELr7hhASyDM4vzU7oh74kEDblvumfk7sSGmd9VZSBvxkl
 tTMuHq3eV2+fjN+orfNSJANaRbkP3/BKVAY/QwMAjf3P3hxkzaxVmEX7p
 5r9lxNHS013AmuYzCcelnYcSw8/mZ0O+HoKLRl0oOz/GuuZc4EKJKFOWy
 PuLb0Z/w/RmtDCHo2Qzs72mLCmOJL8lHUWHyFMoo45OnLaQFa38UhtH00
 ugtraj4+HXsMaBaTOZjP9JE3wiiFGFZFXUGPOBdZTAhRer+TwXzA07qOb Q==;
X-CSE-ConnectionGUID: e0LHxmnKRxqrW0nWDtNk8w==
X-CSE-MsgGUID: FNEelRN1S0Gep3K6248ReA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900253"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:07 -0800
X-CSE-ConnectionGUID: 2V3stSTER2+G5NQKx2D3ZQ==
X-CSE-MsgGUID: 7sMdKCvpQymrDt0qPQ1dmA==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:05 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 1/8] Revert "tests/intel/kms_frontbuffer_tracking: Enable
 the tests support variations based on the WAs"
Date: Tue, 11 Nov 2025 00:54:47 +0530
Message-ID: <20251110192454.44385-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110192454.44385-1-mohammed.thasleem@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
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

This reverts commit 022083725350b3a7f31c8d3f59e28c339fddc7e8.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 03428b373..2c2772532 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2613,8 +2613,8 @@ static void prepare_subtest_data(const struct test_mode *t,
 static void prepare_subtest_screens(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f(t->feature == FEATURE_FBC && intel_is_fbc_disabled_by_wa(drm.fd),
-		      "WA has disabled FBC on BMG\n");
+	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+		      "FBC isn't supported on BMG\n");
 
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
@@ -2661,8 +2661,8 @@ static void prepare_subtest(const struct test_mode *t,
 static void rte_subtest(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f(t->feature == FEATURE_FBC && intel_is_fbc_disabled_by_wa(drm.fd),
-		      "WA has disabled FBC on BMG\n");
+	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+		      "FBC isn't supported on BMG\n");
 
 	prepare_subtest_data(t, NULL);
 
@@ -4166,8 +4166,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.tiling = opt.tiling;
 
 			/* FBC disabled: Wa_16023588340 */
-			igt_skip_on_f(t.feature == FEATURE_FBC && intel_is_fbc_disabled_by_wa(drm.fd),
-				      "WA has disabled FBC on BMG\n");
+			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
+				      "FBC isn't supported on BMG\n");
 
 			for_each_pipe(&drm.display, pipe) {
 				if (pipe == default_pipe) {
-- 
2.48.1

