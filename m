Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7296F6E5BB
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 06:17:03 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Mon, 26 Jul 2021 11:36:30 +0530
Message-Id: <20210726060630.28834-1-vidya.srinivas@intel.com>
In-Reply-To: <20210724165317.32000-1-vidya.srinivas@intel.com>
References: <20210724165317.32000-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915: Return false in gem_has_lmem for
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
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com, juha-pekka.heikkila@intel.com, Lin Charlton <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Starting commit (tests/kms: Create buffer object from LMEM for discrete)
it checks for LMEM. This is breaking older kernels like 5.4 without
DRM_I915_QUERY_MEMORY_REGIONS support.

Kernel writes length back to userspace if ret and
length differ, indicating an error condition. In this case, the length
written back is -22 which is EINVAL. Patch checks negative item length
and returns false from gem_has_lmem.

Credits-to: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Lin Charlton <charlton.lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Change-Id: Ia404b77fbe4c1fc22ca462a15f26640f9ffa4120
---
 lib/i915/intel_memory_region.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 144ae12ca7a0..8db3e69e9913 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -164,6 +164,15 @@ uint8_t gem_get_lmem_region_count(int fd)
  */
 bool gem_has_lmem(int fd)
 {
+	struct drm_i915_query_item item;
+	int ret;
+
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
+	ret = __i915_query_items(fd, &item, 1);
+	if (ret != 0 || item.length < 0)
+		return false;
+
 	return gem_get_lmem_region_count(fd) > 0;
 }
 
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
