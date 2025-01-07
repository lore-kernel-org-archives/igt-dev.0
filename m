Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F1DE7719C
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF80610E7A2;
	Tue,  7 Jan 2025 20:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tn5lgqus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348EB10E793
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736281686; x=1767817686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bfWn5bSGFZGfTgSKrKTOWkUvdLskgity3l6S+f7UolY=;
 b=Tn5lgqusO9C4QKEvsWGcMPEFpGEW9TWYP0IMYxtU2B+AMwhJovB6mkVe
 SI6DE/b6BhCdxFxcfAC6oWI5dyOW4Ro7TRCA2Fi+EFuciI1ImcKkKCGs1
 TMQg+fEIAUcIVKBPcTnEesJUqmNMCJhlMm5ckemb76uHLsOoDeDE2x6mi
 y5Ug0Bun3gP0cBrA6dGakwwCovl/FeQC5Eo3JI7htr7pqSNsFdRfKFzu0
 1V/hRVWBDJ75GgkUn1UhGQBPJPu8yRuLL5KGs72ol2aYKrS1Pw5YVmCBQ
 2oOPoTp31sPzi41PKFLpYpAe8l47KNDt9q5G0MZgBdgvh/JVA0vcpA48X Q==;
X-CSE-ConnectionGUID: uae3meMFQX+oiL3KdDKOwA==
X-CSE-MsgGUID: oWDhmcNZQLGQlGe0Ui0NyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39309014"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="39309014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
X-CSE-ConnectionGUID: Y0NNCSfvSB+Ep9TEeiEABA==
X-CSE-MsgGUID: WqLIBGsURiKMAiJvUbNrMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133725692"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t v2 7/8] tests/intel/xe_drm_fdinfo: Stop asserting on
 usage percentage
Date: Tue,  7 Jan 2025 12:26:14 -0800
Message-ID: <20250107202615.1306306-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250107202615.1306306-1-lucas.demarchi@intel.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It's unreliable to assert on the usage percentage considering 2 data
points as it still depends on the CPU scheduling not preempting tasks in
the wrong moment. On a normal use case of a top-like application, the
value not accounted for would simply show up in the next sample without
much issue. For a test assertion, it's better to check that the value
reported via fdinfo is reasonably close to the one saved by the GPU in
the spin. It's still allowed some error because there are a few GPU
ticks of difference due to the **GPU** scheduling the contexts.

v2:
  - Fix parallel tests due to not checking width and other minor nits
    (Jonathan Cavitt)
  - Fix negative delta computation

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 53 ++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 39519fa52..f9eca25ed 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <math.h>
+
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_device.h"
@@ -370,36 +372,43 @@ static void basic_engine_utilization(int xe)
 
 static void
 check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
-	      int class, int width, enum expected_load expected_load)
+	      int class, int width, uint32_t spin_stamp,
+	      enum expected_load expected_load)
 {
 	double percent;
-	u64 den, num;
+	uint64_t den, num;
 
 	igt_debug("%s: sample 1: cycles %"PRIu64", total_cycles %"PRIu64"\n",
 		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
 	igt_debug("%s: sample 2: cycles %"PRIu64", total_cycles %"PRIu64"\n",
 		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
+	igt_debug("spin_stamp: %u width: %d\n", spin_stamp, width);
 
 	num = s2[class].cycles - s1[class].cycles;
 	den = s2[class].total_cycles - s1[class].total_cycles;
+
 	percent = (num * 100.0) / (den + 1);
 
-	/* for parallel submission scale the busyness with width */
+	/* For parallel submission scale the busyness with width */
 	percent /= width;
 
-	igt_debug("%s: percent: %f\n", engine_map[class], percent);
+	igt_debug("%s: percent: %.2f%%\n", engine_map[class], percent);
 
 	switch (expected_load) {
 	case EXPECTED_LOAD_IDLE:
 		igt_assert_eq(num, 0);
 		break;
 	case EXPECTED_LOAD_FULL:
+		/* For parallel submission scale the busyness with width */
+		spin_stamp *= width;
+
 		/*
-		 * We are still relying on CPU sleep time and there could be
-		 * some imprecision when calculating the load. Use a 5% margin.
+		 * Percentage error between value saved by gpu in xe_spin and what
+		 * is reported via fdinfo
 		 */
-		igt_assert_lt_double(95.0, percent);
-		igt_assert_lt_double(percent, 105.0);
+		percent = fabs((int64_t)(num - spin_stamp) * 100.0) / (spin_stamp + 1);
+		igt_debug("%s: error: %.2f%%\n", engine_map[class], percent);
+		igt_assert_lt_double(percent, 5.0);
 		break;
 	}
 }
@@ -437,14 +446,17 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	expected_load = flags & TEST_BUSY ?
 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
-	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1, expected_load);
+
+	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1,
+		      cork ? cork->spin->timestamp : 0, expected_load);
 
 	if (flags & TEST_ISOLATION) {
 		/*
 		 * Load from one client shouldn't spill on another,
 		 * so check for idle
 		 */
-		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, EXPECTED_LOAD_IDLE);
+		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, 0,
+			      EXPECTED_LOAD_IDLE);
 		close(new_fd);
 	}
 
@@ -460,6 +472,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct xe_cork *cork;
+	uint32_t timestamp;
 	uint32_t vm;
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -471,13 +484,15 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 
 	/* destroy queue before sampling again */
 	xe_cork_sync_end(fd, cork);
+	timestamp = cork->spin->timestamp;
 	xe_cork_destroy(fd, cork);
 
 	read_engine_cycles(fd, pceu2);
 
 	xe_vm_destroy(fd, vm);
 
-	check_results(pceu1, pceu2, hwe->engine_class, 1, EXPECTED_LOAD_FULL);
+	check_results(pceu1, pceu2, hwe->engine_class, 1, timestamp,
+		      EXPECTED_LOAD_FULL);
 }
 
 static void
@@ -502,7 +517,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 		enum expected_load expected_load = hwe->engine_class != class ?
 			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-		check_results(pceu1, pceu2, class, 1, expected_load);
+		check_results(pceu1, pceu2, class, 1, cork->spin->timestamp,
+			      expected_load);
 	}
 
 	xe_cork_destroy(fd, cork);
@@ -547,7 +563,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 		if (!cork[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, 1, expected_load);
+		check_results(pceu1, pceu2, class, 1, cork[class]->spin->timestamp,
+			      expected_load);
 		xe_cork_destroy(fd, cork[class]);
 	}
 
@@ -588,7 +605,9 @@ utilization_all_full_load(int fd)
 		if (!cork[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
+		check_results(pceu1, pceu2, class, 1,
+			      cork[class]->spin->timestamp,
+			      EXPECTED_LOAD_FULL);
 		xe_cork_destroy(fd, cork[class]);
 	}
 
@@ -660,14 +679,16 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	expected_load = flags & TEST_BUSY ?
 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
-	check_results(pceu[0], pceu[1], class, width, expected_load);
+
+	check_results(pceu[0], pceu[1], class, width,
+		      cork ? cork->spin->timestamp : 0, expected_load);
 
 	if (flags & TEST_ISOLATION) {
 		/*
 		 * Load from one client shouldn't spill on another,
 		 * so check for idle
 		 */
-		check_results(pceu_spill[0], pceu_spill[1], class, width,
+		check_results(pceu_spill[0], pceu_spill[1], class, width, 0,
 			      EXPECTED_LOAD_IDLE);
 		close(fd_spill);
 	}
-- 
2.47.0

