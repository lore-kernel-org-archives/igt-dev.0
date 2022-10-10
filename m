Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95F10E501
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:13:07 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 18:12:34 +0000
Message-Id: <20221010181300.513297-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
References: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 08/34] i915/perf: Use gt in perf tests
 and lib
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

Enable perf tests to use gt information for sysfs attributes.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf.c   | 36 ++++++++++++++++++++++++++++++++++--
 tests/i915/perf.c | 27 ++++++++++++++++++++-------
 2 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 7349a460..3f131aaa 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -409,6 +409,35 @@ open_master_sysfs_dir(int drm_fd)
 	return sysfs;
 }
 
+typedef enum {
+	RPS_MIN_FREQ_MHZ,
+	RPS_MAX_FREQ_MHZ,
+
+	RPS_MAX_ATTR,
+} intel_sysfs_attr_id;
+
+static const char *intel_sysfs_attr_name[2][RPS_MAX_ATTR] =
+{
+	{
+		"gt_min_freq_mhz",
+		"gt_max_freq_mhz",
+	},
+	{
+		"gt/gt0/rps_min_freq_mhz",
+		"gt/gt0/rps_max_freq_mhz",
+	},
+};
+
+static const char *
+intel_sysfs_attr_id_to_name(int sysfs_dirfd, intel_sysfs_attr_id id)
+{
+	assert(id < RPS_MAX_ATTR);
+
+	return !faccessat(sysfs_dirfd, "gt", O_RDONLY, 0) ?
+		intel_sysfs_attr_name[1][id] :
+		intel_sysfs_attr_name[0][id];
+}
+
 struct intel_perf *
 intel_perf_for_fd(int drm_fd)
 {
@@ -424,8 +453,11 @@ intel_perf_for_fd(int drm_fd)
 	if (sysfs_dir_fd < 0)
 		return NULL;
 
-	if (!read_sysfs(sysfs_dir_fd, "gt_min_freq_mhz", &gt_min_freq) ||
-	    !read_sysfs(sysfs_dir_fd, "gt_max_freq_mhz", &gt_max_freq)) {
+#define read_sysfs_rps(fd, id, value) \
+	read_sysfs(fd, intel_sysfs_attr_id_to_name(fd, id), value)
+
+	if (!read_sysfs_rps(sysfs_dir_fd, RPS_MIN_FREQ_MHZ, &gt_min_freq) ||
+	    !read_sysfs_rps(sysfs_dir_fd, RPS_MAX_FREQ_MHZ, &gt_max_freq)) {
 		close(sysfs_dir_fd);
 		return NULL;
 	}
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 75594f04..0543a79e 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -345,11 +345,11 @@ try_sysfs_read_u64(const char *path, uint64_t *val)
 }
 
 static unsigned long
-sysfs_read(const char *path)
+sysfs_read(enum i915_attr_id id)
 {
 	unsigned long value;
 
-	igt_assert(igt_sysfs_scanf(sysfs, path, "%lu", &value) == 1);
+	igt_assert(igt_sysfs_rps_scanf(sysfs, id, "%lu", &value) == 1);
 
 	return value;
 }
@@ -4177,7 +4177,7 @@ gen12_test_single_ctx_render_target_writes_a_counter(void)
 
 static unsigned long rc6_residency_ms(void)
 {
-	return sysfs_read("power/rc6_residency_ms");
+	return sysfs_read(RC6_RESIDENCY_MS);
 }
 
 static void
@@ -4200,7 +4200,7 @@ test_rc6_disable(void)
 	unsigned long rc6_start, rc6_end, rc6_enabled;
 
 	rc6_enabled = 0;
-	igt_sysfs_scanf(sysfs, "power/rc6_enable", "%lu", &rc6_enabled);
+	igt_sysfs_rps_scanf(sysfs, RC6_ENABLE, "%lu", &rc6_enabled);
 	igt_require(rc6_enabled);
 
 	/* Verify rc6 is functional by measuring residency while idle */
@@ -4837,6 +4837,19 @@ done:
 	return ref_count;
 }
 
+static int perf_sysfs_open(int i915)
+{
+	int dirfd, gt;
+
+	/* use the first available sysfs interface */
+	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
+		break;
+
+	igt_assert(dirfd != -1);
+
+	return dirfd;
+}
+
 /* check that an open i915 perf stream holds a reference on the drm i915 module
  * including in the corner case where the original drm fd has been closed.
  */
@@ -4872,7 +4885,7 @@ test_i915_ref_count(void)
 	drm_fd = __drm_open_driver(DRIVER_INTEL);
 	igt_require_intel(drm_fd);
 	devid = intel_get_drm_devid(drm_fd);
-	sysfs = igt_sysfs_open(drm_fd);
+	sysfs = perf_sysfs_open(drm_fd);
 
 	/* Note: these global variables are only initialized after calling
 	 * init_sys_info()...
@@ -4974,14 +4987,14 @@ igt_main
 		igt_require_gem(drm_fd);
 
 		devid = intel_get_drm_devid(drm_fd);
-		sysfs = igt_sysfs_open(drm_fd);
+		sysfs = perf_sysfs_open(drm_fd);
 
 		igt_require(init_sys_info());
 
 		write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
 
-		gt_max_freq_mhz = sysfs_read("gt_boost_freq_mhz");
+		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
 
 		render_copy = igt_get_render_copyfunc(devid);
 		igt_require_f(render_copy, "no render-copy function\n");
-- 
2.25.1
