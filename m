Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B048CD11DD
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 17:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E880F1124FD;
	Thu, 28 Mar 2024 17:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UY302dlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056B51124FD
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711647707; x=1743183707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wrw1kqxcpGpBca0FK9CS0AgdDh6PYmrADORSoYoPz+A=;
 b=UY302dlVE6M8jFnReafEbUMgetbL2Qhka6e7gTpaGZd9TkehovvHWvSz
 JaJfK87qUfrqsI96QgYVNV4gtcU0z4U1nFHuNFSi/ze1JmvaLqCmYMOF5
 UaC91GljVZuKA7oCQp27Cfli7v1CItrQUGuyq9/yOxzFOUGfq2cURp/aP
 CuJ/w6JIAx6cFPIW/TtbPhPdmYP5e52wl/LK5rAQetxigP2rxIH4vgAqB
 /h7ripdtuzCJGgzTPG5qZd30/fxtx1qpWdKcrCu9c2P1DArLVJaNc0QBW
 f0B+r3WznXEZDZyPUq5fZaTfUtKkSjtglm+/iYf9lQaxj+GOuxZHNLSwR Q==;
X-CSE-ConnectionGUID: /6H2l5rUSC2pKvk2ZPVp/w==
X-CSE-MsgGUID: LKqAWYeFTjCfhuvc4VEMyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17452736"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17452736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 10:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16750681"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 10:41:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests: Use MI_ARB_CHECK definition more consistently
Date: Thu, 28 Mar 2024 10:41:39 -0700
Message-ID: <20240328174139.1533658-1-matthew.d.roper@intel.com>
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

Even though we have MI_ARB_CHECK defined in our GPU instruction header,
several of our tests and test libraries seem to be using alternate
definitions and/or magic numbers to emit this instruction, which makes
grep'ing the code for it challenging (and makes the behavior of the
tests themselves less obvious in some cases).  Try to use the standard
definition more consistently everywhere.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_dummyload.c             |  4 +---
 lib/xe/xe_spin.c                |  2 +-
 tests/intel/gem_exec_balancer.c |  2 +-
 tests/intel/gem_exec_fair.c     |  2 +-
 tests/intel/gem_exec_fence.c    |  2 +-
 tests/intel/gem_exec_latency.c  |  4 ++--
 tests/intel/gem_exec_nop.c      | 10 ++++------
 tests/intel/gem_sync.c          |  2 +-
 tests/intel/gem_watchdog.c      |  2 +-
 tests/intel/i915_pm_rps.c       |  2 +-
 10 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index d3cee9154..2e842929b 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -64,8 +64,6 @@
 
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
-#define MI_ARB_CHK (0x5 << 23)
-
 static const int BATCH_SIZE = 4096;
 static const int LOOP_START_OFFSET = 64;
 
@@ -286,7 +284,7 @@ emit_recursive_batch(igt_spin_t *spin,
 
 	/* Allow ourselves to be preempted */
 	if (!(opts->flags & IGT_SPIN_NO_PREEMPTION))
-		*cs++ = MI_ARB_CHK;
+		*cs++ = MI_ARB_CHECK;
 	if (opts->flags & IGT_SPIN_INVALID_CS) {
 		igt_assert(opts->ctx);
 		if (!gem_engine_has_cmdparser(fd, &opts->ctx->cfg, opts->engine))
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 2c9b5848a..d142f2cac 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -97,7 +97,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	spin->batch[b++] = 0xc0ffee;
 
 	if (opts->preempt)
-		spin->batch[b++] = (0x5 << 23);
+		spin->batch[b++] = MI_ARB_CHECK;
 
 	if (opts->write_timestamp) {
 		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index b1a108a5a..7504f3737 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -1276,7 +1276,7 @@ static void disable_preparser(int i915, uint32_t ctx)
 
 	cs = gem_mmap__device_coherent(i915, obj.handle, 0, 4096, PROT_WRITE);
 
-	cs[0] = 0x5 << 23 | 1 << 8 | 0; /* disable preparser magic */
+	cs[0] = MI_ARB_CHECK | 1 << 8 | 0; /* disable preparser magic */
 	cs[1] = MI_BATCH_BUFFER_END;
 	munmap(cs, 4096);
 
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index 29d732205..c903b6edd 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -236,7 +236,7 @@ static void delay(int i915,
 		*cs++ = 0;
 	jmp = cs;
 
-	*cs++ = 0x5 << 23; /* MI_ARB_CHECK */
+	*cs++ = MI_ARB_CHECK;
 
 	*cs++ = MI_LOAD_REGISTER_IMM(1);
 	*cs++ = CS_GPR(NOW_TS) + 4;
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index 3ed61b5f5..e4263b3f9 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -318,7 +318,7 @@ static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 
 	i = 0;
 	if ((flags & HANG) == 0)
-		batch[i++] = 0x5 << 23;
+		batch[i++] = MI_ARB_CHECK;
 
 	if (!ahnd) {
 		obj.relocs_ptr = to_user_pointer(&reloc);
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index e5399de17..b9d086afc 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -816,7 +816,7 @@ static void context_switch(int i915, const intel_ctx_t *ctx,
 		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 
 	cs = bbe;
-	*cs++ = 0x5 << 23;
+	*cs++ = MI_ARB_CHECK;
 	*cs++ = 0x24 << 23 | 2; /* SRM */
 	*cs++ = mmio_base + 0x358; /* TIMESTAMP */
 	reloc[0].target_handle = obj[0].handle;
@@ -871,7 +871,7 @@ static void context_switch(int i915, const intel_ctx_t *ctx,
 
 		*bbe = 0xa << 23;
 		gem_sync(i915, obj[1].handle);
-		*bbe = 0x5 << 23;
+		*bbe = MI_ARB_CHECK;
 
 		v = results[0];
 		igt_mean_add(&mean, (results[1] - results[2]) * rcs_clock);
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 8a6d6c42a..6c547a412 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -154,7 +154,6 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 		      int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
-	const uint32_t MI_ARB_CHK = 0x5 << 23;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc[4], *r;
@@ -206,7 +205,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 
 		b = batch + (start_offset + 64) / sizeof(*batch);
 		bbe[start_offset != 0] = b;
-		*b++ = MI_ARB_CHK;
+		*b++ = MI_ARB_CHECK;
 
 		r->target_handle = obj.handle;
 		r->offset = (b - batch + 1) * sizeof(uint32_t);
@@ -240,7 +239,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 	do {
 		unsigned int idx = ++cycles & 1;
 
-		*bbe[idx] = MI_ARB_CHK;
+		*bbe[idx] = MI_ARB_CHECK;
 		execbuf.batch_start_offset =
 			(bbe[idx] - batch) * sizeof(*batch) - 64;
 
@@ -267,7 +266,6 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	const struct intel_execution_engine2 *e;
-	const uint32_t MI_ARB_CHK = 0x5 << 23;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc[4], *r;
@@ -334,7 +332,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
 
 		b = batch + (start_offset + 64) / sizeof(*batch);
 		bbe[start_offset != 0] = b;
-		*b++ = MI_ARB_CHK;
+		*b++ = MI_ARB_CHECK;
 
 		r->target_handle = obj[1].handle;
 		r->offset = (b - batch + 1) * sizeof(uint32_t);
@@ -371,7 +369,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
 	do {
 		unsigned int idx = ++cycles & 1;
 
-		*bbe[idx] = MI_ARB_CHK;
+		*bbe[idx] = MI_ARB_CHECK;
 		execbuf.batch_start_offset =
 			(bbe[idx] - batch) * sizeof(*batch) - 64;
 
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index 80119e30b..041ea5959 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -876,7 +876,7 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 					*b++ = offset;
 				}
 				*b++ = r;
-				*b++ = 0x5 << 23;
+				*b++ = MI_ARB_CHECK;
 			}
 			*b++ = MI_BATCH_BUFFER_END;
 			igt_assert((b - batch)*sizeof(uint32_t) < sz);
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 98da6cdce..b66667f46 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -356,7 +356,7 @@ static void delay(int i915,
 		*cs++ = 0;
 	jmp = cs;
 
-	*cs++ = 0x5 << 23; /* MI_ARB_CHECK */
+	*cs++ = MI_ARB_CHECK;
 
 	*cs++ = MI_LOAD_REGISTER_IMM(1);
 	*cs++ = CS_GPR(NOW_TS) + 4;
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 5aa5c6dbb..648765b02 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -653,7 +653,7 @@ static void waitboost(int fd, bool reset)
 static uint32_t batch_create(int i915, uint64_t sz)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	const uint32_t chk = 0x5 << 23;
+	const uint32_t chk = MI_ARB_CHECK;
 	uint32_t handle = gem_create(i915, sz);
 	uint32_t *map;
 
-- 
2.43.0

