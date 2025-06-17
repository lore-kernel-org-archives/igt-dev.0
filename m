Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94849C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E29410E152;
	Tue, 17 Jun 2025 19:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbQbP38e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4FB10E152
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750188412; x=1781724412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5C9+LssWfQ9wWDs8w2bhfLY5a7G3PJ4+Hq2HN2+W+zM=;
 b=NbQbP38eNwub2jkFuTIaNAVrLW3h7bZghoioPgmbMbYg/3qfY0Kyy0HW
 tkaZDQwhARCHvTFhrhJ4qIJrKArCY3eDQocLUfZHymykxXB4SVej3/tnw
 B7RQ9iTX4pU5zcHoJCBkK3/In3PW7VFXPTy/92odafUGz/itlAI/tQhXu
 y6am/5TZIwqlPPCVxFDqp+bxWlcHwRh1j6XPkCQulbtqOcFqqxwBHiioS
 HORmG/ADFB2dZAoWH50B58yzVkS2eoRlBSqQDs4JzroGMy8dGIy0RHEce
 6F4CcdwlEUHLVTyM2xQVk/njR/qzUUrAprMzzwIAVUc4EioFcqwH9xTMh A==;
X-CSE-ConnectionGUID: FK/bP7EfTK2kiqHLy8/y1Q==
X-CSE-MsgGUID: EDxUQ+fBS3WyNhAat4CQaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52523998"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52523998"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:26:51 -0700
X-CSE-ConnectionGUID: 1IK9iyoYTzeJlw6WJE8wfg==
X-CSE-MsgGUID: RwM2N5YLRpGiK+o+W8rwNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148807888"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:26:50 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH v6 3/7] tests/intel/kms_frontbuffer_tracking: Enable the tests
 support variations based on the WAs
Date: Wed, 18 Jun 2025 01:00:24 +0530
Message-Id: <20250617193028.107483-4-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617193028.107483-1-mohammed.thasleem@intel.com>
References: <20250617193028.107483-1-mohammed.thasleem@intel.com>
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

