Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120B2C83F1D
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 12:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEFD10E8B6;
	Thu, 10 Jul 2025 12:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kc5N7xRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AC210E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752150860; x=1783686860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JfIA9hM/M1w9tBMO2puMjILbe9lsiPdoDHp1/Z+R/Ow=;
 b=Kc5N7xRjMbJlwhubcf2tTJT5rxhDlKEXxvZaoy721cQKhbVVs+NwauLr
 I15GL6GQ0P9US2Rm4pa7r3zG2Suaej89BEX86nElXPlRs2YYnoFLoTV1M
 mP60TlkyBvvnX7R53tidrKkNPxABY6eNK81cO7A+h042he5QC81teDmmQ
 2fkfs9KtimEjhEWezDYxIumjSqNzrE4dJ4/yDwbKEy0sQVqpKa8A/09bg
 wRTLMmMPZdl9nuXHeXYjr9QTNJUdo2BrINSdPTmd6Idj3Ik81JBC+Eubr
 SpyLMnnYQvUR7nPGM0z4c6rx21lTBEvx2csbwDbbEIcjWCKFvLpSM1+XY w==;
X-CSE-ConnectionGUID: OFvNFHhGQvyr/0fsd/9O4A==
X-CSE-MsgGUID: ON3xPqyyRamrdEie0ydVXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58095884"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="58095884"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:34:19 -0700
X-CSE-ConnectionGUID: NsFY0Uj9TIGdwzTaSzhubw==
X-CSE-MsgGUID: SKZWDMQeRjalIq2x+semZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187071437"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:34:14 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_basic: fix compilation warning
Date: Thu, 10 Jul 2025 14:34:06 +0200
Message-ID: <20250710123406.84306-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Fix compilation warning:
[1564/2025] Compiling C object tests/amdgpu/amd_basic.p/amd_basic.c.o
../tests/amdgpu/amd_basic.c:142:13: warning: 'amdgpu_test_all_queues' defined but not used [-Wunused-function]
  142 | static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
      |             ^~~~~~~~~~~~~~~~~~~~~~

Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Fixes: b195a6c65cdd ("tests/amdgpu: Add test coverage for all user-mode queues across IP blocks")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/amdgpu/amd_basic.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 100a634ce..45cf64251 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -707,8 +707,8 @@ igt_main
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	bool enable_test = false;
 #ifdef AMDGPU_USERQ_ENABLED
-	bool enable_test;
 	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
@@ -805,11 +805,9 @@ igt_main
 		}
 	}
 
-#ifdef AMDGPU_USERQ_ENABLED
-
 	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
-		if (userq_arr_cap[AMD_IP_GFX]) {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx-with-umq")
 			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
 		}
@@ -817,7 +815,7 @@ igt_main
 
 	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
 	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
-		if (userq_arr_cap[AMD_IP_COMPUTE]) {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute-with-umq")
 			amdgpu_command_submission_compute(device, true);
 		}
@@ -825,7 +823,7 @@ igt_main
 
 	igt_describe("Check-sync-dependency-using-GFX-ring");
 	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
-		if (userq_arr_cap[AMD_IP_GFX]) {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("sync-dependency-test-with-umq")
 			amdgpu_sync_dependency_test(device, true);
 		}
@@ -848,7 +846,6 @@ igt_main
 			amdgpu_test_all_queues(device, true);
 		}
 	}
-#endif
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
-- 
2.50.1

