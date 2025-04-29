Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45DAC3ABAB
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 10:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729E610E43A;
	Tue, 29 Apr 2025 10:37:03 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E961210E43A
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 10:37:01 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id CFD4C36A000C; Tue, 29 Apr 2025 16:06:59 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 "Prosyak@sunil.khatri"@amd.com, Vitaly <Vitaly.Prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2 4/5] tests/amdgpu: execute cs_nops userq tests only if
 supported
Date: Tue, 29 Apr 2025 16:06:52 +0530
Message-ID: <20250429103653.190107-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429103653.190107-1-sunil.khatri@amd.com>
References: <20250429103653.190107-1-sunil.khatri@amd.com>
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

check the ip supported for userqueues before executing
any cs_nops userqueues test cases.

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

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
-- 
2.43.0

