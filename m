Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351D9CAC5A8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 10:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC33D10E6FE;
	Thu, 18 Sep 2025 10:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WuC/VQFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F393B10E6FE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758193173; x=1789729173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ja0NWIF9x2n7Km8W/ZJJbbHUhMRIC4ta/GXAyn4LnO4=;
 b=WuC/VQFZU1UBtHE8Z2ShorHJUxs5FH1J/sDfk12Uh3XZJNfgTMKCBRCx
 qFkNczE3XFmLRlf5Mhm2SFu4h/W3nnBr4DvtXA7gxSwLJwP8v2VoEomik
 kMlfLIZ+BkIOlki+m0Kpsznw08WMcs3gvYK91kmQFlB6T82e9nAoNnPfp
 WN25LrF3oFZ8S0pI7hXC1IInF4gbfWZEDRm1qaxawOGNhXEr3QygBVe4y
 YC1a+4NKfmnwvffTz/XKaGCN9V/XzQizabXpXvsyRqql05YefLnyx0btJ
 1UG6v9Z8ICsKEEfkbtT5cK3Y3TCogiaKFM8czRg8Pqvq2bgQeENKe5Bkp g==;
X-CSE-ConnectionGUID: XmDZwPpjRgSWDZJ+1ZuNew==
X-CSE-MsgGUID: jtVFeVQ4SpGBXKuFgnBy3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60450824"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60450824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 03:59:32 -0700
X-CSE-ConnectionGUID: 9aHnZRr/Q7SNiR13fQ3mVQ==
X-CSE-MsgGUID: 7DgTcmvvRimsoWnBQLrj6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="176307978"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.76])
 by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2025 03:59:32 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: Refactor system suspend
 test function parameters
Date: Thu, 18 Sep 2025 16:27:08 +0530
Message-Id: <20250918105709.25093-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Modified the system_suspend_modeset_subtest() function to accept suspend
state and test type as parameters instead of using hardcoded values.

This change improves code flexibility and reusability for different suspend
testing scenarios.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index d22f165b8..344ef8c94 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1127,10 +1127,11 @@ __noreturn static void stay_subtest(void)
 		sleep(600);
 }
 
-static void system_suspend_modeset_subtest(void)
+static void system_suspend_modeset_subtest(enum igt_suspend_state state,
+					   enum igt_suspend_test test)
 {
 	disable_all_screens_and_wait(&ms_data);
-	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	igt_system_suspend_autoresume(state, test);
 	igt_assert(wait_for_suspended());
 
 	enable_one_screen_and_wait(&ms_data);
@@ -1682,7 +1683,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	/* System suspend */
 	igt_subtest("system-suspend-modeset")
-		system_suspend_modeset_subtest();
+		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
+					       SUSPEND_TEST_NONE);
 
 	/* power-wake reference tests */
 	igt_subtest("pm-tiling") {
-- 
2.25.1

