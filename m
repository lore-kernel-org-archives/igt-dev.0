Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F42CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 06:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDE810E51F;
	Tue,  4 Nov 2025 06:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9fWs++s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2339210E521
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 06:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762236111; x=1793772111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fQ/8ME0CER7ZU/jckwRKszVCgXNmRYu5eawo9Mog7W8=;
 b=P9fWs++sxyoP6E5E4dyJpOjbBzyjq29qDClc3RdB4pG+F0m6lYgmGFCa
 L9zHmifb3JZZ1FeLt7IUIKIvmm2KTfrsWDgj208Ylz6mVjwv3ygwDNL8S
 3QtlSu93I1xNb+Sr9zwEQA0XMpEUIDR+jqFc9SWMpM7+8p0mgIqq0fihj
 Jhr5hDqp2QGw3od9AaqwSnq7+taHTjqVYHbqj3DCWa3OJEjd/sUPx1Do2
 oR9GvMVBM5S3nriTTlfBhhH7f8N3E3xO9OZtI2h5vzO8hT+5ssUwC3juU
 Fr+TQn6srDN8sh7v0pRqJuJU0LiheqPNxQ0J7IUUaY7xLtLGLpIa4j0Ct w==;
X-CSE-ConnectionGUID: Urh5zd4MSkmPfAaKx/ECcQ==
X-CSE-MsgGUID: lPtAEXdLRjCTH5Atcgj/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81728721"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="81728721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:51 -0800
X-CSE-ConnectionGUID: B6dCsQ3/TLSVC19rJbCBcw==
X-CSE-MsgGUID: mxCsCTSMSIiXBeREqgNu7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="217709606"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:48 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Refine engine activity accuracy
 test
Date: Tue,  4 Nov 2025 11:21:29 +0530
Message-Id: <20251104055129.3826274-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104055129.3826274-1-soham.purkait@intel.com>
References: <20251104055129.3826274-1-soham.purkait@intel.com>
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

Create spinner once and reuse by ending and resetting between iterations
instead of reallocating. This removes redundant allocations and improves
timing consistency, leading to more accurate engine activity measurements.

Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate engine activity accuracy")
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba..af0c2dfe4 100644
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

