Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CC789FC5
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2020 15:55:37 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Mon, 13 Apr 2020 08:55:33 -0700
Message-Id: <20200413155533.11914-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200413155533.11914-1-umesh.nerlige.ramappa@intel.com>
References: <20200413155533.11914-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tools: Enable interrupt support in i915
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

Add poll delay and the interrupt mode parameters to the
i915-perf-recorder tool.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 7671f39b..ae31581c 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -355,6 +355,7 @@ struct recording_context {
 	int command_fifo_fd;
 
 	uint64_t poll_period;
+	bool interrupt_mode;
 };
 
 static int
@@ -396,6 +397,11 @@ perf_open(struct recording_context *ctx)
 		properties[p++] = ctx->poll_period;
 	}
 
+	if (revision >= 6) {
+		properties[p++] = DRM_I915_PERF_PROP_OA_ENABLE_INTERRUPT;
+		properties[p++] = ctx->interrupt_mode;
+	}
+
 	memset(&param, 0, sizeof(param));
 	param.flags = 0;
 	param.flags |= I915_PERF_FLAG_FD_CLOEXEC | I915_PERF_FLAG_FD_NONBLOCK;
@@ -738,7 +744,10 @@ usage(const char *name)
 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
 		"     --poll-period         -P <value>  Polling interval in microseconds used by a timer in the driver to query\n"
 		"                                       for OA reports periodically\n"
-		"                                       (default = 5000), Minimum = 100.\n",
+		"                                       (default = 5000), Minimum = 100. A value of 0 disables the timer and can be\n"
+	       	"                                       used only if interrupt-mode is enabled\n"
+		"     --interrupt-mode      -i          Enable interrupt mode in driver to query for OA reports.\n"
+		"                                       (default: interrupt-mode is disabled)\n",
 		name);
 }
 
@@ -781,6 +790,7 @@ main(int argc, char *argv[])
 		{"command-fifo",         required_argument, 0, 'f'},
 		{"cpu-clock",            required_argument, 0, 'k'},
 		{"poll-period",          required_argument, 0, 'P'},
+		{"interrupt-mode",             no_argument, 0, 'i'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -808,11 +818,12 @@ main(int argc, char *argv[])
 		.command_fifo = I915_PERF_RECORD_FIFO_PATH,
 		.command_fifo_fd = -1,
 
+		.interrupt_mode = false,
 		/* 5 ms poll period */
 		.poll_period = 5 * 1000 * 1000,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:iP:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -854,9 +865,14 @@ main(int argc, char *argv[])
 			}
 			break;
 		}
-		case 'P':
-			ctx.poll_period = MAX(100, atol(optarg)) * 1000;
+		case 'i':
+			ctx.interrupt_mode = true;
 			break;
+		case 'P': {
+			int pd = atol(optarg);
+			ctx.poll_period = pd ? MAX(100, pd) * 1000 : 0;
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
