Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4336E97C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 22:38:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Mar 2020 14:38:13 -0800
Message-Id: <20200303223813.3866-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/6] tools: Enable interrupt support in i915
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add poll delay and the interrupt mode parameters to the
i915-perf-recorder tool.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 53 ++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 6bbc451e..397e410d 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -353,14 +353,32 @@ struct recording_context {
 
 	const char *command_fifo;
 	int command_fifo_fd;
+
+	bool interrupt_mode;
+	uint32_t poll_delay;
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
@@ -374,6 +392,16 @@ perf_open(struct recording_context *ctx)
 	properties[p++] = DRM_I915_PERF_PROP_OA_EXPONENT;
 	properties[p++] = ctx->oa_exponent;
 
+	if (revision >= 4) {
+		properties[p++] = DRM_I915_PERF_PROP_POLL_OA_DELAY;
+		properties[p++] = ctx->poll_delay;
+	}
+
+	if (revision >= 5) {
+		properties[p++] = DRM_I915_PERF_PROP_OA_ENABLE_INTERRUPT;
+		properties[p++] = ctx->interrupt_mode;
+	}
+
 	memset(&param, 0, sizeof(param));
 	param.flags = 0;
 	param.flags |= I915_PERF_FLAG_FD_CLOEXEC | I915_PERF_FLAG_FD_NONBLOCK;
@@ -720,7 +748,13 @@ usage(const char *name)
 		"                                       (To use with i915-perf-control)\n"
 		"     --output,             -o <path>   Output file (default = i915_perf.record)\n"
 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
-		"                                       Values: boot, mono, mono_raw (default = mono)\n",
+		"                                       Values: boot, mono, mono_raw (default = mono)\n"
+		"     --interrupt-mode      -i          Enable interrupt mode in driver to query for OA reports.\n"
+		"                                       (default: interrupt-mode is disabled)\n"
+		"     --poll-delay          -P <value>  Polling interval in microseconds used by a timer in the driver to query\n"
+		"                                       for OA reports periodically\n"
+		"                                       (default = 5000), Minimum = 100. A value of 0 disables the timer and can be\n"
+	       	"                                       used only if interrupt-mode is enabled\n",
 		name);
 }
 
@@ -762,6 +796,8 @@ main(int argc, char *argv[])
 		{"size",                 required_argument, 0, 's'},
 		{"command-fifo",         required_argument, 0, 'f'},
 		{"cpu-clock",            required_argument, 0, 'k'},
+		{"interrupt-mode",             no_argument, 0, 'i'},
+		{"poll-delay",           required_argument, 0, 'P'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -788,9 +824,12 @@ main(int argc, char *argv[])
 
 		.command_fifo = I915_PERF_RECORD_FIFO_PATH,
 		.command_fifo_fd = -1,
+
+		.interrupt_mode = false,
+		.poll_delay = 5 * 1000 * 1000,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:iP:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -832,6 +871,14 @@ main(int argc, char *argv[])
 			}
 			break;
 		}
+		case 'i':
+			ctx.interrupt_mode = true;
+			break;
+		case 'P': {
+			int pd = atoi(optarg);
+			ctx.poll_delay = pd ? MAX(100, pd) * 1000 : 0;
+			break;
+		}
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
