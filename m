Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08BDC3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 17:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9799610E07C;
	Thu, 25 Jul 2024 17:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kml9kwK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9840E10E320
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721928181; x=1753464181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=osvmf7JVjKVOej2sLxz32YWMGO+VSzfjSNULqqs7AT4=;
 b=Kml9kwK7KzpvoZSl4OtdgZhnLp9N8QSz2P4uuHkzRhdk4cstgaLAjNSC
 p3+TOcEYNDgoyCfkH2wAYqzzVUpC2llGf+iiNPRQh35YzwxL/knppVifM
 HYOTtX1iuDMzrell6WZjvLPUm9ee2D0733FGLglySymBCpsCJ/aK+3zw8
 CF4kW+9VdkMn7EV+tw5lu8KtkReEthdnE0RW/Ldh5Z+fm4FLJ6vIvvgPe
 HFAq+KMfREQqtX9iKUWTR9Gth12JV6CD9wsvDf1+hoEdT7l6BJ7MwGHd9
 c1mLOZOFTfIHpQY1e5ihCCxSYMLWSLdtPaqn3Dt+lhzF0nSbyXFCSOh0D g==;
X-CSE-ConnectionGUID: HP7i27diTPSs0AwSFoIdQg==
X-CSE-MsgGUID: mykUo2pfSZaoPXxGBcmamQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19839656"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19839656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:23:01 -0700
X-CSE-ConnectionGUID: pqMWJD/sSRigNwbbuWhWiQ==
X-CSE-MsgGUID: b3p9cLywSXaZ9d/VcLfKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="57583286"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:23:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH v3 1/2] tests/intel/xe_pm_residency: convert all tests to
 dynamic subtests
Date: Thu, 25 Jul 2024 10:23:43 -0700
Message-Id: <20240725172344.1927234-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Riana Tauro <riana.tauro@intel.com>

Convert all tests to dynamic subtests to identify which GT
the tests are running on.

No functional changes

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel/xe_pm_residency.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 367b1027c6..51735d8874 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -233,8 +233,8 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
 	unsigned long end, start;
 	unsigned long elapsed_ms, residency_end, residency_start;
 
-	igt_debug("Running on %s:%d\n",
-		  xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
+	igt_info("Running on %s:%d\n",
+		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
 	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(done != MAP_FAILED);
 	memset(done, 0, 4096);
@@ -321,35 +321,44 @@ igt_main
 	}
 
 	igt_describe("Validate GT C6 on idle");
-	igt_subtest("gt-c6-on-idle")
+	igt_subtest_with_dynamic("gt-c6-on-idle") {
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+			igt_dynamic_f("gt%u", gt)
+				igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
+					     "GT %d not in C6\n", gt);
+	}
 
 	igt_describe("Validate idle residency measured over suspend cycle is within the tolerance");
-	igt_subtest("gt-c6-freeze") {
+	igt_subtest_with_dynamic("gt-c6-freeze") {
 		if (xe_has_vram(fd)) {
 			igt_device_get_pci_slot_name(fd, pci_slot_name);
 			igt_pm_get_d3cold_allowed(pci_slot_name, &d3cold_allowed);
 			igt_pm_set_d3cold_allowed(pci_slot_name, 0);
 		}
 		xe_for_each_gt(fd, gt)
-			test_idle_residency(fd, gt, TEST_S2IDLE);
+			igt_dynamic_f("gt%u", gt)
+				test_idle_residency(fd, gt, TEST_S2IDLE);
 
 		if (xe_has_vram(fd))
 			igt_pm_set_d3cold_allowed(pci_slot_name, d3cold_allowed);
 	}
 
 	igt_describe("Validate idle residency measured over a time interval is within the tolerance");
-	igt_subtest("idle-residency")
+	igt_subtest_with_dynamic("idle-residency") {
 		xe_for_each_gt(fd, gt)
-			test_idle_residency(fd, gt, TEST_IDLE);
+			igt_dynamic_f("gt%u", gt)
+				test_idle_residency(fd, gt, TEST_IDLE);
+	}
 
 	igt_describe("Validate idle residency on exec");
-	igt_subtest("idle-residency-on-exec") {
+	igt_subtest_with_dynamic("idle-residency-on-exec") {
 		xe_for_each_gt(fd, gt) {
 			xe_for_each_engine(fd, hwe) {
-				if (gt == hwe->gt_id && !hwe->engine_instance)
-					idle_residency_on_exec(fd, hwe);
+				if (gt == hwe->gt_id && !hwe->engine_instance) {
+					igt_dynamic_f("gt%u-engine-%s", gt,
+						      xe_engine_class_string(hwe->engine_class))
+						idle_residency_on_exec(fd, hwe);
+				}
 			}
 		}
 	}
-- 
2.34.1

