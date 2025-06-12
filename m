Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDFAC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 10:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA01810E48F;
	Thu, 12 Jun 2025 10:24:13 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A0C10E768
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 10:24:12 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id D2A1F36A0134; Thu, 12 Jun 2025 15:54:08 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: use uniform names for umq tests
Date: Thu, 12 Jun 2025 15:54:07 +0530
Message-ID: <20250612102407.7694-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612102407.7694-1-sunil.khatri@amd.com>
References: <20250612102407.7694-1-sunil.khatri@amd.com>
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

Update the test description and test name to reflect
uniform naming convention for usermore queues
like "test-xyz-umq"

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 624ea4c81..7bc53ee12 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -188,11 +188,11 @@ igt_main
 	}
 
 #ifdef AMDGPU_USERQ_ENABLED
-	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
-	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
+	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg-umq");
+	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access-umq") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
 		    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
-			igt_dynamic_f("amdgpu-umq-illegal-reg-access")
+			igt_dynamic_f("amdgpu-illegal-reg-access-umq")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					       AMDGPU_HW_IP_GFX, &pci, true);
 		}
-- 
2.43.0

