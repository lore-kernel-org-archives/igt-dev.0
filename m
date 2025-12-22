Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4034DE674B5
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 15:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E206810E31D;
	Mon, 22 Dec 2025 15:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jddNUYLF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6138B10E31D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766419016; x=1797955016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5L1oH20qSJasnSlYE6a3/v8r5Pydk7qZgoAbOhCAjZA=;
 b=jddNUYLF2IQzuoeuF1zBWVJn6Xx4UCcl5kyBIY8zoYBFZkcY+6kwQjzD
 4AYFrBxxwtNG0+/r9y2wAkc/emb9vcurht3nUq2iJQM4cPD64hjXthIfR
 KW84O7olY22ZXNEOiqJxV7nPX/WRWYQaeRjmDZ5jSm8YPwIkCemHXGeHI
 Dw6i6N/IsU4Y4JkVvWPkrsTmxIxkANhJPzXluHO+RmltoB4SKLnTQcD8e
 UJKYnmSym8OqVtRVoBMUO1zC3e/C1PYXhRjptOMuA+9af3UoR8BjCzxtp
 6NTmTj+TNRwR033BX9GDEU9hniIZV5fhpjoZWI27ks48X7YHPOk9OCugd g==;
X-CSE-ConnectionGUID: PDJb04flROeg29D3KG9xkQ==
X-CSE-MsgGUID: gqy9GKX3QtKOJ0m4jag30g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90934983"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="90934983"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:56:55 -0800
X-CSE-ConnectionGUID: +5nw5hOhQR6zX54MOnn0FQ==
X-CSE-MsgGUID: ygY2p9DBSwGbNKRXj221qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="200445564"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:56:52 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v3 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
Date: Mon, 22 Dec 2025 21:15:41 +0530
Message-Id: <20251222154541.4119131-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222154541.4119131-1-soham.purkait@intel.com>
References: <20251222154541.4119131-1-soham.purkait@intel.com>
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

Creating a new spinner during each pass was introducing unnecessary
overhead, which could distort timing-sensitive measurements
and increase error rates. The cumulative cost of repeated spinner
initialization was impacting test accuracy and efficiency.

To address this, a single spinner instance is now reused and properly
ended and reset between iterations. This approach reduces the overhead
associated with repeated spinner creation, saving time across multiple
passes by eliminating the cumulative time spent on spinner
initialization (creation time × number of passes). As the spinner's active
duration more accurately reflects actual engine busyness, this leads to
more precise measurements of the percentage of engine busyness in terms
of spinner running time.

With this change, the engine-activity-accuracy test results clearly show
an improvement in error reduction ranging from 98.97% to 99.53%.

v1:
 - Add how this patch improves the engine activity accuracy test. (Lucas)
 - Show the numbers with the said improvement. (Lucas)

v2:
 - Add an overview of the issue. (Riana)
 - Add the links in Closes. (Riana)
 - Add improvement in percentage. (Kamil)

v3:
 - Add xe_spin_sync_wait() with excess time adjusted
   accordingly. (Riana)

Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate engine activity accuracy")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6251
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index c8b3cebf0..33852270a 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -534,6 +534,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 		intel_allocator_init();
 		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 
+		spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+		xe_spin_end(spin->xe_spin);
+		xe_spin_sync_wait(fd, spin);
+
 		for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
 			unsigned int target_idle_us = idle_us;
 			struct timespec start = { };
@@ -546,21 +550,25 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 
 			while (pass_ns < timeout[pass]) {
 				unsigned long loop_ns, loop_active_ns, loop_idle_ns, now;
+				unsigned long after_sync;
 				double err, prev_avg, cur_val;
 
 				/* idle sleep */
 				igt_measured_usleep(target_idle_us);
 
 				/* start spinner */
-				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+				xe_spin_reset(fd, spin);
 				loop_idle_ns = igt_nsec_elapsed(&start);
 				igt_measured_usleep(active_us);
-				igt_spin_free(fd, spin);
+				xe_spin_end(spin->xe_spin);
 
 				now = igt_nsec_elapsed(&start);
+				xe_spin_sync_wait(fd, spin);
+				after_sync = igt_nsec_elapsed(&start);
+
 				loop_active_ns = now - loop_idle_ns;
 				loop_ns = now - pass_ns;
-				pass_ns = now;
+				pass_ns = after_sync;
 
 				pass_active_ns += loop_active_ns;
 				total_active_ns += loop_active_ns;
@@ -590,6 +598,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 				      sizeof(expected));
 		}
 
+		igt_spin_free(fd, spin);
 		xe_vm_destroy(fd, vm);
 		put_ahnd(ahnd);
 	}
@@ -622,7 +631,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
 		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
 
-	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
+	assert_within(100.0 * engine_activity, 100.0 * expected, 2);
 }
 
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
-- 
2.34.1

