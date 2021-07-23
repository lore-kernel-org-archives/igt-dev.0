Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE446F9ED
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 09:46:15 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 23 Jul 2021 15:05:48 +0530
Message-Id: <20210723093548.22273-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms: Return false in gem_has_lmem for
 platforms not having LMEM support
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
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com, juha-pekka.heikkila@intel.com, Lin Charlton <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Starting commit (tests/kms: Create buffer object from LMEM for discrete) it checks
for LMEM. But this is breaking older kernels like 5.4 without
DRM_I915_QUERY_MEMORY_REGIONS support. This causes
item.length filled from IOCTL to be < 0 and gives segmentation
fault. Another way to fix is check for NULL query in
gem_get_lmem_region_count and return false.

Patch returns false from gem_has_lmem for obvious platforms
which dont have LMEM support and also adds the check
for NULL query in gem_get_lmem_region_count.

Signed-off-by: Lin Charlton <charlton.lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 lib/i915/intel_memory_region.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 144ae12ca7a0..635c21ab3765 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -143,6 +143,10 @@ uint8_t gem_get_lmem_region_count(int fd)
 	uint8_t lmem_regions = 0;
 
 	query_info = gem_get_query_memory_regions(fd);
+
+	if (!query_info)
+		return 0;
+
 	num_regions = query_info->num_regions;
 
 	for (int i = 0; i < num_regions; i++) {
@@ -164,6 +168,9 @@ uint8_t gem_get_lmem_region_count(int fd)
  */
 bool gem_has_lmem(int fd)
 {
+	if (intel_display_ver(intel_get_drm_devid(fd) < 12) ||
+		IS_ALDERLAKE_P(intel_get_drm_devid(fd)) || IS_TIGERLAKE(intel_get_drm_devid(fd)))
+		return false;
 	return gem_get_lmem_region_count(fd) > 0;
 }
 
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
