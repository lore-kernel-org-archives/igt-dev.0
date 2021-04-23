Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948F96EB50
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:59 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:44 +0300
Message-Id: <20210423074444.175199-9-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/8] tools/i915-perf-recorder: print out oa
 format
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

Just so that we can tell how the HW is configured.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index adc41c29f..3a8ee46a4 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -1001,8 +1001,9 @@ main(int argc, char *argv[])
 	}
 
 	ctx.oa_exponent = oa_exponent_for_period(ctx.timestamp_frequency, perf_period);
-	fprintf(stdout, "Opening perf stream with metric_id=%"PRIu64" oa_exponent=%u\n",
-		ctx.metric_set->perf_oa_metrics_set, ctx.oa_exponent);
+	fprintf(stdout, "Opening perf stream with metric_id=%"PRIu64" oa_exponent=%u oa_format=%u\n",
+		ctx.metric_set->perf_oa_metrics_set, ctx.oa_exponent,
+		ctx.metric_set->perf_oa_format);
 
 	ctx.perf_fd = perf_open(&ctx);
 	if (ctx.perf_fd < 0) {
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
