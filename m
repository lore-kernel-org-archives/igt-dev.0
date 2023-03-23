Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5059510E4A2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:10 -0700
Message-Id: <20230323225534.3739835-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 06/30] i915/perf: Add class:instance
 support to OA tests
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

Add test to verify class:instance interface to perf OA.

v2: Temporarily move uapi to lib/i915/i915_drm_local.h

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/i915_drm_local.h |  3 +++
 tests/i915/perf.c         | 49 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 9a2273c4..af017650 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -23,6 +23,9 @@ extern "C" {
 
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
 
+#define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
+#define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 865858fe..a480f8ca 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1175,6 +1175,47 @@ test_invalid_open_flags(void)
 	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
 }
 
+static void
+test_invalid_class_instance(void)
+{
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
+		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, 0,
+		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, 0,
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+#define OA_E_CLASS 9
+#define OA_E_INSTANCE 11
+
+	properties[OA_E_CLASS] = I915_ENGINE_CLASS_COPY;
+	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
+
+	properties[OA_E_CLASS] = 10;
+	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
+
+	properties[OA_E_CLASS] = I915_ENGINE_CLASS_RENDER;
+
+	properties[OA_E_INSTANCE] = 100;
+	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
+
+	properties[OA_E_INSTANCE] = 248;
+	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
+
+	properties[OA_E_CLASS] = default_e2.class;
+	properties[OA_E_INSTANCE] = default_e2.instance;
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	__perf_close(stream_fd);
+}
+
 static void
 test_invalid_oa_metric_set_id(void)
 {
@@ -5294,6 +5335,14 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		igt_fixture igt_require(i915_perf_revision(drm_fd) >= 6);
+
+		igt_describe("Verify invalid class instance");
+		igt_subtest("gen12-invalid-class-instance")
+			test_invalid_class_instance();
+	}
+
 	igt_subtest("rc6-disable")
 		test_rc6_disable();
 
-- 
2.36.1
