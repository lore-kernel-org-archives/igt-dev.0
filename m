Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF3C3DA46
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 18:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8E210EC23;
	Fri,  5 Jul 2024 18:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfGMYkTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CF910E26D
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720204001; x=1751740001;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hMA+QKfdQNzhEA5Tfw/bN3l6Di6WBIVcCaGSuirgooM=;
 b=AfGMYkTjpKqXlUyVkZ/Iw1AlygE9766hx3Te88YuXpqUIVZGzdEvmDNq
 yX0OmLd2UewiMY1HG7XxenxfoW8Uc/f0jEeoD7LZ6cwAvp34JZqtFtVsc
 iySogWVPJS8kyWEWMQTauDP+nD5hVk5RAjxZ6+7GcGIp/wF7uxSH3MLtH
 /iZm8GEkAlU9kJUlbpvcT+1M8zkK7g7gQeFhGyay4yqJ6XJ+0EHndfQHQ
 m6DnpSnxD3t0jj4PEz+S1pKLOv0/BpxGgeA9E5bQjesWdxRyf5+CY7O4A
 7iYDPbgltDdFHaNYxgyW/eCBILfZJLD/x+8A8TFjKZh/vdlHh+50nzL0g g==;
X-CSE-ConnectionGUID: Xc683XlaQC63+NzYp3ktUA==
X-CSE-MsgGUID: EgHpsb/4Q5qzSs7ahkE8zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17146545"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17146545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:41 -0700
X-CSE-ConnectionGUID: gOz8Z7ZmTTCDLMOY5lozqQ==
X-CSE-MsgGUID: 4CK0lfHSQ/iIQQbWNB5ZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="47011698"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:41 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/15] tests/intel/xe_oa: blocking and polling tests
Date: Fri,  5 Jul 2024 11:26:29 -0700
Message-ID: <20240705182637.2679730-9-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
References: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
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

"blocking", "polling" and "polling-small-buf".

v2: Rename xe perf layer as xe observation layer

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 463 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 463 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 410baf3ef1..1e18740a68 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -430,6 +430,24 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
 	return hwe;
 }
 
+static char *
+pretty_print_oa_period(uint64_t oa_period_ns)
+{
+	static char result[100];
+	static const char *units[4] = { "ns", "us", "ms", "s" };
+	double val = oa_period_ns;
+	int iter = 0;
+
+	while (iter < (ARRAY_SIZE(units) - 1) &&
+	       val >= 1000.0f) {
+		val /= 1000.0f;
+		iter++;
+	}
+
+	snprintf(result, sizeof(result), "%.3f%s", val, units[iter]);
+	return result;
+}
+
 static void
 __perf_close(int fd)
 {
@@ -1630,6 +1648,432 @@ static void test_invalid_oa_exponent(void)
 	}
 }
 
+static int64_t
+get_time(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+
+	return ts.tv_sec * 1000000000 + ts.tv_nsec;
+}
+
+/**
+ * SUBTEST: blocking
+ * Description: Test blocking reads
+ */
+/* Note: The interface doesn't currently provide strict guarantees or control
+ * over the upper bound for how long it might take for a POLLIN event after
+ * some OA report is written by the OA unit.
+ *
+ * The plan is to add a property later that gives some control over the maximum
+ * latency, but for now we expect it is tuned for a fairly low latency
+ * suitable for applications wanting to provide live feedback for captured
+ * metrics.
+ *
+ * At the time of writing this test the driver was using a fixed 200Hz hrtimer
+ * regardless of the OA sampling exponent.
+ *
+ * There is no lower bound since a stream configured for periodic sampling may
+ * still contain other automatically triggered reports.
+ *
+ * What we try and check for here is that blocking reads don't return EAGAIN
+ * and that we aren't spending any significant time burning the cpu in
+ * kernelspace.
+ */
+static void test_blocking(uint64_t requested_oa_period,
+			  bool set_kernel_hrtimer,
+			  uint64_t kernel_hrtimer,
+			  const struct drm_xe_engine_class_instance *hwe)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	uint64_t props[XE_OA_MAX_SET_PROPERTIES * 2];
+	uint64_t *idx = props;
+	struct intel_xe_oa_open_prop param;
+	uint8_t buf[1024 * 1024];
+	struct tms start_times;
+	struct tms end_times;
+	int64_t user_ns, kernel_ns;
+	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
+	int64_t test_duration_ns = tick_ns * 100;
+	int max_iterations = (test_duration_ns / oa_period) + 2;
+	int n_extra_iterations = 0;
+	int perf_fd;
+
+	/* It's a bit tricky to put a lower limit here, but we expect a
+	 * relatively low latency for seeing reports, while we don't currently
+	 * give any control over this in the api.
+	 *
+	 * We assume a maximum latency of 6 millisecond to deliver a POLLIN and
+	 * read() after a new sample is written (46ms per iteration) considering
+	 * the knowledge that that the driver uses a 200Hz hrtimer (5ms period)
+	 * to check for data and giving some time to read().
+	 */
+	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
+	int64_t start, end;
+	int n = 0;
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
+
+	ADD_PROPS(props, idx, SAMPLE_OA, true);
+	ADD_PROPS(props, idx, OA_METRIC_SET, test_set->perf_oa_metrics_set);
+	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
+	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
+	ADD_PROPS(props, idx, OA_DISABLED, true);
+	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
+	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
+
+	param.num_properties = (idx - props) / 2;
+	param.properties_ptr = to_user_pointer(props);
+
+	perf_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+        set_fd_flags(perf_fd, O_CLOEXEC);
+
+	times(&start_times);
+
+	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, min iter. = %d,"
+		  " estimated max iter. = %d, oa_period = %s\n",
+		  (int)tick_ns, test_duration_ns,
+		  min_iterations, max_iterations,
+		  pretty_print_oa_period(oa_period));
+
+	/* In the loop we perform blocking polls while the HW is sampling at
+	 * ~25Hz, with the expectation that we spend most of our time blocked
+	 * in the kernel, and shouldn't be burning cpu cycles in the kernel in
+	 * association with this process (verified by looking at stime before
+	 * and after loop).
+	 *
+	 * We're looking to assert that less than 1% of the test duration is
+	 * spent in the kernel dealing with polling and read()ing.
+	 *
+	 * The test runs for a relatively long time considering the very low
+	 * resolution of stime in ticks of typically 10 milliseconds. Since we
+	 * don't know the fractional part of tick values we read from userspace
+	 * so our minimum threshold needs to be >= one tick since any
+	 * measurement might really be +- tick_ns (assuming we effectively get
+	 * floor(real_stime)).
+	 *
+	 * We Loop for 1000 x tick_ns so one tick corresponds to 0.1%
+	 *
+	 * Also enable the stream just before poll/read to minimize
+	 * the error delta.
+	 */
+	start = get_time();
+	do_ioctl(perf_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
+		bool timer_report_read = false;
+		bool non_timer_report_read = false;
+		int ret;
+
+		while ((ret = read(perf_fd, buf, sizeof(buf))) < 0 &&
+		       (errno == EINTR || errno == EIO))
+			;
+		igt_assert(ret > 0);
+
+		for (int offset = 0; offset < ret; offset += format_size) {
+			uint32_t *report = (void *)(buf + offset);
+
+			if (oa_report_is_periodic(oa_exponent, report))
+				timer_report_read = true;
+			else
+				non_timer_report_read = true;
+		}
+
+		if (non_timer_report_read && !timer_report_read)
+			n_extra_iterations++;
+
+		n++;
+	}
+
+	times(&end_times);
+
+	/* Using nanosecond units is fairly silly here, given the tick in-
+	 * precision - ah well, it's consistent with the get_time() units.
+	 */
+	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
+	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
+
+	igt_debug("%d blocking reads during test with %"PRIu64" Hz OA sampling (expect no more than %d)\n",
+		  n, NSEC_PER_SEC / oa_period, max_iterations);
+	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
+		  n_extra_iterations);
+	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
+		  user_ns, (int)tick_ns,
+		  (int)start_times.tms_utime, (int)end_times.tms_utime);
+	igt_debug("time in kernelspace = %"PRIu64"ns (+-%dns) (start stime = %d, end = %d)\n",
+		  kernel_ns, (int)tick_ns,
+		  (int)start_times.tms_stime, (int)end_times.tms_stime);
+
+	/* With completely broken blocking (but also not returning an error) we
+	 * could end up with an open loop,
+	 */
+	igt_assert(n <= (max_iterations + n_extra_iterations));
+
+	/* Make sure the driver is reporting new samples with a reasonably
+	 * low latency...
+	 */
+	igt_assert(n > (min_iterations + n_extra_iterations));
+
+	if (!set_kernel_hrtimer)
+		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
+
+	__perf_close(perf_fd);
+}
+
+/**
+ * SUBTEST: polling
+ * Description: Test polled reads
+ */
+static void test_polling(uint64_t requested_oa_period,
+			 bool set_kernel_hrtimer,
+			 uint64_t kernel_hrtimer,
+			 const struct drm_xe_engine_class_instance *hwe)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
+	uint64_t props[XE_OA_MAX_SET_PROPERTIES * 2];
+	uint64_t *idx = props;
+	struct intel_xe_oa_open_prop param;
+	uint8_t buf[1024 * 1024];
+	struct tms start_times;
+	struct tms end_times;
+	int64_t user_ns, kernel_ns;
+	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
+	int64_t test_duration_ns = tick_ns * 100;
+
+	int max_iterations = (test_duration_ns / oa_period) + 2;
+	int n_extra_iterations = 0;
+
+	/* It's a bit tricky to put a lower limit here, but we expect a
+	 * relatively low latency for seeing reports.
+	 *
+	 * We assume a maximum latency of kernel_hrtimer + some margin
+	 * to deliver a POLLIN and read() after a new sample is
+	 * written (40ms + hrtimer + margin per iteration) considering
+	 * the knowledge that that the driver uses a 200Hz hrtimer
+	 * (5ms period) to check for data and giving some time to
+	 * read().
+	 */
+	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
+	int64_t start, end;
+	int n = 0;
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
+
+	ADD_PROPS(props, idx, SAMPLE_OA, true);
+	ADD_PROPS(props, idx, OA_METRIC_SET, test_set->perf_oa_metrics_set);
+	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
+	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
+	ADD_PROPS(props, idx, OA_DISABLED, true);
+	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
+	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
+
+	param.num_properties = (idx - props) / 2;
+	param.properties_ptr = to_user_pointer(props);
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
+
+	times(&start_times);
+
+	igt_debug("tick length = %dns, oa period = %s, "
+		  "test duration = %"PRIu64"ns, min iter. = %d, max iter. = %d\n",
+		  (int)tick_ns, pretty_print_oa_period(oa_period), test_duration_ns,
+		  min_iterations, max_iterations);
+
+	/* In the loop we perform blocking polls while the HW is sampling at
+	 * ~25Hz, with the expectation that we spend most of our time blocked
+	 * in the kernel, and shouldn't be burning cpu cycles in the kernel in
+	 * association with this process (verified by looking at stime before
+	 * and after loop).
+	 *
+	 * We're looking to assert that less than 1% of the test duration is
+	 * spent in the kernel dealing with polling and read()ing.
+	 *
+	 * The test runs for a relatively long time considering the very low
+	 * resolution of stime in ticks of typically 10 milliseconds. Since we
+	 * don't know the fractional part of tick values we read from userspace
+	 * so our minimum threshold needs to be >= one tick since any
+	 * measurement might really be +- tick_ns (assuming we effectively get
+	 * floor(real_stime)).
+	 *
+	 * We Loop for 1000 x tick_ns so one tick corresponds to 0.1%
+	 *
+	 * Also enable the stream just before poll/read to minimize
+	 * the error delta.
+	 */
+	start = get_time();
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
+		bool timer_report_read = false;
+		bool non_timer_report_read = false;
+		int ret;
+
+		while ((ret = poll(&pollfd, 1, -1)) < 0 && errno == EINTR)
+			;
+		igt_assert_eq(ret, 1);
+		igt_assert(pollfd.revents & POLLIN);
+
+		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
+		       (errno == EINTR || errno == EIO))
+			;
+
+		/* Don't expect to see EAGAIN if we've had a POLLIN event
+		 *
+		 * XXX: actually this is technically overly strict since we do
+		 * knowingly allow false positive POLLIN events. At least in
+		 * the future when supporting context filtering of metrics for
+		 * Gen8+ handled in the kernel then POLLIN events may be
+		 * delivered when we know there are pending reports to process
+		 * but before we've done any filtering to know for certain that
+		 * any reports are destined to be copied to userspace.
+		 *
+		 * Still, for now it's a reasonable sanity check.
+		 */
+		if (ret < 0)
+			igt_debug("Unexpected error when reading after poll = %d\n", errno);
+		igt_assert_neq(ret, -1);
+
+		/* For Haswell reports don't contain a well defined reason
+		 * field we so assume all reports to be 'periodic'. For gen8+
+		 * we want to to consider that the HW automatically writes some
+		 * non periodic reports (e.g. on context switch) which might
+		 * lead to more successful read()s than expected due to
+		 * periodic sampling and we don't want these extra reads to
+		 * cause the test to fail...
+		 */
+		for (int offset = 0; offset < ret; offset += format_size) {
+			uint32_t *report = (void *)(buf + offset);
+
+			if (oa_report_is_periodic(oa_exponent, report))
+				timer_report_read = true;
+			else
+				non_timer_report_read = true;
+		}
+
+		if (non_timer_report_read && !timer_report_read)
+			n_extra_iterations++;
+
+		/* At this point, after consuming pending reports (and hoping
+		 * the scheduler hasn't stopped us for too long) we now expect
+		 * EAGAIN on read. While this works most of the times, there are
+		 * some rare failures when the OA period passed to this test is
+		 * very small (say 500 us) and that results in some valid
+		 * reports here. To weed out those rare occurences we assert
+		 * only if the OA period is >= 40 ms because 40 ms has withstood
+		 * the test of time on most platforms (ref: subtest: polling).
+		 */
+		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
+		       (errno == EINTR || errno == EIO))
+			;
+
+		if (requested_oa_period >= 40000000) {
+			igt_assert_eq(ret, -1);
+			igt_assert_eq(errno, EAGAIN);
+		}
+
+		n++;
+	}
+
+	times(&end_times);
+
+	/* Using nanosecond units is fairly silly here, given the tick in-
+	 * precision - ah well, it's consistent with the get_time() units.
+	 */
+	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
+	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
+
+	igt_debug("%d non-blocking reads during test with %"PRIu64" Hz OA sampling (expect no more than %d)\n",
+		  n, NSEC_PER_SEC / oa_period, max_iterations);
+	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
+		  n_extra_iterations);
+	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
+		  user_ns, (int)tick_ns,
+		  (int)start_times.tms_utime, (int)end_times.tms_utime);
+	igt_debug("time in kernelspace = %"PRIu64"ns (+-%dns) (start stime = %d, end = %d)\n",
+		  kernel_ns, (int)tick_ns,
+		  (int)start_times.tms_stime, (int)end_times.tms_stime);
+
+	/* With completely broken blocking while polling (but still somehow
+	 * reporting a POLLIN event) we could end up with an open loop.
+	 */
+	igt_assert(n <= (max_iterations + n_extra_iterations));
+
+	/* Make sure the driver is reporting new samples with a reasonably
+	 * low latency...
+	 */
+	igt_assert(n > (min_iterations + n_extra_iterations));
+
+	if (!set_kernel_hrtimer)
+		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
+
+	__perf_close(stream_fd);
+}
+
+/**
+ * SUBTEST: polling-small-buf
+ * Description: Test polled read with buffer size smaller than available data
+ */
+static void test_polling_small_buf(void)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t test_duration = 80 * 1000 * 1000;
+	int sample_size = get_oa_format(default_test_set->perf_oa_format).size;
+	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
+	int n_expect_read_bytes = n_expected_reports * sample_size;
+	struct timespec ts = {};
+	int n_bytes_read = 0;
+	uint32_t n_polls = 0;
+
+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+
+	while (igt_nsec_elapsed(&ts) < test_duration) {
+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
+
+		ppoll(&pollfd, 1, NULL, NULL);
+		if (pollfd.revents & POLLIN) {
+			uint8_t buf[1024];
+			int ret;
+
+			ret = read(stream_fd, buf, sizeof(buf));
+			if (ret >= 0)
+				n_bytes_read += ret;
+		}
+
+		n_polls++;
+	}
+
+	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
+		 n_bytes_read, n_expect_read_bytes,
+		 n_bytes_read * 100.0f / n_expect_read_bytes,
+		 n_polls);
+
+	__perf_close(stream_fd);
+
+	igt_assert(abs(n_expect_read_bytes - n_bytes_read) <
+		   0.20 * n_expect_read_bytes);
+}
+
 /**
  * SUBTEST: buffer-fill
  * Description: Test filling, wraparound and overflow of OA buffer
@@ -2463,6 +2907,25 @@ igt_main
 		__for_one_hwe_in_oag(hwe)
 			test_enable_disable(hwe);
 
+	igt_subtest_with_dynamic("blocking") {
+		__for_one_hwe_in_oag(hwe)
+			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
+				      false /* set_kernel_hrtimer */,
+				      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
+				      hwe);
+	}
+
+	igt_subtest_with_dynamic("polling") {
+		__for_one_hwe_in_oag(hwe)
+			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
+				     false /* set_kernel_hrtimer */,
+				     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
+				     hwe);
+	}
+
+	igt_subtest("polling-small-buf")
+		test_polling_small_buf();
+
 	igt_subtest("short-reads")
 		test_short_reads();
 
-- 
2.41.0

