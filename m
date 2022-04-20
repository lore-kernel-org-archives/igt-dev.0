Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8042A10E192
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 06:12:59 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Apr 2022 23:12:50 -0700
Message-Id: <d38e666fe8159eed5defb4d30045fa1154410e4f.1650435058.git.ashutosh.dixit@intel.com>
In-Reply-To: <85c51c99da76e3fe286ed28e80fa964e148f6020.1650435058.git.ashutosh.dixit@intel.com>
References: <85c51c99da76e3fe286ed28e80fa964e148f6020.1650435058.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_sysfs: Add RPS sysfs helpers
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

RPS sysfs files exposed by the kernel can either be in per-gt sysfs or in
the per-device legacy sysfs. Add helpers to read/write these files in
either of the two sets of locations.

v2: Added function descriptions (Kamil)
    Separated patch from "lib/igt_sysfs: Add helpers to iterate over GTs"

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_sysfs.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h | 54 +++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index b167c0507039..0ac5d2a3d6e5 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -54,6 +54,96 @@
  * provides basic support for like igt_sysfs_open().
  */
 
+enum {
+	GT,
+	RPS,
+
+	SYSFS_NUM_TYPES,
+};
+
+static const char *i915_attr_name[SYSFS_NUM_TYPES][SYSFS_NUM_ATTR] = {
+	{
+		"gt_act_freq_mhz",
+		"gt_cur_freq_mhz",
+		"gt_min_freq_mhz",
+		"gt_max_freq_mhz",
+		"gt_RP0_freq_mhz",
+		"gt_RP1_freq_mhz",
+		"gt_RPn_freq_mhz",
+		"gt_idle_freq_mhz",
+		"gt_boost_freq_mhz",
+		"power/rc6_enable",
+		"power/rc6_residency_ms",
+		"power/rc6p_residency_ms",
+		"power/rc6pp_residency_ms",
+		"power/media_rc6_residency_ms",
+	},
+	{
+		"rps_act_freq_mhz",
+		"rps_cur_freq_mhz",
+		"rps_min_freq_mhz",
+		"rps_max_freq_mhz",
+		"rps_RP0_freq_mhz",
+		"rps_RP1_freq_mhz",
+		"rps_RPn_freq_mhz",
+		"rps_idle_freq_mhz",
+		"rps_boost_freq_mhz",
+		"rc6_enable",
+		"rc6_residency_ms",
+		"rc6p_residency_ms",
+		"rc6pp_residency_ms",
+		"media_rc6_residency_ms",
+	},
+};
+
+/**
+ * igt_sysfs_dir_id_to_name:
+ * @dir: sysfs directory fd
+ * @id: sysfs attribute id
+ *
+ * Returns attribute name corresponding to attribute id in either the
+ * per-gt or legacy per-device sysfs
+ *
+ * Returns:
+ * Attribute name in sysfs
+ */
+const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id)
+{
+	igt_assert(id < SYSFS_NUM_ATTR);
+
+	if (igt_sysfs_has_attr(dir, i915_attr_name[GT][id]))
+		return i915_attr_name[GT][id];
+	else if (igt_sysfs_has_attr(dir, i915_attr_name[RPS][id]))
+		return i915_attr_name[RPS][id];
+	else
+		igt_assert_f(0, "Invalid sysfs dir\n");
+}
+
+/**
+ * igt_sysfs_path_id_to_name:
+ * @path: sysfs directory path
+ * @id: sysfs attribute id
+ *
+ * Returns attribute name corresponding to attribute id in either the
+ * per-gt or legacy per-device sysfs
+ *
+ * Returns:
+ * Attribute name in sysfs
+ */
+const char *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id)
+{
+	int dir;
+	const char *name;
+
+	dir = open(path, O_RDONLY);
+	igt_assert(dir);
+
+	name = igt_sysfs_dir_id_to_name(dir, id);
+	close(dir);
+
+	return name;
+}
+
 /**
  * igt_sysfs_has_attr:
  * @dir: sysfs directory fd
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 33317a969619..8e39b8fa9890 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -38,11 +38,65 @@
 	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
 	     close(dirfd__), gt__++)
 
+#define igt_sysfs_rps_write(dir, id, data, len) \
+	igt_sysfs_write(dir, igt_sysfs_dir_id_to_name(dir, id), data, len)
+
+#define igt_sysfs_rps_read(dir, id, data, len) \
+	igt_sysfs_read(dir, igt_sysfs_dir_id_to_name(dir, id), data, len)
+
+#define igt_sysfs_rps_set(dir, id, value) \
+	igt_sysfs_set(dir, igt_sysfs_dir_id_to_name(dir, id), value)
+
+#define igt_sysfs_rps_get(dir, id) \
+	igt_sysfs_get(dir, igt_sysfs_dir_id_to_name(dir, id))
+
+#define igt_sysfs_rps_scanf(dir, id, fmt, ...) \
+	igt_sysfs_scanf(dir, igt_sysfs_dir_id_to_name(dir, id), fmt, ##__VA_ARGS__)
+
+#define igt_sysfs_rps_vprintf(dir, id, fmt, ap) \
+	igt_sysfs_vprintf(dir, igt_sysfs_dir_id_to_name(id), fmt, ap)
+
+#define igt_sysfs_rps_printf(dir, id, fmt, ...) \
+	igt_sysfs_printf(dir, igt_sysfs_dir_id_to_name(dir, id), fmt, ##__VA_ARGS__)
+
+#define igt_sysfs_rps_get_u32(dir, id) \
+	igt_sysfs_get_u32(dir, igt_sysfs_dir_id_to_name(dir, id))
+
+#define igt_sysfs_rps_set_u32(dir, id, value) \
+	igt_sysfs_set_u32(dir, igt_sysfs_dir_id_to_name(dir, id), value)
+
+#define igt_sysfs_rps_get_boolean(dir, id) \
+	igt_sysfs_get_boolean(dir, igt_sysfs_dir_id_to_name(dir, id))
+
+#define igt_sysfs_rps_set_boolean(dir, id, value) \
+	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
+
+enum i915_attr_id {
+	RPS_ACT_FREQ_MHZ,
+	RPS_CUR_FREQ_MHZ,
+	RPS_MIN_FREQ_MHZ,
+	RPS_MAX_FREQ_MHZ,
+	RPS_RP0_FREQ_MHZ,
+	RPS_RP1_FREQ_MHZ,
+	RPS_RPn_FREQ_MHZ,
+	RPS_IDLE_FREQ_MHZ,
+	RPS_BOOST_FREQ_MHZ,
+	RC6_ENABLE,
+	RC6_RESIDENCY_MS,
+	RC6P_RESIDENCY_MS,
+	RC6PP_RESIDENCY_MS,
+	MEDIA_RC6_RESIDENCY_MS,
+
+	SYSFS_NUM_ATTR,
+};
+
 char *igt_sysfs_path(int device, char *path, int pathlen);
 int igt_sysfs_open(int device);
 char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
 int igt_sysfs_gt_open(int device, int gt);
 bool igt_sysfs_has_attr(int dir, const char *attr);
+const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id);
+const char *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id);
 
 int igt_sysfs_read(int dir, const char *attr, void *data, int len);
 int igt_sysfs_write(int dir, const char *attr, const void *data, int len);
-- 
2.34.1
