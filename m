Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33AB6EA9E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2020 22:52:55 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Thu, 19 Mar 2020 15:52:54 -0700
Message-Id: <20200319225254.29840-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200319225254.29840-1-umesh.nerlige.ramappa@intel.com>
References: <20200319225254.29840-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tools: Allow user to set poll delay in
 i915 perf recorder
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 37 +++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 6bbc451e..ca4f13ea 100644
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
 
+	if (revision >= 4) {
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
+		"     --poll-delay          -P <value>  Polling interval in microseconds used by a timer in the driver to query\n"
+		"                                       for OA reports periodically\n"
+		"                                       (default = 5000), Minimum = 100.\n",
 		name);
 }
 
@@ -762,6 +787,7 @@ main(int argc, char *argv[])
 		{"size",                 required_argument, 0, 's'},
 		{"command-fifo",         required_argument, 0, 'f'},
 		{"cpu-clock",            required_argument, 0, 'k'},
+		{"poll-delay",           required_argument, 0, 'P'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -788,9 +814,11 @@ main(int argc, char *argv[])
 
 		.command_fifo = I915_PERF_RECORD_FIFO_PATH,
 		.command_fifo_fd = -1,
+
+		.poll_period = 5 * 1000 * 1000,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -832,6 +860,9 @@ main(int argc, char *argv[])
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
