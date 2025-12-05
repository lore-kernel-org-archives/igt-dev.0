Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B5BD33987
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 15:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4296B10EB5E;
	Fri,  5 Dec 2025 15:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkYJKlW0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F16A10EB60
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764950105; x=1796486105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2Madn4xkFlwxwMMG9kkYtNwKSOuo5rbv5I02OiB6qw=;
 b=XkYJKlW0wvITWRDKQdjSvrmGKiQDmSm2RRgrgKPTY+wVOH86cHQ1wwi6
 cOOk+jIHOjYzQquvezS5vViRL661mz4oAiBUk9jvOOJa+w+fCoHCTq6Ad
 UpI56Vx6EDlRsGtac+eT3IVrRJgIvlx1RpbQtvO7/EUjeIw6GCFTQS5bu
 /q/d4lBKyPU4dYVa/aD/VyLAsyzOcIxhAEuJBIVmeQfYFu6Ln6E+ZPhxy
 ta3gAU1GIHiasKjNdV7rZuyS0OAJX24xmMbB4un3VjXMrRUfGPoSY875c
 EtFOLIXoJVW/X+GRtKbJ5pAygCgWAI3mYF/dZqNk0CajUtQ8ztRUqFqcX A==;
X-CSE-ConnectionGUID: 6b0ddJC7SbiVbcdUdIaT/Q==
X-CSE-MsgGUID: Tv/UhoibS8ymRuCUhRne6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67026571"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67026571"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 07:55:04 -0800
X-CSE-ConnectionGUID: wj1ayhpBQwqqHVNXioyG8w==
X-CSE-MsgGUID: jFHmtm6ySJao9d38bQaJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226324441"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 07:55:02 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
Date: Fri,  5 Dec 2025 21:14:17 +0530
Message-Id: <20251205154417.3963533-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205154417.3963533-1-soham.purkait@intel.com>
References: <20251205154417.3963533-1-soham.purkait@intel.com>
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

Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate engine activity accuracy")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6251
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 6e91b752a..7a110c87f 100644
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
@@ -552,10 +556,10 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 				igt_measured_usleep(target_idle_us);
 
 				/* start spinner */
-				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+				xe_spin_reset(fd, spin);
 				loop_idle_ns = igt_nsec_elapsed(&start);
 				igt_measured_usleep(active_us);
-				igt_spin_free(fd, spin);
+				xe_spin_end(spin->xe_spin);
 
 				now = igt_nsec_elapsed(&start);
 				loop_active_ns = now - loop_idle_ns;
@@ -590,6 +594,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 				      sizeof(expected));
 		}
 
+		igt_spin_free(fd, spin);
 		xe_vm_destroy(fd, vm);
 		put_ahnd(ahnd);
 	}
@@ -622,7 +627,7 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
 		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
 
-	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
+	assert_within(100.0 * engine_activity, 100.0 * expected, 2);
 }
 
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
-- 
2.34.1

