Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2686D10E72B
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 21:42:19 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 21:41:51 +0000
Message-Id: <20221010214215.5378-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 12/36] i915/perf: Fix CS timestamp vs OA
 timstamp mismatch
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

CS timestamp can have an additional configuration that shifts the
timestamp value by a specified number of bits. On DG2, this additional
configuration is ignored by OA, so OA timestamps are missing the shift.

Add newly defined interface to get the exact OA timestamp frequency so
that the deltas can be accurately calculated.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 include/drm-uapi/i915_drm.h |  6 ++++++
 lib/i915/perf.c             |  6 +++++-
 tests/i915/perf.c           | 25 ++++++++++++++++++++++++-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index fd6146b2..709fe425 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -749,6 +749,12 @@ typedef struct drm_i915_irq_wait {
 /* Query if the kernel supports the I915_USERPTR_PROBE flag. */
 #define I915_PARAM_HAS_USERPTR_PROBE 56
 
+/*
+ * Frequency of the timestamps in OA reports. This used to be the same as the CS
+ * timestamp frequency, but differs on some platforms.
+ */
+#define I915_PARAM_OA_TIMESTAMP_FREQUENCY 57
+
 /* Must be kept compact -- no holes and well documented */
 
 typedef struct drm_i915_getparam {
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 3f131aaa..2f24cbd8 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -464,7 +464,11 @@ intel_perf_for_fd(int drm_fd)
 	close(sysfs_dir_fd);
 
 	if (getparam(drm_fd, I915_PARAM_CHIPSET_ID, &device_id) ||
-	    getparam(drm_fd, I915_PARAM_REVISION, &device_revision) ||
+	    getparam(drm_fd, I915_PARAM_REVISION, &device_revision))
+		return NULL;
+
+	/* if OA_TIMESTAMP_FREQUENCY is not supported, fall back to CS_TIMESTAMP_FREQUENCY */
+	if (getparam(drm_fd, I915_PARAM_OA_TIMESTAMP_FREQUENCY, &timestamp_frequency) &&
 	    getparam(drm_fd, I915_PARAM_CS_TIMESTAMP_FREQUENCY, &timestamp_frequency))
 		return NULL;
 
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 6652c218..befae0da 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -442,6 +442,29 @@ gen8_read_report_reason(const uint32_t *report)
 		return "unknown";
 }
 
+static uint32_t
+cs_timestamp_frequency(int fd)
+{
+	struct drm_i915_getparam gp = {};
+	static uint32_t value = 0;
+
+	if (value)
+		return value;
+
+	gp.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY;
+	gp.value = (int *)(&value);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp), 0);
+
+	return value;
+}
+
+static uint64_t
+cs_timebase_scale(uint32_t u32_delta)
+{
+	return ((uint64_t)u32_delta * NSEC_PER_SEC) / cs_timestamp_frequency(drm_fd);
+}
+
 static uint64_t
 timebase_scale(uint32_t u32_delta)
 {
@@ -4142,7 +4165,7 @@ static void gen12_single_ctx_helper(void)
 	/* Sanity check that we can pass the delta to timebase_scale */
 	igt_assert(delta_ts64 < UINT32_MAX);
 	delta_oa32_ns = timebase_scale(delta_oa32);
-	delta_ts64_ns = timebase_scale(delta_ts64);
+	delta_ts64_ns = cs_timebase_scale(delta_ts64);
 
 	igt_debug("oa32 delta = %u, = %uns\n",
 			delta_oa32, (unsigned)delta_oa32_ns);
-- 
2.25.1
