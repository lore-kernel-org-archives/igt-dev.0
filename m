Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E52210EB8B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:42 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:18 -0700
Message-Id: <20230323225534.3739835-15-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 14/30] i915/perf: Test concurrent access
 to OA in different groups
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

With multiple OA buffers, verify that the perf interface allows
concurrent access to the OA buffers in different groups.

v2: (Ashutosh)
- Rename concurrency functions to use group instead of gt
- Fix comment

v3: (CI issues)
- Run group-exclusive-stream tests for >= gen12
- Fix exponent for group-exclusive-stream tests

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 142 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 138 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 5340eff1..d3f80a19 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2235,6 +2235,7 @@ test_blocking(uint64_t requested_oa_period,
 
 	int max_iterations = (test_duration_ns / oa_period) + 2;
 	int n_extra_iterations = 0;
+	int perf_fd;
 
 	/* It's a bit tricky to put a lower limit here, but we expect a
 	 * relatively low latency for seeing reports, while we don't currently
@@ -2268,7 +2269,7 @@ test_blocking(uint64_t requested_oa_period,
 	param.num_properties = (idx - props) / 2;
 	param.properties_ptr = to_user_pointer(props);
 
-	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
+	perf_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 
 	times(&start_times);
 
@@ -2300,14 +2301,14 @@ test_blocking(uint64_t requested_oa_period,
 	 * the error delta.
 	 */
 	start = get_time();
-	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
+	do_ioctl(perf_fd, I915_PERF_IOCTL_ENABLE, 0);
 	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
 		struct drm_i915_perf_record_header *header;
 		bool timer_report_read = false;
 		bool non_timer_report_read = false;
 		int ret;
 
-		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
+		while ((ret = read(perf_fd, buf, sizeof(buf))) < 0 &&
 		       errno == EINTR)
 			;
 
@@ -2375,7 +2376,7 @@ test_blocking(uint64_t requested_oa_period,
 	if (!set_kernel_hrtimer)
 		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
 
-	__perf_close(stream_fd);
+	__perf_close(perf_fd);
 }
 
 static void
@@ -5469,6 +5470,14 @@ static void put_engine_groups(struct perf_engine_group *groups,
 	free(groups);
 }
 
+static struct i915_engine_class_instance *
+random_engine(struct perf_engine_group *group)
+{
+	srandom(time(NULL));
+
+	return &group->ci[random() % group->num_engines];
+}
+
 static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
 {
 	int fd;
@@ -5491,6 +5500,111 @@ static void set_default_engine(const intel_ctx_t *ctx)
 			default_e2 = *e;
 }
 
+/*
+ * Test if OA buffer streams can be independently opened on each group. Once a user
+ * opens a stream, that group is exclusive to the user, other users get -EBUSY on
+ * trying to open a stream.
+ */
+static void
+test_group_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
+{
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, 0,
+		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, 0,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		/* for gem_context use case, we do no pass exponent */
+		.num_properties = exponent ?
+				  ARRAY_SIZE(properties) / 2 :
+				  ARRAY_SIZE(properties) / 2 - 1,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t i, j;
+
+	/* for each group, open one random perf stream with sample OA */
+	for (i = 0; i < num_perf_oa_groups; i++) {
+		struct perf_engine_group *grp = &perf_oa_groups[i];
+		struct i915_engine_class_instance *ci = random_engine(grp);
+
+		if (!exponent) {
+			properties[0] = DRM_I915_PERF_PROP_CTX_HANDLE;
+			properties[1] = ctx->id;
+		}
+
+		properties[7] = ci->engine_class;
+		properties[9] = ci->engine_instance;
+		grp->perf_fd = igt_ioctl(drm_fd,
+					 DRM_IOCTL_I915_PERF_OPEN,
+					 &param);
+		igt_assert(grp->perf_fd >= 0);
+		igt_debug("opened OA buffer with c:i %d:%d\n",
+			  ci->engine_class, ci->engine_instance);
+	}
+
+	/* for each group make sure no other streams can be opened */
+	for (i = 0; i < num_perf_oa_groups; i++) {
+		struct perf_engine_group *grp = &perf_oa_groups[i];
+		int err;
+
+		for (j = 0; j < grp->num_engines; j++) {
+			struct i915_engine_class_instance *ci = grp->ci + j;
+
+			/*
+			 * case 1:
+			 * concurrent access to OAG should fail
+			 */
+			properties[0] = DRM_I915_PERF_PROP_SAMPLE_OA;
+			properties[1] = true;
+			properties[7] = ci->engine_class;
+			properties[9] = ci->engine_instance;
+			/* for SAMPLE OA use case, we must pass exponent */
+			param.num_properties = ARRAY_SIZE(properties) / 2;
+			do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param,
+				     EBUSY);
+			igt_debug("try OA buffer with c:i %d:%d\n",
+				  ci->engine_class, ci->engine_instance);
+
+			/*
+			 * case 2:
+			 * concurrent access to non-OAG unit should fail
+			 */
+			properties[0] = DRM_I915_PERF_PROP_CTX_HANDLE;
+			properties[1] = gem_context_create(drm_fd);
+			/* for gem_context use case, we do no pass exponent */
+			param.num_properties = ARRAY_SIZE(properties) / 2 - 1;
+			errno = 0;
+			err = igt_ioctl(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param);
+			igt_assert(err < 0);
+			igt_assert(errno == EBUSY || errno == ENODEV);
+			igt_debug("try OA ci unit with c:i %d:%d\n",
+				  ci->engine_class, ci->engine_instance);
+			gem_context_destroy(drm_fd, properties[1]);
+		}
+
+		if (grp->perf_fd >= 0)
+			close(grp->perf_fd);
+	}
+}
+
+static void
+test_group_concurrent_oa_buffer_read(void)
+{
+	igt_fork(child, num_perf_oa_groups) {
+		struct intel_execution_engine2 e;
+
+		e.class = perf_oa_groups[child].ci->engine_class;
+		e.instance = perf_oa_groups[child].ci->engine_instance;
+
+		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, &e);
+	}
+	igt_waitchildren();
+}
+
 igt_main
 {
 	const intel_ctx_t *ctx;
@@ -5716,6 +5830,26 @@ igt_main
 		igt_describe("Verify invalid class instance");
 		igt_subtest("gen12-invalid-class-instance")
 			test_invalid_class_instance();
+
+		/*
+		 * OAR and OAG use cases can be separately opened only on gen12
+		 * and later, so group-exclusive-stream tests require >= 12.
+		 */
+		igt_describe("Verify exclusivity of perf streams with sample oa option");
+		igt_subtest("gen12-group-exclusive-stream-sample-oa") {
+			igt_require(intel_gen(devid) >= 12);
+			test_group_exclusive_stream(ctx, true);
+		}
+
+		igt_describe("Verify exclusivity of perf streams with ctx handle");
+		igt_subtest("gen12-group-exclusive-stream-ctx-handle") {
+			igt_require(intel_gen(devid) >= 12);
+			test_group_exclusive_stream(ctx, false);
+		}
+
+		igt_describe("Verify concurrent reads from OA buffers in different groups");
+		igt_subtest("gen12-group-concurrent-oa-buffer-read")
+			test_group_concurrent_oa_buffer_read();
 	}
 
 	igt_subtest("rc6-disable")
-- 
2.36.1
