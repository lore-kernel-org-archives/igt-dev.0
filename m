Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9A6CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EE310E49A;
	Mon, 10 Nov 2025 19:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWZlZnk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39B410E489
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802715; x=1794338715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FsfnAsbEkwPF6+r1jDYzSE/1zcjsSNLcj803l+TROGo=;
 b=NWZlZnk8x9rhLt1TAPW3o8R5uDmqxxm7mNIzdoGo+JV/S8GhEQwHXGpR
 UTyo0cGUH6LNH7uIKwQ/4JcnwzwMzJAvM5DOCEWyCHZeDHOJc/lhuzLE3
 gUw2eR07S31pHkghp7Kgar7zPav9uVbJJYlbNTyeJkr8B+nKgOO1YuO48
 Iv9Mc0/5PnN57tldpjZCT1LSlXnlC8vqHGh22pCZmH92Nwx88frqPWQIe
 20kHmPIYp9CLv1tLgD1X5a+GjTyWM0BEMnJBWsnl038rT3SEZaykvagjq
 T+/Wsf5MVCEhq6em7CJ/rWg8lu3ayNTvnAnryylUorafZGaLhbuvlwd0c w==;
X-CSE-ConnectionGUID: W4HGqH/XTXG/0Ww9aSiABw==
X-CSE-MsgGUID: k0cfihAnRvewX5o4EgDjtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900263"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:15 -0800
X-CSE-ConnectionGUID: Uw877qNVQcOMEtH4Ku0ewg==
X-CSE-MsgGUID: meaw1Ub2RLSlaH3RpoOOoA==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:13 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 6/8] tests/intel/kms_*: Remove FBC disable comment
Date: Tue, 11 Nov 2025 00:54:52 +0530
Message-ID: <20251110192454.44385-7-mohammed.thasleem@intel.com>
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

Remove FBC disable workaround comments from tests.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c              | 1 -
 tests/intel/kms_fbcon_fbt.c            | 2 --
 tests/intel/kms_frontbuffer_tracking.c | 3 ---
 3 files changed, 6 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index a5707c5b1..c0649c0c6 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -380,7 +380,6 @@ igt_main
 							      data.output) {
 					data.mode = igt_output_get_mode(data.output);
 
-					/* FBC disabled: Wa_16023588340 */
 					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
 						       "FBC isn't supported on BMG\n");
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index e8d0702b2..2c8cbbb1e 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -461,7 +461,6 @@ igt_main
 	igt_describe("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc") {
-		/* FBC disabled: Wa_16023588340 */
 		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
 		subtest(&drm, &fbc, false);
 	}
@@ -474,7 +473,6 @@ igt_main
 	igt_describe("Suspend test to validate  the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend") {
-		/* FBC disabled: Wa_16023588340 */
 		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
 		subtest(&drm, &fbc, true);
 	}
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 2c2772532..0f162d9a5 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2612,7 +2612,6 @@ static void prepare_subtest_data(const struct test_mode *t,
 
 static void prepare_subtest_screens(const struct test_mode *t)
 {
-	/* FBC disabled: Wa_16023588340 */
 	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
 		      "FBC isn't supported on BMG\n");
 
@@ -2660,7 +2659,6 @@ static void prepare_subtest(const struct test_mode *t,
  */
 static void rte_subtest(const struct test_mode *t)
 {
-	/* FBC disabled: Wa_16023588340 */
 	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
 		      "FBC isn't supported on BMG\n");
 
@@ -4165,7 +4163,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.flip = -1;
 			t.tiling = opt.tiling;
 
-			/* FBC disabled: Wa_16023588340 */
 			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
 				      "FBC isn't supported on BMG\n");
 
-- 
2.48.1

