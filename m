Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91760CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA5A10EA10;
	Wed, 27 May 2026 20:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVFdKEbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE12510EA0F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915431; x=1811451431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BHhC5r82yc335Cctrr/aaDBMIz6SNyK6TXDr29QOUlY=;
 b=bVFdKEbqtalPksd3UKDP3olvjzXM3ejfhIDQYdHDegdnxI2YX6XPUOPI
 gbFswA4aUgW1CphovCRT6pQ9u1TfUH9+fmMZbizT4Ino+I4H/QZ+HqXCs
 M5J7OjlD7YSlDYOVesvog8jhoU42lX5oqYTwqF5bRX0zGFCZIDAoASA8h
 a/WENMr+oAWU3zmDUY+ABpJtSaquqw5tMxJ8VWIxd6LvhTW16l8GXeWS8
 HtZVjDAqPGExv+7t4PAQZnsNzaUUmgaLnCzi8QZq8JO2l2vKy0PfAoxAQ
 BrL6Koy+1zaqSoxFbkw7C9sviVyCWRKw2eZ3f3BXLWSs3L0l9iPcKNuYn A==;
X-CSE-ConnectionGUID: sk271a6cQfeM/IwaXf9ZJw==
X-CSE-MsgGUID: eQ8o7bsgT5OE0M78ZnEntg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84383438"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="84383438"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:11 -0700
X-CSE-ConnectionGUID: 1+Ew+MwZQ8i7KMcS/D0V/g==
X-CSE-MsgGUID: TKc6YF7mQUi7OVpjjgIoEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239347231"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:09 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 4/8] tests/intel/xe_sriov_scheduling: Add PMU-based
 verification helpers
Date: Wed, 27 May 2026 22:56:37 +0200
Message-ID: <20260527205644.2801165-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Add Xe PMU helper infrastructure to collect per-VF engine-active-ticks and
engine-total-ticks over the workload measurement window.

Use the collected counters to derive per-VF runtime shares and cross-check
them against throughput shares computed from workload completion
statistics, strengthening scheduling validation.

Keep this verification optional by enabling it only when the required
Xe perf events are available.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 433 ++++++++++++++++++++++++++++++
 1 file changed, 433 insertions(+)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index f7cca95ae..6d8b7640d 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 #include "igt.h"
+#include "igt_perf.h"
 #include "igt_sriov_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
@@ -660,6 +661,438 @@ prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_
 	return params;
 }
 
+struct vf_config {
+	unsigned int vf_id;
+	struct vf_sched_params sched_params;
+	bool run_workload;
+};
+
+struct runtime_metrics {
+	unsigned int vf_id;
+	uint64_t engine_active_ticks;
+	uint64_t engine_total_ticks;
+	double measured_total_tick_share;
+	double active_to_total_ratio;
+	double measured_throughput_share;
+	double expected_throughput_share;
+	double expected_active_to_total_ratio;
+	double expected_total_tick_share;
+};
+
+struct perf_counters {
+	int pmu_fd[2];
+	uint64_t before[2];
+	uint64_t after[2];
+};
+
+static char perf_device[NAME_MAX];
+
+static bool has_perf_event(const char *device, const char *event)
+{
+	char path[512];
+
+	snprintf(path, sizeof(path),
+		 "/sys/bus/event_source/devices/%s/events/%s",
+		 device, event);
+
+	return access(path, F_OK) == 0;
+}
+
+static int perf_open_group(int xe, uint64_t config, int group)
+{
+	int fd;
+
+	fd = igt_perf_open_group(xe_perf_type_id(xe), config, group);
+	igt_skip_on(fd < 0 && errno == ENODEV);
+	igt_assert_fd(fd);
+
+	return fd;
+}
+
+static uint64_t perf_read_values(int fd, unsigned int num, uint64_t *val)
+{
+	uint64_t buf[2 + num];
+	unsigned int i;
+
+	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
+
+	for (i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	return buf[1];
+}
+
+static uint64_t perf_add_format_config(const char *format, uint64_t val)
+{
+	uint64_t config;
+	uint32_t shift;
+	int ret;
+
+	ret = perf_event_format(perf_device, format, &shift);
+	igt_assert(ret >= 0);
+	config = val << shift;
+
+	return config;
+}
+
+static uint64_t perf_get_event_config(unsigned int gt,
+				      const struct drm_xe_engine_class_instance *eci,
+				      const char *event)
+{
+	uint64_t perf_config = 0;
+	int ret;
+
+	ret = perf_event_config(perf_device, event, &perf_config);
+	igt_assert(ret >= 0);
+	perf_config |= perf_add_format_config("gt", gt);
+
+	if (eci) {
+		perf_config |= perf_add_format_config("engine_class", eci->engine_class);
+		perf_config |= perf_add_format_config("engine_instance", eci->engine_instance);
+	}
+
+	return perf_config;
+}
+
+static uint64_t perf_get_event_config_vf(unsigned int gt, unsigned int vf_id,
+					 const struct drm_xe_engine_class_instance *eci,
+					 const char *event)
+{
+	return perf_get_event_config(gt, eci, event) |
+	       perf_add_format_config("function", vf_id);
+}
+
+static double expected_total_tick_weight(const struct vf_config *config)
+{
+	return config->sched_params.exec_quantum_ms;
+}
+
+static double expected_throughput_weight(const struct vf_config *config)
+{
+	if (!config->run_workload)
+		return 0.0;
+
+	return config->sched_params.exec_quantum_ms;
+}
+
+static void init_perf_counters(int pf_fd,
+			       const struct drm_xe_engine_class_instance *eci,
+			       const struct vf_config *configs,
+			       size_t num_configs,
+			       struct perf_counters *counters)
+{
+	int leader = -1;
+
+	for (size_t i = 0; i < num_configs; i++) {
+		uint64_t config;
+
+		counters[i].pmu_fd[0] = -1;
+		counters[i].pmu_fd[1] = -1;
+
+		config = perf_get_event_config_vf(eci->gt_id, configs[i].vf_id, eci,
+						  "engine-active-ticks");
+		counters[i].pmu_fd[0] = perf_open_group(pf_fd, config, leader);
+		if (leader < 0)
+			leader = counters[i].pmu_fd[0];
+
+		config = perf_get_event_config_vf(eci->gt_id, configs[i].vf_id, eci,
+						  "engine-total-ticks");
+		counters[i].pmu_fd[1] = perf_open_group(pf_fd, config, leader);
+	}
+}
+
+static void fini_perf_counters(struct perf_counters *counters,
+			       size_t num_configs)
+{
+	for (size_t i = 0; i < num_configs; i++) {
+		if (counters[i].pmu_fd[0] >= 0)
+			close(counters[i].pmu_fd[0]);
+		if (counters[i].pmu_fd[1] >= 0)
+			close(counters[i].pmu_fd[1]);
+	}
+}
+
+static uint64_t start_perf_counters(struct perf_counters *counters,
+				    size_t num_configs)
+{
+	uint64_t values[2 * num_configs];
+
+	perf_read_values(counters[0].pmu_fd[0], 2 * num_configs, values);
+
+	for (size_t i = 0; i < num_configs; i++) {
+		counters[i].before[0] = values[2 * i];
+		counters[i].before[1] = values[2 * i + 1];
+	}
+
+	return current_timestamp_ns();
+}
+
+static void
+init_expected_runtime_metrics(const struct vf_config *configs,
+			      size_t num_configs,
+			      struct runtime_metrics *metrics)
+{
+	double total_expected_total_tick_weight = 0.0;
+	double total_expected_throughput_weight = 0.0;
+
+	for (size_t i = 0; i < num_configs; i++) {
+		total_expected_total_tick_weight += expected_total_tick_weight(&configs[i]);
+		total_expected_throughput_weight += expected_throughput_weight(&configs[i]);
+	}
+
+	for (size_t i = 0; i < num_configs; i++) {
+		metrics[i].vf_id = configs[i].vf_id;
+		metrics[i].expected_throughput_share = total_expected_throughput_weight ?
+			expected_throughput_weight(&configs[i]) /
+			total_expected_throughput_weight : 0.0;
+		metrics[i].expected_total_tick_share = total_expected_total_tick_weight ?
+			expected_total_tick_weight(&configs[i]) /
+			total_expected_total_tick_weight : 0.0;
+		metrics[i].expected_active_to_total_ratio =
+			configs[i].sched_params.priority == XE_SRIOV_SCHED_PRIORITY_NORMAL ?
+				(configs[i].run_workload ? 1.0 : 0.0) :
+				(metrics[i].expected_total_tick_share ?
+				 metrics[i].expected_throughput_share /
+				 metrics[i].expected_total_tick_share : 0.0);
+	}
+}
+
+static void compute_perf_metrics(const struct vf_config *configs,
+				 const struct perf_counters *counters,
+				 size_t num_configs,
+				 struct runtime_metrics *metrics)
+{
+	uint64_t total_engine_total_ticks = 0;
+
+	init_expected_runtime_metrics(configs, num_configs, metrics);
+
+	for (size_t i = 0; i < num_configs; i++) {
+		metrics[i].engine_active_ticks = counters[i].after[0] - counters[i].before[0];
+		metrics[i].engine_total_ticks = counters[i].after[1] - counters[i].before[1];
+		total_engine_total_ticks += metrics[i].engine_total_ticks;
+	}
+
+	for (size_t i = 0; i < num_configs; i++) {
+		metrics[i].active_to_total_ratio = metrics[i].engine_total_ticks ?
+			(double)metrics[i].engine_active_ticks /
+			metrics[i].engine_total_ticks : 0.0;
+		metrics[i].measured_total_tick_share = total_engine_total_ticks ?
+			(double)metrics[i].engine_total_ticks /
+			total_engine_total_ticks : 0.0;
+
+		igt_info("%s actual={active_ticks=%" PRIu64 ",total_ticks=%" PRIu64
+			 ",active/total=%.4f,total_share=%.4f} "
+			 "expected={active/total=%.4f,total_share=%.4f,throughput_share=%.4f}\n",
+			 igt_sriov_func_str(configs[i].vf_id),
+			 metrics[i].engine_active_ticks, metrics[i].engine_total_ticks,
+			 metrics[i].active_to_total_ratio,
+			 metrics[i].measured_total_tick_share,
+			 metrics[i].expected_active_to_total_ratio,
+			 metrics[i].expected_total_tick_share,
+			 metrics[i].expected_throughput_share);
+	}
+}
+
+static uint64_t stop_perf_counters(const struct vf_config *configs,
+				   struct perf_counters *counters,
+				   size_t num_configs,
+				   struct runtime_metrics *metrics)
+{
+	uint64_t end_timestamp = current_timestamp_ns();
+	uint64_t values[2 * num_configs];
+
+	perf_read_values(counters[0].pmu_fd[0], 2 * num_configs, values);
+
+	for (size_t i = 0; i < num_configs; i++) {
+		counters[i].after[0] = values[2 * i];
+		counters[i].after[1] = values[2 * i + 1];
+	}
+
+	compute_perf_metrics(configs, counters, num_configs, metrics);
+
+	return end_timestamp;
+}
+
+static void init_vf_configs_from_set(int pf_fd,
+				     const struct subm_set *set,
+				     struct vf_config *configs)
+{
+	const struct drm_xe_engine_class_instance *eci = &set->data[0].subm.hwe;
+
+	for (int n = 0; n < set->ndata; ++n) {
+		const struct subm *subm = &set->data[n].subm;
+		const int vf_num = subm->vf_num;
+
+		igt_assert_eq(subm->hwe.gt_id, eci->gt_id);
+		igt_assert_eq(subm->hwe.engine_class, eci->engine_class);
+		igt_assert_eq(subm->hwe.engine_instance, eci->engine_instance);
+		configs[n] = (struct vf_config) {
+			.vf_id = vf_num,
+			.sched_params = {
+				.exec_quantum_ms = xe_sriov_admin_get_exec_quantum_ms(pf_fd,
+								      vf_num),
+				.preempt_timeout_us = xe_sriov_admin_get_preempt_timeout_us(pf_fd,
+									    vf_num),
+				.priority = xe_sriov_admin_get_sched_priority(pf_fd, vf_num, NULL),
+			},
+			.run_workload = true,
+		};
+	}
+}
+
+static unsigned int count_window_completions(const struct subm_stats *stats,
+					     uint64_t window_start,
+					     uint64_t window_end)
+{
+	unsigned int completions = 0;
+
+	for (int i = 0; i < stats->samples.n_values; i++) {
+		uint64_t cts = stats->complete_ts[i];
+
+		if (cts >= window_start && cts <= window_end)
+			completions++;
+	}
+
+	return completions;
+}
+
+static void compute_measured_throughput_share(const struct subm_set *set,
+					      uint64_t window_start,
+					      uint64_t window_end,
+					      struct runtime_metrics *metrics)
+{
+	unsigned int completions[set->ndata];
+	unsigned int total_completions = 0;
+
+	for (int n = 0; n < set->ndata; ++n) {
+		completions[n] = count_window_completions(&set->data[n].stats,
+							  window_start,
+							  window_end);
+		total_completions += completions[n];
+	}
+
+	for (int n = 0; n < set->ndata; ++n) {
+		metrics[n].measured_throughput_share = total_completions ?
+			(double)completions[n] / total_completions : 0.0;
+	}
+}
+
+static void compute_concurrent_rate_share(const struct subm_set *set,
+					  struct runtime_metrics *metrics)
+{
+	double total_rate = 0.0;
+
+	for (int n = 0; n < set->ndata; ++n)
+		total_rate += set->data[n].stats.concurrent_rate;
+
+	for (int n = 0; n < set->ndata; ++n) {
+		metrics[n].measured_throughput_share = total_rate ?
+			set->data[n].stats.concurrent_rate / total_rate : 0.0;
+	}
+}
+
+static void run_subm_set_and_collect_metrics(int pf_fd,
+					     struct subm_set *set,
+					     struct vf_config *vf_configs,
+					     struct runtime_metrics *metrics,
+					     bool verify_with_perf_counters,
+					     uint64_t *measurement_start_ns,
+					     uint64_t *measurement_end_ns)
+{
+	struct perf_counters *perf_counters = NULL;
+	const struct drm_xe_engine_class_instance *eci = &set->data[0].subm.hwe;
+
+	init_vf_configs_from_set(pf_fd, set, vf_configs);
+	init_expected_runtime_metrics(vf_configs, set->ndata, metrics);
+
+	if (verify_with_perf_counters) {
+		perf_counters = calloc(set->ndata, sizeof(*perf_counters));
+		igt_assert(perf_counters);
+		init_perf_counters(pf_fd, eci,
+				   vf_configs, set->ndata, perf_counters);
+		*measurement_start_ns = start_perf_counters(perf_counters,
+							    set->ndata);
+	}
+
+	subm_set_dispatch_and_wait_threads(set);
+
+	if (verify_with_perf_counters) {
+		*measurement_end_ns = stop_perf_counters(vf_configs,
+							 perf_counters,
+							 set->ndata,
+							 metrics);
+		fini_perf_counters(perf_counters, set->ndata);
+		free(perf_counters);
+	}
+
+	subm_set_close_handles(set);
+	compute_common_time_frame_stats(set);
+	compute_concurrent_rate_share(set, metrics);
+
+	if (verify_with_perf_counters)
+		compute_measured_throughput_share(set,
+						  *measurement_start_ns,
+						  *measurement_end_ns,
+						  metrics);
+}
+
+static void assert_share_matches_expected(const struct runtime_metrics *metrics,
+					  size_t num_metrics,
+					  double tolerance,
+					  bool use_total_tick_share)
+{
+	for (size_t n = 0; n < num_metrics; ++n) {
+		double measured_share = use_total_tick_share ?
+			metrics[n].measured_total_tick_share :
+			metrics[n].measured_throughput_share;
+		double expected_share = use_total_tick_share ?
+			metrics[n].expected_total_tick_share :
+			metrics[n].expected_throughput_share;
+		const char *share_name = use_total_tick_share ?
+			"total tick share" : "throughput share";
+
+		igt_assert_f(check_within_epsilon(measured_share,
+						  expected_share,
+						  tolerance),
+			     "%s=%0.4f not within +-%.0f%% of expected=%0.4f for %s\n",
+			     share_name, measured_share, tolerance * 100,
+			     expected_share,
+			     igt_sriov_func_str(metrics[n].vf_id));
+	}
+}
+
+static void assert_throughput_share_matches_total_tick(const struct runtime_metrics *metrics,
+						       size_t num_metrics,
+						       double tolerance)
+{
+	for (size_t n = 0; n < num_metrics; ++n) {
+		double expected_ratio = metrics[n].expected_total_tick_share ?
+			metrics[n].expected_throughput_share /
+			metrics[n].expected_total_tick_share : 0.0;
+		double expected_throughput_share =
+			metrics[n].measured_total_tick_share * expected_ratio;
+
+		assert_within_epsilon(metrics[n].measured_throughput_share,
+				      expected_throughput_share,
+				      tolerance);
+	}
+}
+
+static void warn_active_ticks_mismatch(const struct runtime_metrics *metrics,
+				       size_t num_metrics,
+				       double tolerance)
+{
+	for (size_t n = 0; n < num_metrics; ++n) {
+		igt_warn_on_f(!check_within_epsilon(metrics[n].active_to_total_ratio,
+						    metrics[n].expected_active_to_total_ratio,
+						    tolerance),
+			      "active/total=%0.4f not within +-%.0f%% of expected=%0.4f for %s\n",
+			      metrics[n].active_to_total_ratio, tolerance * 100,
+			      metrics[n].expected_active_to_total_ratio,
+			      igt_sriov_func_str(metrics[n].vf_id));
+	}
+}
+
 /**
  * SUBTEST: equal-throughput
  * Description:
-- 
2.43.0

