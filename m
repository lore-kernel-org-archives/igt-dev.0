Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7BB10E390
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:06 -0700
Message-ID: <20230808010017.37819-10-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/20] tests/i915/perf: Fix
 test_i915_ref_count for xe
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

We need to tell read_i915_module_ref if we are using i915 or xe. Also the
module name in /proc/modules is different.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 292afda9a434..ef2d56e319f8 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5418,18 +5418,21 @@ test_whitelisted_registers_userspace_config(void)
 }
 
 static unsigned
-read_i915_module_ref(void)
+read_i915_module_ref(bool is_xe)
 {
 	FILE *fp = fopen("/proc/modules", "r");
 	char *line = NULL;
 	size_t line_buf_size = 0;
 	int len = 0;
 	unsigned ref_count;
+	char mod[8];
+	int modn = is_xe ? 3 : 5;
 
 	igt_assert(fp);
 
+	strcpy(mod, is_xe ? "xe " : "i915 ");
 	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
-		if (strncmp(line, "i915 ", 5) == 0) {
+		if (strncmp(line, mod, modn) == 0) {
 			unsigned long mem;
 			int ret = sscanf(line + 5, "%lu %u", &mem, &ref_count);
 			igt_assert(ret == 2);
@@ -5484,17 +5487,26 @@ test_i915_ref_count(void)
 	unsigned baseline, ref_count0, ref_count1;
 	uint32_t oa_report0[64];
 	uint32_t oa_report1[64];
+	bool is_xe;
 
 	/* This should be the first test before the first fixture so no drm_fd
 	 * should have been opened so far...
 	 */
 	igt_assert_eq(drm_fd, -1);
 
-	baseline = read_i915_module_ref();
+	/* Tell read_i915_module_ref if we are on xe or i915 (because drm_fd is -1) */
+	drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+	is_xe = is_xe_device(drm_fd);
+	drm_close_driver(drm_fd);
+	close(sysfs);
+	drm_fd = -1;
+
+	baseline = read_i915_module_ref(is_xe);
 	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
 
-	drm_fd = __drm_open_driver(DRIVER_INTEL);
-	igt_require_i915(drm_fd);
+	drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+	if (is_xe_device(drm_fd))
+		xe_device_get(drm_fd);
 	devid = intel_get_drm_devid(drm_fd);
 	sysfs = perf_sysfs_open(drm_fd);
 
@@ -5506,12 +5518,12 @@ test_i915_ref_count(void)
 	properties[5] = default_test_set->perf_oa_format;
 	properties[7] = oa_exp_1_millisec;
 
-	ref_count0 = read_i915_module_ref();
+	ref_count0 = read_i915_module_ref(is_xe);
 	igt_debug("initial ref count with drm_fd open = %u\n", ref_count0);
 	igt_assert(ref_count0 > baseline);
 
 	stream_fd = __perf_open(drm_fd, &param, false);
-	ref_count1 = read_i915_module_ref();
+	ref_count1 = read_i915_module_ref(is_xe);
 	igt_debug("ref count after opening i915 perf stream = %u\n", ref_count1);
 	igt_assert(ref_count1 > ref_count0);
 
@@ -5519,7 +5531,7 @@ test_i915_ref_count(void)
 	close(sysfs);
 	drm_fd = -1;
 	sysfs = -1;
-	ref_count0 = read_i915_module_ref();
+	ref_count0 = read_i915_module_ref(is_xe);
 	igt_debug("ref count after closing drm fd = %u\n", ref_count0);
 
 	igt_assert(ref_count0 > baseline);
@@ -5531,7 +5543,7 @@ test_i915_ref_count(void)
 			  false); /* not just timer reports */
 
 	__perf_close(stream_fd);
-	ref_count0 = read_i915_module_ref();
+	ref_count0 = read_i915_module_ref(is_xe);
 	igt_debug("ref count after closing i915 perf stream fd = %u\n", ref_count0);
 	igt_assert_eq(ref_count0, baseline);
 }
-- 
2.41.0
