Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916C510E15C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 06:12:38 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 11 Dec 2022 22:12:31 -0800
Message-Id: <20221212061233.2220742-2-ashutosh.dixit@intel.com>
In-Reply-To: <20221212061233.2220742-1-ashutosh.dixit@intel.com>
References: <20221212061233.2220742-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_sysfs: Generic verification of
 clamped sysfs attributes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Several sysfs attributes have the property that writes to the attribute is
clamped at min and/or max levels. Implement a generic verification for such
sysfs attributes. The clamped min and max limits (and therefore the linear
region for the attribute) are determined by sweeping over the range of
possible values. It is also verified that the read value following a write
to the attribute is approximately equal to the written value in the linear
range.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_sysfs.c | 177 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |   2 +
 2 files changed, 179 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index a913be4c8f2..1eb14ae8163 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -784,3 +784,180 @@ void fbcon_blink_enable(bool enable)
 	write(fd, buffer, r + 1);
 	close(fd);
 }
+
+static bool clamp_equal_within_epsilon(uint64_t x, uint64_t ref, double tol)
+{
+	return (x <= (1.0 + tol) * ref) && (x >= (1.0 - tol) * ref);
+}
+
+/* Show the entire range of values for an attribute */
+static void clamp_sweep(int dir, char *attr)
+{
+	uint64_t get, set = 1;
+	bool ret;
+
+	igt_debug("'%s': sweeping range of values\n", attr);
+	while (1) {
+		if (set >= UINT64_MAX / 2) {
+			igt_debug("'%s': done sweeping\n", attr);
+			return;
+		}
+
+		ret = igt_sysfs_set_u64(dir, attr, set);
+		get = igt_sysfs_get_u64(dir, attr);
+		igt_debug("'%s': ret %d set %lu get %lu\n", attr, ret, set, get);
+		set *= 2;
+	}
+}
+
+/* Find the min clamped level, or start of linear region for the attr */
+static int clamp_find_min(int dir, char *attr, uint64_t start, uint64_t *min)
+{
+	uint64_t get, set = start;
+	bool ret;
+
+	igt_debug("'%s': finding min\n", attr);
+	while (1) {
+		/* searched enough */
+		if (set >= UINT64_MAX / 2) {
+			igt_debug("Unable to find min for attr '%s'\n", attr);
+			return -ENOENT;
+		}
+
+		ret = igt_sysfs_set_u64(dir, attr, set);
+		get = igt_sysfs_get_u64(dir, attr);
+		igt_debug("'%s': ret %d set %lu get %lu\n", attr, ret, set, get);
+		if (ret && clamp_equal_within_epsilon(get, set, 0.1)) {
+			*min = set;
+			igt_debug("'%s': min %lu\n", attr, *min);
+			return 0;
+		}
+		set *= 2;
+	}
+}
+
+/* Find the max clamped level, or end of linear region for the attr */
+static int clamp_find_max(int dir, char *attr, uint64_t start, uint64_t *max)
+{
+	uint64_t get, set = start * 2;
+	bool ret;
+
+	igt_debug("'%s': finding max\n", attr);
+	while (1) {
+		/* searched enough */
+		if (set >= UINT64_MAX / 2) {
+			igt_debug("Unable to find max for attr '%s'\n", attr);
+			return -ENOENT;
+		}
+
+		ret = igt_sysfs_set_u64(dir, attr, set);
+		get = igt_sysfs_get_u64(dir, attr);
+		igt_debug("'%s': ret %d set %lu get %lu\n", attr, ret, set, get);
+		if (!ret || !clamp_equal_within_epsilon(get, set, 0.1)) {
+			/* previous value is the max */
+			*max = set / 2;
+			igt_debug("'%s': max %lu\n", attr, *max);
+			return 0;
+		}
+		set *= 2;
+	}
+}
+
+/*
+ * Verify that writes followed by reads in the linear region of the attr
+ * are equal within a tolerance
+*/
+static int clamp_verify_range(int dir, char *attr, uint64_t min, uint64_t max)
+{
+	uint64_t get, set = min;
+
+	/* min to max */
+	igt_debug("'%s': verifying: min to max\n", attr);
+	for (set = min; set <= max; set *= 2) {
+		if (!igt_sysfs_set_u64(dir, attr, set)) {
+			igt_debug("'%s': set %lu failed\n", attr, set);
+			return -EIO;
+		}
+		get = igt_sysfs_get_u64(dir, attr);
+		igt_debug("'%s': set %lu get %lu\n", attr, set, get);
+		if (!clamp_equal_within_epsilon(get, set, 0.1)) {
+			igt_debug("'%s': mismatch set %lu get %lu\n", attr, set, get);
+			return -EIO;
+		}
+	}
+
+	/* max to min */
+	igt_debug("'%s': verifying: max to min\n", attr);
+	for (set = max; set >= min; set /= 2) {
+		if (!igt_sysfs_set_u64(dir, attr, set)) {
+			igt_debug("'%s': set %lu failed\n", attr, set);
+			return -EIO;
+		}
+		get = igt_sysfs_get_u64(dir, attr);
+		igt_debug("'%s': set %lu get %lu\n", attr, set, get);
+		if (!clamp_equal_within_epsilon(get, set, 0.1)) {
+			igt_debug("'%s': mismatch set %lu get %lu\n", attr, set, get);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * igt_sysfs_clamped_attr_verify:
+ * @dir: directory for the device from igt_sysfs_open()
+ * @attr: name of the sysfs node to open
+ *
+ * Several sysfs attributes (such as power, voltage, frequency, time) have
+ * the property that writes to the attribute is clamped (saturated) at min
+ * and/or max levels. The clamping can be done in a couple of ways, either
+ * the write past the clamped level is disallowed, or the write is allowed
+ * but a read following the write reflects the clamped value. Between the
+ * clamped levels is a "linear" region for the attribute where the read
+ * following the write reflects approximately or exactly the value
+ * written. The attributes are typically also unsigned.
+ *
+ * This function implements a generic verification of sysfs attributes with
+ * the above properties. The linear region of the attribute is determined
+ * by sweeping over the entire range of possible values and then it is
+ * verified that read value for the attribute is equal to the written value
+ * within a tolerance in the linear region. With --debug, it also displays
+ * the entire range for read and written values of the attribute.
+ */
+void igt_sysfs_clamped_attr_verify(int dir, char *attr)
+{
+	uint64_t prev, get, min, max;
+	struct stat st;
+	int ret;
+
+	igt_assert(!fstatat(dir, attr, &st, 0));
+	igt_assert(st.st_mode & 0222);
+
+	prev = igt_sysfs_get_u64(dir, attr);
+	igt_debug("'%s': prev %lu\n", attr, prev);
+
+	clamp_sweep(dir, attr);
+
+	ret = clamp_find_min(dir, attr, 1, &min);
+	if (ret)
+		goto restore;
+
+	ret = clamp_find_max(dir, attr, min, &max);
+	if (ret)
+		goto restore;
+
+	ret = clamp_verify_range(dir, attr, min, max);
+	if (ret)
+		goto restore;
+
+	/*
+	 * Restore previous value: we don't assert before this point so
+	 * that we can restore the attr before asserting
+	 */
+restore:
+	igt_assert_eq(1, igt_sysfs_set_u64(dir, attr, prev));
+	get = igt_sysfs_get_u64(dir, attr);
+	igt_assert_eq(get, prev);
+	igt_assert(!ret);
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 1c9791a1bdc..b079f0fcbd6 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -125,4 +125,6 @@ void bind_fbcon(bool enable);
 void kick_snd_hda_intel(void);
 void fbcon_blink_enable(bool enable);
 
+void igt_sysfs_clamped_attr_verify(int dir, char *attr);
+
 #endif /* __IGT_SYSFS_H__ */
-- 
2.38.0
