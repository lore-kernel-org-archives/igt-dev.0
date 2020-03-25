Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5DE6E83C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 21:50:06 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Wed, 25 Mar 2020 14:50:05 -0700
Message-Id: <20200325215005.5489-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200325215005.5489-1-umesh.nerlige.ramappa@intel.com>
References: <20200325215005.5489-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 3/3] tools: Allow user to set poll delay in i915
 perf recorder
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add poll delay parameter to the i915-perf-recorder tool so that the user
can set the frequency of the poll timer that checks for available
reports in the OA buffer.

v2:
- Change poll period parameter type to match kernel interface (Lionel)
- Update to use poll period in the code (Ashutosh)

v3:
- Change command line paramter to poll-period (Ashutosh)
- Fix the version check for the feature (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 38 +++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 6bbc451e..4d729b0e 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -353,14 +353,31 @@ struct recording_context {
 
 	const char *command_fifo;
 	int command_fifo_fd;
+
+	uint64_t poll_period;
 };
 
+static int
+perf_revision(int drm_fd)
+{
+	drm_i915_getparam_t gp;
+	int value = 1;
+
+	gp.param = I915_PARAM_PERF_REVISION;
+	gp.value = &value;
+	perf_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
+
+	return value;
+}
+
 static int
 perf_open(struct recording_context *ctx)
 {
 	uint64_t properties[DRM_I915_PERF_PROP_MAX * 2];
 	struct drm_i915_perf_open_param param;
-	int p = 0, stream_fd;
+	int p = 0, stream_fd, revision;
+
+	revision = perf_revision(ctx->drm_fd);
 
 	properties[p++] = DRM_I915_PERF_PROP_SAMPLE_OA;
 	properties[p++] = true;
@@ -374,6 +391,11 @@ perf_open(struct recording_context *ctx)
 	properties[p++] = DRM_I915_PERF_PROP_OA_EXPONENT;
 	properties[p++] = ctx->oa_exponent;
 
+	if (revision >= 5) {
+		properties[p++] = DRM_I915_PERF_PROP_POLL_OA_PERIOD;
+		properties[p++] = ctx->poll_period;
+	}
+
 	memset(&param, 0, sizeof(param));
 	param.flags = 0;
 	param.flags |= I915_PERF_FLAG_FD_CLOEXEC | I915_PERF_FLAG_FD_NONBLOCK;
@@ -720,7 +742,10 @@ usage(const char *name)
 		"                                       (To use with i915-perf-control)\n"
 		"     --output,             -o <path>   Output file (default = i915_perf.record)\n"
 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
-		"                                       Values: boot, mono, mono_raw (default = mono)\n",
+		"                                       Values: boot, mono, mono_raw (default = mono)\n"
+		"     --poll-period         -P <value>  Polling interval in microseconds used by a timer in the driver to query\n"
+		"                                       for OA reports periodically\n"
+		"                                       (default = 5000), Minimum = 100.\n",
 		name);
 }
 
@@ -762,6 +787,7 @@ main(int argc, char *argv[])
 		{"size",                 required_argument, 0, 's'},
 		{"command-fifo",         required_argument, 0, 'f'},
 		{"cpu-clock",            required_argument, 0, 'k'},
+		{"poll-period",          required_argument, 0, 'P'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -788,9 +814,12 @@ main(int argc, char *argv[])
 
 		.command_fifo = I915_PERF_RECORD_FIFO_PATH,
 		.command_fifo_fd = -1,
+
+		/* 5 ms poll period */
+		.poll_period = 5 * 1000 * 1000,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -832,6 +861,9 @@ main(int argc, char *argv[])
 			}
 			break;
 		}
+		case 'P':
+			ctx.poll_period = MAX(100, atol(optarg)) * 1000;
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
