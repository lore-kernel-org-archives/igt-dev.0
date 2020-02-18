Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0A66EADA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 22:56:48 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 19 Feb 2020 00:56:20 +0200
Message-Id: <20200218225620.668212-7-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200218225620.668212-1-lionel.g.landwerlin@intel.com>
References: <20200218225620.668212-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 6/6] tools: add i915-perf-reader
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reading & printing out data recorded with i915-perf-recorder.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/perf.c                    |  73 ++++++++
 lib/i915/perf.h                    |  11 ++
 tools/i915-perf/i915_perf_reader.c | 279 +++++++++++++++++++++++++++++
 tools/i915-perf/meson.build        |   6 +
 4 files changed, 369 insertions(+)
 create mode 100644 tools/i915-perf/i915_perf_reader.c

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 6c92fd02..9afdadc3 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -509,3 +509,76 @@ intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd)
 		load_metric_set_config(metric_set, drm_fd);
 	}
 }
+
+static void
+accumulate_uint32(const uint32_t *report0,
+                  const uint32_t *report1,
+                  uint64_t *deltas)
+{
+	*deltas += (uint32_t)(*report1 - *report0);
+}
+
+static void
+accumulate_uint40(int a_index,
+                  const uint32_t *report0,
+                  const uint32_t *report1,
+                  uint64_t *deltas)
+{
+	const uint8_t *high_bytes0 = (uint8_t *)(report0 + 40);
+	const uint8_t *high_bytes1 = (uint8_t *)(report1 + 40);
+	uint64_t high0 = (uint64_t)(high_bytes0[a_index]) << 32;
+	uint64_t high1 = (uint64_t)(high_bytes1[a_index]) << 32;
+	uint64_t value0 = report0[a_index + 4] | high0;
+	uint64_t value1 = report1[a_index + 4] | high1;
+	uint64_t delta;
+
+	if (value0 > value1)
+		delta = (1ULL << 40) + value1 - value0;
+	else
+		delta = value1 - value0;
+
+	*deltas += delta;
+}
+
+void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
+				   int oa_format,
+				   const struct drm_i915_perf_record_header *record0,
+				   const struct drm_i915_perf_record_header *record1)
+{
+	const uint32_t *start = (const uint32_t *)(record0 + 1);
+	const uint32_t *end = (const uint32_t *)(record1 + 1);
+	uint64_t *deltas = acc->deltas;
+	int idx = 0;
+	int i;
+
+	memset(acc, 0, sizeof(*acc));
+
+	switch (oa_format) {
+	case I915_OA_FORMAT_A32u40_A4u32_B8_C8:
+		accumulate_uint32(start + 1, end + 1, deltas + idx++); /* timestamp */
+		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
+
+		/* 32x 40bit A counters... */
+		for (i = 0; i < 32; i++)
+			accumulate_uint40(i, start, end, deltas + idx++);
+
+		/* 4x 32bit A counters... */
+		for (i = 0; i < 4; i++)
+			accumulate_uint32(start + 36 + i, end + 36 + i, deltas + idx++);
+
+		/* 8x 32bit B counters + 8x 32bit C counters... */
+		for (i = 0; i < 16; i++)
+			accumulate_uint32(start + 48 + i, end + 48 + i, deltas + idx++);
+		break;
+
+	case I915_OA_FORMAT_A45_B8_C8:
+		accumulate_uint32(start + 1, end + 1, deltas); /* timestamp */
+
+		for (i = 0; i < 61; i++)
+			accumulate_uint32(start + 3 + i, end + 3 + i, deltas + 1 + i);
+		break;
+	default:
+		assert(0);
+	}
+
+}
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 246d06cf..00ac2f6f 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -114,6 +114,11 @@ typedef enum {
 	INTEL_PERF_LOGICAL_COUNTER_UNIT_MAX
 } intel_perf_logical_counter_unit_t;
 
+/* Hold deltas of raw performance counters. */
+struct intel_perf_accumulator {
+#define INTEL_PERF_MAX_RAW_OA_COUNTERS 62
+	uint64_t deltas[INTEL_PERF_MAX_RAW_OA_COUNTERS];
+};
 
 struct intel_perf;
 struct intel_perf_metric_set;
@@ -202,6 +207,7 @@ struct intel_perf {
 	struct intel_perf_devinfo devinfo;
 };
 
+struct drm_i915_perf_record_header;
 struct drm_i915_query_topology_info;
 
 struct intel_perf *intel_perf_for_fd(int drm_fd);
@@ -222,6 +228,11 @@ void intel_perf_add_metric_set(struct intel_perf *perf,
 
 void intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd);
 
+void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
+				   int oa_format,
+				   const struct drm_i915_perf_record_header *record0,
+				   const struct drm_i915_perf_record_header *record1);
+
 #ifdef __cplusplus
 };
 #endif
diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
new file mode 100644
index 00000000..fd944b45
--- /dev/null
+++ b/tools/i915-perf/i915_perf_reader.c
@@ -0,0 +1,279 @@
+/*
+ * Copyright (C) 2020 Intel Corporation
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
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include <i915_drm.h>
+
+#include "i915/perf.h"
+#include "i915/perf_data_reader.h"
+
+#define MAX(a,b) ((a) > (b) ? (a) : (b))
+#define MIN(a,b) ((a) > (b) ? (b) : (a))
+
+static void
+usage(void)
+{
+	printf("Usage: i915-perf-reader [options] file\n"
+	       "Reads the content of an i915-perf recording.\n"
+	       "\n"
+	       "     --help,    -h             Print this screen\n"
+	       "     --counters, -c c1,c2,...  List of counters to display values for.\n"
+	       "                               Use 'all' to display all counters.\n"
+	       "                               Use 'list' to list available counters.\n");
+}
+
+static struct intel_perf_logical_counter *
+find_counter(struct intel_perf_metric_set *metric_set,
+	     const char *name)
+{
+	for (uint32_t i = 0; i < metric_set->n_counters; i++) {
+		if (!strcmp(name, metric_set->counters[i].symbol_name)) {
+			return &metric_set->counters[i];
+		}
+	}
+
+	return NULL;
+}
+
+static void
+append_counter(struct intel_perf_logical_counter ***counters,
+	       int32_t *n_counters,
+	       uint32_t *n_allocated_counters,
+	       struct intel_perf_logical_counter *counter)
+{
+	if (*n_counters < *n_allocated_counters) {
+		(*counters)[(*n_counters)++] = counter;
+		return;
+	}
+
+	*n_allocated_counters = MAX(2, *n_allocated_counters * 2);
+	*counters = realloc(*counters,
+			    sizeof(struct intel_perf_logical_counter *) *
+			    (*n_allocated_counters));
+	(*counters)[(*n_counters)++] = counter;
+}
+
+static struct intel_perf_logical_counter **
+get_logical_counters(struct intel_perf_metric_set *metric_set,
+		     const char *counter_list,
+		     int32_t *out_n_counters)
+{
+	struct intel_perf_logical_counter **counters = NULL, *counter;
+	uint32_t n_allocated_counters = 0;
+	const char *current, *next;
+	char counter_name[100];
+
+	if (!counter_list) {
+		*out_n_counters = 0;
+		return NULL;
+	}
+
+	if (!strcmp(counter_list, "list")) {
+		uint32_t longest_name = 0;
+
+		*out_n_counters = -1;
+		for (uint32_t i = 0; i < metric_set->n_counters; i++) {
+			longest_name = MAX(longest_name,
+					   strlen(metric_set->counters[i].symbol_name));
+		}
+
+		fprintf(stdout, "Available counters:\n");
+		for (uint32_t i = 0; i < metric_set->n_counters; i++) {
+			fprintf(stdout, "%s:%*s%s\n",
+				metric_set->counters[i].symbol_name,
+				(int)(longest_name -
+				      strlen(metric_set->counters[i].symbol_name) + 1), " ",
+				metric_set->counters[i].name);
+		}
+		return NULL;
+	}
+
+	if (!strcmp(counter_list, "all")) {
+		counters = malloc(sizeof(*counters) * metric_set->n_counters);
+		*out_n_counters = metric_set->n_counters;
+		for (uint32_t i = 0; i < metric_set->n_counters; i++)
+			counters[i] = &metric_set->counters[i];
+		return counters;
+	}
+
+	*out_n_counters = 0;
+	current = counter_list;
+	while ((next = strstr(current, ","))) {
+		snprintf(counter_name,
+			 MIN((uint32_t)(next - current) + 1, sizeof(counter_name)),
+			 "%s", current);
+
+		counter = find_counter(metric_set, counter_name);
+		if (!counter) {
+			fprintf(stderr, "Unknown counter '%s'.\n", counter_name);
+			free(counters);
+			*out_n_counters = -1;
+			return NULL;
+		}
+
+		append_counter(&counters, out_n_counters, &n_allocated_counters, counter);
+
+		current = next + 1;
+	}
+
+	if (strlen(current) > 0) {
+		counter = find_counter(metric_set, current);
+		if (!counter) {
+			fprintf(stderr, "Unknown counter '%s'.\n", current);
+			free(counters);
+			*out_n_counters = -1;
+			return NULL;
+		}
+
+		append_counter(&counters, out_n_counters, &n_allocated_counters, counter);
+	}
+
+	return counters;
+}
+
+int
+main(int argc, char *argv[])
+{
+	const struct option long_options[] = {
+		{"help",             no_argument, 0, 'h'},
+		{"counters",   required_argument, 0, 'c'},
+		{0, 0, 0, 0}
+	};
+	struct intel_perf_data_reader reader;
+	struct intel_perf_logical_counter **counters;
+	const char *counter_names = NULL;
+	int32_t n_counters;
+	int fd, opt;
+
+	while ((opt = getopt_long(argc, argv, "hc:", long_options, NULL)) != -1) {
+		switch (opt) {
+		case 'h':
+			usage();
+			return EXIT_SUCCESS;
+		case 'c':
+			counter_names = optarg;
+			break;
+		default:
+			fprintf(stderr, "Internal error: "
+				"unexpected getopt value: %d\n", opt);
+			usage();
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (optind >= argc) {
+		fprintf(stderr, "No recording file specified.\n");
+		return EXIT_FAILURE;
+	}
+
+	fd = open(argv[optind], 0, O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "Cannot open '%s': %s.\n",
+			argv[optind], strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	if (!intel_perf_data_reader_init(&reader, fd)) {
+		fprintf(stderr, "Unable to parse '%s': %s.\n",
+			argv[optind], reader.error_msg);
+		return EXIT_FAILURE;
+	}
+
+	counters = get_logical_counters(reader.metric_set, counter_names, &n_counters);
+	if (n_counters < 0)
+		goto exit;
+
+	fprintf(stdout, "Recorded on device=0x%x gen=%i\n",
+		reader.devinfo.devid, reader.devinfo.gen);
+	fprintf(stdout, "Metric used : %s (%s) uuid=%s\n",
+		reader.metric_set->symbol_name, reader.metric_set->name,
+		reader.metric_set->hw_config_guid);
+	fprintf(stdout, "Reports: %u\n", reader.n_records);
+	fprintf(stdout, "Context switches: %u\n", reader.n_timelines);
+	fprintf(stdout, "Timestamp correlation points: %u\n", reader.n_correlations);
+
+	if (strcmp(reader.metric_set_uuid, reader.metric_set->hw_config_guid)) {
+		fprintf(stdout,
+			"WARNING: Recording used a different HW configuration.\n"
+			"WARNING: This could lead to inconsistent counter values.\n");
+	}
+
+	for (uint32_t i = 0; i < reader.n_timelines; i++) {
+		const struct intel_perf_timeline_item *item = &reader.timelines[i];
+		const struct drm_i915_perf_record_header *i915_report0 =
+			reader.records[item->record_start];
+		const struct drm_i915_perf_record_header *i915_report1 =
+			reader.records[item->record_end];
+		struct intel_perf_accumulator accu;
+
+		fprintf(stdout, "Time: CPU=0x%016" PRIx64 "-0x%016" PRIx64
+			" GPU=0x%016" PRIx64 "-0x%016" PRIx64"\n",
+			item->cpu_ts_start, item->cpu_ts_end,
+			item->ts_start, item->ts_end);
+		fprintf(stdout, "hw_id=0x%x %s\n",
+			item->hw_id, item->hw_id == 0xffffffff ? "(idle)" : "");
+
+		intel_perf_accumulate_reports(&accu, reader.metric_set->perf_oa_format,
+					      i915_report0, i915_report1);
+
+		for (uint32_t c = 0; c < n_counters; c++) {
+			struct intel_perf_logical_counter *counter = counters[c];
+
+			switch (counter->storage) {
+			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_UINT64:
+			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_UINT32:
+			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_BOOL32:
+				fprintf(stdout, "   %s: %" PRIu64 "\n",
+					counter->symbol_name, counter->read_uint64(reader.perf,
+										   reader.metric_set,
+										   accu.deltas));
+				break;
+			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_DOUBLE:
+			case INTEL_PERF_LOGICAL_COUNTER_STORAGE_FLOAT:
+				fprintf(stdout, "   %s: %f\n",
+					counter->symbol_name, counter->read_float(reader.perf,
+										  reader.metric_set,
+										  accu.deltas));
+				break;
+			}
+		}
+	}
+
+ exit:
+	intel_perf_data_reader_fini(&reader);
+	close(fd);
+
+	return EXIT_SUCCESS;
+}
diff --git a/tools/i915-perf/meson.build b/tools/i915-perf/meson.build
index 9884dfd9..bc2d8f39 100644
--- a/tools/i915-perf/meson.build
+++ b/tools/i915-perf/meson.build
@@ -14,3 +14,9 @@ executable('i915-perf-control',
            [ 'i915_perf_control.c' ],
            include_directories: inc,
            install: true)
+
+executable('i915-perf-reader',
+           [ 'i915_perf_reader.c' ],
+           include_directories: inc,
+           dependencies: lib_igt_i915_perf,
+           install: true)
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
