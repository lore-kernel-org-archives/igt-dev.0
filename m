Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3623FC7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AA810E96D;
	Fri, 27 Jun 2025 06:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQAniA+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5741310E96B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751004045; x=1782540045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tKce+AXXSkdQBm8guJKtEzy0O96XOSpzPi6V+dAVF4M=;
 b=aQAniA+jkCkMviumKjQVqn1NYXhG/DL9Aj4FKbcmqwb3JfCH9Pn7CPdK
 CxKToeusIev2bahH6wxMCVaqxz5bgAlxNmxzo8POpUV7RGIWTGwNCl7Us
 T9e7QEZQqG1yfOMoi2VUNisV8Ujm1/hU/fNsV7MhVjW4FgN7eLdOB01GU
 logHISCPzgdhUUD1EkaC/zL3MgX8j95to/lwSNma3ObnuieYDhZNywqgo
 5jyyUE3j7GIYfVqItpeQmB9jBy77pqitYOCce0fqOr0Uw2mMUCtJ6IQ14
 AJwE46xGAMYqi9lPoFUDSD6Mf5De54YKbunID4YKxgmnFB5wfdsQdV4n5 g==;
X-CSE-ConnectionGUID: c0iqLP7yR+qx8j3pLTt28w==
X-CSE-MsgGUID: cffod3g5SPexHilEf8BRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53278510"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53278510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:00:45 -0700
X-CSE-ConnectionGUID: Akryd3moTTuzwtLaKBaXNA==
X-CSE-MsgGUID: odmzbg8GTFGk/FJaFlKsyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152809456"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 23:00:43 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH v6 3/7] tests/intel/kms_frontbuffer_tracking: Enable the tests
 support variations based on the WAs
Date: Fri, 27 Jun 2025 11:34:42 +0530
Message-Id: <20250627060446.29615-4-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627060446.29615-1-mohammed.thasleem@intel.com>
References: <20250627060446.29615-1-mohammed.thasleem@intel.com>
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
v6: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..32d5590ff 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2610,8 +2610,8 @@ static void prepare_subtest_data(const struct test_mode *t,
 static void prepare_subtest_screens(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	igt_skip_on_f(t->feature == FEATURE_FBC && !intel_is_fbc_disabled_by_wa(drm.fd),
+		     "WA has disabled FBC on BMG\n");
 
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
@@ -2658,8 +2658,8 @@ static void prepare_subtest(const struct test_mode *t,
 static void rte_subtest(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
-		      "FBC isn't supported on BMG\n");
+	igt_skip_on_f(t->feature == FEATURE_FBC && !intel_is_fbc_disabled_by_wa(drm.fd),
+		     "WA has disabled FBC on BMG\n");
 
 	prepare_subtest_data(t, NULL);
 
@@ -4157,8 +4157,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.tiling = opt.tiling;
 
 			/* FBC disabled: Wa_16023588340 */
-			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
-				      "FBC isn't supported on BMG\n");
+			igt_skip_on_f(t.feature == FEATURE_FBC && !intel_is_fbc_disabled_by_wa(drm.fd),
+				     "WA has disabled FBC on BMG\n");
 
 			for_each_pipe(&drm.display, pipe) {
 				if (pipe == default_pipe) {
-- 
2.34.1

