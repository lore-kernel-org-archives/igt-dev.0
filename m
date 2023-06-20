Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB83E10E0A4
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 17:12:44 +0000 (UTC)
From: =?UTF-8?q?=C5=81ukasz=20=C5=81aguna?= <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 19:12:20 +0200
Message-Id: <20230620171220.21718-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_sysfs: add asserting helpers for
 read/write operations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Prefix names of existing, non-asserting helpers with "__":

- igt_sysfs_get_u32 -> __igt_sysfs_get_u32
- igt_sysfs_set_u32 -> __igt_sysfs_set_u32
- igt_sysfs_get_u64 -> __igt_sysfs_get_u64
- igt_sysfs_set_u64 -> __igt_sysfs_set_u64
- igt_sysfs_get_boolean -> __igt_sysfs_get_boolean
- igt_sysfs_set_boolean -> __igt_sysfs_set_boolean

Replace all calls to don't introduce any functional changes in the
existing code.

Additionally, reimplement non-asserting get helpers to return boolean
result of the read operation and store the read value via pointer
passed as function parameter. In previous implementation, it wasn't
possible to distinguish if returned zero was a read value or failure on
a read attempt.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/i915/gem_submission.c      |   4 +-
 lib/igt_pm.c                   |   2 +-
 lib/igt_power.c                |   2 +-
 lib/igt_sysfs.c                | 193 +++++++++++++++++++++++----------
 lib/igt_sysfs.h                |  28 +++--
 tests/device_reset.c           |   5 +-
 tests/i915/i915_pm_dc.c        |   6 +-
 tests/i915/i915_pm_freq_mult.c |  41 +++----
 tests/i915/i915_pm_rps.c       |  32 +++---
 tests/i915/i915_power.c        |   9 +-
 tests/i915/perf_pmu.c          |  49 +++++----
 tests/kms_prime.c              |   6 +-
 tests/nouveau_crc.c            |   7 +-
 13 files changed, 246 insertions(+), 138 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index adf5eb394..7d1c3970f 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -65,12 +65,14 @@ unsigned gem_submission_method(int fd)
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned method = GEM_SUBMISSION_RINGBUF;
 	int dir;
+	uint32_t value = 0;
 
 	dir = igt_params_open(fd);
 	if (dir < 0)
 		return 0;
 
-	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
+	__igt_sysfs_get_u32(dir, "enable_guc", &value);
+	if (value & 1) {
 		method = GEM_SUBMISSION_GUC;
 	} else if (gen >= 8) {
 		method = GEM_SUBMISSION_EXECLISTS;
diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 18c84bf3a..ba591f0f8 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1415,5 +1415,5 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 		return;
 
 	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
-	igt_assert(igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val));
+	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
 }
diff --git a/lib/igt_power.c b/lib/igt_power.c
index 3b34be406..b4c846cc4 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -137,7 +137,7 @@ void igt_power_get_energy(struct igt_power *power, struct power_sample *s)
 
 	if (power->hwmon_fd >= 0) {
 		if (igt_sysfs_has_attr(power->hwmon_fd, "energy1_input"))
-			s->energy = igt_sysfs_get_u64(power->hwmon_fd, "energy1_input");
+			__igt_sysfs_get_u64(power->hwmon_fd, "energy1_input", &s->energy);
 	} else if (power->rapl.fd >= 0) {
 		rapl_read(&power->rapl, s);
 	}
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 35a4faa9a..01e1c2089 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -512,121 +512,204 @@ int igt_sysfs_printf(int dir, const char *attr, const char *fmt, ...)
 }
 
 /**
- * igt_sysfs_get_u32:
- * @dir: directory for the device from igt_sysfs_open()
- * @attr: name of the sysfs node to open
+ * __igt_sysfs_get_u32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ * @value: pointer for storing read value
  *
  * Convenience wrapper to read a unsigned 32bit integer from a sysfs file.
  *
  * Returns:
- * The value read.
+ * True if value successfully read, false otherwise.
  */
-uint32_t igt_sysfs_get_u32(int dir, const char *attr)
+bool __igt_sysfs_get_u32(int dir, const char *attr, uint32_t *value)
 {
-	uint32_t result;
+	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%u", value) != 1))
+		return false;
 
-	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%u", &result) != 1))
-		return 0;
+	return true;
+}
 
-	return result;
+/**
+ * igt_sysfs_get_u32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ * @value: pointer for storing read value
+ *
+ * Asserting equivalent of __igt_sysfs_get_u32.
+ */
+void igt_sysfs_get_u32(int dir, const char *attr, uint32_t *value)
+{
+	igt_assert(__igt_sysfs_get_u32(dir, attr, value));
 }
 
 /**
- * igt_sysfs_get_u64:
- * @dir: directory for the device from igt_sysfs_open()
- * @attr: name of the sysfs node to open
+ * __igt_sysfs_set_u32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
+ * @value: value to set
+ *
+ * Convenience wrapper to write a unsigned 32bit integer to a sysfs file.
+ *
+ * Returns:
+ * True if successfully written, false otherwise.
+ */
+bool __igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
+{
+	return igt_sysfs_printf(dir, attr, "%u", value) > 0;
+}
+
+/**
+ * igt_sysfs_set_u32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
+ * @value: value to set
+ *
+ * Asserting equivalent of __igt_sysfs_set_u32.
+ */
+void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
+{
+	igt_assert(__igt_sysfs_set_u32(dir, attr, value));
+}
+
+/**
+ * __igt_sysfs_get_u64:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ * @value: pointer for storing read value
  *
  * Convenience wrapper to read a unsigned 64bit integer from a sysfs file.
  *
  * Returns:
- * The value read.
+ * True if value successfully read, false otherwise.
  */
-uint64_t igt_sysfs_get_u64(int dir, const char *attr)
+bool __igt_sysfs_get_u64(int dir, const char *attr, uint64_t *value)
 {
-	uint64_t result;
+	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%"PRIu64, value) != 1))
+		return false;
 
-	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%"PRIu64, &result) != 1))
-		return 0;
+	return true;
+}
 
-	return result;
+/**
+ * igt_sysfs_get_u64:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ * @value: pointer for storing read value
+ *
+ * Asserting equivalent of __igt_sysfs_get_u64.
+ */
+void igt_sysfs_get_u64(int dir, const char *attr, uint64_t *value)
+{
+	igt_assert(__igt_sysfs_get_u64(dir, attr, value));
 }
 
 /**
- * igt_sysfs_set_u64:
- * @dir: directory for the device from igt_sysfs_open()
- * @attr: name of the sysfs node to open
+ * __igt_sysfs_set_u64:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
  * @value: value to set
  *
  * Convenience wrapper to write a unsigned 64bit integer to a sysfs file.
  *
  * Returns:
- * True if successfully written
+ * True if successfully written, false otherwise.
  */
-bool igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
+bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
 {
 	return igt_sysfs_printf(dir, attr, "%"PRIu64, value) > 0;
 }
 
 /**
- * igt_sysfs_set_u32:
- * @dir: directory for the device from igt_sysfs_open()
- * @attr: name of the sysfs node to open
+ * igt_sysfs_set_u64:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
  * @value: value to set
  *
- * Convenience wrapper to write a unsigned 32bit integer to a sysfs file.
- *
- * Returns:
- * True if successfully written
+ * Asserting equivalent of __igt_sysfs_set_u64.
  */
-bool igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
+void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
 {
-	return igt_sysfs_printf(dir, attr, "%u", value) > 0;
+	igt_assert(__igt_sysfs_set_u64(dir, attr, value));
 }
 
 /**
- * igt_sysfs_get_boolean:
- * @dir: directory for the device from igt_sysfs_open()
- * @attr: name of the sysfs node to open
+ * __igt_sysfs_get_boolean:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ * @value: pointer for storing read value
  *
  * Convenience wrapper to read a boolean sysfs file.
- * 
+ *
  * Returns:
- * The value read.
+ * True if value successfully read, false otherwise.
  */
-bool igt_sysfs_get_boolean(int dir, const char *attr)
+bool __igt_sysfs_get_boolean(int dir, const char *attr, bool *value)
 {
-	int result;
 	char *buf;
 
 	buf = igt_sysfs_get(dir, attr);
 	if (igt_debug_on(!buf))
 		return false;
 
-	if (sscanf(buf, "%d", &result) != 1) {
+	if (sscanf(buf, "%hhu", (uint8_t *)value) != 1) {
 		/* kernel's param_get_bool() returns "Y"/"N" */
-		result = !strcasecmp(buf, "Y");
+		if (!strcasecmp(buf, "Y")) {
+			*value = true;
+		} else if (!strcasecmp(buf, "N")) {
+			*value = false;
+		} else {
+			free(buf);
+			return false;
+		}
 	}
 
 	free(buf);
-	return result;
+	return true;
 }
 
 /**
- * igt_sysfs_set_boolean:
- * @dir: directory for the device from igt_sysfs_open()
- * @attr: name of the sysfs node to open
+ * igt_sysfs_get_boolean:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ * @value: pointer for storing read value
+ *
+ * Asserting equivalent of __igt_sysfs_get_boolean.
+ */
+void igt_sysfs_get_boolean(int dir, const char *attr, bool *value)
+{
+	igt_assert(__igt_sysfs_get_boolean(dir, attr, value));
+}
+
+/**
+ * __igt_sysfs_set_boolean:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
  * @value: value to set
  *
  * Convenience wrapper to write a boolean sysfs file.
- * 
+ *
  * Returns:
- * The value read.
+ * True if successfully written, false otherwise.
  */
-bool igt_sysfs_set_boolean(int dir, const char *attr, bool value)
+bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value)
 {
 	return igt_sysfs_printf(dir, attr, "%d", value) == 1;
 }
 
+/**
+ * igt_sysfs_set_boolean:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
+ * @value: value to set
+ *
+ * Asserting equivalent of __igt_sysfs_set_boolean.
+ */
+void igt_sysfs_set_boolean(int dir, const char *attr, bool value)
+{
+	igt_assert(__igt_sysfs_set_boolean(dir, attr, value));
+}
+
 static void bind_con(const char *name, bool enable)
 {
 	const char *path = "/sys/class/vtconsole";
@@ -791,14 +874,14 @@ static bool rw_attr_equal_within_epsilon(uint64_t x, uint64_t ref, double tol)
 /* Sweep the range of values for an attribute to identify matching reads/writes */
 static int rw_attr_sweep(igt_sysfs_rw_attr_t *rw)
 {
-	uint64_t get, set = rw->start;
+	uint64_t get = 0, set = rw->start;
 	int num_points = 0;
 	bool ret;
 
 	igt_debug("'%s': sweeping range of values\n", rw->attr);
 	while (set < UINT64_MAX / 2) {
-		ret = igt_sysfs_set_u64(rw->dir, rw->attr, set);
-		get = igt_sysfs_get_u64(rw->dir, rw->attr);
+		ret = __igt_sysfs_set_u64(rw->dir, rw->attr, set);
+		__igt_sysfs_get_u64(rw->dir, rw->attr, &get);
 		igt_debug("'%s': ret %d set %lu get %lu\n", rw->attr, ret, set, get);
 		if (ret && rw_attr_equal_within_epsilon(get, set, rw->tol)) {
 			igt_debug("'%s': matches\n", rw->attr);
@@ -834,7 +917,7 @@ static int rw_attr_sweep(igt_sysfs_rw_attr_t *rw)
  */
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 {
-	uint64_t prev, get;
+	uint64_t prev = 0, get = 0;
 	struct stat st;
 	int ret;
 
@@ -842,7 +925,7 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	igt_assert(st.st_mode & 0222); /* writable */
 	igt_assert(rw->start);	/* cannot be 0 */
 
-	prev = igt_sysfs_get_u64(rw->dir, rw->attr);
+	__igt_sysfs_get_u64(rw->dir, rw->attr, &prev);
 	igt_debug("'%s': prev %lu\n", rw->attr, prev);
 
 	ret = rw_attr_sweep(rw);
@@ -851,8 +934,8 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	 * Restore previous value: we don't assert before this point so
 	 * that we can restore the attr before asserting
 	 */
-	igt_assert_eq(1, igt_sysfs_set_u64(rw->dir, rw->attr, prev));
-	get = igt_sysfs_get_u64(rw->dir, rw->attr);
+	igt_sysfs_set_u64(rw->dir, rw->attr, prev);
+	__igt_sysfs_get_u64(rw->dir, rw->attr, &get);
 	igt_assert_eq(get, prev);
 	igt_assert(!ret);
 }
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 978b6906e..f3cb6c7cd 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -61,14 +61,14 @@
 #define igt_sysfs_rps_printf(dir, id, fmt, ...) \
 	igt_sysfs_printf(dir, igt_sysfs_dir_id_to_name(dir, id), fmt, ##__VA_ARGS__)
 
-#define igt_sysfs_rps_get_u32(dir, id) \
-	igt_sysfs_get_u32(dir, igt_sysfs_dir_id_to_name(dir, id))
+#define igt_sysfs_rps_get_u32(dir, id, value) \
+	__igt_sysfs_get_u32(dir, igt_sysfs_dir_id_to_name(dir, id), value)
 
 #define igt_sysfs_rps_set_u32(dir, id, value) \
-	igt_sysfs_set_u32(dir, igt_sysfs_dir_id_to_name(dir, id), value)
+	__igt_sysfs_set_u32(dir, igt_sysfs_dir_id_to_name(dir, id), value)
 
-#define igt_sysfs_rps_get_boolean(dir, id) \
-	igt_sysfs_get_boolean(dir, igt_sysfs_dir_id_to_name(dir, id))
+#define igt_sysfs_rps_get_boolean(dir, id, value) \
+	igt_sysfs_get_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
 
 #define igt_sysfs_rps_set_boolean(dir, id, value) \
 	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
@@ -114,14 +114,20 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 int igt_sysfs_printf(int dir, const char *attr, const char *fmt, ...)
 	__attribute__((format(printf,3,4)));
 
-uint32_t igt_sysfs_get_u32(int dir, const char *attr);
-bool igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
+bool __igt_sysfs_get_u32(int dir, const char *attr, uint32_t *value);
+void igt_sysfs_get_u32(int dir, const char *attr, uint32_t *value);
+bool __igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
+void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
 
-uint64_t igt_sysfs_get_u64(int dir, const char *attr);
-bool igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
+bool __igt_sysfs_get_u64(int dir, const char *attr, uint64_t *value);
+void igt_sysfs_get_u64(int dir, const char *attr, uint64_t *value);
+bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
+void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
 
-bool igt_sysfs_get_boolean(int dir, const char *attr);
-bool igt_sysfs_set_boolean(int dir, const char *attr, bool value);
+bool __igt_sysfs_get_boolean(int dir, const char *attr, bool *value);
+void igt_sysfs_get_boolean(int dir, const char *attr, bool *value);
+bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value);
+void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 
 void bind_fbcon(bool enable);
 void kick_snd_hda_intel(void);
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 9ebd479df..1eb0ea27e 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -359,13 +359,16 @@ static void driver_bind(struct device_fds *dev)
 /* Initiate device reset */
 static void initiate_device_reset(struct device_fds *dev, enum reset type)
 {
+	bool value = false;
+
 	igt_debug("reset device\n");
 
 	if (type == FLR_RESET) {
 		igt_assert(igt_sysfs_set(dev->fds.dev_dir, "reset", "1"));
 	} else if (type == COLD_RESET) {
 		igt_assert(igt_sysfs_set(dev->fds.slot_dir, "power", "0"));
-		igt_assert(!igt_sysfs_get_boolean(dev->fds.slot_dir, "power"));
+		__igt_sysfs_get_boolean(dev->fds.slot_dir, "power", &value);
+		igt_assert(!value);
 		igt_assert(igt_sysfs_set(dev->fds.slot_dir, "power", "1"));
 	}
 
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 2bb07ba8b..b83cafbd5 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -533,8 +533,8 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 	int prev_dc = 0, prev_rpm, sysfs_fd;
 
 	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
-	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
-	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
+	__igt_sysfs_get_boolean(sysfs_fd, "poll", &kms_poll_saved_state);
+	__igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
 	close(sysfs_fd);
 	if (DC9_RESETS_DC_COUNTERS(data->devid)) {
 		prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
@@ -629,7 +629,7 @@ static void kms_poll_state_restore(int sig)
 
 	sysfs_fd = open(KMS_HELPER, O_RDONLY);
 	if (sysfs_fd >= 0) {
-		igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
+		__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
 		close(sysfs_fd);
 	}
 }
diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
index d75ec3f9e..6b667906d 100644
--- a/tests/i915/i915_pm_freq_mult.c
+++ b/tests/i915/i915_pm_freq_mult.c
@@ -50,25 +50,26 @@ static void spin_all(void)
 
 static void restore_rps_defaults(int dir)
 {
-	int def, min, max;
+	int def;
+	uint32_t min = 0, max = 0;
 
 	/* Read from gt/gtN/.defaults/ write to gt/gtN/ */
 	def = openat(dir, ".defaults", O_RDONLY);
 	if (def < 0)
 		return;
 
-	max = igt_sysfs_get_u32(def, "rps_max_freq_mhz");
-	igt_sysfs_set_u32(dir, "rps_max_freq_mhz", max);
+	__igt_sysfs_get_u32(def, "rps_max_freq_mhz", &max);
+	__igt_sysfs_set_u32(dir, "rps_max_freq_mhz", max);
 
-	min = igt_sysfs_get_u32(def, "rps_min_freq_mhz");
-	igt_sysfs_set_u32(dir, "rps_min_freq_mhz", min);
+	__igt_sysfs_get_u32(def, "rps_min_freq_mhz", &min);
+	__igt_sysfs_set_u32(dir, "rps_min_freq_mhz", min);
 
 	close(def);
 }
 
 static void setup_freq(int gt, int dir)
 {
-	int rp0, rp1, rpn, min, max, act, media;
+	uint32_t rp0 = 0, rp1 = 0, rpn = 0, min = 0, max = 0, act = 0, media = 0;
 
 	ctx = intel_ctx_create_all_physical(i915);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
@@ -81,17 +82,17 @@ static void setup_freq(int gt, int dir)
 	wait_freq_set();
 
 	/* Print some debug information */
-	rp0 = igt_sysfs_get_u32(dir, "rps_RP0_freq_mhz");
-	rp1 = igt_sysfs_get_u32(dir, "rps_RP1_freq_mhz");
-	rpn = igt_sysfs_get_u32(dir, "rps_RPn_freq_mhz");
-	min = igt_sysfs_get_u32(dir, "rps_min_freq_mhz");
-	max = igt_sysfs_get_u32(dir, "rps_max_freq_mhz");
-	act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
+	rp0 = __igt_sysfs_get_u32(dir, "rps_RP0_freq_mhz", &rp0);
+	rp1 = __igt_sysfs_get_u32(dir, "rps_RP1_freq_mhz", &rp1);
+	rpn = __igt_sysfs_get_u32(dir, "rps_RPn_freq_mhz", &rpn);
+	min = __igt_sysfs_get_u32(dir, "rps_min_freq_mhz", &min);
+	max = __igt_sysfs_get_u32(dir, "rps_max_freq_mhz", &max);
+	act = __igt_sysfs_get_u32(dir, "rps_act_freq_mhz", &act);
 
-	igt_debug("RP0 MHz: %d, RP1 MHz: %d, RPn MHz: %d, min MHz: %d, max MHz: %d, act MHz: %d\n", rp0, rp1, rpn, min, max, act);
+	igt_debug("RP0 MHz: %u, RP1 MHz: %u, RPn MHz: %u, min MHz: %u, max MHz: %u, act MHz: %u\n", rp0, rp1, rpn, min, max, act);
 
 	if (igt_sysfs_has_attr(dir, "media_freq_factor")) {
-		media = igt_sysfs_get_u32(dir, "media_freq_factor");
+		__igt_sysfs_get_u32(dir, "media_freq_factor", &media);
 		igt_debug("media ratio: %.2f\n", media * FREQ_SCALE_FACTOR);
 	}
 }
@@ -108,6 +109,7 @@ static void cleanup(int dir)
 static void media_freq(int gt, int dir)
 {
 	float scale;
+	uint32_t rp0 = 0, rpn = 0;
 
 	igt_require(igt_sysfs_has_attr(dir, "media_freq_factor"));
 
@@ -116,9 +118,9 @@ static void media_freq(int gt, int dir)
 
 	setup_freq(gt, dir);
 
-	igt_debug("media RP0 mhz: %d, media RPn mhz: %d\n",
-		  igt_sysfs_get_u32(dir, "media_RP0_freq_mhz"),
-		  igt_sysfs_get_u32(dir, "media_RPn_freq_mhz"));
+	__igt_sysfs_get_u32(dir, "media_RP0_freq_mhz", &rp0);
+	__igt_sysfs_get_u32(dir, "media_RPn_freq_mhz", &rpn);
+	igt_debug("media RP0 mhz: %u, media RPn mhz: %u\n", rp0, rpn);
 	igt_debug("media ratio value 0.0 represents dynamic mode\n");
 
 	/*
@@ -127,7 +129,8 @@ static void media_freq(int gt, int dir)
 	 * modes. Fixed ratio modes should return the same value.
 	 */
 	for (int v = 256; v >= 0; v -= 64) {
-		int getv, ret;
+		int ret;
+		uint32_t getv = 0;
 
 		/*
 		 * Check that we can set the mode. Ratios other than 1:2
@@ -141,7 +144,7 @@ static void media_freq(int gt, int dir)
 
 		wait_freq_set();
 
-		getv = igt_sysfs_get_u32(dir, "media_freq_factor");
+		__igt_sysfs_get_u32(dir, "media_freq_factor", &getv);
 
 		igt_debug("media ratio set: %.2f, media ratio get: %.2f\n",
 			  v * scale, getv * scale);
diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index eaacc7c90..bb0b0530d 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -720,7 +720,7 @@ static void fence_order(int i915)
 		.buffer_count = ARRAY_SIZE(obj),
 	};
 	uint64_t wr, rw;
-	int min, max;
+	uint32_t min = 0, max = 0;
 	double freq;
 	int sysfs;
 
@@ -742,14 +742,14 @@ static void fence_order(int i915)
 	 */
 
 	sysfs = igt_sysfs_open(i915);
-	min = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
-	max = igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
+	__igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz", &min);
+	__igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz", &max);
 	igt_require(max > min);
 
 	/* Only allow ourselves to upclock via waitboosting */
-	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
-	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", min);
-	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%d", max);
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", min);
+	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", max);
 
 	/* Warm up to bind the vma */
 	__fence_order(i915, &obj[0], &execbuf, 0, 0, &freq);
@@ -763,8 +763,8 @@ static void fence_order(int i915)
 	gem_close(i915, obj[0].handle);
 	gem_close(i915, obj[1].handle);
 
-	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
-	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", max);
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
 
 	close(sysfs);
 
@@ -830,7 +830,7 @@ static void engine_order(int i915)
 	uint64_t forward, backward, both;
 	unsigned int num_engines;
 	const intel_ctx_t *ctx;
-	int min, max;
+	uint32_t min = 0, max = 0;
 	double freq;
 	int sysfs;
 
@@ -862,14 +862,14 @@ static void engine_order(int i915)
 	execbuf.rsvd1 = ctx->id;
 
 	sysfs = igt_sysfs_open(i915);
-	min = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
-	max = igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
+	__igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz", &min);
+	__igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz", &max);
 	igt_require(max > min);
 
 	/* Only allow ourselves to upclock via waitboosting */
-	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
-	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", min);
-	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%d", max);
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", min);
+	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", max);
 
 	/* Warm up to bind the vma */
 	gem_execbuf(i915, &execbuf);
@@ -893,8 +893,8 @@ static void engine_order(int i915)
 	gem_close(i915, obj[1].handle);
 	intel_ctx_destroy(i915, ctx);
 
-	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
-	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", max);
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
 
 	close(sysfs);
 
diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
index 3675b9d6d..f3d64d84f 100644
--- a/tests/i915/i915_power.c
+++ b/tests/i915/i915_power.c
@@ -38,7 +38,8 @@ static void sanity(int i915)
 	double idle, busy;
 	igt_spin_t *spin;
 	uint64_t ahnd;
-	int dir, gt, req, act;
+	int dir, gt;
+	uint32_t req = 0, act = 0;
 
 #define DURATION_SEC 2
 
@@ -58,9 +59,9 @@ static void sanity(int i915)
 	igt_spin_busywait_until_started(spin);
 	busy = measure_power(&pwr, DURATION_SEC);
 	i915_for_each_gt(i915, dir, gt) {
-		req = igt_sysfs_get_u32(dir, "rps_cur_freq_mhz");
-		act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
-		igt_info("gt %d: req MHz: %d, act MHz: %d\n", gt, req, act);
+		__igt_sysfs_get_u32(dir, "rps_cur_freq_mhz", &req);
+		__igt_sysfs_get_u32(dir, "rps_act_freq_mhz", &act);
+		igt_info("gt %d: req MHz: %u, act MHz: %u\n", gt, req, act);
 	}
 	igt_free_spins(i915);
 	put_ahnd(ahnd);
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 8b31df7b2..7ffa67f0c 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1782,7 +1782,7 @@ static igt_spin_t *spin_sync_gt(int i915, uint64_t ahnd, unsigned int gt,
 static void
 test_frequency(int gem_fd, unsigned int gt)
 {
-	uint32_t min_freq, max_freq, boost_freq;
+	uint32_t min_freq = 0, max_freq = 0, boost_freq = 0, read_value = 0;
 	uint64_t val[2], start[2], slept;
 	double min[2], max[2];
 	igt_spin_t *spin;
@@ -1793,9 +1793,9 @@ test_frequency(int gem_fd, unsigned int gt)
 	sysfs = igt_sysfs_gt_open(gem_fd, gt);
 	igt_require(sysfs >= 0);
 
-	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
-	max_freq = igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz");
-	boost_freq = igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
+	__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &min_freq);
+	__igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz", &max_freq);
+	__igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz", &boost_freq);
 	igt_info("Frequency: min=%u, max=%u, boost=%u MHz\n",
 		 min_freq, max_freq, boost_freq);
 	igt_require(min_freq > 0 && max_freq > 0 && boost_freq > 0);
@@ -1808,12 +1808,15 @@ test_frequency(int gem_fd, unsigned int gt)
 	/*
 	 * Set GPU to min frequency and read PMU counters.
 	 */
-	igt_require(igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == min_freq);
-	igt_require(igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == min_freq);
-	igt_require(igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == min_freq);
+	igt_require(__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq));
+	igt_require(__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz", &read_value));
+	igt_require(read_value == min_freq);
+	igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", min_freq));
+	igt_require(__igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz", &read_value));
+	igt_require(read_value == min_freq);
+	igt_require(__igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", min_freq));
+	igt_require(__igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz", &read_value));
+	igt_require(read_value == min_freq);
 
 	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
 	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
@@ -1834,13 +1837,16 @@ test_frequency(int gem_fd, unsigned int gt)
 	/*
 	 * Set GPU to max frequency and read PMU counters.
 	 */
-	igt_require(igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", max_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == max_freq);
-	igt_require(igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", boost_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == boost_freq);
+	igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", max_freq));
+	igt_require(__igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz", &read_value));
+	igt_require(read_value == max_freq);
+	igt_require(__igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", boost_freq));
+	igt_require(__igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz", &read_value));
+	igt_require(read_value == boost_freq);
 
-	igt_require(igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", max_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == max_freq);
+	igt_require(__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", max_freq));
+	igt_require(__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz", &read_value));
+	igt_require(read_value == max_freq);
 
 	gem_quiescent_gpu(gem_fd);
 	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
@@ -1859,10 +1865,11 @@ test_frequency(int gem_fd, unsigned int gt)
 	/*
 	 * Restore min/max.
 	 */
-	igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq);
-	if (igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") != min_freq)
+	__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq);
+	__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz", &read_value);
+	if (read_value != min_freq)
 		igt_warn("Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
-			 min_freq, igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz"));
+			 min_freq, read_value);
 	close(fd[0]);
 	close(fd[1]);
 	put_ahnd(ahnd);
@@ -1883,7 +1890,7 @@ test_frequency(int gem_fd, unsigned int gt)
 static void
 test_frequency_idle(int gem_fd, unsigned int gt)
 {
-	uint32_t min_freq;
+	uint32_t min_freq = 0;
 	uint64_t val[2], start[2], slept;
 	double idle[2];
 	int fd[2], sysfs;
@@ -1891,7 +1898,7 @@ test_frequency_idle(int gem_fd, unsigned int gt)
 	sysfs = igt_sysfs_gt_open(gem_fd, gt);
 	igt_require(sysfs >= 0);
 
-	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
+	__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &min_freq);
 	close(sysfs);
 
 	/* While parked, our convention is to report the GPU at 0Hz */
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index dd5ab993e..6d49743ca 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -341,7 +341,7 @@ static void kms_poll_state_restore(void)
 	int sysfs_fd;
 
 	igt_assert((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
-	igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
+	__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
 	close(sysfs_fd);
 
 }
@@ -351,8 +351,8 @@ static void kms_poll_disable(void)
 	int sysfs_fd;
 
 	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
-	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
-	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
+	__igt_sysfs_get_boolean(sysfs_fd, "poll", &kms_poll_saved_state);
+	__igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
 	kms_poll_disabled = true;
 	close(sysfs_fd);
 }
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 785d39bde..1016be240 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -264,15 +264,18 @@ static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
 {
 	igt_pipe_crc_t *pipe_crc;
 	const int fd = data->drm_fd;
+	uint32_t value = 0;
 
 	pipe_crc = igt_pipe_crc_new(fd, data->pipe, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	set_crc_flip_threshold(data, 5);
 	igt_pipe_crc_start(pipe_crc);
-	igt_assert_eq(igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold"), 5);
+	__igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold", &value);
+	igt_assert_eq(value, 5);
 	igt_pipe_crc_stop(pipe_crc);
 
-	igt_assert_neq(igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold"), 5);
+	__igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold", &value);
+	igt_assert_neq(value, 5);
 	igt_pipe_crc_free(pipe_crc);
 }
 
-- 
2.40.0
