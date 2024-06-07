Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40391C27C78
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B670410ED22;
	Fri,  7 Jun 2024 20:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sm6thBvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073A910ED10
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717790941; x=1749326941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/AM/0Yh6nrlsGOu6+LOucmPNjzpSX5fLa9WUVqnMuSw=;
 b=Sm6thBvx/3RcXab8HKlvKIFpO0CEqq0d0/17rxQCXkUgrGKS87BBfzpG
 dCQ6yy/iMQAfC74x5us6KmfEhFzmZKomm5Kb8nmdNjw2/1wZdKpthcSNy
 hI3gKIWRrYASPGgW/ub8UL0UN2Auw49hxlwUQMNfAVZicyruzlyfyDhp0
 48JOAstsomYbDo0bNKoglYh7kGhjUtgYeXlBH+1vPx93Rf+mxjBwG4Kyf
 NpcrBwwXTZYODvpWAltykXJaECuRyq3FfMeHNdMYeXqdxDcI6uS4gOXGh
 UOLZ03ZxIBS+in0hZDhBXzPgJmgnzU5BkpvqF3G2uNUcVFr2vZiZ0ALEF g==;
X-CSE-ConnectionGUID: rwdsKen5QSmG6BVksJ1a6A==
X-CSE-MsgGUID: jHISwFrnSUi4OVj1yOFSNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18383235"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18383235"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:09:00 -0700
X-CSE-ConnectionGUID: tLgSA2iIRpaxLYMl3+JeTg==
X-CSE-MsgGUID: 6npZsqe6TomJnevNIPCMtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38373859"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:09:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 21/27] lib/xe/oa: Add xe_oa_data_reader to IGT lib
Date: Fri,  7 Jun 2024 13:08:41 -0700
Message-ID: <20240607200847.1964629-22-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
References: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

xe_oa_data_reader is used to interpret data recorded by xe_perf_recorder
and contains common functionality used by xe_perf_reader and applications
like gpuvis.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/meson.build            |   3 +
 lib/xe/xe_oa_data.h        | 101 ++++++++++
 lib/xe/xe_oa_data_reader.c | 369 +++++++++++++++++++++++++++++++++++++
 lib/xe/xe_oa_data_reader.h |  87 +++++++++
 4 files changed, 560 insertions(+)
 create mode 100644 lib/xe/xe_oa_data.h
 create mode 100644 lib/xe/xe_oa_data_reader.c
 create mode 100644 lib/xe/xe_oa_data_reader.h

diff --git a/lib/meson.build b/lib/meson.build
index 02b86a77ff..4d51402163 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -380,6 +380,7 @@ install_headers(
 xe_oa_files = [
   'igt_list.c',
   'xe/xe_oa.c',
+  'xe/xe_oa_data_reader.c',
 ]
 
 xe_oa_hardware = [
@@ -453,6 +454,8 @@ install_headers(
   'igt_list.h',
   'intel_chipset.h',
   'xe/xe_oa.h',
+  'xe/xe_oa_data.h',
+  'xe/xe_oa_data_reader.h',
   subdir : 'xe-oa'
 )
 
diff --git a/lib/xe/xe_oa_data.h b/lib/xe/xe_oa_data.h
new file mode 100644
index 0000000000..82d9019a9a
--- /dev/null
+++ b/lib/xe/xe_oa_data.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef XE_OA_DATA_H
+#define XE_OA_DATA_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#include <stdint.h>
+
+/* For now this enum is the same as i915 intel_perf_record_type/drm_i915_perf_record_type */
+enum intel_xe_perf_record_type {
+	/* An packet/record of OA data */
+	INTEL_XE_PERF_RECORD_TYPE_SAMPLE = 1,
+
+	/* Indicates one or more OA reports were not written by HW */
+	INTEL_XE_PERF_RECORD_OA_TYPE_REPORT_LOST,
+
+	/* An error occurred that resulted in all pending OA reports being lost */
+	INTEL_XE_PERF_RECORD_OA_TYPE_BUFFER_LOST,
+
+	INTEL_XE_PERF_RECORD_TYPE_VERSION,
+
+	/* intel_xe_perf_record_device_info */
+	INTEL_XE_PERF_RECORD_TYPE_DEVICE_INFO,
+
+	/* intel_xe_perf_record_device_topology */
+	INTEL_XE_PERF_RECORD_TYPE_DEVICE_TOPOLOGY,
+
+	/* intel_xe_perf_record_timestamp_correlation */
+	INTEL_XE_PERF_RECORD_TYPE_TIMESTAMP_CORRELATION,
+
+	INTEL_XE_PERF_RECORD_MAX /* non-ABI */
+};
+
+/* This structure cannot ever change. */
+struct intel_xe_perf_record_version {
+	/* Version of the xe-perf file recording format (effectively
+	 * versioning this file).
+	 */
+	uint32_t version;
+
+#define INTEL_XE_PERF_RECORD_VERSION (1)
+
+	uint32_t pad;
+} __attribute__((packed));
+
+struct intel_xe_perf_record_device_info {
+	/* Frequency of the timestamps in the records. */
+	uint64_t timestamp_frequency;
+
+	/* PCI ID */
+	uint32_t device_id;
+
+	/* Stepping */
+	uint32_t device_revision;
+
+	/* GT min/max frequencies */
+	uint32_t gt_min_frequency;
+	uint32_t gt_max_frequency;
+
+	/* Engine */
+	uint32_t engine_class;
+	uint32_t engine_instance;
+
+	/* enum intel_xe_oa_format_name */
+	uint32_t oa_format;
+
+	/* Metric set name */
+	char metric_set_name[256];
+
+	/* Configuration identifier */
+	char metric_set_uuid[40];
+
+	uint32_t pad;
+ } __attribute__((packed));
+
+/* Topology as filled by xe_fill_topology_info (variable length, aligned by
+ * the recorder). */
+struct intel_xe_perf_record_device_topology {
+	struct intel_xe_topology_info topology;
+};
+
+/* Timestamp correlation between CPU/GPU. */
+struct intel_xe_perf_record_timestamp_correlation {
+	/* In CLOCK_MONOTONIC */
+	uint64_t cpu_timestamp;
+
+	/* Engine timestamp associated with the OA unit */
+	uint64_t gpu_timestamp;
+} __attribute__((packed));
+
+#ifdef __cplusplus
+};
+#endif
+
+#endif /* XE_OA_DATA_H */
diff --git a/lib/xe/xe_oa_data_reader.c b/lib/xe/xe_oa_data_reader.c
new file mode 100644
index 0000000000..b463f63c45
--- /dev/null
+++ b/lib/xe/xe_oa_data_reader.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <assert.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include <xe_drm.h>
+
+#include "intel_chipset.h"
+#include "xe_oa.h"
+#include "xe_oa_data_reader.h"
+
+#define MAX(a,b) ((a) > (b) ? (a) : (b))
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
+static inline bool
+oa_report_ctx_is_valid(const struct intel_xe_perf_devinfo *devinfo,
+		       const uint8_t *_report)
+{
+	const uint32_t *report = (const uint32_t *) _report;
+
+	if (devinfo->graphics_ver < 8)
+		return false; /* TODO */
+	if (devinfo->graphics_ver >= 12)
+		return true; /* Always valid */
+	if (devinfo->graphics_ver == 8)
+		return report[0] & (1ul << 25);
+	if (devinfo->graphics_ver > 8)
+		return report[0] & (1ul << 16);
+
+	return false;
+}
+
+static uint32_t
+oa_report_ctx_id(struct intel_xe_perf_data_reader *reader, const uint8_t *report)
+{
+	if (!oa_report_ctx_is_valid(&reader->devinfo, report))
+		return 0xffffffff;
+
+	if (reader->metric_set->perf_oa_format == XE_OA_FORMAT_PEC64u64)
+		return ((const uint32_t *) report)[4];
+	else
+		return ((const uint32_t *) report)[2];
+}
+
+static void
+append_record(struct intel_xe_perf_data_reader *reader,
+	      const struct intel_xe_perf_record_header *header)
+{
+	if (reader->n_records >= reader->n_allocated_records) {
+		reader->n_allocated_records = MAX(100, 2 * reader->n_allocated_records);
+		reader->records =
+			(const struct intel_xe_perf_record_header **)
+			realloc((void *) reader->records,
+				reader->n_allocated_records *
+				sizeof(struct intel_xe_perf_record_header *));
+		assert(reader->records);
+	}
+
+	reader->records[reader->n_records++] = header;
+}
+
+static void
+append_timestamp_correlation(struct intel_xe_perf_data_reader *reader,
+			     const struct intel_xe_perf_record_timestamp_correlation *corr)
+{
+	if (reader->n_correlations >= reader->n_allocated_correlations) {
+		reader->n_allocated_correlations = MAX(100, 2 * reader->n_allocated_correlations);
+		reader->correlations =
+			(const struct intel_xe_perf_record_timestamp_correlation **)
+			realloc((void *) reader->correlations,
+				reader->n_allocated_correlations *
+				sizeof(*reader->correlations));
+		assert(reader->correlations);
+	}
+
+	reader->correlations[reader->n_correlations++] = corr;
+}
+
+static struct intel_xe_perf_metric_set *
+find_metric_set(struct intel_xe_perf *perf, const char *symbol_name)
+{
+	struct intel_xe_perf_metric_set *metric_set;
+
+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
+		if (!strcmp(symbol_name, metric_set->symbol_name))
+			return metric_set;
+	}
+
+	return NULL;
+}
+
+static bool
+parse_data(struct intel_xe_perf_data_reader *reader)
+{
+	const struct intel_xe_perf_record_device_info *record_info;
+	const struct intel_xe_perf_record_device_topology *record_topology;
+	const uint8_t *end = reader->mmap_data + reader->mmap_size;
+	const uint8_t *iter = reader->mmap_data;
+
+	while (iter < end) {
+		const struct intel_xe_perf_record_header *header =
+			(const struct intel_xe_perf_record_header *) iter;
+
+		switch (header->type) {
+		case INTEL_XE_PERF_RECORD_TYPE_SAMPLE:
+			append_record(reader, header);
+			break;
+
+		case INTEL_XE_PERF_RECORD_OA_TYPE_REPORT_LOST:
+		case INTEL_XE_PERF_RECORD_OA_TYPE_BUFFER_LOST:
+			assert(header->size == sizeof(*header));
+			break;
+
+		case INTEL_XE_PERF_RECORD_TYPE_VERSION: {
+			struct intel_xe_perf_record_version *version =
+				(struct intel_xe_perf_record_version*) (header + 1);
+			if (version->version != INTEL_XE_PERF_RECORD_VERSION) {
+				snprintf(reader->error_msg, sizeof(reader->error_msg),
+					 "Unsupported recording version (%u, expected %u)",
+					 version->version, INTEL_XE_PERF_RECORD_VERSION);
+				return false;
+			}
+			break;
+		}
+
+		case INTEL_XE_PERF_RECORD_TYPE_DEVICE_INFO: {
+			reader->record_info = header + 1;
+			assert(header->size == (sizeof(struct intel_xe_perf_record_device_info) +
+						sizeof(*header)));
+			break;
+		}
+
+		case INTEL_XE_PERF_RECORD_TYPE_DEVICE_TOPOLOGY: {
+			reader->record_topology = header + 1;
+			break;
+		}
+
+		case INTEL_XE_PERF_RECORD_TYPE_TIMESTAMP_CORRELATION: {
+			append_timestamp_correlation(reader,
+						     (const struct intel_xe_perf_record_timestamp_correlation *) (header + 1));
+			break;
+		}
+		}
+
+		iter += header->size;
+	}
+
+	if (!reader->record_info ||
+	    !reader->record_topology) {
+		snprintf(reader->error_msg, sizeof(reader->error_msg),
+			 "Invalid file, missing device or topology info");
+		return false;
+	}
+
+	record_info = reader->record_info;
+	record_topology = reader->record_topology;
+
+	reader->perf = intel_xe_perf_for_devinfo(record_info->device_id,
+						 record_info->device_revision,
+						 record_info->timestamp_frequency,
+						 record_info->gt_min_frequency,
+						 record_info->gt_max_frequency,
+						 &record_topology->topology);
+	if (!reader->perf) {
+		snprintf(reader->error_msg, sizeof(reader->error_msg),
+			 "Recording occured on unsupported device (0x%x)",
+			 record_info->device_id);
+		return false;
+	}
+
+	reader->devinfo = reader->perf->devinfo;
+
+	reader->metric_set_name = record_info->metric_set_name;
+	reader->metric_set_uuid = record_info->metric_set_uuid;
+	reader->metric_set = find_metric_set(reader->perf, record_info->metric_set_name);
+
+	return true;
+}
+
+static uint64_t
+correlate_gpu_timestamp(struct intel_xe_perf_data_reader *reader,
+			uint64_t gpu_ts)
+{
+	/* OA reports only have the lower 32bits of the timestamp
+	 * register, while our correlation data has the whole 36bits.
+	 * Try to figure what portion of the correlation data the
+	 * 32bit timestamp belongs to.
+	 */
+	uint64_t mask = reader->perf->devinfo.oa_timestamp_mask;
+	int corr_idx = -1;
+
+	/* On some OA formats, gpu_ts is a 64 bit value and the shift can
+	 * result in bit[31] being set. This throws off the correlation and the
+	 * timelines. Apply the mask on gpu_ts as well.
+	 */
+	gpu_ts = gpu_ts & mask;
+
+	for (uint32_t i = 0; i < reader->n_correlation_chunks; i++) {
+		if (gpu_ts >= (reader->correlation_chunks[i].gpu_ts_begin & mask) &&
+		    gpu_ts <= (reader->correlation_chunks[i].gpu_ts_end & mask)) {
+			corr_idx = reader->correlation_chunks[i].idx;
+			break;
+		}
+	}
+
+	/* Not found? Assume prior to the first timestamp correlation.
+	 */
+	if (corr_idx < 0) {
+		return reader->correlations[0]->cpu_timestamp -
+			((reader->correlations[0]->gpu_timestamp & mask) - gpu_ts) *
+			(reader->correlations[1]->cpu_timestamp - reader->correlations[0]->cpu_timestamp) /
+			(reader->correlations[1]->gpu_timestamp - reader->correlations[0]->gpu_timestamp);
+	}
+
+	for (uint32_t i = corr_idx; i < (reader->n_correlations - 1); i++) {
+		if (gpu_ts >= (reader->correlations[i]->gpu_timestamp & mask) &&
+		    gpu_ts < (reader->correlations[i + 1]->gpu_timestamp & mask)) {
+			return reader->correlations[i]->cpu_timestamp +
+				(gpu_ts - (reader->correlations[i]->gpu_timestamp & mask)) *
+				(reader->correlations[i + 1]->cpu_timestamp - reader->correlations[i]->cpu_timestamp) /
+				(reader->correlations[i + 1]->gpu_timestamp - reader->correlations[i]->gpu_timestamp);
+		}
+	}
+
+	/* This is a bit harsh, but the recording tool should ensure we have
+	 * sampling points on either side of the bag of OA reports.
+	 */
+	assert(0);
+}
+
+static void
+append_timeline_event(struct intel_xe_perf_data_reader *reader,
+		      uint64_t ts_start, uint64_t ts_end,
+		      uint32_t record_start, uint32_t record_end,
+		      uint32_t hw_id)
+{
+	if (reader->n_timelines >= reader->n_allocated_timelines) {
+		reader->n_allocated_timelines = MAX(100, 2 * reader->n_allocated_timelines);
+		reader->timelines =
+			(struct intel_xe_perf_timeline_item *)
+			realloc((void *) reader->timelines,
+				reader->n_allocated_timelines *
+				sizeof(*reader->timelines));
+		assert(reader->timelines);
+	}
+
+	reader->timelines[reader->n_timelines].ts_start = ts_start;
+	reader->timelines[reader->n_timelines].ts_end = ts_end;
+	reader->timelines[reader->n_timelines].cpu_ts_start =
+		correlate_gpu_timestamp(reader, ts_start);
+	reader->timelines[reader->n_timelines].cpu_ts_end =
+		correlate_gpu_timestamp(reader, ts_end);
+	reader->timelines[reader->n_timelines].record_start = record_start;
+	reader->timelines[reader->n_timelines].record_end = record_end;
+	reader->timelines[reader->n_timelines].hw_id = hw_id;
+	reader->n_timelines++;
+}
+
+static void
+generate_cpu_events(struct intel_xe_perf_data_reader *reader)
+{
+	uint32_t last_header_idx = 0;
+	const struct intel_xe_perf_record_header *last_header = reader->records[0],
+		*current_header = reader->records[0];
+	const uint8_t *start_report, *end_report;
+	uint32_t last_ctx_id, current_ctx_id;
+	uint64_t gpu_ts_start, gpu_ts_end;
+
+	for (uint32_t i = 1; i < reader->n_records; i++) {
+		current_header = reader->records[i];
+
+		start_report = (const uint8_t *) (last_header + 1);
+		end_report = (const uint8_t *) (current_header + 1);
+
+		last_ctx_id = oa_report_ctx_id(reader, start_report);
+		current_ctx_id = oa_report_ctx_id(reader, end_report);
+
+		gpu_ts_start = intel_xe_perf_read_record_timestamp(reader->perf,
+								reader->metric_set,
+								last_header);
+		gpu_ts_end = intel_xe_perf_read_record_timestamp(reader->perf,
+							      reader->metric_set,
+							      current_header);
+
+		if (last_ctx_id == current_ctx_id)
+			continue;
+
+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, i, last_ctx_id);
+
+		last_header = current_header;
+		last_header_idx = i;
+	}
+
+	if (last_header != current_header)
+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, reader->n_records - 1, last_ctx_id);
+}
+
+static void
+compute_correlation_chunks(struct intel_xe_perf_data_reader *reader)
+{
+	uint64_t mask = ~(0xffffffff);
+	uint32_t last_idx = 0;
+	uint64_t last_ts = reader->correlations[last_idx]->gpu_timestamp;
+
+	for (uint32_t i = 0; i < reader->n_correlations; i++) {
+		if (!reader->n_correlation_chunks ||
+		    (last_ts & mask) != (reader->correlations[i]->gpu_timestamp & mask)) {
+			assert(reader->n_correlation_chunks < ARRAY_SIZE(reader->correlation_chunks));
+			reader->correlation_chunks[reader->n_correlation_chunks].gpu_ts_begin = last_ts;
+			reader->correlation_chunks[reader->n_correlation_chunks].gpu_ts_end = last_ts | ~mask;
+			reader->correlation_chunks[reader->n_correlation_chunks].idx = last_idx;
+			last_ts = reader->correlation_chunks[reader->n_correlation_chunks].gpu_ts_end + 1;
+			last_idx = i;
+			reader->n_correlation_chunks++;
+		}
+	}
+}
+
+bool
+intel_xe_perf_data_reader_init(struct intel_xe_perf_data_reader *reader,
+			       int perf_file_fd)
+{
+	struct stat st;
+	if (fstat(perf_file_fd, &st) != 0) {
+		snprintf(reader->error_msg, sizeof(reader->error_msg),
+			 "Unable to access file (%s)", strerror(errno));
+		return false;
+	}
+
+	memset(reader, 0, sizeof(*reader));
+
+	reader->mmap_size = st.st_size;
+	reader->mmap_data = (const uint8_t *) mmap(NULL, st.st_size,
+						   PROT_READ, MAP_PRIVATE,
+						   perf_file_fd, 0);
+	if (reader->mmap_data == MAP_FAILED) {
+		snprintf(reader->error_msg, sizeof(reader->error_msg),
+			 "Unable to access file (%s)", strerror(errno));
+		return false;
+	}
+
+	if (!parse_data(reader))
+		return false;
+
+	compute_correlation_chunks(reader);
+	generate_cpu_events(reader);
+
+	return true;
+}
+
+void
+intel_xe_perf_data_reader_fini(struct intel_xe_perf_data_reader *reader)
+{
+	intel_xe_perf_free(reader->perf);
+	free(reader->records);
+	free(reader->timelines);
+	free(reader->correlations);
+	munmap((void *)reader->mmap_data, reader->mmap_size);
+}
diff --git a/lib/xe/xe_oa_data_reader.h b/lib/xe/xe_oa_data_reader.h
new file mode 100644
index 0000000000..dcb734bab8
--- /dev/null
+++ b/lib/xe/xe_oa_data_reader.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef XE_OA_DATA_READER_H
+#define XE_OA_DATA_READER_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/* Helper to read a xe-perf recording. */
+
+#include <stdbool.h>
+#include <stdint.h>
+
+#include "xe_oa_data.h"
+
+struct intel_xe_perf_timeline_item {
+	uint64_t ts_start;
+	uint64_t ts_end;
+	uint64_t cpu_ts_start;
+	uint64_t cpu_ts_end;
+
+	/* Offsets into intel_xe_perf_data_reader.records */
+	uint32_t record_start;
+	uint32_t record_end;
+
+	uint32_t hw_id;
+
+	/* User associated data with a given item on the xe perf
+	 * timeline.
+	 */
+	void *user_data;
+};
+
+struct intel_xe_perf_data_reader {
+	/* Array of pointers into the mmapped xe perf file. */
+	const struct intel_xe_perf_record_header **records;
+	uint32_t n_records;
+	uint32_t n_allocated_records;
+
+	/**/
+	struct intel_xe_perf_timeline_item *timelines;
+	uint32_t n_timelines;
+	uint32_t n_allocated_timelines;
+
+	/**/
+	const struct intel_xe_perf_record_timestamp_correlation **correlations;
+	uint32_t n_correlations;
+	uint32_t n_allocated_correlations;
+
+	struct {
+		uint64_t gpu_ts_begin;
+		uint64_t gpu_ts_end;
+		uint32_t idx;
+	} correlation_chunks[4];
+	uint32_t n_correlation_chunks;
+
+	const char *metric_set_uuid;
+	const char *metric_set_name;
+
+	struct intel_xe_perf_devinfo devinfo;
+
+	struct intel_xe_perf *perf;
+	struct intel_xe_perf_metric_set *metric_set;
+
+	char error_msg[256];
+
+	/**/
+	const void *record_info;
+	const void *record_topology;
+
+	const uint8_t *mmap_data;
+	size_t mmap_size;
+};
+
+bool intel_xe_perf_data_reader_init(struct intel_xe_perf_data_reader *reader,
+				    int perf_file_fd);
+void intel_xe_perf_data_reader_fini(struct intel_xe_perf_data_reader *reader);
+
+#ifdef __cplusplus
+};
+#endif
+
+#endif /* XE_OA_DATA_READER_H */
-- 
2.41.0

