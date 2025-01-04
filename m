Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C52E77197
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 07:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E12D10E44D;
	Sat,  4 Jan 2025 07:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nL8DVDAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FDB10E449
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735974963; x=1767510963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oy3U9MzCbD4zBZV2a2LTKEzMI8BoCXIx0AoeeoCh4Z0=;
 b=nL8DVDAHtfdPbU0pUDC8I683FgsR8jzKycM0f4TJGlgw6bSzalOz3T17
 N8KcMxEZWkw71Du9Ddi56uW82wOVl9EkQNSObVIYaA82dQ8BtJQ1+P1FA
 i2VdsgVgqQrnxJC/cFfaEAazZX2CESVHBKFJypJKHgVNvBXh647r7SN7a
 BtSUrnzqGn74QvkZsBdX5i7Z6Etl9k5my12MX/s+ZrAWFQTfaQraJQA5N
 zpbj0BMzqM/clJGmjEMN+SowqelUfZziT2+6wnUJ9GSjCpzS9cjL1KTL7
 qzqjqlosZhVa/0KjAybRli6DdPjcQiEk9h3q5+byaJbh/11O6wvBisFzz g==;
X-CSE-ConnectionGUID: RIsGLMEMRWaBQkVYu44ZgQ==
X-CSE-MsgGUID: JYn4E8SlRU2rBwV8K/6Lpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46878996"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="46878996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
X-CSE-ConnectionGUID: GVQ8Cyh0RXGBLWWzmY8ATQ==
X-CSE-MsgGUID: pHZMJvvGSbKiUQEFXnepcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101762007"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 8/8] tests/intel/xe_drm_fdinfo: Stop asserting on usage
 percentage
Date: Fri,  3 Jan 2025 23:15:48 -0800
Message-ID: <20250104071548.737612-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
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

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 49 +++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 1089e5119..120436fbe 100644
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
@@ -371,7 +373,8 @@ static void basic_engine_utilization(int xe)
 
 static void
 check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
-	      int class, int width, enum expected_load expected_load)
+	      int class, int width, uint32_t spin_stamp,
+	      enum expected_load expected_load)
 {
 	double percent;
 	u64 den, num;
@@ -383,12 +386,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 
 	num = s2[class].cycles - s1[class].cycles;
 	den = s2[class].total_cycles - s1[class].total_cycles;
-	percent = (num * 100.0) / (den + 1);
-
-	/* for parallel submission scale the busyness with width */
-	percent /= width;
 
-	igt_debug("%s: percent: %f\n", engine_map[class], percent);
+	percent = (num * 100.0) / (den + 1) / width;
+	igt_debug("%s: percent: %.2f%%\n", engine_map[class], percent);
 
 	switch (expected_load) {
 	case EXPECTED_LOAD_IDLE:
@@ -396,11 +396,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 		break;
 	case EXPECTED_LOAD_FULL:
 		/*
-		 * We are still relying on CPU sleep time and there could be
-		 * some imprecision when calculating the load. Use a 5% margin.
+		 * percentage error between value saved by gpu in xe_spin and what
+		 * is reported via fdinfo
 		 */
-		igt_assert_lt_double(95.0, percent);
-		igt_assert_lt_double(percent, 105.0);
+		percent = fabs((num - spin_stamp) * 100.0) / (spin_stamp + 1);
+		igt_debug("%s: error: %.2f%%\n", engine_map[class], percent);
+		igt_assert_lt_double(percent, 5.0);
 		break;
 	}
 }
@@ -438,14 +439,17 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
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
 
@@ -461,6 +465,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct xe_cork *cork;
+	uint32_t timestamp;
 	uint32_t vm;
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -472,13 +477,15 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 
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
@@ -503,7 +510,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 		enum expected_load expected_load = hwe->engine_class != class ?
 			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-		check_results(pceu1, pceu2, class, 1, expected_load);
+		check_results(pceu1, pceu2, class, 1, cork->spin->timestamp,
+			      expected_load);
 	}
 
 	xe_cork_destroy(fd, cork);
@@ -547,7 +555,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 		if (!cork[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, 1, expected_load);
+		check_results(pceu1, pceu2, class, 1, cork[class]->spin->timestamp,
+			      expected_load);
 		xe_cork_destroy(fd, cork[class]);
 	}
 
@@ -585,7 +594,9 @@ utilization_all_full_load(int fd)
 		if (!cork[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
+		check_results(pceu1, pceu2, class, 1,
+			      cork[class]->spin->timestamp,
+			      EXPECTED_LOAD_FULL);
 		xe_cork_destroy(fd, cork[class]);
 	}
 
@@ -657,14 +668,16 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
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

