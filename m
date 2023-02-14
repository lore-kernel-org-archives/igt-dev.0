Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8862F10E9A9
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:16 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 13:00:04 -0800
Message-Id: <20230214210007.2026033-28-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 27/30] lib/perf: Add support for MPEC format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support in perf library for MPEC formats.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c             | 38 +++++++++++++++++++++++++++++++++++++
 lib/i915/perf_data_reader.c | 14 +++++++++-----
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 24ef3819..d736490b 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -915,6 +915,34 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
 		for (i = 0; i < 61; i++)
 			accumulate_uint32(start + 3 + i, end + 3 + i, deltas + 1 + i);
 		break;
+
+	case I915_OAM_FORMAT_MPEC8u32_B8_C8: {
+		const uint64_t *start64 = (const uint64_t *)(record0 + 1);
+		const uint64_t *end64 = (const uint64_t *)(record1 + 1);
+
+		/* 64 bit timestamp */
+		if (perf->devinfo.oa_timestamp_shift >= 0)
+			deltas[idx++] += (end64[1] - start64[1]) << perf->devinfo.oa_timestamp_shift;
+		else
+			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
+
+		/* 64 bit clock */
+		deltas[idx++] = end64[3] - start64[3];
+
+		/* 8x 32bit MPEC counters */
+		for (i = 0; i < 8; i++)
+			accumulate_uint32(start + 8 + i, end + 8 + i, deltas + idx++);
+
+		/* 8x 32bit B counters */
+		for (i = 0; i < 8; i++)
+			accumulate_uint32(start + 16 + i, end + 16 + i, deltas + idx++);
+
+		/* 8x 32bit C counters */
+		for (i = 0; i < 8; i++)
+			accumulate_uint32(start + 24 + i, end + 24 + i, deltas + idx++);
+
+		break;
+		}
 	default:
 		assert(0);
 	}
@@ -926,6 +954,7 @@ uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
 					  const struct drm_i915_perf_record_header *record)
 {
        const uint32_t *report32 = (const uint32_t *)(record + 1);
+       const uint64_t *report64 = (const uint64_t *)(record + 1);
        uint64_t ts;
 
        switch (metric_set->perf_oa_format) {
@@ -935,6 +964,10 @@ uint64_t intel_perf_read_record_timestamp(const struct intel_perf *perf,
                ts = report32[1];
                break;
 
+       case I915_OAM_FORMAT_MPEC8u32_B8_C8:
+               ts = report64[1];
+               break;
+
        default:
                assert(0);
        }
@@ -952,6 +985,7 @@ uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
 					  const struct drm_i915_perf_record_header *record)
 {
        const uint32_t *report32 = (const uint32_t *)(record + 1);
+       const uint64_t *report64 = (const uint64_t *)(record + 1);
        uint64_t ts;
 
        switch (metric_set->perf_oa_format) {
@@ -961,6 +995,10 @@ uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
                ts = report32[1];
                break;
 
+       case I915_OAM_FORMAT_MPEC8u32_B8_C8:
+               ts = report64[1];
+               break;
+
        default:
                assert(0);
        }
diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index 10e78e63..332f530e 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -58,11 +58,15 @@ oa_report_ctx_is_valid(const struct intel_perf_devinfo *devinfo,
 }
 
 static uint32_t
-oa_report_ctx_id(const struct intel_perf_devinfo *devinfo, const uint8_t *report)
+oa_report_ctx_id(struct intel_perf_data_reader *reader, const uint8_t *report)
 {
-	if (!oa_report_ctx_is_valid(devinfo, report))
+	if (!oa_report_ctx_is_valid(&reader->devinfo, report))
 		return 0xffffffff;
-	return ((const uint32_t *) report)[2];
+
+	if (reader->metric_set->perf_oa_format == I915_OAM_FORMAT_MPEC8u32_B8_C8)
+		return ((const uint32_t *) report)[4];
+	else
+		return ((const uint32_t *) report)[2];
 }
 
 static void
@@ -289,8 +293,8 @@ generate_cpu_events(struct intel_perf_data_reader *reader)
 		start_report = (const uint8_t *) (last_header + 1);
 		end_report = (const uint8_t *) (current_header + 1);
 
-		last_ctx_id = oa_report_ctx_id(&reader->devinfo, start_report);
-		current_ctx_id = oa_report_ctx_id(&reader->devinfo, end_report);
+		last_ctx_id = oa_report_ctx_id(reader, start_report);
+		current_ctx_id = oa_report_ctx_id(reader, end_report);
 
 		gpu_ts_start = intel_perf_read_record_timestamp(reader->perf,
 								reader->metric_set,
-- 
2.36.1
