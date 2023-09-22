Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B4610E19F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 21:52:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:52:29 -0700
Message-Id: <20230922215233.2438200-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
References: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] i915/pmu: Add helpers to convert ticks
 to ns
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

MTL is introducing a 2 new counters to read busyness in ticks rather
than nanoseconds:

(1) A counter that returns engine busyness in ticks (xxxx-busy-ticks)
(2) A counter that returns gt active time in ticks (total-active-ticks)

Busyness % = (delta-xxxx-busy-ticks * 100) / delta-total-active-ticks

At the same time it is deprecating the old busyness counter that would
require the kernel to convert the ticks to ns.

Current IGT modifications are not using total-active-ticks since that is
a larger change and more thought needs to go into incorporating that
into the tests. That will be part of a follow up series. For now, add
some helpers to the IGT tests to convert the ticks to ns.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/perf_pmu.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index c6e6a8b77..87078ad38 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -255,6 +255,72 @@ IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
 
 const double tolerance = 0.05f;
 const unsigned long batch_duration_ns = 500e6;
+static bool busy_ticks_only;
+static uint32_t cs_ts_freq;
+
+static bool strendswith(const char *str, const char *endswith)
+{
+	unsigned int endlen = strlen(endswith);
+	unsigned int str_len = strlen(str);
+
+	if (str_len < endlen)
+		return false;
+
+	return strcmp(str + (str_len - endlen), endswith) == 0;
+}
+
+static bool pmu_supports_event(int i915, const char *event_end)
+{
+	struct dirent *dent;
+	bool found = false;
+	int pmu_fd;
+	DIR *d;
+
+	pmu_fd = igt_perf_events_dir(i915);
+	igt_require(pmu_fd >= 0);
+
+	d = fdopendir(dup(pmu_fd));
+	igt_assert(d);
+	rewinddir(d);
+
+	while ((dent = readdir(d)) != NULL) {
+		if (dent->d_type != DT_REG)
+			continue;
+
+		if (strendswith(dent->d_name, event_end)) {
+			found = true;
+			break;
+		}
+	}
+
+	closedir(d);
+	close(pmu_fd);
+
+	return found;
+}
+
+static bool pmu_supports_only_busy_ticks(int i915)
+{
+	return pmu_supports_event(i915, "-busy-ticks") &&
+	       !pmu_supports_event(i915, "-busy");
+}
+
+static uint32_t
+cs_timestamp_frequency(int fd)
+{
+	struct drm_i915_getparam gp = {};
+	static uint32_t value;
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
 
 char *drpc;
 const char *no_debug_data = "\0";
@@ -2482,6 +2548,9 @@ igt_main
 
 		i915_for_each_gt(fd, tmp, gt)
 			num_gt++;
+
+		busy_ticks_only = pmu_supports_only_busy_ticks(fd);
+		cs_ts_freq = cs_timestamp_frequency(fd);
 	}
 
 	igt_describe("Verify i915 pmu dir exists and read all events");
-- 
2.38.1
