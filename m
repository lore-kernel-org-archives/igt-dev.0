Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254FD10E9FE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:46:54 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:23 -0800
Message-Id: <20230215004648.2100655-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/31] i915/perf: Add class:instance support
 to OA tests
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

Add test to verify class:instance interface to perf OA.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h | 20 +++++++++++++++
 tests/i915/perf.c           | 49 +++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index b71acfba..5fab3066 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2627,6 +2627,26 @@ enum drm_i915_perf_property_id {
 	 */
 	DRM_I915_PERF_PROP_POLL_OA_PERIOD,
 
+	/**
+	 * In platforms with multiple OA buffers, the engine class instance must
+	 * be passed to open a stream to a OA unit corresponding to the engine.
+	 * Multiple engines may be mapped to the same OA unit.
+	 *
+	 * In addition to the class:instance, if a gem context is also passed, then
+	 * 1) the report headers of OA reports from other engines are squashed.
+	 * 2) OAR is enabled for the class:instance
+	 *
+	 * This property is available in perf revision 6.
+	 */
+	DRM_I915_PERF_PROP_OA_ENGINE_CLASS,
+
+	/**
+	 * This parameter specifies the engine instance.
+	 *
+	 * This property is available in perf revision 6.
+	 */
+	DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE,
+
 	DRM_I915_PERF_PROP_MAX /* non-ABI */
 };
 
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 77bda442..13cfe895 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -1188,6 +1188,47 @@ test_invalid_open_flags(void)
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
@@ -5305,6 +5346,14 @@ igt_main
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
