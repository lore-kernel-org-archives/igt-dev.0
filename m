Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8AB6E05A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:22:17 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 17 Feb 2020 16:21:52 +0200
Message-Id: <20200217142155.501499-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
References: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/6] lib/i915: Add support for loading perf
 configurations
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

---
 lib/i915/perf.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/perf.h |  2 ++
 2 files changed, 77 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 8aaf8e61..f23a9b12 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -433,3 +433,78 @@ intel_perf_add_metric_set(struct intel_perf *perf,
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
+	int drm_card = get_card_for_fd(drm_fd);
+	struct dirent *entry;
+	char metrics_path[128];
+	DIR *metrics_dir;
+	struct intel_perf_metric_set *metric_set;
+
+	snprintf(metrics_path, sizeof(metrics_path),
+		 "/sys/class/drm/card%d/metrics", drm_card);
+	metrics_dir = opendir(metrics_path);
+	if (!metrics_dir)
+		return;
+
+	while ((entry = readdir(metrics_dir))) {
+		char *metric_id_path;
+		uint64_t metric_id;
+
+		if (entry->d_type != DT_DIR)
+			continue;
+
+		asprintf(&metric_id_path, "%s/%s/id",
+			 metrics_path, entry->d_name);
+
+		if (!read_file_uint64(metric_id_path, &metric_id)) {
+			free(metric_id_path);
+			continue;
+		}
+
+		free(metric_id_path);
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
