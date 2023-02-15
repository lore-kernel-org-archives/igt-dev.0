Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874110EA13
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:47:03 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:43 -0800
Message-Id: <20230215004648.2100655-27-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 26/31] lib/perf: Enable multi-tile support
 for perf library
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

Add class instance awareness to perf library.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c                      | 15 ++++--
 lib/i915/perf.h                      |  2 +-
 tests/core_hotunplug.c               |  2 +-
 tests/i915/perf.c                    |  2 +-
 tools/i915-perf/i915_perf_configs.c  |  2 +-
 tools/i915-perf/i915_perf_recorder.c | 72 ++++++++++++++++++++++++++--
 6 files changed, 81 insertions(+), 14 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 6c7a1925..d8624dc0 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -574,7 +574,7 @@ typedef enum {
 	RPS_MAX_ATTR,
 } intel_sysfs_attr_id;
 
-static const char *intel_sysfs_attr_name[2][RPS_MAX_ATTR] =
+static const char *intel_sysfs_attr_name[][RPS_MAX_ATTR] =
 {
 	{
 		"gt_min_freq_mhz",
@@ -584,20 +584,25 @@ static const char *intel_sysfs_attr_name[2][RPS_MAX_ATTR] =
 		"gt/gt0/rps_min_freq_mhz",
 		"gt/gt0/rps_max_freq_mhz",
 	},
+	{
+		"gt/gt1/rps_min_freq_mhz",
+		"gt/gt1/rps_max_freq_mhz",
+	},
 };
 
 static const char *
-intel_sysfs_attr_id_to_name(int sysfs_dirfd, intel_sysfs_attr_id id)
+intel_sysfs_attr_id_to_name(int sysfs_dirfd, intel_sysfs_attr_id id, int gt)
 {
 	assert(id < RPS_MAX_ATTR);
+	assert(gt < sizeof(intel_sysfs_attr_name) - 1);
 
 	return !faccessat(sysfs_dirfd, "gt", O_RDONLY, 0) ?
-		intel_sysfs_attr_name[1][id] :
+		intel_sysfs_attr_name[gt + 1][id] :
 		intel_sysfs_attr_name[0][id];
 }
 
 struct intel_perf *
-intel_perf_for_fd(int drm_fd)
+intel_perf_for_fd(int drm_fd, int gt)
 {
 	uint32_t device_id;
 	uint32_t device_revision;
@@ -612,7 +617,7 @@ intel_perf_for_fd(int drm_fd)
 		return NULL;
 
 #define read_sysfs_rps(fd, id, value) \
-	read_sysfs(fd, intel_sysfs_attr_id_to_name(fd, id), value)
+	read_sysfs(fd, intel_sysfs_attr_id_to_name(fd, id, gt), value)
 
 	if (!read_sysfs_rps(sysfs_dir_fd, RPS_MIN_FREQ_MHZ, &gt_min_freq) ||
 	    !read_sysfs_rps(sysfs_dir_fd, RPS_MAX_FREQ_MHZ, &gt_max_freq)) {
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index e6e60dc9..df5b6b96 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -316,7 +316,7 @@ intel_perf_devinfo_eu_available(const struct intel_perf_devinfo *devinfo,
 	return (devinfo->eu_masks[subslice_offset + eu / 8] & (1U << eu % 8)) != 0;
 }
 
-struct intel_perf *intel_perf_for_fd(int drm_fd);
+struct intel_perf *intel_perf_for_fd(int drm_fd, int gt);
 struct intel_perf *intel_perf_for_devinfo(uint32_t device_id,
 					  uint32_t revision,
 					  uint64_t timestamp_frequency,
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index ebb646b5..e79eb1ed 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -377,7 +377,7 @@ static bool local_i915_perf_healthcheck(int i915)
 {
 	struct intel_perf *intel_perf;
 
-	intel_perf = intel_perf_for_fd(i915);
+	intel_perf = intel_perf_for_fd(i915, 0);
 	if (intel_perf)
 		intel_perf_free(intel_perf);
 	return intel_perf;
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index b50c86d1..e1848360 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1136,7 +1136,7 @@ init_sys_info(void)
 {
 	igt_assert_neq(devid, 0);
 
-	intel_perf = intel_perf_for_fd(drm_fd);
+	intel_perf = intel_perf_for_fd(drm_fd, 0);
 	igt_require(intel_perf);
 
 	igt_debug("n_eu_slices: %"PRIu64"\n", intel_perf->devinfo.n_eu_slices);
diff --git a/tools/i915-perf/i915_perf_configs.c b/tools/i915-perf/i915_perf_configs.c
index bce3bd0f..0db9a126 100644
--- a/tools/i915-perf/i915_perf_configs.c
+++ b/tools/i915-perf/i915_perf_configs.c
@@ -230,7 +230,7 @@ main(int argc, char *argv[])
 
 	fprintf(stdout, "Device graphics_ver=%i gt=%i\n", devinfo->graphics_ver, devinfo->gt);
 
-	perf = intel_perf_for_fd(drm_fd);
+	perf = intel_perf_for_fd(drm_fd, 0);
 	if (!perf) {
 		fprintf(stderr, "No perf data found.\n");
 		return EXIT_FAILURE;
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index d16f1546..ee8a288d 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -26,6 +26,7 @@
 #include <fcntl.h>
 #include <getopt.h>
 #include <inttypes.h>
+#include <limits.h>
 #include <poll.h>
 #include <signal.h>
 #include <stdbool.h>
@@ -408,6 +409,9 @@ struct recording_context {
 	int command_fifo_fd;
 
 	uint64_t poll_period;
+
+	struct i915_engine_class_instance engine;
+	int gt;
 };
 
 static int
@@ -449,6 +453,13 @@ perf_open(struct recording_context *ctx)
 		properties[p++] = ctx->poll_period;
 	}
 
+	if (ctx->engine.engine_class >= 0 && ctx->engine.engine_instance >= 0) {
+		properties[p++] = DRM_I915_PERF_PROP_OA_ENGINE_CLASS;
+		properties[p++] = ctx->engine.engine_class;
+		properties[p++] = DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE;
+		properties[p++] = ctx->engine.engine_instance;
+	}
+
 	memset(&param, 0, sizeof(param));
 	param.flags = 0;
 	param.flags |= I915_PERF_FLAG_FD_CLOEXEC | I915_PERF_FLAG_FD_NONBLOCK;
@@ -497,8 +508,8 @@ write_header(FILE *output, struct recording_context *ctx)
 		.gt_min_frequency = ctx->perf->devinfo.gt_min_freq,
 		.gt_max_frequency = ctx->perf->devinfo.gt_max_freq,
 		.oa_format = ctx->metric_set->perf_oa_format,
-		.engine_class = I915_ENGINE_CLASS_RENDER,
-		.engine_instance = 0,
+		.engine_class = ctx->engine.engine_class,
+		.engine_instance = ctx->engine.engine_instance,
 	};
 	struct drm_i915_perf_record_header header = {
 		.type = INTEL_PERF_RECORD_TYPE_DEVICE_INFO,
@@ -805,7 +816,9 @@ usage(const char *name)
 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
 		"     --poll-period         -P <value>  Polling interval in microseconds used by a timer in the driver to query\n"
 		"                                       for OA reports periodically\n"
-		"                                       (default = 5000), Minimum = 100.\n",
+		"                                       (default = 5000), Minimum = 100.\n"
+		"     --engine-class        -e <value>  Engine class used for the OA capture.\n"
+		"     --engine-instance     -i <value>  Engine instance used for the OA capture.\n",
 		name);
 }
 
@@ -834,6 +847,33 @@ teardown_recording_context(struct recording_context *ctx)
 		close(ctx->drm_fd);
 }
 
+static int
+mtl_engine_to_gt(const struct i915_engine_class_instance *engine)
+{
+        switch (engine->engine_class) {
+        case I915_ENGINE_CLASS_RENDER:
+                return 0;
+        case I915_ENGINE_CLASS_VIDEO:
+        case I915_ENGINE_CLASS_VIDEO_ENHANCE:
+                return 1;
+        default:
+                return -1;
+        }
+}
+
+/* static mapping as in igt core library until a different way is available */
+static int
+engine_to_gt(struct recording_context *ctx)
+{
+	if (ctx->devinfo->is_meteorlake)
+		return mtl_engine_to_gt(&ctx->engine);
+	else if (ctx->engine.engine_class == I915_ENGINE_CLASS_RENDER &&
+		 ctx->engine.engine_instance == 0)
+		return 0;
+
+	return -1;
+}
+
 int
 main(int argc, char *argv[])
 {
@@ -849,6 +889,8 @@ main(int argc, char *argv[])
 		{"command-fifo",         required_argument, 0, 'f'},
 		{"cpu-clock",            required_argument, 0, 'k'},
 		{"poll-period",          required_argument, 0, 'P'},
+		{"engine-class",         required_argument, 0, 'e'},
+		{"engine-instance",      required_argument, 0, 'i'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -878,9 +920,10 @@ main(int argc, char *argv[])
 
 		/* 5 ms poll period */
 		.poll_period = 5 * 1000 * 1000,
+		.engine = { USHRT_MAX, USHRT_MAX },
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:e:i:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -931,6 +974,12 @@ main(int argc, char *argv[])
 		case 'P':
 			ctx.poll_period = MAX(100, atol(optarg)) * 1000;
 			break;
+		case 'e':
+			ctx.engine.engine_class = atoi(optarg);
+			break;
+		case 'i':
+			ctx.engine.engine_instance = atoi(optarg);
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
@@ -944,6 +993,12 @@ main(int argc, char *argv[])
 		return EXIT_SUCCESS;
 	}
 
+	if (ctx.engine.engine_class == USHRT_MAX ||
+	    ctx.engine.engine_instance == USHRT_MAX) {
+		ctx.engine.engine_class = I915_ENGINE_CLASS_RENDER;
+		ctx.engine.engine_instance = 0;
+	}
+
 	ctx.drm_fd = open_render_node(&ctx.devid, dev_node_id);
 	if (ctx.drm_fd < 0) {
 		fprintf(stderr, "Unable to open device.\n");
@@ -956,6 +1011,13 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
+	ctx.gt = engine_to_gt(&ctx);
+	if (ctx.gt < 0) {
+		fprintf(stderr, "Unsupported engine class:instance %d:%d.\n",
+			ctx.engine.engine_class, ctx.engine.engine_instance);
+		goto fail;
+	}
+
 	fprintf(stdout, "Device name=%s gen=%i gt=%i id=0x%x\n",
 		ctx.devinfo->codename, ctx.devinfo->graphics_ver, ctx.devinfo->gt, ctx.devid);
 
@@ -965,7 +1027,7 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
-	ctx.perf = intel_perf_for_fd(ctx.drm_fd);
+	ctx.perf = intel_perf_for_fd(ctx.drm_fd, ctx.gt);
 	if (!ctx.perf) {
 		fprintf(stderr, "No perf data found.\n");
 		goto fail;
-- 
2.36.1
