Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ACB10E24B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 20:07:18 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Oct 2022 20:06:58 +0000
Message-Id: <20221025200709.83314-19-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
References: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 18/29] lib/i915/perf: add a helper to read
 timestamps
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

We expect location/size of the timestamp might move around in the
report.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c                    | 21 +++++++++++++++++++++
 lib/i915/perf.h                    |  4 ++++
 lib/i915/perf_data_reader.c        | 14 ++++++--------
 lib/meson.build                    |  4 ++--
 tools/i915-perf/i915_perf_reader.c | 20 ++++++++++++++++++++
 5 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index cc7dceea..f7aff13a 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -839,3 +839,24 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
 	}
 
 }
+
+uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
+					  const struct intel_perf_metric_set *metric_set,
+					  const struct drm_i915_perf_record_header *record)
+{
+       const uint32_t *report32 = (const uint32_t *)(record + 1);
+       uint64_t ts;
+
+       switch (metric_set->perf_oa_format) {
+       case I915_OA_FORMAT_A24u40_A14u32_B8_C8:
+       case I915_OA_FORMAT_A32u40_A4u32_B8_C8:
+       case I915_OA_FORMAT_A45_B8_C8:
+               ts = report32[1];
+               break;
+
+       default:
+               assert(0);
+       }
+
+       return ts;
+}
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 4091feb9..88a36ebe 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -324,6 +324,10 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
 				   const struct drm_i915_perf_record_header *record0,
 				   const struct drm_i915_perf_record_header *record1);
 
+uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
+					  const struct intel_perf_metric_set *metric_set,
+					  const struct drm_i915_perf_record_header *record);
+
 #ifdef __cplusplus
 };
 #endif
diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index 857bcd3a..4d1efe92 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -65,12 +65,6 @@ oa_report_ctx_id(const struct intel_perf_devinfo *devinfo, const uint8_t *report
 	return ((const uint32_t *) report)[2];
 }
 
-static inline uint64_t
-oa_report_timestamp(const uint8_t *report)
-{
-	return ((const uint32_t *)report)[1];
-}
-
 static void
 append_record(struct intel_perf_data_reader *reader,
 	      const struct drm_i915_perf_record_header *header)
@@ -298,8 +292,12 @@ generate_cpu_events(struct intel_perf_data_reader *reader)
 		last_ctx_id = oa_report_ctx_id(&reader->devinfo, start_report);
 		current_ctx_id = oa_report_ctx_id(&reader->devinfo, end_report);
 
-		gpu_ts_start = oa_report_timestamp(start_report);
-		gpu_ts_end = oa_report_timestamp(end_report);
+		gpu_ts_start = intel_perf_read_record_timestamp(reader->perf,
+								reader->metric_set,
+								last_header);
+		gpu_ts_end = intel_perf_read_record_timestamp(reader->perf,
+							      reader->metric_set,
+							      current_header);
 
 		if (last_ctx_id == current_ctx_id)
 			continue;
diff --git a/lib/meson.build b/lib/meson.build
index 50ffd8cd..747889b9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -321,7 +321,7 @@ lib_igt_i915_perf_build = shared_library(
   dependencies: lib_igt_chipset,
   include_directories : inc,
   install: true,
-  soversion: '1.3')
+  soversion: '1.4')
 
 lib_igt_i915_perf = declare_dependency(
   link_with : lib_igt_i915_perf_build,
@@ -342,7 +342,7 @@ pkgconf.set('prefix', get_option('prefix'))
 pkgconf.set('exec_prefix', '${prefix}')
 pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
 pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
-pkgconf.set('i915_perf_version', '1.3.0')
+pkgconf.set('i915_perf_version', '1.4.0')
 
 configure_file(
   input : 'i915-perf.pc.in',
diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
index e51f5a5d..afd8c39c 100644
--- a/tools/i915-perf/i915_perf_reader.c
+++ b/tools/i915-perf/i915_perf_reader.c
@@ -230,6 +230,26 @@ main(int argc, char *argv[])
 	fprintf(stdout, "Context switches: %u\n", reader.n_timelines);
 	fprintf(stdout, "Timestamp correlation points: %u\n", reader.n_correlations);
 
+	if (reader.n_correlations < 2) {
+		fprintf(stderr, "Less than 2 CPU/GPU timestamp correlation points.\n");
+		return EXIT_FAILURE;
+	}
+
+	fprintf(stdout, "Timestamp correlation CPU range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
+		reader.correlations[0]->cpu_timestamp,
+		reader.correlations[reader.n_correlations - 1]->cpu_timestamp);
+	fprintf(stdout, "Timestamp correlation GPU range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
+		reader.correlations[0]->gpu_timestamp,
+		reader.correlations[reader.n_correlations - 1]->gpu_timestamp);
+
+	fprintf(stdout, "OA data timestamp range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
+		intel_perf_read_record_timestamp(reader.perf,
+						 reader.metric_set,
+						 reader.records[0]),
+		intel_perf_read_record_timestamp(reader.perf,
+						 reader.metric_set,
+						 reader.records[reader.n_records - 1]));
+
 	if (strcmp(reader.metric_set_uuid, reader.metric_set->hw_config_guid)) {
 		fprintf(stdout,
 			"WARNING: Recording used a different HW configuration.\n"
-- 
2.25.1
