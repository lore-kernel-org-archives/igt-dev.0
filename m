Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8776A6E8A0
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2020 01:11:20 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Fri, 14 Feb 2020 17:11:13 -0800
Message-Id: <20200215011115.5838-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200215011115.5838-1-umesh.nerlige.ramappa@intel.com>
References: <20200215011115.5838-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/i915/perf: Add support for loading
 perf configurations
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
To: igt-dev@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Add support for loading perf configurations used by gpuvis.

v2: rebase fixes for igt list (Umesh)

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c | 138 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/perf.h |   2 +
 2 files changed, 140 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 1627f102..ae786701 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -20,8 +20,18 @@
  * SOFTWARE.
  */
 
+#include <assert.h>
+#include <errno.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <dirent.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+#include <unistd.h>
 
 #include "intel_chipset.h"
 #include "perf.h"
@@ -192,3 +202,131 @@ intel_perf_add_metric_set(struct intel_perf *perf,
 {
 	igt_list_add_tail(&metric_set->link, &perf->metric_sets);
 }
+
+static bool
+read_file_uint64(const char *file, uint64_t *value)
+{
+	char buf[32];
+	int fd, n;
+
+	fd = open(file, 0);
+	if (fd < 0)
+		return false;
+	n = read(fd, buf, sizeof (buf) - 1);
+	close(fd);
+	if (n < 0)
+		return false;
+
+	buf[n] = '\0';
+	*value = strtoull(buf, 0, 0);
+
+	return true;
+}
+
+static int
+get_card_for_fd(int fd)
+{
+	struct stat sb;
+	int mjr, mnr;
+	char buffer[128];
+	DIR *drm_dir;
+	struct dirent *entry;
+	int retval = -1;
+
+	if (fstat(fd, &sb))
+		return -1;
+
+	mjr = major(sb.st_rdev);
+	mnr = minor(sb.st_rdev);
+
+	snprintf(buffer, sizeof(buffer), "/sys/dev/char/%d:%d/device/drm", mjr, mnr);
+
+	drm_dir = opendir(buffer);
+	assert(drm_dir != NULL);
+
+	while ((entry = readdir(drm_dir))) {
+		if (entry->d_type == DT_DIR && strncmp(entry->d_name, "card", 4) == 0) {
+			retval = strtoull(entry->d_name + 4, NULL, 10);
+			break;
+		}
+	}
+
+	closedir(drm_dir);
+
+	return retval;
+}
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
index 5a091c46..0b66efe1 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -231,6 +231,8 @@ void intel_perf_add_logical_counter(struct intel_perf *perf,
 void intel_perf_add_metric_set(struct intel_perf *perf,
 			       struct intel_perf_metric_set *metric_set);
 
+void intel_perf_load_perf_configs(struct intel_perf *perf, int drm_fd);
+
 #ifdef __cplusplus
 };
 #endif
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
