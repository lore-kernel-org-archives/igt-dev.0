Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBA3C61DB2
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 09:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCAA10EA21;
	Fri,  6 Jun 2025 09:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThN+ux7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A048C10EA20
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749203172; x=1780739172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V50p+DaeLmobcIGN5PQ0AjxhRMPfBUZHMjVJfOrXB2k=;
 b=ThN+ux7kkBcqHW21plVsiazF//KHKkPwSy1+j6tXopwqn9twxDsUesyA
 eLi31dBp7w1J3r0o3KR5JuQbVD/28i7UjG0R2SkPVOzWZUt2pYHhVGV7k
 +Sed/yYVdWN5ixV1S+ypzpMxAYjLVpFqEBKgk3rSkLjFUnB5/0c0myb7w
 rN/ykzTnT0stjyrEosjXbfWCuHCW5/7/I5uWP1CUTV2Ka+hXueLgW6AEE
 EKqvvk5nvz/tIpLBMAwGA8l02QzzNK9xjg2i1+mHBwZHZjAOMafSPsNpp
 C9iDzu6PrI0Q1ZgY/v2sPspqlmgqmfWpbkayneoj/vieKNKBP+YYLYlWd A==;
X-CSE-ConnectionGUID: dKVV+MDvTAeuTjX8nleT+g==
X-CSE-MsgGUID: nDW+VUgERU+ZSoEVW+G3oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62745036"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="62745036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:11 -0700
X-CSE-ConnectionGUID: fjl6BARHQoWDLAcoVxyjZQ==
X-CSE-MsgGUID: 51tF4tkOT9CA+rV075e+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="182974805"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:09 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v3 2/5] tests/intel/xe_pmu: Validate engine activity
 after suspend
Date: Fri,  6 Jun 2025 15:40:05 +0530
Message-ID: <20250606101008.1949955-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250606101008.1949955-1-riana.tauro@intel.com>
References: <20250606101008.1949955-1-riana.tauro@intel.com>
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

Add a test to validate engine activity after suspend. This is
to validate if guc action for engine activity is sent after
suspend

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index d9b0d2c96..e6afca9c4 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -46,6 +46,9 @@
  * SUBTEST: engine-activity-gt-reset
  * Description: Test to validate engine activity on all engines before and after gt reset
  *
+ * SUBTEST: engine-activity-suspend
+ * Description: Test to validate engine activity on all engines before and after s2idle
+ *
  * SUBTEST: engine-activity-most-load
  * Description: Test to validate engine activity by running workload on all engines except one
  *
@@ -847,6 +850,13 @@ igt_main
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
 	}
 
+	igt_describe("Validate engine activity before and after s2idle");
+	igt_subtest("engine-activity-suspend") {
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+	}
+
 	igt_subtest_group {
 		unsigned int num_fns;
 
-- 
2.47.1

