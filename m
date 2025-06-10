Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89545C71131
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 17:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E57610E288;
	Tue, 10 Jun 2025 17:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grsErr1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE83D10E288
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749577144; x=1781113144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5C9+LssWfQ9wWDs8w2bhfLY5a7G3PJ4+Hq2HN2+W+zM=;
 b=grsErr1DivkwYrbSIJoJm/EPY7BBCM7bYD4YCtDG62hYoevNqX0y9lRz
 OqqFHrb5k7FSI582oMlDt7BvtoM6U7yTnxBIfXIO0W/6WPBnIRu8f/RWL
 +FRP7TIV6RE6Dcomv9c2cmtSWRENYLAUk7x8De4vS1nHjIxa3PFyqBqNI
 qwIZ+lnmCn9vtrWWEX+mQiMnIxPtwwC03SOpbZKVq/Htdw7tOycBkt3uS
 b4iet9/f4/bks0/LKLO9wnv2IcNi9Es/CFVGMj7MvfcbzlpPfz/CPc48A
 79VsPjDXPZ3wxYP8MQRYpeOqYCdHBvqEiyCACI3uAnqJFOtT/YXquaD8B g==;
X-CSE-ConnectionGUID: WksjXBHARTiw7vpl1GYcWg==
X-CSE-MsgGUID: 5eh3YcoCQW24m2XI0nH1XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55505946"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="55505946"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:39:03 -0700
X-CSE-ConnectionGUID: N/P8LqrYT/C0lNrOHzB2Vw==
X-CSE-MsgGUID: U9m8bHLnSKu9ddyeIjb+OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147854440"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 10:39:02 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH v5 3/7] tests/intel/kms_frontbuffer_tracking: Enable the tests
 support variations based on the WAs
Date: Tue, 10 Jun 2025 23:12:40 +0530
Message-Id: <20250610174244.1292-4-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610174244.1292-1-mohammed.thasleem@intel.com>
References: <20250610174244.1292-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

v2: Use WA_FBC_DISABLED instead CHECK_WA. (Vinod)
    Update igt_skip_on_f discription. (Vinod)
v3: Remove platform check and make it for xe specific. (Vinod)
    Rename function name with is_fbc_support. (Vinod)
v4: Update function name and add igt_skip check. (Vinod)
v5: Move is_fbc_supported to intel_fbc.c (Kunal)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..aaa4261ee 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -781,6 +781,7 @@
  */
 
 #define TIME SLOW_QUICK(1000, 10000)
+#define WA_FBC_DISABLED "16023588340"
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
@@ -2610,8 +2611,8 @@ static void prepare_subtest_data(const struct test_mode *t,
 static void prepare_subtest_screens(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	igt_skip_on_f(t->feature == FEATURE_FBC && !intel_is_fbc_supported(drm.fd, WA_FBC_DISABLED),
+		     "WA has disabled FBC on BMG\n");
 
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
@@ -2658,8 +2659,8 @@ static void prepare_subtest(const struct test_mode *t,
 static void rte_subtest(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	igt_skip_on_f(t->feature == FEATURE_FBC && !intel_is_fbc_supported(drm.fd, WA_FBC_DISABLED),
+		     "WA has disabled FBC on BMG\n");
 
 	prepare_subtest_data(t, NULL);
 
@@ -4157,8 +4158,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.tiling = opt.tiling;
 
 			/* FBC disabled: Wa_16023588340 */
-			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
-				      "FBC isn't supported on BMG\n");
+			igt_skip_on_f(t.feature == FEATURE_FBC && !intel_is_fbc_supported(drm.fd, WA_FBC_DISABLED),
+				     "WA has disabled FBC on BMG\n");
 
 			for_each_pipe(&drm.display, pipe) {
 				if (pipe == default_pipe) {
-- 
2.34.1

