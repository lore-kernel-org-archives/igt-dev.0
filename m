Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D012CCCD1A7
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 15:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F010E070;
	Tue, 21 Oct 2025 15:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU3kCviB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DE210E070
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761058976; x=1792594976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nqQO6aqWdvH8p8Y/TKP46WxqXzx/59e9FyR76Ck95RE=;
 b=HU3kCviBTFknCArFvJx/wVAF2UMJhsYb+a3eC3O8E3/HyeVMWkVi/BA9
 4eqoBI4vnIkpFhCjCr+ev1XB5wPUXRFZoPu70/H/L/sbKO8vFGZPFfHgn
 reQoFzq8/mnhYoruHIToUJpcJxjzcmOrFNLIhl9DBaqjlnzRyhxMjjmze
 GhqsREk3Bubfmrz2ff9I5cHzvVCY0+K8uDf259xlw1696emb1geRNi/qo
 ImXHepeu6ZsSHKH73DssE/0xWo26K6uL5y4myNcaiCKnsW8ASiqAYL9ZO
 A0JOY3Xkd483PjijNaYeBYa2NK+QKMwlQeFYwFLajDrxtYtP6aUxI46j3 w==;
X-CSE-ConnectionGUID: fn4n55B7QiWZTreJVirvRg==
X-CSE-MsgGUID: LwnTmh5YTamr+9Nh6aL65Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74624007"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="74624007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:02:56 -0700
X-CSE-ConnectionGUID: 2LzXPkgZTDCvhW2sbI3luA==
X-CSE-MsgGUID: BZ+rXOrsRZyxNM/Dui52iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184012222"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.36])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:02:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Align compute
 arrays
Date: Tue, 21 Oct 2025 17:02:13 +0200
Message-ID: <20251021150240.1284629-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Align the malloc'ed arrays use for input and output by the compute kernel
so that the sequence below matches what is observed for both 4KB and 2MB:
- 1 × GPU fault for input array
- 1 × CPU fault for input array
- 1 × CPU fault for output array

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b88967e58..ba4daaaea 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2176,8 +2176,9 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 		uint64_t sync;
 	} *bo_sync;
 	uint32_t vm;
+	size_t aligned_size = size ?: xe_get_default_alignment(fd);
 	struct user_execenv env = {
-		.array_size = size / sizeof(float),
+		.array_size = aligned_size / sizeof(float),
 	};
 	float *compute_input, *compute_output;
 	int i;
@@ -2188,9 +2189,9 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 	bind_system_allocator(&sync, 1);
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
-	compute_input = aligned_alloc(SZ_2M, size);
+	compute_input = aligned_alloc(aligned_size, size);
 	igt_assert(compute_input);
-	compute_output = aligned_alloc(SZ_2M, size);
+	compute_output = aligned_alloc(aligned_size, size);
 	igt_assert(compute_output);
 
 	for (i = 0; i < env.array_size; i++)
@@ -2596,6 +2597,10 @@ igt_main
 	}
 
 	igt_subtest("compute")
+		xe_for_each_engine(fd, hwe)
+			test_compute(fd, hwe, SZ_4K);
+
+	igt_subtest("compute-large")
 		xe_for_each_engine(fd, hwe)
 			test_compute(fd, hwe, SZ_2M);
 
-- 
2.43.0

