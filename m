Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C72E10E1E6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 20:07:19 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Oct 2022 20:07:03 +0000
Message-Id: <20221025200709.83314-24-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
References: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 23/29] tools/i915-perf: printout CPU clock used
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

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 72011c87..f8f9b737 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -588,6 +588,17 @@ static uint64_t timespec_diff(struct timespec *begin,
 
 static clock_t correlation_clock_id = CLOCK_MONOTONIC;
 
+static const char *
+get_correlation_clock_name(clock_t clock_id)
+{
+  switch (clock_id) {
+  case CLOCK_BOOTTIME:      return "bootime";
+  case CLOCK_MONOTONIC:     return "monotonic";
+  case CLOCK_MONOTONIC_RAW: return "monotonic_raw";
+  default:                  return "*unknown*";
+  }
+}
+
 static bool
 get_correlation_timestamps(struct intel_perf_record_timestamp_correlation *corr, int drm_fd)
 {
@@ -1069,6 +1080,9 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
+	fprintf(stdout, "Using correlation clock: %s\n",
+		get_correlation_clock_name(correlation_clock_id));
+
 	ctx.oa_exponent = oa_exponent_for_period(ctx.oa_timestamp_frequency, perf_period);
 	fprintf(stdout, "Opening perf stream with metric_id=%"PRIu64" oa_exponent=%u oa_format=%u\n",
 		ctx.metric_set->perf_oa_metrics_set, ctx.oa_exponent,
-- 
2.25.1
