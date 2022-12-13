Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F0610E1E0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 18:35:35 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Dec 2022 10:35:28 -0800
Message-Id: <20221213183529.2290856-4-ashutosh.dixit@intel.com>
In-Reply-To: <20221213183529.2290856-1-ashutosh.dixit@intel.com>
References: <20221213183529.2290856-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/igt_sysfs: Make it easier to extend
 verification of clamped sysfs attr
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

Clamped sysfs attribute verification has been added to lib/ in the hope
that subsystems other that hwmon will find this functionality
useful. However other users might have to tweak parameters of the algorithm
to suit their needs. To facilitate this, minimize
assumptions (e.g. previously the tolerance for comparison was hardcoded as
0.1) in the implementation. Also define 'struct igt_sysfs_clamp' to
consolidate parameters of the algorithm and make it easier to extend the
algorithm in the future.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_sysfs.c         | 111 ++++++++++++++++++++--------------------
 lib/igt_sysfs.h         |  23 ++++++++-
 tests/i915/i915_hwmon.c |   8 ++-
 3 files changed, 84 insertions(+), 58 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 1eb14ae8163..1488103161c 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -791,45 +791,45 @@ static bool clamp_equal_within_epsilon(uint64_t x, uint64_t ref, double tol)
 }
 
 /* Show the entire range of values for an attribute */
-static void clamp_sweep(int dir, char *attr)
+static void clamp_sweep(igt_sysfs_clamp_t *sc)
 {
-	uint64_t get, set = 1;
+	uint64_t get, set = sc->start;
 	bool ret;
 
-	igt_debug("'%s': sweeping range of values\n", attr);
+	igt_debug("'%s': sweeping range of values\n", sc->attr);
 	while (1) {
 		if (set >= UINT64_MAX / 2) {
-			igt_debug("'%s': done sweeping\n", attr);
+			igt_debug("'%s': done sweeping\n", sc->attr);
 			return;
 		}
 
-		ret = igt_sysfs_set_u64(dir, attr, set);
-		get = igt_sysfs_get_u64(dir, attr);
-		igt_debug("'%s': ret %d set %lu get %lu\n", attr, ret, set, get);
+		ret = igt_sysfs_set_u64(sc->dir, sc->attr, set);
+		get = igt_sysfs_get_u64(sc->dir, sc->attr);
+		igt_debug("'%s': ret %d set %lu get %lu\n", sc->attr, ret, set, get);
 		set *= 2;
 	}
 }
 
 /* Find the min clamped level, or start of linear region for the attr */
-static int clamp_find_min(int dir, char *attr, uint64_t start, uint64_t *min)
+static int clamp_find_min(igt_sysfs_clamp_t *sc)
 {
-	uint64_t get, set = start;
+	uint64_t get, set = sc->start;
 	bool ret;
 
-	igt_debug("'%s': finding min\n", attr);
+	igt_debug("'%s': finding min\n", sc->attr);
 	while (1) {
 		/* searched enough */
 		if (set >= UINT64_MAX / 2) {
-			igt_debug("Unable to find min for attr '%s'\n", attr);
+			igt_debug("Unable to find min for attr '%s'\n", sc->attr);
 			return -ENOENT;
 		}
 
-		ret = igt_sysfs_set_u64(dir, attr, set);
-		get = igt_sysfs_get_u64(dir, attr);
-		igt_debug("'%s': ret %d set %lu get %lu\n", attr, ret, set, get);
+		ret = igt_sysfs_set_u64(sc->dir, sc->attr, set);
+		get = igt_sysfs_get_u64(sc->dir, sc->attr);
+		igt_debug("'%s': ret %d set %lu get %lu\n", sc->attr, ret, set, get);
 		if (ret && clamp_equal_within_epsilon(get, set, 0.1)) {
-			*min = set;
-			igt_debug("'%s': min %lu\n", attr, *min);
+			sc->min = set;
+			igt_debug("'%s': min %lu\n", sc->attr, sc->min);
 			return 0;
 		}
 		set *= 2;
@@ -837,26 +837,26 @@ static int clamp_find_min(int dir, char *attr, uint64_t start, uint64_t *min)
 }
 
 /* Find the max clamped level, or end of linear region for the attr */
-static int clamp_find_max(int dir, char *attr, uint64_t start, uint64_t *max)
+static int clamp_find_max(igt_sysfs_clamp_t *sc)
 {
-	uint64_t get, set = start * 2;
+	uint64_t get, set = sc->min * 2;
 	bool ret;
 
-	igt_debug("'%s': finding max\n", attr);
+	igt_debug("'%s': finding max\n", sc->attr);
 	while (1) {
 		/* searched enough */
 		if (set >= UINT64_MAX / 2) {
-			igt_debug("Unable to find max for attr '%s'\n", attr);
+			igt_debug("Unable to find max for attr '%s'\n", sc->attr);
 			return -ENOENT;
 		}
 
-		ret = igt_sysfs_set_u64(dir, attr, set);
-		get = igt_sysfs_get_u64(dir, attr);
-		igt_debug("'%s': ret %d set %lu get %lu\n", attr, ret, set, get);
+		ret = igt_sysfs_set_u64(sc->dir, sc->attr, set);
+		get = igt_sysfs_get_u64(sc->dir, sc->attr);
+		igt_debug("'%s': ret %d set %lu get %lu\n", sc->attr, ret, set, get);
 		if (!ret || !clamp_equal_within_epsilon(get, set, 0.1)) {
 			/* previous value is the max */
-			*max = set / 2;
-			igt_debug("'%s': max %lu\n", attr, *max);
+			sc->max = set / 2;
+			igt_debug("'%s': max %lu\n", sc->attr, sc->max);
 			return 0;
 		}
 		set *= 2;
@@ -867,36 +867,36 @@ static int clamp_find_max(int dir, char *attr, uint64_t start, uint64_t *max)
  * Verify that writes followed by reads in the linear region of the attr
  * are equal within a tolerance
 */
-static int clamp_verify_range(int dir, char *attr, uint64_t min, uint64_t max)
+static int clamp_verify_range(igt_sysfs_clamp_t *sc)
 {
-	uint64_t get, set = min;
+	uint64_t get, set;
 
 	/* min to max */
-	igt_debug("'%s': verifying: min to max\n", attr);
-	for (set = min; set <= max; set *= 2) {
-		if (!igt_sysfs_set_u64(dir, attr, set)) {
-			igt_debug("'%s': set %lu failed\n", attr, set);
+	igt_debug("'%s': verifying: min to max\n", sc->attr);
+	for (set = sc->min; set <= sc->max; set *= 2) {
+		if (!igt_sysfs_set_u64(sc->dir, sc->attr, set)) {
+			igt_debug("'%s': set %lu failed\n", sc->attr, set);
 			return -EIO;
 		}
-		get = igt_sysfs_get_u64(dir, attr);
-		igt_debug("'%s': set %lu get %lu\n", attr, set, get);
-		if (!clamp_equal_within_epsilon(get, set, 0.1)) {
-			igt_debug("'%s': mismatch set %lu get %lu\n", attr, set, get);
+		get = igt_sysfs_get_u64(sc->dir, sc->attr);
+		igt_debug("'%s': set %lu get %lu\n", sc->attr, set, get);
+		if (!clamp_equal_within_epsilon(get, set, sc->tol)) {
+			igt_debug("'%s': mismatch set %lu get %lu\n", sc->attr, set, get);
 			return -EIO;
 		}
 	}
 
 	/* max to min */
-	igt_debug("'%s': verifying: max to min\n", attr);
-	for (set = max; set >= min; set /= 2) {
-		if (!igt_sysfs_set_u64(dir, attr, set)) {
-			igt_debug("'%s': set %lu failed\n", attr, set);
+	igt_debug("'%s': verifying: max to min\n", sc->attr);
+	for (set = sc->max; set >= sc->min; set /= 2) {
+		if (!igt_sysfs_set_u64(sc->dir, sc->attr, set)) {
+			igt_debug("'%s': set %lu failed\n", sc->attr, set);
 			return -EIO;
 		}
-		get = igt_sysfs_get_u64(dir, attr);
-		igt_debug("'%s': set %lu get %lu\n", attr, set, get);
-		if (!clamp_equal_within_epsilon(get, set, 0.1)) {
-			igt_debug("'%s': mismatch set %lu get %lu\n", attr, set, get);
+		get = igt_sysfs_get_u64(sc->dir, sc->attr);
+		igt_debug("'%s': set %lu get %lu\n", sc->attr, set, get);
+		if (!clamp_equal_within_epsilon(get, set, sc->tol)) {
+			igt_debug("'%s': mismatch set %lu get %lu\n", sc->attr, set, get);
 			return -EIO;
 		}
 	}
@@ -906,8 +906,7 @@ static int clamp_verify_range(int dir, char *attr, uint64_t min, uint64_t max)
 
 /**
  * igt_sysfs_clamped_attr_verify:
- * @dir: directory for the device from igt_sysfs_open()
- * @attr: name of the sysfs node to open
+ * @sc: 'struct igt_sysfs_clamp' describing the clamped sysfs attr
  *
  * Several sysfs attributes (such as power, voltage, frequency, time) have
  * the property that writes to the attribute is clamped (saturated) at min
@@ -925,29 +924,29 @@ static int clamp_verify_range(int dir, char *attr, uint64_t min, uint64_t max)
  * within a tolerance in the linear region. With --debug, it also displays
  * the entire range for read and written values of the attribute.
  */
-void igt_sysfs_clamped_attr_verify(int dir, char *attr)
+void igt_sysfs_clamped_attr_verify(igt_sysfs_clamp_t *sc)
 {
-	uint64_t prev, get, min, max;
+	uint64_t prev, get;
 	struct stat st;
 	int ret;
 
-	igt_assert(!fstatat(dir, attr, &st, 0));
+	igt_assert(!fstatat(sc->dir, sc->attr, &st, 0));
 	igt_assert(st.st_mode & 0222);
 
-	prev = igt_sysfs_get_u64(dir, attr);
-	igt_debug("'%s': prev %lu\n", attr, prev);
+	prev = igt_sysfs_get_u64(sc->dir, sc->attr);
+	igt_debug("'%s': prev %lu\n", sc->attr, prev);
 
-	clamp_sweep(dir, attr);
+	clamp_sweep(sc);
 
-	ret = clamp_find_min(dir, attr, 1, &min);
+	ret = clamp_find_min(sc);
 	if (ret)
 		goto restore;
 
-	ret = clamp_find_max(dir, attr, min, &max);
+	ret = clamp_find_max(sc);
 	if (ret)
 		goto restore;
 
-	ret = clamp_verify_range(dir, attr, min, max);
+	ret = clamp_verify_range(sc);
 	if (ret)
 		goto restore;
 
@@ -956,8 +955,8 @@ void igt_sysfs_clamped_attr_verify(int dir, char *attr)
 	 * that we can restore the attr before asserting
 	 */
 restore:
-	igt_assert_eq(1, igt_sysfs_set_u64(dir, attr, prev));
-	get = igt_sysfs_get_u64(dir, attr);
+	igt_assert_eq(1, igt_sysfs_set_u64(sc->dir, sc->attr, prev));
+	get = igt_sysfs_get_u64(sc->dir, sc->attr);
 	igt_assert_eq(get, prev);
 	igt_assert(!ret);
 }
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index b079f0fcbd6..95d805bbc65 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -125,6 +125,27 @@ void bind_fbcon(bool enable);
 void kick_snd_hda_intel(void);
 void fbcon_blink_enable(bool enable);
 
-void igt_sysfs_clamped_attr_verify(int dir, char *attr);
+/**
+ * igt_sysfs_clamp:
+ * @dir: file descriptor for parent directory
+ * @attr: name of sysfs attribute
+ * @start: start value to start searching for min, typically just 1
+ * @tol: tolerance to use to compare written and read values
+ * @min: (output) min clamped level, or start of linear region for the attr
+ * @max: (output) max clamped level, or end of linear region for the attr
+ *
+ * Structure used to describe the clampled sysfs attribute to
+ * igt_sysfs_clamped_attr_verify
+ */
+typedef struct igt_sysfs_clamp {
+	int dir;
+	char *attr;
+	uint64_t start;
+	double tol;
+	uint64_t min;
+	uint64_t max;
+} igt_sysfs_clamp_t;
+
+void igt_sysfs_clamped_attr_verify(igt_sysfs_clamp_t *sc);
 
 #endif /* __IGT_SYSFS_H__ */
diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
index 6bf048735f7..7127b3b57b2 100644
--- a/tests/i915/i915_hwmon.c
+++ b/tests/i915/i915_hwmon.c
@@ -34,10 +34,15 @@ static void hwmon_read(int hwm)
 
 static void hwmon_write(int hwm)
 {
+	igt_sysfs_clamp_t sc;
 	struct dirent *de;
 	struct stat st;
 	DIR *dir;
 
+	sc.dir = hwm;
+	sc.start = 1;
+	sc.tol = 0.1;
+
 	dir = fdopendir(dup(hwm));
 	igt_assert(dir);
 	rewinddir(dir);
@@ -50,7 +55,8 @@ static void hwmon_write(int hwm)
 		if (!(st.st_mode & 0222))
 			continue;
 
-		igt_sysfs_clamped_attr_verify(hwm, de->d_name);
+		sc.attr = de->d_name;
+		igt_sysfs_clamped_attr_verify(&sc);
 	}
 	closedir(dir);
 }
-- 
2.38.0
