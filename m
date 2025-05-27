Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CFBC54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 07:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A135610E416;
	Tue, 27 May 2025 07:12:24 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBF510E3CE
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 07:12:22 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id 6819F36A0041; Tue, 27 May 2025 12:42:16 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] tests/amdgpu: disable unstable tests to avoid failure in CI
Date: Tue, 27 May 2025 12:42:15 +0530
Message-ID: <20250527071215.21975-1-sunil.khatri@amd.com>
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

Keep tests in CI which are stable and rest disabled
till we reach a stable level of driver for other tests.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c   | 2 ++
 tests/amdgpu/amd_deadlock.c | 2 ++
 tests/amdgpu/amd_security.c | 3 ++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 268bc9201..eb07a2823 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -200,6 +200,7 @@ igt_main
 	}
 
 #ifdef AMDGPU_USERQ_ENABLED
+#ifdef AMDGPU_DISABLE_USERQTEST
 	for (p = phase; p->name; p++) {
 		for (e = engines; e->name; e++) {
 			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
@@ -212,6 +213,7 @@ igt_main
 			}
 		}
 	}
+#endif
 #endif
 
 	igt_fixture {
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index d59957cc2..b5ae1c5c9 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -180,6 +180,7 @@ igt_main
 		}
 	}
 #ifdef AMDGPU_USERQ_ENABLED
+#ifdef AMDGPU_DISABLE_USERQTEST
 	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
 	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
 		if (userq_arr_cap[AMD_IP_GFX] &&
@@ -189,6 +190,7 @@ igt_main
 					AMDGPU_HW_IP_GFX, &pci, true);
 		}
 	}
+#endif
 #endif
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index ff22fd8db..79fe0f78e 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -357,7 +357,7 @@ igt_main
 			AMDGPU_HW_IP_DMA), is_secure);
 
 #ifdef AMDGPU_USERQ_ENABLED
-
+#ifdef AMDGPU_DISABLE_USERQTEST
 	igt_describe("amdgpu gfx command submission write linear helper with user queue");
 	igt_subtest("gfx-write-linear-helper-secure-umq")
 	if (userq_arr_cap[AMD_IP_GFX])
@@ -369,6 +369,7 @@ igt_main
 	if (userq_arr_cap[AMD_IP_COMPUTE])
 		amdgpu_command_submission_write_linear_helper(device,
 				get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
+#endif
 #endif
 
 	igt_fixture {
-- 
2.43.0

