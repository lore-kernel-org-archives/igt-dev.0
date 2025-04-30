Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2106C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 06:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EDF10E6D5;
	Wed, 30 Apr 2025 06:28:48 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E59210E291
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 06:28:43 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id AC85136A000B; Wed, 30 Apr 2025 11:58:39 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 "Prosyak@sunil.khatri"@amd.com, Vitaly <Vitaly.Prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v3 3/4] tests/amdgpu: execute userq tests only if userq
 support IP
Date: Wed, 30 Apr 2025 11:58:34 +0530
Message-ID: <20250430062835.348074-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430062835.348074-1-sunil.khatri@amd.com>
References: <20250430062835.348074-1-sunil.khatri@amd.com>
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

check the IP supported by userqueues before executing any
userq test cases.

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_basic.c    | 10 +++++-----
 tests/amdgpu/amd_cs_nop.c   | 11 +++--------
 tests/amdgpu/amd_security.c | 13 +++++++++----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index eb8447220..e0029f582 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -697,6 +697,7 @@ igt_main
 	int fd = -1;
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -717,6 +718,7 @@ igt_main
 		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
+		asic_userq_readiness(device, userq_arr_cap);
 	}
 	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
 	igt_subtest("memory-alloc")
@@ -789,12 +791,10 @@ igt_main
 	}
 
 #ifdef AMDGPU_USERQ_ENABLED
-	arr_cap[AMD_IP_GFX] = 1;
-	arr_cap[AMD_IP_COMPUTE] = 1;
 
 	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
-		if (arr_cap[AMD_IP_GFX]) {
+		if (userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx-with-umq")
 			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
 		}
@@ -802,7 +802,7 @@ igt_main
 
 	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
 	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
-		if (arr_cap[AMD_IP_COMPUTE]) {
+		if (userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute-with-umq")
 			amdgpu_command_submission_compute(device, true);
 		}
@@ -810,7 +810,7 @@ igt_main
 
 	igt_describe("Check-sync-dependency-using-GFX-ring");
 	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
-		if (arr_cap[AMD_IP_GFX]) {
+		if (userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("sync-dependency-test-with-umq")
 			amdgpu_sync_dependency_test(device, true);
 		}
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 67bb0419d..160c4f026 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -169,6 +169,7 @@ igt_main
 	}, *e;
 	int fd = -1;
 	bool arr_cap[AMD_IP_MAX] = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -182,6 +183,7 @@ igt_main
 		err = amdgpu_cs_ctx_create(device, &context);
 		igt_assert_eq(err, 0);
 		asic_rings_readness(device, 1, arr_cap);
+		asic_userq_readiness(device, userq_arr_cap);
 	}
 
 	for (p = phase; p->name; p++) {
@@ -198,18 +200,11 @@ igt_main
 	}
 
 #ifdef AMDGPU_USERQ_ENABLED
-	/*
-	 * TODO: Add a programmatic check to determine which IPs (gfx, compute, sdma)
-	 * are present for the user-mode queue and execute the test accordingly.
-	 */
-	arr_cap[AMDGPU_HW_IP_GFX] = 1;
-	arr_cap[AMDGPU_HW_IP_COMPUTE] = 1;
-
 	for (p = phase; p->name; p++) {
 		for (e = engines; e->name; e++) {
 			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
 			igt_subtest_with_dynamic_f("cs-nops-with-%s-%s0-with-UQ-Submission", p->name, e->name) {
-				if (arr_cap[e->ip_type]) {
+				if (userq_arr_cap[e->ip_type]) {
 					igt_dynamic_f("cs-nop-with-%s-%s0-with-UQ-Submission", p->name, e->name)
 					nop_cs(device, context, e->name, e->ip_type, 0, 20,
 					       p->flags, 1);
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 1c880c11f..ff22fd8db 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -315,6 +315,7 @@ igt_main
 	struct drm_amdgpu_info_hw_ip  sdma_info = {};
 	int r, fd = -1;
 	bool is_secure = true;
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -331,6 +332,7 @@ igt_main
 		igt_assert_eq(r, 0);
 		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_DMA, 0, &sdma_info);
 		igt_assert_eq(r, 0);
+		asic_userq_readiness(device, userq_arr_cap);
 		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
 	}
 
@@ -355,15 +357,18 @@ igt_main
 			AMDGPU_HW_IP_DMA), is_secure);
 
 #ifdef AMDGPU_USERQ_ENABLED
+
 	igt_describe("amdgpu gfx command submission write linear helper with user queue");
 	igt_subtest("gfx-write-linear-helper-secure-umq")
-	amdgpu_command_submission_write_linear_helper(device,
-			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
+	if (userq_arr_cap[AMD_IP_GFX])
+		amdgpu_command_submission_write_linear_helper(device,
+				get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
 
 	igt_describe("amdgpu compute command submission write linear helper with user queue");
 	igt_subtest("compute-write-linear-helper-secure-umq")
-	amdgpu_command_submission_write_linear_helper(device,
-			get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
+	if (userq_arr_cap[AMD_IP_COMPUTE])
+		amdgpu_command_submission_write_linear_helper(device,
+				get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
 #endif
 
 	igt_fixture {
-- 
2.43.0

