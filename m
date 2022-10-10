Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6F110E73A
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 22:52:20 +0000 (UTC)
Date: Mon, 10 Oct 2022 15:52:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Y0SiECRbV6qDIeOH@unerlige-ril>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
 <20221010214215.5378-22-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010214215.5378-22-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 21/36] lib/i915/perf: store bit
 shifting required for OA timestamps
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

some nits, but lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Umesh

On Mon, Oct 10, 2022 at 09:42:00PM +0000, Umesh Nerlige Ramappa wrote:
>From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>Some new platforms have the OA timestamps shifted to the right by a
>number of bits. This is configurable but since i915 appears to leave
>the default values, let's just hardcode this in the device info.
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>---
> lib/i915/perf.c                    | 31 +++++++++++++++++++++++++-----
> lib/i915/perf.h                    | 18 ++++++++++++++++-
> lib/i915/perf_data_reader.c        |  2 +-
> lib/meson.build                    |  4 ++--
> tools/i915-perf/i915_perf_reader.c |  3 ++-
> 5 files changed, 48 insertions(+), 10 deletions(-)
>
>diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>index 82f08b36..05730d64 100644
>--- a/lib/i915/perf.c
>+++ b/lib/i915/perf.c
>@@ -208,6 +208,10 @@ intel_perf_for_devinfo(uint32_t device_id,
> 	/* Valid on most generations except Gen9LP. */
> 	perf->devinfo.eu_threads_count = 7;
>
>+	/* Most platforms have full 32bit timestamps. */
>+	perf->devinfo.oa_timestamp_mask = 0xffffffff;
>+	perf->devinfo.oa_timestamp_shift = 0;
>+
> 	if (devinfo->is_haswell) {
> 		intel_perf_load_metrics_hsw(perf);
> 	} else if (devinfo->is_broadwell) {
>@@ -663,7 +667,8 @@ accumulate_uint40(int a_index,
> }
>
> void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
>-				   int oa_format,
>+				   const struct intel_perf *perf,
>+				   const struct intel_perf_metric_set *metric_set,
> 				   const struct drm_i915_perf_record_header *record0,
> 				   const struct drm_i915_perf_record_header *record1)
> {
>@@ -675,9 +680,13 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
>
> 	memset(acc, 0, sizeof(*acc));
>
>-	switch (oa_format) {
>+	switch (metric_set->perf_oa_format) {
> 	case I915_OA_FORMAT_A24u40_A14u32_B8_C8:
>-		accumulate_uint32(start + 1, end + 1, deltas + idx++); /* timestamp */
>+		/* timestamp */
>+		if (perf->devinfo.oa_timestamp_shift >= 0)
>+			deltas[idx++] += (end[1] - start[1]) << perf->devinfo.oa_timestamp_shift;
>+		else
>+			deltas[idx++] += (end[1] - start[1]) >> (-perf->devinfo.oa_timestamp_shift);

I am guessing the negative numbers are used to shift right and positive 
for shift left.

> 		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
>
> 		/* 4x 32bit A0-3 counters... */
>@@ -710,7 +719,10 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
>
> 	case I915_OAR_FORMAT_A32u40_A4u32_B8_C8:
> 	case I915_OA_FORMAT_A32u40_A4u32_B8_C8:
>-		accumulate_uint32(start + 1, end + 1, deltas + idx++); /* timestamp */
>+		if (perf->devinfo.oa_timestamp_shift >= 0)
>+			deltas[idx++] += (end[1] - start[1]) << perf->devinfo.oa_timestamp_shift;
>+		else
>+			deltas[idx++] += (end[1] - start[1]) >> (-perf->devinfo.oa_timestamp_shift);

These could use a helper ^.

> 		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
>
> 		/* 32x 40bit A counters... */
>@@ -727,7 +739,11 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
> 		break;
>
> 	case I915_OA_FORMAT_A45_B8_C8:
>-		accumulate_uint32(start + 1, end + 1, deltas); /* timestamp */
>+		/* timestamp */
>+		if (perf->devinfo.oa_timestamp_shift >= 0)
>+			deltas[0] += (end[1] - start[1]) << perf->devinfo.oa_timestamp_shift;
>+		else
>+			deltas[0] += (end[1] - start[1]) >> (-perf->devinfo.oa_timestamp_shift);
>
> 		for (i = 0; i < 61; i++)
> 			accumulate_uint32(start + 3 + i, end + 3 + i, deltas + 1 + i);
>@@ -756,5 +772,10 @@ uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
>                assert(0);
>        }
>
>+       if (perf->devinfo.oa_timestamp_shift >= 0)
>+	       ts <<= perf->devinfo.oa_timestamp_shift;
>+       else
>+	       ts >>= -perf->devinfo.oa_timestamp_shift;
>+
>        return ts;
> }
>diff --git a/lib/i915/perf.h b/lib/i915/perf.h
>index e3848b7e..6803c149 100644
>--- a/lib/i915/perf.h
>+++ b/lib/i915/perf.h
>@@ -52,6 +52,21 @@ struct intel_perf_devinfo {
> 	uint32_t devid;
> 	uint32_t graphics_ver;
> 	uint32_t revision;
>+	/**
>+	 * Bit shifting required to put OA report timestamps into
>+	 * timestamp_frequency (some HW generations can shift
>+	 * timestamp values to the right by a number of bits).
>+	 */
>+	int32_t  oa_timestamp_shift;
>+	/**
>+	 * On some platforms only part of the timestamp bits are valid
>+	 * (on previous platforms we would get full 32bits, newer
>+	 * platforms can have fewer). It's important to know when
>+	 * correlating the full 36bits timestamps to the OA report
>+	 * timestamps.
>+	 */
>+	uint64_t  oa_timestamp_mask;
>+	/* Frequency of the timestamps in Hz */
> 	uint64_t timestamp_frequency;
> 	uint64_t gt_min_freq;
> 	uint64_t gt_max_freq;
>@@ -236,7 +251,8 @@ void intel_perf_add_metric_set(struct intel_perf *perf,
> void intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd);
>
> void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
>-				   int oa_format,
>+				   const struct intel_perf *perf,
>+				   const struct intel_perf_metric_set *metric_set,
> 				   const struct drm_i915_perf_record_header *record0,
> 				   const struct drm_i915_perf_record_header *record1);
>
>diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
>index 4d1efe92..fcdd5ed1 100644
>--- a/lib/i915/perf_data_reader.c
>+++ b/lib/i915/perf_data_reader.c
>@@ -209,7 +209,7 @@ correlate_gpu_timestamp(struct intel_perf_data_reader *reader,
> 	 * Try to figure what portion of the correlation data the
> 	 * 32bit timestamp belongs to.
> 	 */
>-	uint64_t mask = 0xffffffff;
>+	uint64_t mask = reader->perf->devinfo.oa_timestamp_mask;
> 	int corr_idx = -1;
>
> 	for (uint32_t i = 0; i < reader->n_correlation_chunks; i++) {
>diff --git a/lib/meson.build b/lib/meson.build
>index 2e5adbae..b51cf23c 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -308,7 +308,7 @@ lib_igt_i915_perf_build = shared_library(
>   dependencies: lib_igt_chipset,
>   include_directories : inc,
>   install: true,
>-  soversion: '1')
>+  soversion: '1.4')
>
> lib_igt_i915_perf = declare_dependency(
>   link_with : lib_igt_i915_perf_build,
>@@ -329,7 +329,7 @@ pkgconf.set('prefix', get_option('prefix'))
> pkgconf.set('exec_prefix', '${prefix}')
> pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
> pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
>-pkgconf.set('i915_perf_version', '1.3.0')
>+pkgconf.set('i915_perf_version', '1.4.0')
>
> configure_file(
>   input : 'i915-perf.pc.in',
>diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
>index afd8c39c..4a2e3df4 100644
>--- a/tools/i915-perf/i915_perf_reader.c
>+++ b/tools/i915-perf/i915_perf_reader.c
>@@ -271,7 +271,8 @@ main(int argc, char *argv[])
> 		fprintf(stdout, "hw_id=0x%x %s\n",
> 			item->hw_id, item->hw_id == 0xffffffff ? "(idle)" : "");
>
>-		intel_perf_accumulate_reports(&accu, reader.metric_set->perf_oa_format,
>+		intel_perf_accumulate_reports(&accu,
>+					      reader.perf, reader.metric_set,
> 					      i915_report0, i915_report1);
>
> 		for (uint32_t c = 0; c < n_counters; c++) {
>-- 
>2.25.1
>
