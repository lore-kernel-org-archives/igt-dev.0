Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA4810E082
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 10:47:34 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 16:30:48 +0530
Message-Id: <20231109110050.388343-4-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231109110050.388343-1-sujaritha.sundaresan@intel.com>
References: <20231109110050.388343-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 3/5] tests/intel: Add multi-gt support for
 rc6-accuracy test
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

Add multi-gt support for rc6-accuracy subtest.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel/i915_pm_rc6_residency.c | 48 ++++++++++++++---------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 5dc785792..6e491f270 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -82,23 +82,19 @@ static unsigned long get_rc6_enabled_mask(void)
 	return enabled;
 }
 
-static bool has_rc6_residency(const char *name)
+static bool has_rc6_residency(int dirfd, enum i915_attr_id id)
 {
 	unsigned long residency;
-	char path[128];
 
-	sprintf(path, "power/%s_residency_ms", name);
-	return igt_sysfs_scanf(sysfs, path, "%lu", &residency) == 1;
+	return igt_sysfs_rps_scanf(dirfd, id, "%lu", &residency) == 1;
 }
 
-static unsigned long read_rc6_residency(const char *name)
+static unsigned long read_rc6_residency(int dirfd, enum i915_attr_id id)
 {
 	unsigned long residency;
-	char path[128];
 
 	residency = 0;
-	sprintf(path, "power/%s_residency_ms", name);
-	igt_assert(igt_sysfs_scanf(sysfs, path, "%lu", &residency) == 1);
+	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%lu", &residency) == 1);
 	return residency;
 }
 
@@ -125,28 +121,28 @@ static unsigned long gettime_ms(void)
 	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
 }
 
-static void read_residencies(int devid, unsigned int mask,
+static void read_residencies(int devid, int dirfd, unsigned int mask,
 			     struct residencies *res)
 {
 	res->duration = gettime_ms();
 
 	if (mask & RC6_ENABLED)
-		res->rc6 = read_rc6_residency("rc6");
+		res->rc6 = read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
 
 	if ((mask & RC6_ENABLED) &&
 	    (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)))
-		res->media_rc6 = read_rc6_residency("media_rc6");
+		res->media_rc6 = read_rc6_residency(dirfd, MEDIA_RC6_RESIDENCY_MS);
 
 	if (mask & RC6P_ENABLED)
-		res->rc6p = read_rc6_residency("rc6p");
+		res->rc6p = read_rc6_residency(dirfd, RC6P_RESIDENCY_MS);
 
 	if (mask & RC6PP_ENABLED)
-		res->rc6pp = read_rc6_residency("rc6pp");
+		res->rc6pp = read_rc6_residency(dirfd, RC6PP_RESIDENCY_MS);
 
 	res->duration += (gettime_ms() - res->duration) / 2;
 }
 
-static void measure_residencies(int devid, unsigned int mask,
+static void measure_residencies(int devid, int dirfd, unsigned int mask,
 				struct residencies *res)
 {
 	struct residencies start = { };
@@ -158,13 +154,13 @@ static void measure_residencies(int devid, unsigned int mask,
 	 * measurement, since the valid counter range is different on
 	 * different platforms and so fixing it up would be non-trivial.
 	 */
-	read_residencies(devid, mask, &end);
+	read_residencies(devid, dirfd, mask, &end);
 	igt_debug("time=%d: rc6=(%d, %d), rc6p=%d, rc6pp=%d\n",
 		  end.duration, end.rc6, end.media_rc6, end.rc6p, end.rc6pp);
 	for (retry = 0; retry < 2; retry++) {
 		start = end;
 		sleep(SLEEP_DURATION);
-		read_residencies(devid, mask, &end);
+		read_residencies(devid, dirfd, mask, &end);
 
 		igt_debug("time=%d: rc6=(%d, %d), rc6p=%d, rc6pp=%d\n",
 			  end.duration,
@@ -196,7 +192,7 @@ static void measure_residencies(int devid, unsigned int mask,
 	res->rc6 += res->rc6p;
 }
 
-static bool wait_for_rc6(void)
+static bool wait_for_rc6(int dirfd)
 {
 	struct timespec tv = {};
 	unsigned long start, now;
@@ -205,11 +201,11 @@ static bool wait_for_rc6(void)
 	usleep(160 * 1000);
 
 	/* Then poll for RC6 to start ticking */
-	now = read_rc6_residency("rc6");
+	now = read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
 	do {
 		start = now;
 		usleep(5000);
-		now = read_rc6_residency("rc6");
+		now = read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
 		if (now - start > 1)
 			return true;
 	} while (!igt_seconds_elapsed(&tv));
@@ -605,21 +601,23 @@ igt_main
 			devid = intel_get_drm_devid(i915);
 			sysfs = igt_sysfs_open(i915);
 
-			igt_require(has_rc6_residency("rc6"));
+			igt_require(has_rc6_residency(dirfd, RC6_RESIDENCY_MS));
 
 			/* Make sure rc6 counters are running */
 			igt_drop_caches_set(i915, DROP_IDLE);
-			igt_require(wait_for_rc6());
+			igt_require(wait_for_rc6(dirfd));
 
 			rc6_enabled = get_rc6_enabled_mask();
 			igt_require(rc6_enabled & RC6_ENABLED);
 		}
 
 		igt_subtest("rc6-accuracy") {
-			struct residencies res;
+			for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
+				struct residencies res;
 
-			measure_residencies(devid, rc6_enabled, &res);
-			residency_accuracy(res.rc6, res.duration, "rc6");
+				measure_residencies(devid, dirfd, rc6_enabled, &res);
+				residency_accuracy(res.rc6, res.duration, "rc6");
+			}
 		}
 
 		igt_subtest("media-rc6-accuracy") {
@@ -627,7 +625,7 @@ igt_main
 
 			igt_require(IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid));
 
-			measure_residencies(devid, rc6_enabled, &res);
+			measure_residencies(devid, sysfs, rc6_enabled, &res);
 			residency_accuracy(res.media_rc6, res.duration, "media_rc6");
 		}
 
-- 
2.25.1
