Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFBBC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 09:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22F10EA39;
	Wed, 17 Jul 2024 09:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFR5CZ2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E58B10E6F0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721209679; x=1752745679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3n4RGI21S2orTdf4CD9/+BBpJ8MmK0/hKjHeo79uFRs=;
 b=IFR5CZ2qCSZ6+oUT1FOZUM8pHLVDTeYf46YW1ll8EhXZip3OTHUztWmJ
 Qcv6VXRfNk3CPyt0o7QjUEo00QUQHLdxvES702RwRq/cokuvjSpcB7AbS
 3BJM2uidRnrFcpRsmsQ2wj37DN+PDISvLxvEZva4ZD2TLoE7c9QDhXcxk
 Aou1JdQ3+ns5nmJ7MW7t9tx7nVivXH1nDGWetv7YmfnfeLL0qSErqAqka
 mgfE9yq04Bof1LrslCAKRX5keevqVKPFgdiXxpiwMWEHiXYV14VHVW8SU
 wcgILT86ahu7u3prh9PJj/eQXjpRoSEXnEgCXWDGVzDDIFvlRAmGC38wi Q==;
X-CSE-ConnectionGUID: FohIpyUWS0igrmUSsFpkxA==
X-CSE-MsgGUID: bOT9Z0m9SHW07S9l+HTibQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18398361"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18398361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 02:47:58 -0700
X-CSE-ConnectionGUID: 1eydLMA0SeeArK/m0udMpA==
X-CSE-MsgGUID: 67o94oCpR7ObHRLjdIBp7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50662487"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 02:47:57 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: convert all tests to
 dynamic subtests
Date: Wed, 17 Jul 2024 15:30:57 +0530
Message-Id: <20240717100057.4186183-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Convert all tests to dynamic subtests to identify which GT
the tests are running on.

No functional changes

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 367b1027c..51735d887 100644
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
2.40.0

