Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25EFC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 06:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C95210E6FB;
	Thu, 29 May 2025 06:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+SAitGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ED110E6FB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 06:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748500207; x=1780036207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AHkZx2fg244Xfl6b87h2rkYOfQl5f3hhXnaD1DHb4hk=;
 b=k+SAitGUezwpohMfse0iuuAG1HAqZ9jIzrwhtQ2NBHIKkqoY6TOq4qL0
 IG/JESC81GQN8x7BOqhVpJhOmLCtjbh3WqXWTNlDJNV+ruNnIQD2d3Muo
 r+ZznHJVep1AW4q6pLmd4OzzAelooPPKzzZZKSDEz0AJO8lOVNPJl9adb
 cQUni/iMvDGCZpUEHpWHfkOGpyHwFcX+XvVmySbBZJ7uKGVaqKQnUEnml
 GHP0Sp7yBnejyK612615QA15gA2uKUSAZPYslZumLfhklTAACQyztuhVp
 3FrxKASk+KVST11TLvA3zGKCuQ2Y7QP2+AcyklV26AIOwZyFPobJr2O66 Q==;
X-CSE-ConnectionGUID: oVjIF6GwTMObtbO5+w7cow==
X-CSE-MsgGUID: L15aaQ7JREGc1luWnJ7B5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54210914"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54210914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:07 -0700
X-CSE-ConnectionGUID: ZgzDsqFLSVmG/L+kzKs7qw==
X-CSE-MsgGUID: JpqsOkxPTOOX5Z820ZabpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="174347292"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:05 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v2 1/4] tests/intel/xe_pmu: Validate engine activity on
 gt reset and suspend
Date: Thu, 29 May 2025 12:23:56 +0530
Message-ID: <20250529065359.915117-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529065359.915117-1-riana.tauro@intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
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

Add tests to validate engine activity before and after gt resets
and suspend

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 02f23bd7d..15b4b82d8 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -40,6 +40,12 @@
  * Description: Test to validate engine activity by running workload on all engines
  *		simultaneously and trailing idle
  *
+ * SUBTEST: engine-activity-gt-reset
+ * Description: Test to validate engine activity on all engines before and after gt reset
+ *
+ * SUBTEST: engine-activity-suspend
+ * Description: Test to validate engine activity on all engines before and after s2idle
+ *
  * SUBTEST: engine-activity-most-load
  * Description: Test to validate engine activity by running workload on all engines except one
  *
@@ -812,6 +818,21 @@ igt_main
 	igt_subtest("engine-activity-all-load-idle")
 		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
 
+	igt_describe("Validate engine activity before and after gt reset");
+	igt_subtest("engine-activity-gt-reset") {
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+		xe_for_each_gt(fd, gt)
+			xe_force_gt_reset_sync(fd, gt);
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+	}
+
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

