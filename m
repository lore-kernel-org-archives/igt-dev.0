Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC88410E73A
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 23:01:03 +0000 (UTC)
Date: Mon, 10 Oct 2022 16:00:58 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Y0SkKvyv5i41d4Du@unerlige-ril>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
 <20221010214215.5378-31-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010214215.5378-31-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 30/36] lib/i915/perf: add a raw
 timestamp utility
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

On Mon, Oct 10, 2022 at 09:42:09PM +0000, Umesh Nerlige Ramappa wrote:
>From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>Helpful to figure out the bitshifting needed in OA timestamp.
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/i915/perf.c                    | 21 +++++++++++++++++++++
> lib/i915/perf.h                    |  4 ++++
> tools/i915-perf/i915_perf_reader.c |  7 +++++++
> 3 files changed, 32 insertions(+)
>
>diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>index 298e4d0e..b5c69d95 100644
>--- a/lib/i915/perf.c
>+++ b/lib/i915/perf.c
>@@ -810,3 +810,24 @@ uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
>
>        return ts;
> }
>+
>+uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
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
>index ef2a3029..bd6b96f5 100644
>--- a/lib/i915/perf.h
>+++ b/lib/i915/perf.h
>@@ -344,6 +344,10 @@ uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
> 					  const struct intel_perf_metric_set *metric_set,
> 					  const struct drm_i915_perf_record_header *record);
>
>+uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
>+					      const struct intel_perf_metric_set *metric_set,
>+					      const struct drm_i915_perf_record_header *record);
>+
> #ifdef __cplusplus
> };
> #endif
>diff --git a/tools/i915-perf/i915_perf_reader.c b/tools/i915-perf/i915_perf_reader.c
>index 92e43c19..9be1a9fc 100644
>--- a/tools/i915-perf/i915_perf_reader.c
>+++ b/tools/i915-perf/i915_perf_reader.c
>@@ -252,6 +252,13 @@ main(int argc, char *argv[])
> 		intel_perf_read_record_timestamp(reader.perf,
> 						 reader.metric_set,
> 						 reader.records[reader.n_records - 1]));
>+	fprintf(stdout, "OA raw data timestamp range:           0x%016"PRIx64"-0x%016"PRIx64"\n",
>+		intel_perf_read_record_timestamp_raw(reader.perf,
>+						     reader.metric_set,
>+						     reader.records[0]),
>+		intel_perf_read_record_timestamp_raw(reader.perf,
>+						     reader.metric_set,
>+						     reader.records[reader.n_records - 1]));
>
> 	if (strcmp(reader.metric_set_uuid, reader.metric_set->hw_config_guid)) {
> 		fprintf(stdout,
>-- 
>2.25.1
>
