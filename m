Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7632CC54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 10:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F1910E429;
	Tue, 27 May 2025 10:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLZhGSlF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72A10E42D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748340642; x=1779876642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AHkZx2fg244Xfl6b87h2rkYOfQl5f3hhXnaD1DHb4hk=;
 b=BLZhGSlFtROwd9vHY5bffa6BvWcSfEUY96zPgDBqGFuQQ8zZH/b/jQnJ
 ngXQRfLmoTfnZqaGcmdvQp8qpD1URbYJ+5j/08rdLvikGVKZYAn9daQQZ
 dcOXvIK77xC6W26n8rf5b1z+OdEgom/NdnZSTdlKoXJGcXa8/QQZ/EdOt
 M0vFfwL/X+PfHFSZRJK+ciz/x6QxRRDmJSExeh/3WujxxATmwYFPe20+o
 tUfedv/HFqzRuv/Z7Bjn0ahQjOxjHoEHmASbddAWTjFKu0v/7GKZVl2Wj
 8hfcUv8XrUd/MEB9OYCV2lGTDWww68ZYPgmWhglkq6rG2j8386cqOMMLA Q==;
X-CSE-ConnectionGUID: G86X/ghERzWVJsmRZ8qlAg==
X-CSE-MsgGUID: TWZpX8/eTaKx5+ixH2MNvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67741849"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="67741849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:42 -0700
X-CSE-ConnectionGUID: CCp+QMpVR+eFkcvaLqZ3vg==
X-CSE-MsgGUID: DJbOjrvOTIaAbdne1ukllQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142667508"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 1/3] tests/intel/xe_pmu: Validate engine activity on gt
 reset and suspend
Date: Tue, 27 May 2025 16:04:31 +0530
Message-ID: <20250527103433.910475-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250527103433.910475-1-riana.tauro@intel.com>
References: <20250527103433.910475-1-riana.tauro@intel.com>
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

