Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B719E10E443
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 22:22:47 +0000 (UTC)
Date: Mon, 10 Oct 2022 15:22:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Y0SbJj53nMWMGgco@unerlige-ril>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
 <20221010214215.5378-21-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010214215.5378-21-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 20/36] lib/i915/perf: add a helper to
 read timestamps
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

On Mon, Oct 10, 2022 at 09:41:59PM +0000, Umesh Nerlige Ramappa wrote:
>From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>We expect location/size of the timestamp might move around in the
>report.
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Eventually I would think the i915 query (not yet upstreamed) will be 
used for correlation, but this still works for now.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh


>---
> lib/i915/perf.c                    | 21 +++++++++++++++++++++
> lib/i915/perf.h                    |  4 ++++
> lib/i915/perf_data_reader.c        | 14 ++++++--------
> lib/meson.build                    |  2 +-
> tools/i915-perf/i915_perf_reader.c | 20 ++++++++++++++++++++
> 5 files changed, 52 insertions(+), 9 deletions(-)
>
>diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>index d004313f..82f08b36 100644
>--- a/lib/i915/perf.c
>+++ b/lib/i915/perf.c
>@@ -737,3 +737,24 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
> 	}
>
> }
>+
>+uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
>+					  const struct intel_perf_metric_set *metric_set,
>+					  const struct drm_i915_perf_record_header *record)
>+{
>+       const uint32_t *report32 = (const uint32_t *)(record + 1);
>+       uint64_t ts;
>+
>+       switch (metric_set->perf_oa_format) {
>+       case I915_OA_FORMAT_A24u40_A14u32_B8_C8:
>+       case I915_OA_FORMAT_A32u40_A4u32_B8_C8:
>+       case I915_OA_FORMAT_A45_B8_C8:
>+               ts = report32[1];
>+               break;
>+
>+       default:
>+               assert(0);
>+       }
>+
>+       return ts;
>+}
>diff --git a/lib/i915/perf.h b/lib/i915/perf.h
>index d2429c47..e3848b7e 100644
>--- a/lib/i915/perf.h
>+++ b/lib/i915/perf.h
>@@ -240,6 +240,10 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
> 				   const struct drm_i915_perf_record_header *record0,
> 				   const struct drm_i915_perf_record_header *record1);
>
>+uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
>+					  const struct intel_perf_metric_set *metric_set,
>+					  const struct drm_i915_perf_record_header *record);
>+
> #ifdef __cplusplus
> };
> #endif
>diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
>index 857bcd3a..4d1efe92 100644
>--- a/lib/i915/perf_data_reader.c
>+++ b/lib/i915/perf_data_reader.c
>@@ -65,12 +65,6 @@ oa_report_ctx_id(const struct intel_perf_devinfo *devinfo, const uint8_t *report
> 	return ((const uint32_t *) report)[2];
> }
>
>-static inline uint64_t
>-oa_report_timestamp(const uint8_t *report)
>-{
>-	return ((const uint32_t *)report)[1];
>-}
>-
> static void
> append_record(struct intel_perf_data_reader *reader,
> 	      const struct drm_i915_perf_record_header *header)
>@@ -298,8 +292,12 @@ generate_cpu_events(struct intel_perf_data_reader *reader)
> 		last_ctx_id = oa_report_ctx_id(&reader->devinfo, start_report);
> 		current_ctx_id = oa_report_ctx_id(&reader->devinfo, end_report);
>
>-		gpu_ts_start = oa_report_timestamp(start_report);
>-		gpu_ts_end = oa_report_timestamp(end_report);
>+		gpu_ts_start = intel_perf_read_record_timestamp(reader->perf,
>+								reader->metric_set,
>+								last_header);
>+		gpu_ts_end = intel_perf_read_record_timestamp(reader->perf,
>+							      reader->metric_set,
>+							      current_header);
>
> 		if (last_ctx_id == current_ctx_id)
> 			continue;
>diff --git a/lib/meson.build b/lib/meson.build
>index 98c2803b..2e5adbae 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -329,7 +329,7 @@ pkgconf.set('prefix', get_option('prefix'))
> pkgconf.set('exec_prefix', '${prefix}')
> pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
> pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
>-pkgconf.set('i915_perf_version', '1.2.0')
>+pkgconf.set('i915_perf_version', '1.3.0')
>
> configure_file(
>   input : 'i915-perf.pc.in',
>diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
>index e51f5a5d..afd8c39c 100644
>--- a/tools/i915-perf/i915_perf_reader.c
>+++ b/tools/i915-perf/i915_perf_reader.c
>@@ -230,6 +230,26 @@ main(int argc, char *argv[])
> 	fprintf(stdout, "Context switches: %u\n", reader.n_timelines);
> 	fprintf(stdout, "Timestamp correlation points: %u\n", reader.n_correlations);
>
>+	if (reader.n_correlations < 2) {
>+		fprintf(stderr, "Less than 2 CPU/GPU timestamp correlation points.\n");
>+		return EXIT_FAILURE;
>+	}
>+
>+	fprintf(stdout, "Timestamp correlation CPU range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		reader.correlations[0]->cpu_timestamp,
>+		reader.correlations[reader.n_correlations - 1]->cpu_timestamp);
>+	fprintf(stdout, "Timestamp correlation GPU range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		reader.correlations[0]->gpu_timestamp,
>+		reader.correlations[reader.n_correlations - 1]->gpu_timestamp);
>+
>+	fprintf(stdout, "OA data timestamp range: 0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		intel_perf_read_record_timestamp(reader.perf,
>+						 reader.metric_set,
>+						 reader.records[0]),
>+		intel_perf_read_record_timestamp(reader.perf,
>+						 reader.metric_set,
>+						 reader.records[reader.n_records - 1]));
>+
> 	if (strcmp(reader.metric_set_uuid, reader.metric_set->hw_config_guid)) {
> 		fprintf(stdout,
> 			"WARNING: Recording used a different HW configuration.\n"
>-- 
>2.25.1
>
