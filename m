Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A3BC61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D642A10E34A;
	Wed, 11 Jun 2025 11:37:22 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1B810E630
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:37:21 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id 981A736A005F; Wed, 11 Jun 2025 17:07:12 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 1/2] tests/amdgpu: disabled tests are skipped with skip message
Date: Wed, 11 Jun 2025 17:07:10 +0530
Message-ID: <20250611113711.15544-1-sunil.khatri@amd.com>
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

Disabled tests to be shown as skipped and not to be
skipped silently.

Also the --show-list option now shows all the tests
even if they are disabled unlike before.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c   |  8 +++-----
 tests/amdgpu/amd_deadlock.c | 20 +++++++++-----------
 tests/amdgpu/amd_security.c | 26 ++++++++++++--------------
 3 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 644016d5d..6ca489412 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -205,20 +205,18 @@ igt_main
 	}
 
 #ifdef AMDGPU_USERQ_ENABLED
-if (enable_test) {
 	for (p = phase; p->name; p++) {
 		for (e = engines; e->name; e++) {
 			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
 			igt_subtest_with_dynamic_f("cs-nops-with-%s-%s0-with-UQ-Submission", p->name, e->name) {
-				if (userq_arr_cap[e->ip_type]) {
+				if (enable_test && userq_arr_cap[e->ip_type]) {
 					igt_dynamic_f("cs-nop-with-%s-%s0-with-UQ-Submission", p->name, e->name)
-					nop_cs(device, context, e->name, e->ip_type, 0, 20,
-					       p->flags, 1);
+						nop_cs(device, context, e->name, e->ip_type, 0, 20,
+						       p->flags, 1);
 				}
 			}
 		}
 	}
-}
 #endif
 
 	igt_fixture {
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 45a864feb..cb91a500d 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -43,7 +43,7 @@ igt_main
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	struct pci_addr pci;
-	bool enable_test = false;
+	bool enable_test;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
@@ -183,17 +183,15 @@ igt_main
 					AMDGPU_HW_IP_DMA, &pci, false);
 		}
 	}
+
 #ifdef AMDGPU_USERQ_ENABLED
-	if (enable_test) {
-		igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
-		igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
-			if (userq_arr_cap[AMD_IP_GFX] &&
-			    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
-				igt_dynamic_f("amdgpu-umq-illegal-reg-access")
-				bad_access_ring_helper(device,
-					CMD_STREAM_TRANS_BAD_REG_ADDRESS,
-					AMDGPU_HW_IP_GFX, &pci, true);
-			}
+	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
+	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
+		    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-umq-illegal-reg-access")
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+					       AMDGPU_HW_IP_GFX, &pci, true);
 		}
 	}
 #endif
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 45bd7e771..e371aec19 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -316,7 +316,7 @@ igt_main
 	int r, fd = -1;
 	bool is_secure = true;
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
-	bool enable_test = false;
+	bool enable_test;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
@@ -361,21 +361,19 @@ igt_main
 			AMDGPU_HW_IP_DMA), is_secure);
 
 #ifdef AMDGPU_USERQ_ENABLED
-	if (enable_test) {
-		igt_describe("amdgpu gfx command submission write linear helper with user queue");
-		igt_subtest("gfx-write-linear-helper-secure-umq")
-		if (userq_arr_cap[AMD_IP_GFX])
-			amdgpu_command_submission_write_linear_helper(device,
-							get_ip_block(device, AMDGPU_HW_IP_GFX),
-							is_secure, true);
-
-		igt_describe("amdgpu compute command submission write linear helper with user queue");
-		igt_subtest("compute-write-linear-helper-secure-umq")
-		if (userq_arr_cap[AMD_IP_COMPUTE])
-			amdgpu_command_submission_write_linear_helper(device,
+	igt_describe("amdgpu gfx command submission write linear helper with user queue");
+	igt_subtest("gfx-write-linear-helper-secure-umq")
+	if (enable_test && userq_arr_cap[AMD_IP_GFX])
+		amdgpu_command_submission_write_linear_helper(device,
+						get_ip_block(device, AMDGPU_HW_IP_GFX),
+						is_secure, true);
+
+	igt_describe("amdgpu compute command submission write linear helper with user queue");
+	igt_subtest("compute-write-linear-helper-secure-umq")
+	if (enable_test && userq_arr_cap[AMD_IP_COMPUTE])
+		amdgpu_command_submission_write_linear_helper(device,
 							get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
 							is_secure, true);
-	}
 #endif
 
 	igt_fixture {
-- 
2.43.0

