Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0633FC3ABAC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 10:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65A10E43B;
	Tue, 29 Apr 2025 10:37:03 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB94910E435
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 10:37:01 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id D349336A000D; Tue, 29 Apr 2025 16:06:59 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 "Prosyak@sunil.khatri"@amd.com, Vitaly <Vitaly.Prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2 5/5] tests/amdgpu: execute secure userq tests only if
 supported
Date: Tue, 29 Apr 2025 16:06:53 +0530
Message-ID: <20250429103653.190107-5-sunil.khatri@amd.com>
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
any secure userqueues test cases.

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_security.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

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

