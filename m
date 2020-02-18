Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8876E41D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 22:56:44 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 19 Feb 2020 00:56:17 +0200
Message-Id: <20200218225620.668212-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200218225620.668212-1-lionel.g.landwerlin@intel.com>
References: <20200218225620.668212-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/6] lib/i915-perf: Add support for
 loading perf configurations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Loads programming of various HW bits into i915.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/perf.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/perf.h |  2 ++
 2 files changed, 89 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 31888627..6c92fd02 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -422,3 +422,90 @@ intel_perf_add_metric_set(struct intel_perf *perf,
 {
 	igt_list_add_tail(&metric_set->link, &perf->metric_sets);
 }
+
+static void
+load_metric_set_config(struct intel_perf_metric_set *metric_set, int drm_fd)
+{
+	struct drm_i915_perf_oa_config config;
+	uint64_t config_id = 0;
+
+	memset(&config, 0, sizeof(config));
+
+	memcpy(config.uuid, metric_set->hw_config_guid, sizeof(config.uuid));
+
+	config.n_mux_regs = metric_set->n_mux_regs;
+	config.mux_regs_ptr = (uintptr_t) metric_set->mux_regs;
+
+	config.n_boolean_regs = metric_set->n_b_counter_regs;
+	config.boolean_regs_ptr = (uintptr_t) metric_set->b_counter_regs;
+
+	config.n_flex_regs = metric_set->n_flex_regs;
+	config.flex_regs_ptr = (uintptr_t) metric_set->flex_regs;
+
+	while (ioctl(drm_fd, DRM_IOCTL_I915_PERF_ADD_CONFIG, &config) < 0 &&
+	       (errno == EAGAIN || errno == EINTR));
+
+	metric_set->perf_oa_metrics_set = config_id;
+}
+
+void
+intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd)
+{
+	int sysfs_dir_fd = open_master_sysfs_dir(drm_fd);
+	struct dirent *entry;
+	int metrics_dir_fd;
+	DIR *metrics_dir;
+	struct intel_perf_metric_set *metric_set;
+
+	if (sysfs_dir_fd < 0)
+		return;
+
+	metrics_dir_fd = openat(sysfs_dir_fd, "metrics", O_DIRECTORY);
+	close(sysfs_dir_fd);
+	if (metrics_dir_fd < -1)
+		return;
+
+	metrics_dir = fdopendir(metrics_dir_fd);
+	if (!metrics_dir) {
+		close(metrics_dir_fd);
+		return;
+	}
+
+	while ((entry = readdir(metrics_dir))) {
+		bool metric_id_read;
+		uint64_t metric_id;
+		char path[256 + 4];
+		int id_fd;
+
+		if (entry->d_type != DT_DIR)
+			continue;
+
+		snprintf(path, sizeof(path), "%s/id", entry->d_name);
+
+		id_fd = openat(metrics_dir_fd, path, O_RDONLY);
+		if (id_fd < 0)
+			continue;
+
+		metric_id_read = read_fd_uint64(id_fd, &metric_id);
+		close(id_fd);
+
+		if (!metric_id_read)
+			continue;
+
+		igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
+			if (!strcmp(metric_set->hw_config_guid, entry->d_name)) {
+				metric_set->perf_oa_metrics_set = metric_id;
+				break;
+			}
+		}
+	}
+
+	closedir(metrics_dir);
+
+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
+		if (metric_set->perf_oa_metrics_set)
+			continue;
+
+		load_metric_set_config(metric_set, drm_fd);
+	}
+}
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 7dfa0472..246d06cf 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -220,6 +220,8 @@ void intel_perf_add_logical_counter(struct intel_perf *perf,
 void intel_perf_add_metric_set(struct intel_perf *perf,
 			       struct intel_perf_metric_set *metric_set);
 
+void intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd);
+
 #ifdef __cplusplus
 };
 #endif
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
