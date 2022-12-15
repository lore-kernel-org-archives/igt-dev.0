Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE35710E4E3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 02:31:15 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 18:31:08 -0800
Message-Id: <20221215023110.2436554-2-ashutosh.dixit@intel.com>
In-Reply-To: <20221215023110.2436554-1-ashutosh.dixit@intel.com>
References: <20221215023110.2436554-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_sysfs: Generic verification of
 writable sysfs attributes
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

Attempt to verify writable sysfs attributes in a generic way, without going
into the specifics of any attribute. The attribute is first written to and
then read back and it is verified that the read value matches the written
value to a tolerance. However, when we try to do this we run into the issue
that a sysfs attribute might have a behavior where the read value is
different from the written value for any reason. For example, attributes
such as power, voltage, frequency and time typically have a linear region
outside which they are clamped (the values saturate). Therefore for such
attributes read values match the written value only in the linear region
and when writing we don't know if we are writing to the linear or to the
clamped region.

Therefore the verification implemented here takes the approach of sweeping
across the range of possible values of the attribute (this is done using
'doubling' rather than linearly) and seeing where there are matches. There
should be at least one match for the verification to have succeeded.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_sysfs.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h | 20 +++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index a913be4c8f2..c1f8e2d8632 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -784,3 +784,82 @@ void fbcon_blink_enable(bool enable)
 	write(fd, buffer, r + 1);
 	close(fd);
 }
+
+static bool rw_attr_equal_within_epsilon(uint64_t x, uint64_t ref, double tol)
+{
+	return (x <= (1.0 + tol) * ref) && (x >= (1.0 - tol) * ref);
+}
+
+/* Sweep the range of values for an attribute to identify matching reads/writes */
+static int rw_attr_sweep(igt_sysfs_rw_attr_t *rw)
+{
+	uint64_t get, set = rw->start;
+	int num_points = 0;
+	bool ret;
+
+	igt_debug("'%s': sweeping range of values\n", rw->attr);
+	while (1) {
+		if (set >= UINT64_MAX / 2) {
+			igt_debug("'%s': done sweeping\n", rw->attr);
+			break;
+		}
+
+		ret = igt_sysfs_set_u64(rw->dir, rw->attr, set);
+		get = igt_sysfs_get_u64(rw->dir, rw->attr);
+		igt_debug("'%s': ret %d set %lu get %lu\n", rw->attr, ret, set, get);
+		if (ret && rw_attr_equal_within_epsilon(get, set, rw->tol)) {
+			igt_debug("'%s': matches\n", rw->attr);
+			num_points++;
+		}
+
+		set *= 2;
+	}
+
+	return num_points ? 0 : -ENOENT;
+}
+
+/**
+ * igt_sysfs_rw_attr_verify:
+ * @rw: 'struct igt_sysfs_rw_attr' describing a rw sysfs attr
+ *
+ * This function attempts to verify writable sysfs attributes, that is the
+ * attribute is first written to and then read back and it is verified that
+ * the read value matches the written value to a tolerance. However, when
+ * we try to do this we run into the issue that a sysfs attribute might
+ * have a behavior where the read value is different from the written value
+ * for any reason. For example, attributes such as power, voltage,
+ * frequency and time typically have a linear region outside which they are
+ * clamped (the values saturate). Therefore for such attributes read values
+ * match the written value only in the linear region and when writing we
+ * don't know if we are writing to the linear or to the clamped region.
+ *
+ * Therefore the verification implemented here takes the approach of
+ * sweeping across the range of possible values of the attribute (this is
+ * done using 'doubling' rather than linearly) and seeing where there are
+ * matches. There should be at least one match (to a tolerance) for the
+ * verification to have succeeded.
+ */
+void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
+{
+	uint64_t prev, get;
+	struct stat st;
+	int ret;
+
+	igt_assert(!fstatat(rw->dir, rw->attr, &st, 0));
+	igt_assert(st.st_mode & 0222); /* writable */
+	igt_assert(rw->start);	/* cannot be 0 */
+
+	prev = igt_sysfs_get_u64(rw->dir, rw->attr);
+	igt_debug("'%s': prev %lu\n", rw->attr, prev);
+
+	ret = rw_attr_sweep(rw);
+
+	/*
+	 * Restore previous value: we don't assert before this point so
+	 * that we can restore the attr before asserting
+	 */
+	igt_assert_eq(1, igt_sysfs_set_u64(rw->dir, rw->attr, prev));
+	get = igt_sysfs_get_u64(rw->dir, rw->attr);
+	igt_assert_eq(get, prev);
+	igt_assert(!ret);
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 1c9791a1bdc..2e3c4813adc 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -125,4 +125,24 @@ void bind_fbcon(bool enable);
 void kick_snd_hda_intel(void);
 void fbcon_blink_enable(bool enable);
 
+/**
+ * igt_sysfs_rw_attr:
+ * @dir: file descriptor for parent directory
+ * @attr: name of sysfs attribute
+ * @start: start value for searching for matching reads/writes
+ * @tol: tolerance to use to compare written and read values
+ * @rsvd: reserved field used internally
+ *
+ * Structure used to describe the rw sysfs attribute to
+ * igt_sysfs_rw_attr_verify
+ */
+typedef struct igt_sysfs_rw_attr {
+	int dir;
+	char *attr;
+	uint64_t start;
+	double tol;
+} igt_sysfs_rw_attr_t;
+
+void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
+
 #endif /* __IGT_SYSFS_H__ */
-- 
2.38.0
