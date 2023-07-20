Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BC910E1C4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:03 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:40 -0700
Message-ID: <20230720231756.3464641-5-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/20] lib/i915/perf: Derive topology info
 for xe devices
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

Derive topology info for xe devices and feed it into
intel_perf_for_devinfo.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/perf.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++-
 lib/i915/perf.h |   1 +
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 5b08c983918a..0bb1aa59045c 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -38,8 +38,10 @@
 #include <i915_drm.h>
 
 #include "drmtest.h"
+#include "igt_aux.h"
 #include "i915_pciids.h"
 #include "intel_chipset.h"
+#include "ioctl_wrappers.h"
 #include "linux_scaffold.h"
 #include "perf.h"
 #include "xe/xe_query.h"
@@ -609,6 +611,108 @@ intel_sysfs_attr_id_to_name(int sysfs_dirfd, intel_sysfs_attr_id id, int gt)
 		intel_sysfs_attr_name[0][id];
 }
 
+struct drm_i915_query_topology_info *
+xe_fill_i915_topology_info(int drm_fd)
+{
+	struct drm_i915_query_topology_info i915_topinfo = {};
+	struct drm_i915_query_topology_info *i915_topo;
+	struct drm_xe_query_topology_mask *xe_topo;
+	int total_size, pos = 0;
+	u8 *ptr;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
+		.size = 0,
+		.data = 0,
+	};
+
+	/* Fixed fields, see fill_topology_info() and intel_sseu_set_info() in i915 */
+	i915_topinfo.max_slices = 1;			/* always 1 */
+	if (IS_PONTEVECCHIO(xe_dev_id(drm_fd))) {
+		i915_topinfo.max_subslices = 64;
+		i915_topinfo.max_eus_per_subslice = 8;
+	} else if (intel_graphics_ver(xe_dev_id(drm_fd)) >= IP_VER(12, 50)) {
+		i915_topinfo.max_subslices = 32;
+		i915_topinfo.max_eus_per_subslice = 16;
+	} else if (intel_graphics_ver(xe_dev_id(drm_fd)) >= IP_VER(12, 0)) {
+		i915_topinfo.max_subslices = 6;
+		i915_topinfo.max_eus_per_subslice = 16;
+	} else {
+		igt_assert(0);
+	}
+	i915_topinfo.subslice_offset = 1;		/* always 1 */
+	i915_topinfo.subslice_stride = DIV_ROUND_UP(i915_topinfo.max_subslices, 8);
+	i915_topinfo.eu_offset = i915_topinfo.subslice_offset + i915_topinfo.subslice_stride;
+	i915_topinfo.eu_stride = DIV_ROUND_UP(i915_topinfo.max_eus_per_subslice, 8);
+
+	/* Allocate and start filling the struct to return */
+	total_size = sizeof(i915_topinfo) + i915_topinfo.eu_offset +
+			i915_topinfo.max_subslices * i915_topinfo.eu_stride;
+	i915_topo = malloc(total_size);
+	igt_assert(i915_topo);
+
+	memcpy(i915_topo, &i915_topinfo, sizeof(i915_topinfo));
+	ptr = (u8 *)i915_topo + sizeof(i915_topinfo);
+	*ptr++ = 0x1;					/* slice mask */
+
+	/* Get xe topology masks */
+	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	xe_topo = malloc(query.size);
+	igt_assert(xe_topo);
+
+	query.data = to_user_pointer(xe_topo);
+	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_debug("Topology size: %d\n", query.size);
+
+	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
+		struct drm_xe_query_topology_mask *topo =
+			(struct drm_xe_query_topology_mask *)((unsigned char *)xe_topo + pos);
+		int i, sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+		u64 geom_mask, compute_mask;
+
+		igt_debug(" gt_id: %d type: %d n:%d [%d] ",
+			  topo->gt_id, topo->type, topo->num_bytes, sz);
+		for (int j = 0; j < topo->num_bytes; j++)
+			igt_debug(" %02x", topo->mask[j]);
+		igt_debug("\n");
+
+		/* i915 only returns topology for gt 0, do the same here */
+		if (topo->gt_id)
+			continue;
+
+		/* Follow the same order as in xe query_gt_topology() */
+		switch (topo->type) {
+		case XE_TOPO_DSS_GEOMETRY:
+			igt_assert_lte(i915_topo->subslice_stride, 8);	/* Fit in u64 mask */
+			memcpy(&geom_mask, topo->mask, i915_topo->subslice_stride);
+			break;
+		case XE_TOPO_DSS_COMPUTE:
+			memcpy(&compute_mask, topo->mask, i915_topo->subslice_stride);
+			geom_mask |= compute_mask;
+			memcpy(ptr, &geom_mask, i915_topo->subslice_stride);
+			ptr += i915_topo->subslice_stride;
+			break;
+		case XE_TOPO_EU_PER_DSS:
+			for (i = 0; i < i915_topo->max_subslices; i++) {
+				memcpy(ptr, topo->mask, i915_topo->eu_stride);
+				ptr += i915_topo->eu_stride;
+			}
+			break;
+		default:
+			igt_assert(0);
+		}
+
+		query.size -= sz;
+		pos += sz;
+	}
+
+	free(xe_topo);
+
+	return i915_topo;
+}
+
 static struct intel_perf *
 xe_perf_for_fd(int drm_fd, int gt)
 {
@@ -617,6 +721,7 @@ xe_perf_for_fd(int drm_fd, int gt)
 	u32 timestamp_frequency;
 	u64 gt_min_freq;
 	u64 gt_max_freq;
+	struct drm_i915_query_topology_info *topology;
 	struct intel_perf *ret;
 	int sysfs_dir_fd = open_master_sysfs_dir(drm_fd);
 	char path_min[64], path_max[64];
@@ -645,15 +750,23 @@ xe_perf_for_fd(int drm_fd, int gt)
 	device_id = intel_get_drm_devid(drm_fd);
 	timestamp_frequency = xe_gts(drm_fd)->gts[0].oa_timestamp_freq;
 
+	topology = xe_fill_i915_topology_info(drm_fd);
+	if (!topology) {
+		igt_warn("xe_fill_i915_topology_info failed\n");
+		return NULL;
+	}
+
 	ret = intel_perf_for_devinfo(device_id,
 				     device_revision,
 				     timestamp_frequency,
 				     gt_min_freq * 1000000,
 				     gt_max_freq * 1000000,
-				     NULL);
+				     topology);
 	if (!ret)
 		igt_warn("intel_perf_for_devinfo failed\n");
 
+	free(topology);
+
 	return ret;
 }
 
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 8a71ac635e78..f3df578ddc5f 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -318,6 +318,7 @@ intel_perf_devinfo_eu_available(const struct intel_perf_devinfo *devinfo,
 	return (devinfo->eu_masks[subslice_offset + eu / 8] & (1U << eu % 8)) != 0;
 }
 
+struct drm_i915_query_topology_info *xe_fill_i915_topology_info(int drm_fd);
 struct intel_perf *intel_perf_for_fd(int drm_fd, int gt);
 struct intel_perf *intel_perf_for_devinfo(uint32_t device_id,
 					  uint32_t revision,
-- 
2.41.0
