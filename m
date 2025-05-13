Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1145EC3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE2110E5DB;
	Tue, 13 May 2025 18:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOwWA4xR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6A910E5DC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747161839; x=1778697839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VfvpnwR0K/ieihj8ULtyvip7BNKhqyNYk+3t7YkUu88=;
 b=WOwWA4xRUo6lJN/b4QcLD/BIWRpOSja7JhKvsKX0yHYTOx+2G8XGco/J
 nualFux1pbt4Ebz+Rj+lK23OO4YtG0tCr18+ZOukJ4nME36fqS38XWg9L
 e82VUwIuDGBQtRKq8alrE0tXcHge1mpbTvoQnRsx9G8kVewhiDo0tF3D+
 jJTegFwtfwPVK8YDRMBqUZnOMh553y++KZY6+z3/2Y19Lmxb+/Kp2lcy+
 ubsHiZm8fv0JpEoMJ2imoreZKDH6tqdP+7m8PETIl8f4tfY9SVsffRSFJ
 m/kn1M7AkZfBPoKzLVwqUHkPkjiS+EuDLrOv6xyRMIlDLctGGTy2nek2l w==;
X-CSE-ConnectionGUID: z38HqxcHQ0myecKh5ZHgAg==
X-CSE-MsgGUID: murdXEFnS0SvKjTFvPpE0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="36655575"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="36655575"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:43:59 -0700
X-CSE-ConnectionGUID: 8yzfuYl7QPS7j202bolAzg==
X-CSE-MsgGUID: aADO/c6zQRuwXMbNC3TfAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137836059"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:43:57 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,
 1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
Date: Wed, 14 May 2025 00:07:25 +0530
Message-Id: <20250513183726.2118105-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513183726.2118105-1-sk.anirban@intel.com>
References: <20250513183726.2118105-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.

v2:
 - Disable power consumption check for dgfx

v3:
 - Implement igt exit handler

v4:
 - Cosmetic changes (Riana)

v5:
 - Limit the power consumption test to GT0 only

v6:
 - Fix frequency restoration (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rc6_residency.c | 136 +++++++++++++++++++---------
 1 file changed, 91 insertions(+), 45 deletions(-)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index c9128481d..b400460c7 100644
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
+int i915 = -1;
+
+static void restore_freq(int sig)
+{
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
+static void bg_load(const intel_ctx_t *ctx, int dirfd, uint64_t engine_flags,
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
+static void rc6_idle(const intel_ctx_t *ctx, uint64_t flags, unsigned int gt)
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
+			bg_load(ctx, dirfd, flags, phases[p].flags, done, gt);
 
 		igt_power_get_energy(&gpu, &sample[0]);
 		cycles = -READ_ONCE(done[1]);
@@ -451,19 +494,20 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
 
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
 
-static void rc6_fence(int i915, unsigned int gt)
+static void rc6_fence(unsigned int gt)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
@@ -557,7 +601,7 @@ static void rc6_fence(int i915, unsigned int gt)
 	close(fd);
 }
 
-static unsigned int rc6_enabled_mask(int i915, int dirfd)
+static unsigned int rc6_enabled_mask(int dirfd)
 {
 	igt_require(has_rc6_residency(dirfd, RC6_RESIDENCY_MS));
 
@@ -570,7 +614,6 @@ static unsigned int rc6_enabled_mask(int i915, int dirfd)
 
 igt_main
 {
-	int i915 = -1;
 	unsigned int dirfd, gt;
 	const intel_ctx_t *ctx;
 
@@ -582,19 +625,22 @@ igt_main
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
+						rc6_idle(ctx, e->flags, gt);
 				}
 			}
 			intel_ctx_destroy(i915, ctx);
 		}
+		intel_allocator_multiprocess_stop();
 	}
 
 	igt_subtest_with_dynamic("rc6-fence") {
@@ -603,7 +649,7 @@ igt_main
 
 		i915_for_each_gt(i915, dirfd, gt)
 			igt_dynamic_f("gt%u", gt)
-				rc6_fence(i915, gt);
+				rc6_fence(gt);
 	}
 
 	igt_subtest_group {
@@ -621,7 +667,7 @@ igt_main
 				igt_dynamic_f("gt%u", gt) {
 					struct residencies res;
 
-					rc6_enabled = rc6_enabled_mask(i915, dirfd);
+					rc6_enabled = rc6_enabled_mask(dirfd);
 					igt_require(rc6_enabled & RC6_ENABLED);
 
 					measure_residencies(devid, dirfd, rc6_enabled, &res);
@@ -635,7 +681,7 @@ igt_main
 
 			igt_require(IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid));
 
-			rc6_enabled = rc6_enabled_mask(i915, sysfs);
+			rc6_enabled = rc6_enabled_mask(sysfs);
 			igt_require(rc6_enabled & RC6_ENABLED);
 
 			measure_residencies(devid, sysfs, rc6_enabled, &res);
-- 
2.34.1

