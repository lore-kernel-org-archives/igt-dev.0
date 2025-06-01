Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019F4C54FB3
	for <igt-dev@archiver.kernel.org>; Sun,  1 Jun 2025 12:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9137A10E112;
	Sun,  1 Jun 2025 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbCBKoSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935110E112
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Jun 2025 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748781632; x=1780317632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8oM0QxFxIi2i1DrmkHCNC2W2O/dCIbdplSZfQDs1+48=;
 b=LbCBKoSo20gXop5kiWEB2+NzRL4IEiqd45tnNU4AWR+Ddpmf+KYYpc/G
 JBGxZbu7EJWiK0yDLq68DXJSJFSDS8ZKPPErx8Qhl0Gx38q1+9ESA1MHj
 xNz3iCSAmkQNYc6Ry0dFbgE0x9grNDzzsZ9DYl/yEj3jUPvRguClWNLye
 1I5QZTaGZ7txdlhHdNAOMtIdhOlY5CozfphednIB4LGL0EkKqMbGJs2yr
 3Zj0sfOKYE9SmA+WtSvtzDSYl/HdIbi+NOGDSBpL0HpDZ8DypGNgvvxj2
 rQLS+nsTt0dDOCT7OB5lykwaXR5nmZabr70bloSTYuNuKLVqXfxnumRSQ Q==;
X-CSE-ConnectionGUID: AmHPHlRQTJWAa6jsXslc5A==
X-CSE-MsgGUID: TwpcqjVESBazY4X8loT+Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50050207"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; d="scan'208";a="50050207"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2025 05:40:31 -0700
X-CSE-ConnectionGUID: 54I3aVdeTPW4BF09Nras+g==
X-CSE-MsgGUID: WZEEY/6lTwCKRZ3VXXCtCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; d="scan'208";a="144628745"
Received: from linux-lunar-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa008.fm.intel.com with ESMTP; 01 Jun 2025 05:40:29 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 2/2] tests/intel/kms_frontbuffer_tracking: Enable the tests
 support variations based on the WAs
Date: Sun,  1 Jun 2025 18:13:55 +0530
Message-Id: <20250601124355.16351-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530075811.1033-3-mohammed.thasleem@intel.com>
References: <20250530075811.1033-3-mohammed.thasleem@intel.com>
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
v4: Update function name and add igt_skip_on_f at calling function. (Vinod)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..66a5177fe 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -781,6 +781,7 @@
  */
 
 #define TIME SLOW_QUICK(1000, 10000)
+#define WA_FBC_DISABLED "16023588340"
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
@@ -2248,6 +2249,16 @@ static void do_flush(const struct test_mode *t)
 
 #define ASSERT_NO_IDLE_GPU		(1 << 11)
 
+static bool is_fbc_supported(int devid, const struct test_mode *t)
+{
+	int wa;
+
+	wa = igt_has_intel_wa(drm.fd, WA_FBC_DISABLED);
+	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
+
+	return wa != 1;
+}
+
 static int adjust_assertion_flags(const struct test_mode *t, int flags)
 {
 	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
@@ -2610,8 +2621,8 @@ static void prepare_subtest_data(const struct test_mode *t,
 static void prepare_subtest_screens(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	igt_skip_on_f(t->feature == FEATURE_FBC && !is_fbc_supported(drm.devid, t),
+		     "WA has disabled FBC on BMG\n");
 
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
@@ -2658,8 +2669,8 @@ static void prepare_subtest(const struct test_mode *t,
 static void rte_subtest(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	igt_skip_on_f(t->feature == FEATURE_FBC && !is_fbc_supported(drm.devid, t),
+		     "WA has disabled FBC on BMG\n");
 
 	prepare_subtest_data(t, NULL);
 
@@ -4157,8 +4168,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.tiling = opt.tiling;
 
 			/* FBC disabled: Wa_16023588340 */
-			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
-				      "FBC isn't supported on BMG\n");
+			igt_skip_on_f(t.feature == FEATURE_FBC && !is_fbc_supported(drm.devid, &t),
+				     "WA has disabled FBC on BMG\n");
 
 			for_each_pipe(&drm.display, pipe) {
 				if (pipe == default_pipe) {
-- 
2.34.1

