Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962376E12B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 20:07:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Aug 2021 13:07:35 -0700
Message-Id: <20210803200737.30843-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
References: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/5] lib/i915/perf: Add new record for mmaped OA
 buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

DRM_I915_PERF_RECORD_SAMPLE header is added by i915 when user issues a
read to read the counter reports from the OA buffer. When user mmaps the
OA buffer, user has a view into the raw reports without this header.

Introduce INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE in the perf library to
track reports from an mmapped OA buffer.

While each DRM_I915_PERF_RECORD_SAMPLE record corresponds to a single OA
report, INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE corresponds to multiple
OA reports.

By design, these 2 record types cannot be mixed. The i915-perf-recorder
chooses to use mmaped OA buffer using the -M option. Once -M is chosen,
all samples are INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE.

The way timeline events are created and displayed in GPUvis remains
the same, the only change is that the source of these events now is
multiple INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE records.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c                    |  7 ++-
 lib/i915/perf.h                    |  4 +-
 lib/i915/perf_data.h               |  3 +
 lib/i915/perf_data_reader.c        | 95 +++++++++++++++++++++++++++++-
 lib/i915/perf_data_reader.h        |  2 +
 tools/i915-perf/i915_perf_reader.c |  3 +-
 6 files changed, 106 insertions(+), 8 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 9cfa3bca..3ace687c 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -626,10 +626,11 @@ accumulate_uint40(int a_index,
 void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
 				   int oa_format,
 				   const struct drm_i915_perf_record_header *record0,
-				   const struct drm_i915_perf_record_header *record1)
+				   const struct drm_i915_perf_record_header *record1,
+				   uint32_t offset0, uint32_t offset1)
 {
-	const uint32_t *start = (const uint32_t *)(record0 + 1);
-	const uint32_t *end = (const uint32_t *)(record1 + 1);
+	const uint32_t *start = (const uint32_t *)(record0 + 1) + (offset0 / 4);
+	const uint32_t *end = (const uint32_t *)(record1 + 1) + (offset1 / 4);
 	uint64_t *deltas = acc->deltas;
 	int idx = 0;
 	int i;
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index d2429c47..7706eb43 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -238,7 +238,9 @@ void intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd);
 void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
 				   int oa_format,
 				   const struct drm_i915_perf_record_header *record0,
-				   const struct drm_i915_perf_record_header *record1);
+				   const struct drm_i915_perf_record_header *record1,
+				   uint32_t report_start_offset,
+				   uint32_t report_end_offset);
 
 #ifdef __cplusplus
 };
diff --git a/lib/i915/perf_data.h b/lib/i915/perf_data.h
index fb3556f6..a730a0b4 100644
--- a/lib/i915/perf_data.h
+++ b/lib/i915/perf_data.h
@@ -52,6 +52,9 @@ enum intel_perf_record_type {
 
 	/* intel_perf_record_timestamp_correlation */
 	INTEL_PERF_RECORD_TYPE_TIMESTAMP_CORRELATION,
+
+	/* intel_perf_record_timestamp_correlation */
+	INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE,
 };
 
 /* This structure cannot ever change. */
diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index e69189ac..ad0b2daf 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -131,6 +131,7 @@ parse_data(struct intel_perf_data_reader *reader)
 
 		switch (header->type) {
 		case DRM_I915_PERF_RECORD_SAMPLE:
+		case INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE:
 			append_record(reader, header);
 			break;
 
@@ -254,6 +255,7 @@ static void
 append_timeline_event(struct intel_perf_data_reader *reader,
 		      uint64_t ts_start, uint64_t ts_end,
 		      uint32_t record_start, uint32_t record_end,
+		      uint32_t start_offset, uint32_t end_offset,
 		      uint32_t hw_id)
 {
 	if (reader->n_timelines >= reader->n_allocated_timelines) {
@@ -274,12 +276,81 @@ append_timeline_event(struct intel_perf_data_reader *reader,
 		correlate_gpu_timestamp(reader, ts_end);
 	reader->timelines[reader->n_timelines].record_start = record_start;
 	reader->timelines[reader->n_timelines].record_end = record_end;
+	reader->timelines[reader->n_timelines].report_start_offset = start_offset;
+	reader->timelines[reader->n_timelines].report_end_offset = end_offset;
 	reader->timelines[reader->n_timelines].hw_id = hw_id;
 	reader->n_timelines++;
 }
 
+struct perf_record_report {
+	uint32_t record_idx;
+	uint32_t report_offset;
+	uint32_t ctx_id;
+	uint64_t gpu_ts;
+};
+
 static void
-generate_cpu_events(struct intel_perf_data_reader *reader)
+__init_perf_record_report(struct intel_perf_data_reader *reader,
+			  struct perf_record_report *prr)
+{
+	const struct drm_i915_perf_record_header *record;
+	const uint8_t *report;
+
+	record = reader->records[prr->record_idx];
+	report = (const uint8_t *)(record + 1) + prr->report_offset;
+	prr->ctx_id = oa_report_ctx_id(&reader->devinfo, report);
+	prr->gpu_ts = oa_report_timestamp(report);
+}
+
+static bool
+__context_switched(struct intel_perf_data_reader *reader,
+		   struct perf_record_report *prev,
+		   struct perf_record_report *curr)
+{
+	__init_perf_record_report(reader, prev);
+	__init_perf_record_report(reader, curr);
+
+	return (prev->ctx_id != curr->ctx_id);
+}
+
+static void
+append_timeline(struct intel_perf_data_reader *reader,
+		struct perf_record_report *prev,
+		struct perf_record_report *curr)
+{
+	append_timeline_event(reader, prev->gpu_ts, curr->gpu_ts,
+			prev->record_idx, curr->record_idx,
+			prev->report_offset, curr->report_offset,
+			prev->ctx_id);
+}
+
+static void
+generate_cpu_events_multi_sample(struct intel_perf_data_reader *reader)
+{
+	uint32_t report_size = reader->metric_set->perf_raw_size;
+	struct perf_record_report prev = {0}, curr = {0};
+	int i;
+
+	for (i = 0; i < reader->n_records; i++) {
+		uint32_t length = reader->records[i]->size -
+				  sizeof(*(reader->records[i]));
+
+		curr.record_idx = i;
+		for (curr.report_offset = 0;
+		     curr.report_offset < length;
+		     curr.report_offset += report_size)
+			if (__context_switched(reader, &prev, &curr)) {
+				append_timeline(reader, &prev, &curr);
+				prev = curr;
+			}
+	}
+
+	if (!memcmp(&prev, &curr, sizeof(prev)))
+		append_timeline(reader, &prev, &curr);
+}
+
+static void
+generate_cpu_events_oa_sample(struct intel_perf_data_reader *reader)
 {
 	uint32_t last_header_idx = 0;
 	const struct drm_i915_perf_record_header *last_header = reader->records[0],
@@ -303,14 +374,32 @@ generate_cpu_events(struct intel_perf_data_reader *reader)
 		if (last_ctx_id == current_ctx_id)
 			continue;
 
-		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, i, last_ctx_id);
+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end,
+				      last_header_idx, i,
+				      0, 0,
+				      last_ctx_id);
 
 		last_header = current_header;
 		last_header_idx = i;
 	}
 
 	if (last_header != current_header)
-		append_timeline_event(reader, gpu_ts_start, gpu_ts_end, last_header_idx, reader->n_records - 1, last_ctx_id);
+		append_timeline_event(reader, gpu_ts_start, gpu_ts_end,
+				      last_header_idx, reader->n_records - 1,
+				      0, 0,
+				      last_ctx_id);
+}
+
+static void
+generate_cpu_events(struct intel_perf_data_reader *reader)
+{
+	const struct drm_i915_perf_record_header *hdr = reader->records[0];
+
+	if (hdr->type == DRM_I915_PERF_RECORD_SAMPLE)
+		generate_cpu_events_oa_sample(reader);
+
+	if (hdr->type == INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE)
+		generate_cpu_events_multi_sample(reader);
 }
 
 static void
diff --git a/lib/i915/perf_data_reader.h b/lib/i915/perf_data_reader.h
index f625f12d..a9f14a1d 100644
--- a/lib/i915/perf_data_reader.h
+++ b/lib/i915/perf_data_reader.h
@@ -44,6 +44,8 @@ struct intel_perf_timeline_item {
 	/* Offsets into intel_perf_data_reader.records */
 	uint32_t record_start;
 	uint32_t record_end;
+	uint32_t report_start_offset;
+	uint32_t report_end_offset;
 
 	uint32_t hw_id;
 
diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
index e51f5a5d..12638685 100644
--- a/tools/i915-perf/i915_perf_reader.c
+++ b/tools/i915-perf/i915_perf_reader.c
@@ -252,7 +252,8 @@ main(int argc, char *argv[])
 			item->hw_id, item->hw_id == 0xffffffff ? "(idle)" : "");
 
 		intel_perf_accumulate_reports(&accu, reader.metric_set->perf_oa_format,
-					      i915_report0, i915_report1);
+					      i915_report0, i915_report1,
+					      item->report_start_offset, item->report_end_offset);
 
 		for (uint32_t c = 0; c < n_counters; c++) {
 			struct intel_perf_logical_counter *counter = counters[c];
-- 
2.20.1
