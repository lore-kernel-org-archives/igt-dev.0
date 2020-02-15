Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB7A6E89F
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2020 01:11:20 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Fri, 14 Feb 2020 17:11:15 -0800
Message-Id: <20200215011115.5838-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200215011115.5838-1-umesh.nerlige.ramappa@intel.com>
References: <20200215011115.5838-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/i915/perf: Add i915 perf data reader
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Read perf OA records and correlate timestamps between the GPU and CPU.

v2: (Umesh)
- Add README on usage
- rebase fixes for igt_list

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf_data_reader.c | 330 ++++++++++++++++++++++++++++++++++++
 lib/i915/perf_data_reader.h | 103 +++++++++++
 lib/meson.build             |   2 +
 tools/i915-perf/README      |  70 ++++++++
 4 files changed, 505 insertions(+)
 create mode 100644 lib/i915/perf_data_reader.c
 create mode 100644 lib/i915/perf_data_reader.h
 create mode 100644 tools/i915-perf/README

diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
new file mode 100644
index 00000000..43683331
--- /dev/null
+++ b/lib/i915/perf_data_reader.c
@@ -0,0 +1,330 @@
+/*
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ */
+
+#include <assert.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "intel_chipset.h"
+#include "perf.h"
+#include "perf_data_reader.h"
+
+#define MAX(a,b) ((a) > (b) ? (a) : (b))
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
+static inline bool
+oa_report_ctx_is_valid(const struct intel_perf_devinfo *devinfo,
+		       const uint8_t *_report)
+{
+	const uint32_t *report = (const uint32_t *) _report;
+
+	if (devinfo->gen < 8) {
+		return false; /* TODO */
+	} else if (devinfo->gen == 8) {
+		return report[0] & (1ul << 25);
+	} else if (devinfo->gen > 8) {
+		return report[0] & (1ul << 16);
+	}
+
+	return false;
+}
+
+static uint32_t
+oa_report_ctx_id(const struct intel_perf_devinfo *devinfo, const uint8_t *report)
+{
+	if (!oa_report_ctx_is_valid(devinfo, report))
+		return 0xffffffff;
+	return ((const uint32_t *) report)[2];
+}
+
+static inline uint64_t
+oa_report_timestamp(const uint8_t *report)
+{
+	return ((const uint32_t *)report)[1];
+}
+
+static void
+append_record(struct intel_perf_data_reader *reader,
+	      const struct drm_i915_perf_record_header *header)
+{
+	if (reader->n_records >= reader->n_allocated_records) {
+		reader->n_allocated_records = MAX(100, 2 * reader->n_allocated_records);
+		reader->records =
+			(const struct drm_i915_perf_record_header **)
+			realloc((void *) reader->records,
+				reader->n_allocated_records *
+				sizeof(*reader->records));
+		assert(reader->records);
+	}
+
+	reader->records[reader->n_records++] = header;
+}
+
+static void
+append_timestamp_correlation(struct intel_perf_data_reader *reader,
+			     const struct intel_perf_record_timestamp_correlation *corr)
+{
+	if (reader->n_correlations >= reader->n_allocated_correlations) {
+		reader->n_allocated_correlations = MAX(100, 2 * reader->n_allocated_correlations);
+		reader->correlations =
+			(const struct intel_perf_record_timestamp_correlation **)
+			realloc((void *) reader->correlations,
+				reader->n_allocated_correlations *
+				sizeof(*reader->correlations));
+		assert(reader->correlations);
+	}
+
+	reader->correlations[reader->n_correlations++] = corr;
+}
+
+static struct intel_perf_metric_set *
+find_metric_set(struct intel_perf *perf, const char *uuid)
+{
+	struct intel_perf_metric_set *metric_set;
+
+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
+		if (!strcmp(uuid, metric_set->hw_config_guid))
+			return metric_set;
+	}
+
+	return NULL;
+}
+
+static void
+init_devinfo(struct intel_perf_devinfo *perf_devinfo,
+	     const struct intel_device_info *devinfo,
+	     uint32_t devid,
+	     uint64_t timestamp_frequency)
+{
+	perf_devinfo->devid = devid;
+	perf_devinfo->gen = devinfo->gen;
+	perf_devinfo->timestamp_frequency = timestamp_frequency;
+}
+
+static bool
+parse_data(struct intel_perf_data_reader *reader)
+{
+	const uint8_t *end = reader->mmap_data + reader->mmap_size;
+	const uint8_t *iter = reader->mmap_data;
+	while (iter < end) {
+		const struct drm_i915_perf_record_header *header =
+			(const struct drm_i915_perf_record_header *) iter;
+
+		switch (header->type) {
+		case DRM_I915_PERF_RECORD_SAMPLE:
+			append_record(reader, header);
+			break;
+
+		case DRM_I915_PERF_RECORD_OA_REPORT_LOST:
+		case DRM_I915_PERF_RECORD_OA_BUFFER_LOST:
+			assert(header->size == sizeof(*header));
+			break;
+
+		case INTEL_PERF_RECORD_TYPE_DEVICE_INFO: {
+			const struct intel_device_info *devinfo;
+
+			reader->record_info =
+				(const struct intel_perf_record_device_info *) (header + 1);
+			assert(header->size == (sizeof(*reader->record_info) + sizeof(*header)));
+			devinfo = intel_get_device_info(reader->record_info->device_id);
+			if (!devinfo)
+				return false;
+			init_devinfo(&reader->devinfo, devinfo,
+				     reader->record_info->device_id,
+				     reader->record_info->timestamp_frequency);
+			reader->perf = intel_perf_for_devinfo(devinfo);
+			reader->metric_set = find_metric_set(reader->perf, reader->record_info->uuid);
+			break;
+		}
+
+		case INTEL_PERF_RECORD_TYPE_TIMESTAMP_CORRELATION: {
+			append_timestamp_correlation(reader,
+						     (const struct intel_perf_record_timestamp_correlation *) (header + 1));
+			break;
+		}
+		}
+
+		iter += header->size;
+	}
+
+	return true;
+}
+
+static uint64_t
+correlate_gpu_timestamp(struct intel_perf_data_reader *reader,
+			uint64_t gpu_ts)
+{
+	/* OA reports only have the lower 32bits of the timestamp
+	 * register, while our correlation data has the whole 36bits.
+	 * Try to figure what portion of the correlation data the
+	 * 32bit timestamp belongs to.
+	 */
+	uint64_t mask = 0xffffffff;
+	int corr_idx = -1;
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
+append_timeline_event(struct intel_perf_data_reader *reader,
+		      uint64_t ts_start, uint64_t ts_end,
+		      uint32_t record_start, uint32_t record_end,
+		      uint32_t hw_id)
+{
+	if (reader->n_timelines >= reader->n_allocated_timelines) {
+		reader->n_allocated_timelines = MAX(100, 2 * reader->n_allocated_timelines);
+		reader->timelines =
+			(struct intel_perf_timeline_item *)
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
+generate_cpu_events(struct intel_perf_data_reader *reader)
+{
+	uint32_t last_header_idx = 0;
+	const struct drm_i915_perf_record_header *last_header = reader->records[0];
+
+	for (uint32_t i = 1; i < reader->n_records; i++) {
+		const struct drm_i915_perf_record_header *current_header =
+			reader->records[i];
+		const uint8_t *start_report = (const uint8_t *) (last_header + 1),
+			*end_report = (const uint8_t *) (current_header + 1);
+		uint32_t last_ctx_id = oa_report_ctx_id(&reader->devinfo, start_report),
+			current_ctx_id = oa_report_ctx_id(&reader->devinfo, end_report);
+		uint64_t gpu_ts_start = oa_report_timestamp(start_report),
+			gpu_ts_end = oa_report_timestamp(end_report);
+
+		if (last_ctx_id == current_ctx_id)
+			continue;
+
+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, i, last_ctx_id);
+
+		last_header = current_header;
+		last_header_idx = i;
+	}
+}
+
+static void
+compute_correlation_chunks(struct intel_perf_data_reader *reader)
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
+intel_perf_data_reader_init(struct intel_perf_data_reader *reader,
+			    int perf_file_fd)
+{
+        struct stat st;
+        if (fstat(perf_file_fd, &st) != 0)
+		return false;
+
+	memset(reader, 0, sizeof(*reader));
+
+	reader->mmap_size = st.st_size;
+	reader->mmap_data = (const uint8_t *) mmap(NULL, st.st_size,
+						   PROT_READ, MAP_PRIVATE,
+						   perf_file_fd, 0);
+	if (reader->mmap_data == MAP_FAILED)
+		return false;
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
+intel_perf_data_reader_fini(struct intel_perf_data_reader *reader)
+{
+	intel_perf_free(reader->perf);
+	free(reader->records);
+	free(reader->timelines);
+	free(reader->correlations);
+	munmap((void *)reader->mmap_data, reader->mmap_size);
+}
diff --git a/lib/i915/perf_data_reader.h b/lib/i915/perf_data_reader.h
new file mode 100644
index 00000000..f75e96dd
--- /dev/null
+++ b/lib/i915/perf_data_reader.h
@@ -0,0 +1,103 @@
+/*
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ */
+
+#ifndef PERF_DATA_READER_H
+#define PERF_DATA_READER_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/* Helper to read a i915-perf recording. */
+
+#include <stdbool.h>
+#include <stdint.h>
+
+#include <i915_drm.h>
+
+#include "perf.h"
+#include "perf_data.h"
+
+struct intel_device_info;
+
+struct intel_perf_timeline_item {
+	uint64_t ts_start;
+	uint64_t ts_end;
+	uint64_t cpu_ts_start;
+	uint64_t cpu_ts_end;
+
+	/* Offsets into intel_perf_data_reader.records */
+	uint32_t record_start;
+	uint32_t record_end;
+
+	uint32_t hw_id;
+
+	/* User associated data with a given item on the i915 perf
+	 * timeline.
+	 */
+	void *user_data;
+};
+
+struct intel_perf_data_reader {
+	/* Array of pointers into the mmapped i915 perf file. */
+	const struct drm_i915_perf_record_header **records;
+	uint32_t n_records;
+	uint32_t n_allocated_records;
+
+	/**/
+	struct intel_perf_timeline_item *timelines;
+	uint32_t n_timelines;
+	uint32_t n_allocated_timelines;
+
+	/**/
+	const struct intel_perf_record_timestamp_correlation **correlations;
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
+	/**/
+	const struct intel_perf_record_device_info *record_info;
+
+	struct intel_perf_devinfo devinfo;
+
+	struct intel_perf *perf;
+	struct intel_perf_metric_set *metric_set;
+
+	const uint8_t *mmap_data;
+	size_t mmap_size;
+};
+
+bool intel_perf_data_reader_init(struct intel_perf_data_reader *reader,
+				 int perf_file_fd);
+void intel_perf_data_reader_fini(struct intel_perf_data_reader *reader);
+
+#ifdef __cplusplus
+};
+#endif
+
+#endif /* PERF_DATA_READER_H */
diff --git a/lib/meson.build b/lib/meson.build
index 6e935d45..f241bff7 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -173,6 +173,7 @@ lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 
 i915_perf_files = [
   'i915/perf.c',
+  'i915/perf_data_reader.c',
 ]
 
 i915_perf_hardware = [
@@ -218,6 +219,7 @@ install_headers(
   'intel_chipset.h',
   'i915/perf.h',
   'i915/perf_data.h',
+  'i915/perf_data_reader.h',
   subdir : 'i915-perf'
 )
 
diff --git a/tools/i915-perf/README b/tools/i915-perf/README
new file mode 100644
index 00000000..e9822345
--- /dev/null
+++ b/tools/i915-perf/README
@@ -0,0 +1,70 @@
+======================
+i915 perf tools for OA
+======================
+
+The tools provided here enable capturing performance metrics from the i915
+driver and are used in conjunction with the GPUvis software here - 
+
+https://github.com/mikesart/gpuvis
+
+Tools in IGT
+------------
+
+The following tools are generated in build/tools/i915-perf
+
+i915-perf-configs
+i915-perf-control
+i915-perf-recorder
+
+Usage in IGT
+------------
+
+Just launching i915-perf-recorder with no argument will list all available
+metrics. Once installed, the igt recorder tool can be used to record metrics in
+a circular buffer. Example below shows capture of RenderBasic metrics with an
+8Mb circular buffer.
+
+i915-perf-recorder -m RenderBasic -s 8192
+
+The circular buffer can be dumped at a given location from another terminal
+using the i915-perf-control tool :
+
+i915-perf-control -d /tmp/recording.perf
+ 
+Integration with GPUvis
+-----------------------
+
+GPUvis provides sample scripts in gpuvis/sample directory that can be modified
+and used to capture the metrics required.
+
+1. Setup the recording by launching the following scripts from gpuvis/sample
+   directory : 
+
+        trace-cmd-setup.sh
+        trace-cmd-start-tracing.sh
+
+This will setup a recording in a circular buffer.
+ 
+2. Start using the system for a specific task you want to record.
+
+3. Once the task is completed, save the circular buffer into a capture file with
+   the following script :
+
+        trace-cmd-capture.sh
+ 
+4. Once finished, tear down the circular buffer recording with :
+
+        trace-cmd-stop-tracing.sh
+
+Inspecting data captured in GPUvis
+----------------------------------
+ 
+The capture script will generate 2 files for instance : 
+
+        trace_09-26-2019_01-22-40.dat
+        trace_09-26-2019_01-22-40.i915-dat
+
+The first one contains ftrace data, the other i915-perf data. To inspect the
+data launch gpuvis with the 2 files as arguments :
+
+        gpuvis trace_09-26-2019_01-22-40.dat trace_09-26-2019_01-22-40.i915-dat
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
