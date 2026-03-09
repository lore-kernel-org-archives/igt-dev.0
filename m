Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56386EA8554
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 04:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FCD10E0DB;
	Mon,  9 Mar 2026 04:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5XhdTXx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF12710E0DB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 04:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773030845; x=1804566845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ETXH5FYoB5z5Aj1dWQ3oSzU4bdSsnplydfsqvNYdJkI=;
 b=h5XhdTXxH6fkqVqfg9sKomeoDIGhEoOqUuqLK8ZFcvj7vGqcA9HjZyfC
 /cMi+/2N6Ei/gXsn+/zJ5V7xtKBzdehsHnd5w3qk4JaGsR4v/6lYevpRB
 dQ+FdYJb8xYl+DwpXSAM7NeHNxNh2UzkDNi4JGU4xU9eSXTXHA4h2s6uz
 2MKjYtMt7Hs8itogsc9dibCBj/niWcQZLUmRDcAiBaLVu3LXQPETcUZM6
 A+f2d2M0ochaqSdP/7N2ouZJ+4Cai2oXEDNaumdUaTiPFWVJtWhyWh6kE
 QOAztx6Y6ztus1J44P/wgeWh0Kv7akc7S2TvBvF8LZbP1SA9QShqhy00p g==;
X-CSE-ConnectionGUID: adJAbTjlT/qc9h4nDa596g==
X-CSE-MsgGUID: ojYZgn9gTMWrDFryGLvMAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85401201"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85401201"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 21:34:03 -0700
X-CSE-ConnectionGUID: /VDgV78+TYKkVujkFP7Ebw==
X-CSE-MsgGUID: sgeYPL2pSgCF29jcX8N7aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219766717"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.21])
 by orviesa007.jf.intel.com with ESMTP; 08 Mar 2026 21:34:02 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Cc: francois.dugast@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SVM
 compute test
Date: Mon,  9 Mar 2026 04:34:00 +0000
Message-ID: <20260309043400.2280535-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

Updated test to validate output values against expected results after
workload execution. These enhancements improve test coverage, reliability,
and debugging for SVM compute workloads. Updated test to validate output
values against expected results after kernel execution.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 14f5e358f..e670ee007 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2257,7 +2257,7 @@ test_compute(int fd, size_t size, unsigned int flags)
 		 */
 		.array_size = size / sizeof(float),
 	};
-	float *compute_input;
+	float *compute_input, *compute_output;
 	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -2267,19 +2267,31 @@ test_compute(int fd, size_t size, unsigned int flags)
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
 	compute_input = aligned_alloc(SZ_2M, size);
-	igt_assert(compute_input);
+	compute_output = aligned_alloc(SZ_2M, size);
+	igt_assert(compute_input && compute_output);
 
-	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
+	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size / 2;
 	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
 	env.input_addr = to_user_pointer(compute_input);
+	env.output_addr = to_user_pointer(compute_output);
 	env.vm = vm;
 
 	for (i = 0; i < env.loop_count; i++)
-		compute_input[i] = rand() / (float)RAND_MAX;
+		compute_input[i] = (float)i + 2.0f;
 
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
+	for (i = 0; i < env.loop_count; i++) {
+		float expected_output = compute_input[i] * compute_input[i];
+
+		if (compute_output[i] != expected_output || compute_output[i] == 0.0f)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, compute_input[i], compute_output[i], expected_output);
+		igt_assert_eq_double(compute_output[i], expected_output);
+	}
+
 	free(compute_input);
+	free(compute_output);
 	unbind_system_allocator();
 	xe_vm_destroy(fd, vm);
 }
-- 
2.43.0

