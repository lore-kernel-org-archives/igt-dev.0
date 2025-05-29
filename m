Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA86FC5AE59
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 09:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FE710E725;
	Thu, 29 May 2025 09:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGsBb2e2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4A410E725
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748510177; x=1780046177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4xf0aX9oU5gddgxjfAbB+p9S3vwwDkM2SqR87JNpbjY=;
 b=TGsBb2e2PYRAJJ0oDiC2k2jsa9tc2eAdWM9TRWSqc4VU/WDaBf/Q5uR3
 PWdoIkn/EbWPr4TDsQEE72qV+sUdALw0IXQ+UAs64NOIlMZxZvyoB7nvo
 rOWbWhXlx981M6xQgP9YARy4Nf+Jbbb7fgiv6BIgxL9hlEcUI8m1IZld/
 eOnM+K5dXzkEpMGf/RBbMhnn42rsGhWY+CPBoz9+qD4W0/IepLV0QxWuA
 KwwZ6BSoyPrUWG+zmTkCAXasG0qEV7zewLn5fILv/n4vAIyd0khOfUpcf
 u07vDXEtplcjlYD6ArP3M9TXolXhsgpZD3n/K29mqv3IULmm++yZP61K7 g==;
X-CSE-ConnectionGUID: SgSVFx/5So6LL+rdtB269w==
X-CSE-MsgGUID: 99CvQvGRQayJJOD8dalIgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54360218"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54360218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 02:16:17 -0700
X-CSE-ConnectionGUID: L3wfEdqrR+CBTWzRi9d5WQ==
X-CSE-MsgGUID: QmX2EfQnSXaBed/yqzSFLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="143974144"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 02:16:15 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v7 1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve peak
 frequency
Date: Thu, 29 May 2025 14:38:40 +0530
Message-Id: <20250529090841.4177513-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529090841.4177513-1-sk.anirban@intel.com>
References: <20250529090841.4177513-1-sk.anirban@intel.com>
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

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.

v4:
 - Cosmetic changes (Riana)

v5:
 - Limit the power consumption test to GT0 only

v6:
 - Fix frequency restoration (Riana)

v7:
 - Fix variable scope (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/i915_pm_rc6_residency.c | 125 +++++++++++++++++++---------
 1 file changed, 86 insertions(+), 39 deletions(-)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index c9128481d..e7a34b0da 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
 	return false;
 }
 
-static uint32_t batch_create(int fd)
-{
-	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	uint32_t handle;
-
-	handle = gem_create(fd, 4096);
-	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
-
-	return handle;
-}
-
 static int open_pmu(int i915, uint64_t config)
 {
 	int fd;
@@ -286,45 +275,88 @@ static int open_pmu(int i915, uint64_t config)
 	return fd;
 }
 
-#define WAITBOOST 0x1
+#define FREQUENT_BOOST 0x1
 #define ONCE 0x2
 
 static void sighandler(int sig)
 {
 }
 
-static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
+static uint32_t get_freq(int dirfd, uint8_t id)
+{
+	uint32_t val;
+
+	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
+
+	return val;
+}
+
+static int set_freq(int dirfd, uint8_t id, uint32_t val)
+{
+	return igt_sysfs_rps_printf(dirfd, id, "%u", val);
+}
+
+uint32_t stash_min;
+
+static void restore_freq(int sig)
+{
+	int i915 = -1;
+	int dirfd;
+	int gt = 0;
+
+	i915 = drm_open_driver(DRIVER_INTEL);
+	dirfd = igt_sysfs_gt_open(i915, 0);
+	igt_sysfs_gt_open(i915, gt);
+
+	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
+
+	drm_close_driver(i915);
+	close(dirfd);
+}
+
+static void bg_load(int i915, const intel_ctx_t *ctx, int dirfd, uint64_t engine_flags,
+		    unsigned int flags, unsigned long *ctl, unsigned int gt)
 {
 	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
-	struct drm_i915_gem_exec_object2 obj = {
-		.handle = batch_create(i915),
-	};
-	struct drm_i915_gem_execbuffer2 execbuf = {
-		.buffers_ptr = to_user_pointer(&obj),
-		.buffer_count = 1,
-		.flags = engine_flags,
-		.rsvd1 = ctx_id,
-	};
 	struct sigaction act = {
 		.sa_handler = sighandler
 	};
+	int64_t timeout = 1;
+	uint64_t ahnd;
+	int rp0;
 
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
 	sigaction(SIGINT, &act, NULL);
 	do {
 		uint64_t submit, wait, elapsed;
 		struct timespec tv = {};
+		igt_spin_t *spin;
 
 		igt_nsec_elapsed(&tv);
-
-		gem_execbuf(i915, &execbuf);
+		spin = igt_spin_new(i915,
+				    .ahnd = ahnd,
+				    .ctx = ctx,
+				    .engine = engine_flags);
 		submit = igt_nsec_elapsed(&tv);
-		if (flags & WAITBOOST) {
-			gem_sync(i915, obj.handle);
+		if (flags & FREQUENT_BOOST) {
+			/* Set MIN freq to RP0 to achieve the peak freq */
+			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
+			igt_assert(gem_bo_busy(i915, spin->handle));
+			gem_wait(i915, spin->handle, &timeout);
+
+			/* Restore the MIN freq back to default */
+			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
+			igt_spin_end(spin);
+			igt_spin_free(i915, spin);
+			gem_quiescent_gpu(i915);
 			if (flags & ONCE)
-				flags &= ~WAITBOOST;
+				flags &= ~FREQUENT_BOOST;
 		} else  {
-			while (gem_bo_busy(i915, obj.handle))
-				usleep(0);
+			igt_assert(gem_bo_busy(i915, spin->handle));
+			igt_spin_end(spin);
+			igt_spin_free(i915, spin);
+			gem_quiescent_gpu(i915);
 		}
 		wait = igt_nsec_elapsed(&tv);
 
@@ -350,6 +382,7 @@ static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned i
 		/* aim for ~1% busy */
 		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
 	} while (!READ_ONCE(*ctl));
+	put_ahnd(ahnd);
 }
 
 static void kill_children(int sig)
@@ -361,9 +394,9 @@ static void kill_children(int sig)
 	signal(sig, old);
 }
 
-static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
+static void rc6_idle(int i915, const intel_ctx_t *ctx, uint64_t flags, unsigned int gt)
 {
-	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
+	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	struct {
@@ -371,10 +404,11 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
 		unsigned int flags;
 		double power;
 	} phases[] = {
+		{ "once", FREQUENT_BOOST | ONCE },
 		{ "normal", 0 },
-		{ "boost", WAITBOOST },
-		{ "once", WAITBOOST | ONCE },
+		{ "boost", FREQUENT_BOOST }
 	};
+	int dirfd = igt_sysfs_gt_open(i915, gt);
 	struct power_sample sample[2];
 	unsigned long slept, cycles;
 	unsigned long *done;
@@ -407,12 +441,21 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
 
 	assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
 
+	if (gt) {
+		close(fd);
+		close(dirfd);
+		igt_power_close(&gpu);
+		return;
+	}
+
 	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 
+	stash_min = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
+
 	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
 		memset(done, 0, 2 * sizeof(*done));
 		igt_fork(child, 1) /* Setup up a very light load */
-			bg_load(i915, ctx_id, flags, phases[p].flags, done);
+			bg_load(i915, ctx, dirfd, flags, phases[p].flags, done, gt);
 
 		igt_power_get_energy(&gpu, &sample[0]);
 		cycles = -READ_ONCE(done[1]);
@@ -451,15 +494,16 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
 
 	munmap(done, 4096);
 	close(fd);
+	close(dirfd);
 
 	igt_power_close(&gpu);
 
-	if (phases[1].power - phases[0].power > 10) {
-		igt_assert_f(2 * phases[2].power - phases[0].power <= phases[1].power,
+	if (phases[2].power - phases[1].power > 20 && !gem_has_lmem(i915)) {
+		igt_assert_f(2 * phases[0].power - phases[1].power <= phases[2].power,
 			     "Exceeded energy expectations for single busy wait load\n"
 			     "Used %.1fmW, min %.1fmW, max %.1fmW, expected less than %.1fmW\n",
-			     phases[2].power, phases[0].power, phases[1].power,
-			     phases[0].power + (phases[1].power - phases[0].power) / 2);
+			     phases[0].power, phases[1].power, phases[2].power,
+			     phases[1].power + (phases[2].power - phases[1].power) / 2);
 	}
 }
 
@@ -582,19 +626,22 @@ igt_main
 	igt_subtest_with_dynamic("rc6-idle") {
 		const struct intel_execution_engine2 *e;
 
+		igt_install_exit_handler(restore_freq);
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
+		intel_allocator_multiprocess_start();
 
 		i915_for_each_gt(i915, dirfd, gt) {
 			ctx = intel_ctx_create_for_gt(i915, gt);
 			for_each_ctx_engine(i915, ctx, e) {
 				if (e->instance == 0) {
 					igt_dynamic_f("gt%u-%s", gt, e->name)
-						rc6_idle(i915, ctx->id, e->flags, gt);
+						rc6_idle(i915, ctx, e->flags, gt);
 				}
 			}
 			intel_ctx_destroy(i915, ctx);
 		}
+		intel_allocator_multiprocess_stop();
 	}
 
 	igt_subtest_with_dynamic("rc6-fence") {
-- 
2.34.1

