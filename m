Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF8C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A24B10F538;
	Fri, 12 Apr 2024 09:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIdoUiq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA3010F52A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913112; x=1744449112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JDq7CRe3bDHI6POL21cIIFHtXzhexGWtoPfCqB1DxhA=;
 b=EIdoUiq+6m+07WuGbQ3TN5Mj49W1uPkyOFq5nPsiSJM+IuiqXfhE7I1W
 G0NGjZfFCFhZ9WTaqsCJq/MdrDF8G/dvABmgggUcSu8kiKL5739fAvoRA
 gblwjIjyT8AfODfDygv+sX071x3KRO4HF2o8+asuRjxSfukPwO3ggOoA+
 ka++svvemWlU0hyAwSsxl/yuwcmgvzvD55cn8qcwX3pKn84oEE+JDFjLJ
 sUD7lVd+mH0kU6xan3RJmRx70eDbbI8tJfloJbQvwmqYkLjy6XbdUYD2V
 m4pB0c3vHQeEdzCpPr7gkJJ5+rGUwuSESCo4XiipPl36b0cKYI1ijwFr9 Q==;
X-CSE-ConnectionGUID: gE+40wfISvurHVHfGNy4VA==
X-CSE-MsgGUID: frn4APszSz+PxA+0n+ek6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30842847"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="30842847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:52 -0700
X-CSE-ConnectionGUID: iLQvMKHmSk2oVLdJBW1r2Q==
X-CSE-MsgGUID: c2dNHB6EQ/aiVR7KbvqS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25625097"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:50 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/gem_ctx_schedule: Skip some test on MTL
Date: Fri, 12 Apr 2024 10:57:41 +0200
Message-ID: <20240412085744.21196-6-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412085744.21196-1-nirmoy.das@intel.com>
References: <20240412085744.21196-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

We do GGTT update on MTL using bcs engine, blocking that would
fail the test so skip such subtests on bcs engine for MTL.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_schedule.c | 39 +++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index c94988d36..183ee1a21 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3479,6 +3479,12 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 		for_each_if(gem_class_can_store_dword(fd, e->class)) \
 		igt_dynamic_f("%s", e->name)
 
+#define test_each_ggtt_binder_nonblocking_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
+		for_each_if(gem_class_can_store_dword(fd, e->class) && \
+			    !gem_engine_can_block_ggtt_binder(i915, e)) \
+		igt_dynamic_f("%s", e->name)
+
 igt_main
 {
 	int fd = -1;
@@ -3502,21 +3508,22 @@ igt_main
 	igt_subtest_group {
 		const struct intel_execution_engine2 *e;
 
-		test_each_engine_store("fifo", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("fifo", fd, ctx, e)
 			fifo(fd, ctx, e->flags);
 
-		test_each_engine_store("implicit-read-write", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("implicit-read-write", fd, ctx, e)
 			implicit_rw(fd, ctx, e->flags, READ_WRITE);
 
-		test_each_engine_store("implicit-write-read", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("implicit-write-read", fd, ctx, e)
 			implicit_rw(fd, ctx, e->flags, WRITE_READ);
 
-		test_each_engine_store("implicit-boths", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("implicit-boths", fd, ctx, e)
 			implicit_rw(fd, ctx, e->flags, READ_WRITE | WRITE_READ);
 
-		test_each_engine_store("independent", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("independent", fd, ctx, e)
 			independent(fd, ctx, e->flags, 0);
-		test_each_engine_store("u-independent", fd, ctx, e)
+
+		test_each_ggtt_binder_nonblocking_engine("u-independent", fd, ctx, e)
 			independent(fd, ctx, e->flags, IGT_SPIN_USERPTR);
 	}
 
@@ -3612,13 +3619,13 @@ igt_main
 		igt_subtest("smoketest-all")
 			smoketest(fd, &ctx->cfg, ALL_ENGINES, 30);
 
-		test_each_engine_store("in-order", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("in-order", fd, ctx, e)
 			reorder(fd, &ctx->cfg, e->flags, EQUAL);
 
-		test_each_engine_store("out-order", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("out-order", fd, ctx, e)
 			reorder(fd, &ctx->cfg, e->flags, 0);
 
-		test_each_engine_store("promotion", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("promotion", fd, ctx, e)
 			promotion(fd, &ctx->cfg, e->flags);
 
 		igt_subtest_group {
@@ -3685,23 +3692,23 @@ igt_main
 			}
 		}
 
-		test_each_engine_store("noreorder", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("noreorder", fd, ctx, e)
 			noreorder(fd, &ctx->cfg, e->flags, 0, 0);
 
-		test_each_engine_store("noreorder-priority", fd, ctx, e) {
+		test_each_ggtt_binder_nonblocking_engine("noreorder-priority", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
 			noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, 0);
 		}
 
-		test_each_engine_store("noreorder-corked", fd, ctx, e) {
+		test_each_ggtt_binder_nonblocking_engine("noreorder-corked", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
 			noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, CORKED);
 		}
 
-		test_each_engine_store("deep", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("deep", fd, ctx, e)
 			deep(fd, &ctx->cfg, e->flags);
 
-		test_each_engine_store("wide", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("wide", fd, ctx, e)
 			wide(fd, &ctx->cfg, e->flags);
 
 		test_each_engine_store("smoketest", fd, ctx, e)
@@ -3735,10 +3742,10 @@ igt_main
 		test_each_engine("pi-userfault", fd, ctx, e)
 			test_pi_userfault(fd, &ctx->cfg, e->flags);
 
-		test_each_engine("pi-distinct-iova", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("pi-distinct-iova", fd, ctx, e)
 			test_pi_iova(fd, &ctx->cfg, e->flags, 0);
 
-		test_each_engine("pi-shared-iova", fd, ctx, e)
+		test_each_ggtt_binder_nonblocking_engine("pi-shared-iova", fd, ctx, e)
 			test_pi_iova(fd, &ctx->cfg, e->flags, SHARED);
 	}
 
-- 
2.41.0

