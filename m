Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F9CC44515
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 21:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C309010F60B;
	Fri, 17 Jul 2026 21:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFmgwSKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48910F5F3
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784322035; x=1815858035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=22jrLl3xsROuLKM4mMV7x/vMS140hVSLce+upgVL/DU=;
 b=CFmgwSKOxHeCgXXhQAK0xWx2q8y1a/kxFo5JdHmOhTMLGka5DXfqjtKM
 YcZe9iF8H+qleFgY6sg0bsvVxIJM+5LBctCXUK6m+qbu6oO64Um9Prqcy
 e5n2f6y3lkDcAGEPHrV2Q9XNNdquLBQmHoeKM2PWpqkH2R/vzF6JmyF7T
 at+6/yjlqVyLWD2f0Z1RzwLHcBfq5TCCqif/UnEH0/bt603BwNAmd/7nV
 kcxZKre3gCblQLiUvYfaQPOSzAI+y4ROpQPtGbyCtz5fu55DN0iPZa62F
 j6LPs4EzVKEOXdXhkqpaUVSXyynXUCRZNV6mqHaGz8jsNmz0APiASkRfM Q==;
X-CSE-ConnectionGUID: m7vYySyETPeMNfkmrWDjPw==
X-CSE-MsgGUID: AcExcETARf2V2KDUqvjtEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84774462"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="84774462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:34 -0700
X-CSE-ConnectionGUID: 26Zx+INiT1ukMk26uP/MZA==
X-CSE-MsgGUID: RRZVhq0qTNCNWXqoeTzdPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="261854711"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 4/4] tests/intel/xe_oa: Cleanup blocking and polling tests
Date: Fri, 17 Jul 2026 14:00:32 -0700
Message-ID: <20260717210027.2008255-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
References: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
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

1) Drop set_kernel_timer since we don't support it anymore.
2) When running all tests, a failure in blocking/polling tests breaks
   all subsequent tests. Move __perf_close before the asserts.
3) We cannot guarantee latency when reading OA reports as there are no
   guarantees how long it takes for reports to land in memory w.r.t
   any running workloads. Since OA reports are mostly used for
   post-processing, drop the latency checks in these tests.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 153 +++++---------------------------------------
 1 file changed, 17 insertions(+), 136 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 4f652b187bae..9ebb18690ec7 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2127,8 +2127,6 @@ get_time(void)
  * kernelspace.
  */
 static void test_blocking(uint64_t requested_oa_period,
-			  bool set_kernel_hrtimer,
-			  uint64_t kernel_hrtimer,
 			  const struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
@@ -2142,24 +2140,9 @@ static void test_blocking(uint64_t requested_oa_period,
 	int64_t user_ns, kernel_ns;
 	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
 	int64_t test_duration_ns = tick_ns * 100;
-	int max_iterations = (test_duration_ns / oa_period) + 2;
-	int n_extra_iterations = 0;
 	int perf_fd;
-
-	/* It's a bit tricky to put a lower limit here, but we expect a
-	 * relatively low latency for seeing reports, while we don't currently
-	 * give any control over this in the api.
-	 *
-	 * We assume a maximum latency of 6 millisecond to deliver a POLLIN and
-	 * read() after a new sample is written (46ms per iteration) considering
-	 * the knowledge that that the driver uses a 200Hz hrtimer (5ms period)
-	 * to check for data and giving some time to read().
-	 */
-	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
 	int64_t start, end;
-	int n = 0;
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
-	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRIC_SET, test_set->perf_oa_metrics_set);
@@ -2174,13 +2157,8 @@ static void test_blocking(uint64_t requested_oa_period,
 	perf_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
         set_fd_flags(perf_fd, O_CLOEXEC);
 
-	times(&start_times);
-
-	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, min iter. = %d,"
-		  " estimated max iter. = %d, oa_period = %s\n",
-		  (int)tick_ns, test_duration_ns,
-		  min_iterations, max_iterations,
-		  pretty_print_oa_period(oa_period));
+	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, oa_period = %s\n",
+		  (int)tick_ns, test_duration_ns, pretty_print_oa_period(oa_period));
 
 	/* In the loop we perform blocking polls while the HW is sampling at
 	 * ~25Hz, with the expectation that we spend most of our time blocked
@@ -2204,44 +2182,26 @@ static void test_blocking(uint64_t requested_oa_period,
 	 * the error delta.
 	 */
 	start = get_time();
+	times(&start_times);
 	do_ioctl(perf_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
-		bool timer_report_read = false;
-		bool non_timer_report_read = false;
+	while (((end = get_time()) - start) < test_duration_ns) {
 		int ret;
 
 		while ((ret = read(perf_fd, buf, sizeof(buf))) < 0 &&
 		       (errno == EINTR || errno == EIO))
 			;
 		igt_assert_lt(0, ret);
-
-		for (int offset = 0; offset < ret; offset += format_size) {
-			uint32_t *report = (void *)(buf + offset);
-
-			if (oa_report_is_periodic(report))
-				timer_report_read = true;
-			else
-				non_timer_report_read = true;
-		}
-
-		if (non_timer_report_read && !timer_report_read)
-			n_extra_iterations++;
-
-		n++;
 	}
-
 	times(&end_times);
 
+	__perf_close(perf_fd);
+
 	/* Using nanosecond units is fairly silly here, given the tick in-
 	 * precision - ah well, it's consistent with the get_time() units.
 	 */
 	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
 	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
 
-	igt_debug("%d blocking reads during test with %"PRIu64" Hz OA sampling (expect no more than %d)\n",
-		  n, NSEC_PER_SEC / oa_period, max_iterations);
-	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
-		  n_extra_iterations);
 	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
 		  user_ns, (int)tick_ns,
 		  (int)start_times.tms_utime, (int)end_times.tms_utime);
@@ -2249,20 +2209,7 @@ static void test_blocking(uint64_t requested_oa_period,
 		  kernel_ns, (int)tick_ns,
 		  (int)start_times.tms_stime, (int)end_times.tms_stime);
 
-	/* With completely broken blocking (but also not returning an error) we
-	 * could end up with an open loop,
-	 */
-	igt_assert_lte(n, (max_iterations + n_extra_iterations));
-
-	/* Make sure the driver is reporting new samples with a reasonably
-	 * low latency...
-	 */
-	igt_assert_lt((min_iterations + n_extra_iterations), n);
-
-	if (!set_kernel_hrtimer)
-		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
-
-	__perf_close(perf_fd);
+	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
 }
 
 /**
@@ -2270,8 +2217,6 @@ static void test_blocking(uint64_t requested_oa_period,
  * Description: Test polled reads
  */
 static void test_polling(uint64_t requested_oa_period,
-			 bool set_kernel_hrtimer,
-			 uint64_t kernel_hrtimer,
 			 const struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
@@ -2285,25 +2230,8 @@ static void test_polling(uint64_t requested_oa_period,
 	int64_t user_ns, kernel_ns;
 	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
 	int64_t test_duration_ns = tick_ns * 100;
-
-	int max_iterations = (test_duration_ns / oa_period) + 2;
-	int n_extra_iterations = 0;
-
-	/* It's a bit tricky to put a lower limit here, but we expect a
-	 * relatively low latency for seeing reports.
-	 *
-	 * We assume a maximum latency of kernel_hrtimer + some margin
-	 * to deliver a POLLIN and read() after a new sample is
-	 * written (40ms + hrtimer + margin per iteration) considering
-	 * the knowledge that that the driver uses a 200Hz hrtimer
-	 * (5ms period) to check for data and giving some time to
-	 * read().
-	 */
-	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
 	int64_t start, end;
-	int n = 0;
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
-	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
 	ADD_PROPS(props, idx, OA_METRIC_SET, test_set->perf_oa_metrics_set);
@@ -2318,12 +2246,9 @@ static void test_polling(uint64_t requested_oa_period,
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
 
-	times(&start_times);
-
 	igt_debug("tick length = %dns, oa period = %s, "
-		  "test duration = %"PRIu64"ns, min iter. = %d, max iter. = %d\n",
-		  (int)tick_ns, pretty_print_oa_period(oa_period), test_duration_ns,
-		  min_iterations, max_iterations);
+		  "test duration = %"PRIu64"ns\n",
+		  (int)tick_ns, pretty_print_oa_period(oa_period), test_duration_ns);
 
 	/* In the loop we perform blocking polls while the HW is sampling at
 	 * ~25Hz, with the expectation that we spend most of our time blocked
@@ -2347,11 +2272,10 @@ static void test_polling(uint64_t requested_oa_period,
 	 * the error delta.
 	 */
 	start = get_time();
+	times(&start_times);
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
+	while (((end = get_time()) - start) < test_duration_ns) {
 		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
-		bool timer_report_read = false;
-		bool non_timer_report_read = false;
 		int ret;
 
 		while ((ret = poll(&pollfd, 1, -1)) < 0 && errno == EINTR)
@@ -2379,26 +2303,6 @@ static void test_polling(uint64_t requested_oa_period,
 			igt_debug("Unexpected error when reading after poll = %d\n", errno);
 		igt_assert_neq(ret, -1);
 
-		/* For Haswell reports don't contain a well defined reason
-		 * field we so assume all reports to be 'periodic'. For gen8+
-		 * we want to to consider that the HW automatically writes some
-		 * non periodic reports (e.g. on context switch) which might
-		 * lead to more successful read()s than expected due to
-		 * periodic sampling and we don't want these extra reads to
-		 * cause the test to fail...
-		 */
-		for (int offset = 0; offset < ret; offset += format_size) {
-			uint32_t *report = (void *)(buf + offset);
-
-			if (oa_report_is_periodic(report))
-				timer_report_read = true;
-			else
-				non_timer_report_read = true;
-		}
-
-		if (non_timer_report_read && !timer_report_read)
-			n_extra_iterations++;
-
 		/* At this point, after consuming pending reports (and hoping
 		 * the scheduler hasn't stopped us for too long) we now expect
 		 * EAGAIN on read. While this works most of the times, there are
@@ -2416,22 +2320,18 @@ static void test_polling(uint64_t requested_oa_period,
 			igt_assert_eq(ret, -1);
 			igt_assert_eq(errno, EAGAIN);
 		}
-
-		n++;
 	}
 
 	times(&end_times);
 
+	__perf_close(stream_fd);
+
 	/* Using nanosecond units is fairly silly here, given the tick in-
 	 * precision - ah well, it's consistent with the get_time() units.
 	 */
 	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
 	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
 
-	igt_debug("%d non-blocking reads during test with %"PRIu64" Hz OA sampling (expect no more than %d)\n",
-		  n, NSEC_PER_SEC / oa_period, max_iterations);
-	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
-		  n_extra_iterations);
 	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
 		  user_ns, (int)tick_ns,
 		  (int)start_times.tms_utime, (int)end_times.tms_utime);
@@ -2439,20 +2339,7 @@ static void test_polling(uint64_t requested_oa_period,
 		  kernel_ns, (int)tick_ns,
 		  (int)start_times.tms_stime, (int)end_times.tms_stime);
 
-	/* With completely broken blocking while polling (but still somehow
-	 * reporting a POLLIN event) we could end up with an open loop.
-	 */
-	igt_assert_lte(n, (max_iterations + n_extra_iterations));
-
-	/* Make sure the driver is reporting new samples with a reasonably
-	 * low latency...
-	 */
-	igt_assert_lt((min_iterations + n_extra_iterations), n);
-
-	if (!set_kernel_hrtimer)
-		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
-
-	__perf_close(stream_fd);
+	igt_assert(kernel_ns <= (test_duration_ns / 100ull));
 }
 
 /**
@@ -4419,7 +4306,7 @@ test_oa_unit_concurrent_oa_buffer_read(void)
 		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
 			exit(0);
 
-		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, oau);
+		test_blocking(40 * 1000 * 1000, oau);
 	}
 	igt_waitchildren();
 }
@@ -5163,19 +5050,13 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("blocking") {
 		igt_require(!igt_run_in_simulation());
 		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
-			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
-				      false /* set_kernel_hrtimer */,
-				      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
-				      oau);
+			test_blocking(40 * 1000 * 1000, oau);
 	}
 
 	igt_subtest_with_dynamic("polling") {
 		igt_require(!igt_run_in_simulation());
 		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
-			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
-				     false /* set_kernel_hrtimer */,
-				     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
-				     oau);
+			test_polling(40 * 1000 * 1000, oau);
 	}
 
 	igt_subtest("polling-small-buf")
-- 
2.51.0

