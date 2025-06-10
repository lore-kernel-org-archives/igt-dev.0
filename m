Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41EDC5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 06:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0DE10E25F;
	Tue, 10 Jun 2025 06:37:36 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9348D10E05A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 06:37:34 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id 961D336A0041; Tue, 10 Jun 2025 12:07:30 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] tests/amdgpu: add environment variable to enable tests
Date: Tue, 10 Jun 2025 12:07:29 +0530
Message-ID: <20250610063729.944980-1-sunil.khatri@amd.com>
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

Some of the upstream tests are not 100% stable yet
so keeping them disabled by default and developer
can run these using the environment variable
AMDGPU_DISABLE_USERQTEST.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c   |  9 +++++++--
 tests/amdgpu/amd_deadlock.c | 22 ++++++++++++++--------
 tests/amdgpu/amd_security.c | 32 +++++++++++++++++++-------------
 3 files changed, 40 insertions(+), 23 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index eb07a2823..644016d5d 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -167,9 +167,14 @@ igt_main
 		{ "gfx", AMDGPU_HW_IP_GFX },
 		{ },
 	}, *e;
+
 	int fd = -1;
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	bool enable_test;
+	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+
+	enable_test = env && atoi(env);
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -200,7 +205,7 @@ igt_main
 	}
 
 #ifdef AMDGPU_USERQ_ENABLED
-#ifdef AMDGPU_DISABLE_USERQTEST
+if (enable_test) {
 	for (p = phase; p->name; p++) {
 		for (e = engines; e->name; e++) {
 			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
@@ -213,7 +218,7 @@ igt_main
 			}
 		}
 	}
-#endif
+}
 #endif
 
 	igt_fixture {
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index b5ae1c5c9..45a864feb 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -43,6 +43,10 @@ igt_main
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	struct pci_addr pci;
+	bool enable_test = false;
+	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+
+	enable_test = env && atoi(env);
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -180,18 +184,20 @@ igt_main
 		}
 	}
 #ifdef AMDGPU_USERQ_ENABLED
-#ifdef AMDGPU_DISABLE_USERQTEST
-	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
-	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
-		if (userq_arr_cap[AMD_IP_GFX] &&
-			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
-			igt_dynamic_f("amdgpu-umq-illegal-reg-access")
-			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+	if (enable_test) {
+		igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
+		igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
+			if (userq_arr_cap[AMD_IP_GFX] &&
+			    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+				igt_dynamic_f("amdgpu-umq-illegal-reg-access")
+				bad_access_ring_helper(device,
+					CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_GFX, &pci, true);
+			}
 		}
 	}
 #endif
-#endif
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 79fe0f78e..45bd7e771 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -316,6 +316,10 @@ igt_main
 	int r, fd = -1;
 	bool is_secure = true;
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	bool enable_test = false;
+	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+
+	enable_test = env && atoi(env);
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -357,19 +361,21 @@ igt_main
 			AMDGPU_HW_IP_DMA), is_secure);
 
 #ifdef AMDGPU_USERQ_ENABLED
-#ifdef AMDGPU_DISABLE_USERQTEST
-	igt_describe("amdgpu gfx command submission write linear helper with user queue");
-	igt_subtest("gfx-write-linear-helper-secure-umq")
-	if (userq_arr_cap[AMD_IP_GFX])
-		amdgpu_command_submission_write_linear_helper(device,
-				get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
-
-	igt_describe("amdgpu compute command submission write linear helper with user queue");
-	igt_subtest("compute-write-linear-helper-secure-umq")
-	if (userq_arr_cap[AMD_IP_COMPUTE])
-		amdgpu_command_submission_write_linear_helper(device,
-				get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
-#endif
+	if (enable_test) {
+		igt_describe("amdgpu gfx command submission write linear helper with user queue");
+		igt_subtest("gfx-write-linear-helper-secure-umq")
+		if (userq_arr_cap[AMD_IP_GFX])
+			amdgpu_command_submission_write_linear_helper(device,
+							get_ip_block(device, AMDGPU_HW_IP_GFX),
+							is_secure, true);
+
+		igt_describe("amdgpu compute command submission write linear helper with user queue");
+		igt_subtest("compute-write-linear-helper-secure-umq")
+		if (userq_arr_cap[AMD_IP_COMPUTE])
+			amdgpu_command_submission_write_linear_helper(device,
+							get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+							is_secure, true);
+	}
 #endif
 
 	igt_fixture {
-- 
2.43.0

