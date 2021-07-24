Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FA573301
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Jul 2021 16:56:53 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Sat, 24 Jul 2021 22:16:24 +0530
Message-Id: <20210724164624.31848-1-vidya.srinivas@intel.com>
In-Reply-To: <20210723093548.22273-1-vidya.srinivas@intel.com>
References: <20210723093548.22273-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms: Return false in gem_has_lmem for
 kernels not having DRM_I915_QUERY_MEMORY_REGIONS support
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
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com, Lin Charlton <charston.lin@intel.com>, juha-pekka.heikkila@intel.com, charlton.Lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Starting commit (tests/kms: Create buffer object from LMEM for discrete)
it checks for LMEM. This is breaking older kernels like 5.4 without
DRM_I915_QUERY_MEMORY_REGIONS support.

Patch returns false from gem_has_lmem if kernel doesnt have support
for DRM_I915_QUERY_MEMORY_REGIONS.

Signed-off-by: Lin Charlton <charston.lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Change-Id: Ia5bb2f0bb9ca1e854bb03c12dfed6646584bbb9b
---
 lib/i915/intel_memory_region.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 144ae12ca7a0..e553d7ec0f1c 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -76,6 +76,17 @@ bool gem_has_query_support(int fd)
 	return __i915_query(fd, &query) == 0;
 }
 
+bool gem_has_memregion_query_support(int fd)
+{
+	struct drm_i915_query_item item;
+	int ret;
+
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
+	ret = __i915_query_items(fd, &item, 1);
+	return ret;
+}
+
 const char *get_memory_region_name(uint32_t region)
 {
 	uint16_t class = MEMORY_TYPE_FROM_REGION(region);
@@ -164,6 +175,9 @@ uint8_t gem_get_lmem_region_count(int fd)
  */
 bool gem_has_lmem(int fd)
 {
+	if (gem_has_memregion_query_support(fd) == ENOSYS ||
+		gem_has_memregion_query_support(fd) == ENOTSUP)
+		return false;
 	return gem_get_lmem_region_count(fd) > 0;
 }
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
