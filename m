Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D3910E8EE
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 19:53:05 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Oct 2022 19:52:50 +0000
Message-Id: <20221028195258.106453-21-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
References: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 20/28] tools/i915-perf-recorder: capture
 OA & CS frequencies
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

CS & OA timestamp don't have the same accuracy, so we need to adjuste
the correlated timestamps (capture from the CS unit) in the recording
to fit the data in the OA reports.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 43 ++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 7ced7b40..72011c87 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -328,7 +328,7 @@ perf_ioctl(int fd, unsigned long request, void *arg)
 }
 
 static uint64_t
-get_device_timestamp_frequency(const struct intel_device_info *devinfo, int drm_fd)
+get_device_cs_timestamp_frequency(const struct intel_device_info *devinfo, int drm_fd)
 {
 	drm_i915_getparam_t gp;
 	int timestamp_frequency;
@@ -352,12 +352,44 @@ get_device_timestamp_frequency(const struct intel_device_info *devinfo, int drm_
 	return 12000000;
 }
 
+static uint64_t
+get_device_oa_timestamp_frequency(const struct intel_device_info *devinfo, int drm_fd)
+{
+	drm_i915_getparam_t gp;
+	int timestamp_frequency;
+
+	gp.param = I915_PARAM_OA_TIMESTAMP_FREQUENCY;
+	gp.value = &timestamp_frequency;
+	if (perf_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp) == 0)
+		return timestamp_frequency;
+
+	gp.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY;
+	gp.value = &timestamp_frequency;
+	if (perf_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp) == 0)
+		return timestamp_frequency;
+
+
+	if (devinfo->graphics_ver > 9) {
+		fprintf(stderr, "Unable to query timestamp frequency from i915, please update kernel.\n");
+		return 0;
+	}
+
+	fprintf(stderr, "Warning: unable to query timestamp frequency from i915, guessing values...\n");
+
+	if (devinfo->graphics_ver <= 8)
+		return 12500000;
+	if (devinfo->is_broxton)
+		return 19200000;
+	return 12000000;
+}
+
 struct recording_context {
 	int drm_fd;
 	int perf_fd;
 
 	uint32_t devid;
-	uint64_t timestamp_frequency;
+	uint64_t oa_timestamp_frequency;
+	uint64_t cs_timestamp_frequency;
 
 	const struct intel_device_info *devinfo;
 
@@ -459,7 +491,7 @@ static bool
 write_header(FILE *output, struct recording_context *ctx)
 {
 	struct intel_perf_record_device_info info = {
-		.timestamp_frequency = ctx->timestamp_frequency,
+		.timestamp_frequency = ctx->oa_timestamp_frequency,
 		.device_id = ctx->perf->devinfo.devid,
 		.device_revision = ctx->perf->devinfo.revision,
 		.gt_min_frequency = ctx->perf->devinfo.gt_min_freq,
@@ -964,7 +996,8 @@ main(int argc, char *argv[])
 
 	intel_perf_load_perf_configs(ctx.perf, ctx.drm_fd);
 
-	ctx.timestamp_frequency = get_device_timestamp_frequency(ctx.devinfo, ctx.drm_fd);
+	ctx.oa_timestamp_frequency = get_device_oa_timestamp_frequency(ctx.devinfo, ctx.drm_fd);
+	ctx.cs_timestamp_frequency = get_device_cs_timestamp_frequency(ctx.devinfo, ctx.drm_fd);
 
 	signal(SIGINT, sigint_handler);
 
@@ -1036,7 +1069,7 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
-	ctx.oa_exponent = oa_exponent_for_period(ctx.timestamp_frequency, perf_period);
+	ctx.oa_exponent = oa_exponent_for_period(ctx.oa_timestamp_frequency, perf_period);
 	fprintf(stdout, "Opening perf stream with metric_id=%"PRIu64" oa_exponent=%u oa_format=%u\n",
 		ctx.metric_set->perf_oa_metrics_set, ctx.oa_exponent,
 		ctx.metric_set->perf_oa_format);
-- 
2.25.1
