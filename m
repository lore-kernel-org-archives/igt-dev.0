Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC2C3ABA9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 10:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C651310E435;
	Tue, 29 Apr 2025 10:37:02 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BA210E438
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 10:37:01 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id CC5A636A000B; Tue, 29 Apr 2025 16:06:59 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 "Prosyak@sunil.khatri"@amd.com, Vitaly <Vitaly.Prosyak@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2 3/5] tests/amdgpu: execute amdgpu_basic userq tests only if
 supported
Date: Tue, 29 Apr 2025 16:06:51 +0530
Message-ID: <20250429103653.190107-3-sunil.khatri@amd.com>
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

check the IP supported by userqueues before executing any
amdgpu_basic test cases.

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_basic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.43.0

