Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF81D2A540
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFF710E1D0;
	Thu,  4 Dec 2025 21:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZ7czbyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A99310E1D0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764882866; x=1796418866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0GVypKEb8HaXfHvNwqtzeK5VcnpHcwQ3TV4S8e5ZzNw=;
 b=YZ7czbyLQxQHa6SXSzddeeBd/+L/7cYx1KMr4dwH9+C4y595HuapS0w2
 EIPJZdaoeShga8vw5NN6uysAK6N17JmPKs35RciY49Cg56j7Eaidqb2X0
 l5QNfsQytHv5PKWj4k/Oewia/Sj5VJmf3AaeBBtej6j2TWW6PQOvhJBMJ
 dCRkgx5aEA0P6Zg8UA7rFb8njrAdVGwyQNoE9z74VPpWOd6DlN8kLMPt/
 VRVsWM6TKa3syv+gSoYOWjg0CTPW8TYrWk7AuwIAf5Jn22eRxAjAuJ8AQ
 lh1R/VEKFB0UOkBedUUNNkLany79tZATIDaufJaVW4JYt5TdcvzL2odQZ w==;
X-CSE-ConnectionGUID: pc39mZxaRVKboHMnC8z05w==
X-CSE-MsgGUID: CeAKpbcnQ5OJwbrxIAAJ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66952503"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66952503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:14:26 -0800
X-CSE-ConnectionGUID: 3Pdp78abR0CdVW6n+3FOBA==
X-CSE-MsgGUID: JvMr0LtsTtm5bbR4KHQPnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="199517570"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.32])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:14:24 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_mem: fix compilation on armhf
Date: Thu,  4 Dec 2025 22:14:20 +0100
Message-ID: <20251204211421.145825-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix two compilation errors on armhf:

../tests/amdgpu/amd_mem.c: In function ‘ptrace_access_invisible_vram_test’:
../tests/amdgpu/amd_mem.c:3017:56: error: cast to pointer from integer of
 different size [-Werror=int-to-pointer-cast]
 3017 |   if (ptrace(PTRACE_POKEDATA, parent_pid, word_before, (void *)original1))
      |                                                        ^
and same in near line 3019.

Also while at this, fix warnings on var prints:

../tests/amdgpu/amd_mem.c: In function ‘test_signal_handling’:
../tests/amdgpu/amd_mem.c:3143:11: warning: format ‘%lx’ expects
 argument of type ‘long unsigned int’, but argument 5 has type
 ‘uint64_t’ {aka ‘long long unsigned int’} [-Wformat=]
 3143 |  igt_info("System memory allocated at CPU: %p, GPU: 0x%lx\n", sys_cpu_ptr, sys_mc_address);

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/amdgpu/amd_mem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
index 39abd4f66..463e1213b 100644
--- a/tests/amdgpu/amd_mem.c
+++ b/tests/amdgpu/amd_mem.c
@@ -3014,9 +3014,9 @@ static void ptrace_access_invisible_vram_test(amdgpu_device_handle device)
 
 		/* Swap values via ptrace POKEDATA */
 		if (!err) {
-		if (ptrace(PTRACE_POKEDATA, parent_pid, word_before, (void *)original1))
+		if (ptrace(PTRACE_POKEDATA, parent_pid, word_before, from_user_pointer(original1)))
 			err = 1;
-		if (ptrace(PTRACE_POKEDATA, parent_pid, word_after, (void *)original0))
+		if (ptrace(PTRACE_POKEDATA, parent_pid, word_after, from_user_pointer(original0)))
 			err = 1;
 		}
 
@@ -3140,7 +3140,7 @@ static void test_signal_handling(amdgpu_device_handle device)
 	r = amdgpu_bo_cpu_map(sys_bo, &sys_cpu_ptr);
 	igt_assert_eq(r, 0);
 
-	igt_info("System memory allocated at CPU: %p, GPU: 0x%lx\n", sys_cpu_ptr, sys_mc_address);
+	igt_info("System memory allocated at CPU: %p, GPU: 0x%" PRIx64 "\n", sys_cpu_ptr, sys_mc_address);
 
 	/* Fork child process to send signal */
 	child_pid = fork();
@@ -3213,7 +3213,7 @@ static void test_signal_handling(amdgpu_device_handle device)
 
 		/* Submit GPU command to write different value */
 		igt_info("Submitting GPU write command...\n");
-		igt_info("Writing 0xdeadbeaf to address 0x%lx\n", sys_mc_address);
+		igt_info("Writing 0xdeadbeaf to address 0x%" PRIx64 "\n", sys_mc_address);
 
 		/* Now SDMA should write to the correct address since we're using the same BO */
 		r = cmd_submit_write_linear(dma_ctx, sys_mc_address, sizeof(uint32_t), 0xdeadbeaf);
-- 
2.52.0

