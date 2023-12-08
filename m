Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AE710EA24
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 08:45:30 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] lib/igt_perf: modify perf_events dir function for xe
Date: Fri,  8 Dec 2023 14:22:49 +0530
Message-Id: <20231208085251.3798137-2-riana.tauro@intel.com>
In-Reply-To: <20231208085251.3798137-1-riana.tauro@intel.com>
References: <20231208085251.3798137-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

modify igt_perf_events_dir so that it can be used
for xe. Also modify pmu_read test to use these changes.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_perf.c         | 6 ++----
 lib/igt_perf.h         | 2 +-
 tests/intel/perf_pmu.c | 3 ++-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 3866c6d77..5b7bef042 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -129,13 +129,11 @@ uint64_t igt_perf_type_id(const char *device)
 	return strtoull(buf, NULL, 0);
 }
 
-int igt_perf_events_dir(int i915)
+int igt_perf_events_dir(const char *device)
 {
-	char buf[80];
 	char path[PATH_MAX];
 
-	i915_perf_device(i915, buf, sizeof(buf));
-	snprintf(path, sizeof(path), "/sys/bus/event_source/devices/%s/events", buf);
+	snprintf(path, sizeof(path), "/sys/bus/event_source/devices/%s/events", device);
 	return open(path, O_RDONLY);
 }
 
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index 3d9ba2917..776cb36bb 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -54,7 +54,7 @@ perf_event_open(struct perf_event_attr *attr,
 }
 
 uint64_t igt_perf_type_id(const char *device);
-int igt_perf_events_dir(int i915);
+int igt_perf_events_dir(const char *device);
 int igt_perf_open(uint64_t type, uint64_t config);
 int igt_perf_open_group(uint64_t type, uint64_t config, int group);
 
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index c6e6a8b77..a95a43eef 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2420,11 +2420,12 @@ static void test_unload(unsigned int num_engines)
 static void pmu_read(int i915)
 {
 	char val[128];
+	char buf[80];
 	int pmu_fd;
 	struct dirent *de;
 	DIR *dir;
 
-	pmu_fd = igt_perf_events_dir(i915);
+	pmu_fd = igt_perf_events_dir(i915_perf_device(i915, buf, sizeof(buf)));
 	igt_require(pmu_fd >= 0);
 
 	dir = fdopendir(dup(pmu_fd));
-- 
2.40.0
