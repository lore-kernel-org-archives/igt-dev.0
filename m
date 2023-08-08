Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D20110E084
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:04 -0700
Message-ID: <20230808010017.37819-8-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/20] tests/i915/perf: Fix
 i915_perf_revision for use with xe
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

Because xe driver is based on the latest upstream i915, set the perf
revision for xe to be greater than the latest i915 perf revision. Doing so
ensures that all tests for latest i915 features are also available for xe.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 9fb11f9e0730..03af968d9484 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -564,6 +564,12 @@ static int i915_perf_revision(int fd)
 	drm_i915_getparam_t gp;
 	int value = 1, ret;
 
+#define FINAL_I915_PERF_REV 7
+
+	if (is_xe_device(drm_fd))
+		return FINAL_I915_PERF_REV +
+			xe_config(drm_fd)->info[XE_QUERY_OA_IOCTL_VERSION];
+
 	gp.param = I915_PARAM_PERF_REVISION;
 	gp.value = &value;
 	ret = igt_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
-- 
2.41.0
