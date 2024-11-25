Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38805D58D5F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D1510E6A1;
	Mon, 25 Nov 2024 16:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHZX4L5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4910E6A1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732550862; x=1764086862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQwX/utTIB99fwiGjXdwIxsqLZio6861gN895OqPUHE=;
 b=eHZX4L5RWBg3vWPkcg++6NWrOX8AflzIuAMPtu7Tw/vYtuCKHhGBzs0B
 7+oC2o8DCl5cggmEhwO/wS84C7SjsdjaCaOKHdWLsFPNP4AvQXMW8x25u
 KeJAnw+ZlUGRyNIb5k2uUQ3f1t3I/kDXgwTpEoCWqpfVLANUIPi2a+Rb4
 vBKHFdFZLHdWqFd/zj70sapoAu5fGkyqeNJwCQumHF0C41a4ZtG12hLwU
 tBrAH+w5OX/CTSdZKnDWe79AY/8POYlFteayH60geumTNOFbQnA41umx1
 kPA+k4Nn7fjAFbwVxrgy6UjKTO4/NAlWmJNcIGMYQyhH/cwmU9fZOrDBN Q==;
X-CSE-ConnectionGUID: UORhxVQVQu2ChFsdHesUsA==
X-CSE-MsgGUID: VPvi1hsXSHmH57YFOVkYQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32040187"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32040187"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:07:42 -0800
X-CSE-ConnectionGUID: gdgBRkU/QqO2YhhX/ZpjVg==
X-CSE-MsgGUID: 0DCPi+J5QXWHZ8otScb8ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="95407848"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:07:40 -0800
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,
 1/2] tests/i915/pm_rc6_residency: Replace waitboost with spinner and
 use sysfs to reach peak frequency
Date: Mon, 25 Nov 2024 21:28:56 +0530
Message-Id: <20241125155857.2561292-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125155857.2561292-1-sk.anirban@intel.com>
References: <20241125155857.2561292-1-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rc6_residency.c | 98 +++++++++++++++++++----------
 1 file changed, 66 insertions(+), 32 deletions(-)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 7942d46d3..b646e181f 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -290,17 +290,6 @@ static unsigned int measured_usleep(unsigned int usec)
 	return igt_nsec_elapsed(&ts);
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
@@ -312,45 +301,80 @@ static int open_pmu(int i915, uint64_t config)
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
+static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags,
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
+	uint32_t rpn, rp0;
+	int sys;
+
+	igt_require_gem(i915);
+	sys = igt_sysfs_open(i915);
+	igt_require(sys != -1);
+	rpn = get_freq(sys, RPS_RPn_FREQ_MHZ);
+	rp0 = get_freq(sys, RPS_RP0_FREQ_MHZ);
 
 	sigaction(SIGINT, &act, NULL);
 	do {
 		uint64_t submit, wait, elapsed;
 		struct timespec tv = {};
+		const intel_ctx_t *ctx;
+		igt_spin_t *spin;
+		uint64_t ahnd;
 
-		igt_nsec_elapsed(&tv);
+		ctx = intel_ctx_create_for_gt(i915, gt);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
 
-		gem_execbuf(i915, &execbuf);
+		igt_nsec_elapsed(&tv);
+		spin = igt_spin_new(i915,
+				    .ahnd = ahnd,
+				    .ctx = ctx,
+				    .engine = engine_flags);
 		submit = igt_nsec_elapsed(&tv);
-		if (flags & WAITBOOST) {
-			gem_sync(i915, obj.handle);
+		if (flags & FREQUENT_BOOST) {
+			/* Set MIN freq to RP0 to achieve the peak freq */
+			igt_assert_lt(0, set_freq(sys, RPS_MIN_FREQ_MHZ, rp0));
+			igt_assert(gem_bo_busy(i915, spin->handle));
+
+			/* Restore the MIN freq back to default */
+			igt_assert_lt(0, set_freq(sys, RPS_MIN_FREQ_MHZ, rpn));
+			igt_spin_free(i915, spin);
+			gem_quiescent_gpu(i915);
+			put_ahnd(ahnd);
+			intel_ctx_destroy(i915, ctx);
 			if (flags & ONCE)
-				flags &= ~WAITBOOST;
+				flags &= ~FREQUENT_BOOST;
 		} else  {
-			while (gem_bo_busy(i915, obj.handle))
-				usleep(0);
+			igt_assert(gem_bo_busy(i915, spin->handle));
+			igt_assert_lt(0, set_freq(sys, RPS_MIN_FREQ_MHZ, rpn));
+			igt_spin_free(i915, spin);
+			gem_quiescent_gpu(i915);
+			put_ahnd(ahnd);
+			intel_ctx_destroy(i915, ctx);
 		}
 		wait = igt_nsec_elapsed(&tv);
 
@@ -398,8 +422,8 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
 		double power;
 	} phases[] = {
 		{ "normal", 0 },
-		{ "boost", WAITBOOST },
-		{ "once", WAITBOOST | ONCE },
+		{ "boost", FREQUENT_BOOST },
+		{ "once", FREQUENT_BOOST | ONCE },
 	};
 	struct power_sample sample[2];
 	unsigned long slept, cycles;
@@ -438,7 +462,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
 	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
 		memset(done, 0, 2 * sizeof(*done));
 		igt_fork(child, 1) /* Setup up a very light load */
-			bg_load(i915, ctx_id, flags, phases[p].flags, done);
+			bg_load(i915, ctx_id, flags, phases[p].flags, done, gt);
 
 		igt_power_get_energy(&gpu, &sample[0]);
 		cycles = -READ_ONCE(done[1]);
@@ -605,6 +629,11 @@ igt_main
 		i915 = drm_open_driver(DRIVER_INTEL);
 	}
 
+	igt_fixture
+	{
+		intel_allocator_multiprocess_start();
+	}
+
 	igt_subtest_with_dynamic("rc6-idle") {
 		const struct intel_execution_engine2 *e;
 
@@ -623,6 +652,11 @@ igt_main
 		}
 	}
 
+	igt_fixture
+	{
+		intel_allocator_multiprocess_stop();
+	}
+
 	igt_subtest_with_dynamic("rc6-fence") {
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
-- 
2.34.1

