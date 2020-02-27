Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E12B6EC8A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 10:17:28 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 27 Feb 2020 12:17:24 +0200
Message-Id: <20200227101724.1620389-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/perf: add a stress test
 opening/closing the stream
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

This appears to trigger hard hangs...

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/perf.c b/tests/perf.c
index d9bac561..d9ff4edb 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -3995,6 +3995,34 @@ test_rc6_disable(void)
 	igt_assert_neq(n_events_end - n_events_start, 0);
 }
 
+static void
+test_stress_open_close(void)
+{
+	igt_until_timeout(2) {
+		int oa_exponent = 5; /* 5 micro seconds */
+		uint64_t properties[] = {
+			/* XXX: even without periodic sampling we have to
+			 * specify at least one sample layout property...
+			 */
+			DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+		};
+		struct drm_i915_perf_open_param param = {
+			.flags = I915_PERF_FLAG_FD_CLOEXEC |
+			         I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
+			.num_properties = sizeof(properties) / 16,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		stream_fd = __perf_open(drm_fd, &param, false);
+		__perf_close(stream_fd);
+	}
+}
+
 static int __i915_perf_add_config(int fd, struct drm_i915_perf_oa_config *config)
 {
 	int ret = igt_ioctl(fd, DRM_IOCTL_I915_PERF_ADD_CONFIG, config);
@@ -4590,6 +4618,9 @@ igt_main
 	igt_subtest("rc6-disable")
 		test_rc6_disable();
 
+	igt_subtest("stress-open-close")
+		test_stress_open_close();
+
 	igt_subtest("invalid-create-userspace-config")
 		test_invalid_create_userspace_config();
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
