Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F006E17E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 12:25:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Jul 2021 17:56:36 +0530
Message-Id: <20210726122636.159703-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210726094938.155619-1-bhanuprakash.modem@intel.com>
References: <20210726094938.155619-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t V2] lib/i915: Handle QUERY_MEMORY_REGIONS on older
 kernels
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

While checking for LMEM support on older kernels with the
DRM_I915_QUERY_MEMORY_REGIONS, it may fail with EINVAL.

Instead of abort/asserting the test, we must handle this
case properly.

V2:
* Rebase

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Vidya Srinivas <vidya.srinivas@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/i915/intel_memory_region.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index e1e210f2c..72e337af3 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -114,7 +114,7 @@ uint32_t gem_get_batch_size(int fd, uint8_t mem_region_type)
 struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
 {
 	struct drm_i915_query_item item;
-	struct drm_i915_query_memory_regions *query_info;
+	struct drm_i915_query_memory_regions *query_info = NULL;
 
 	memset(&item, 0, sizeof(item));
 	item.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
@@ -123,15 +123,18 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
 	 * Any DRM_I915_QUERY_MEMORY_REGIONS specific errors are encoded in the
 	 * item.length, even though the ioctl might still return success.
 	 */
-	igt_assert_f(item.length > 0,
-		     "DRM_I915_QUERY_MEMORY_REGIONS failed with %d\n",
-		     item.length);
+	if (item.length < 0) {
+		igt_critical("DRM_I915_QUERY_MEMORY_REGIONS failed with %d\n",
+			     item.length);
+		goto out;
+	}
 
 	query_info = calloc(1, item.length);
 
 	item.data_ptr = to_user_pointer(query_info);
 	i915_query_items(fd, &item, 1);
 
+out:
 	return query_info;
 }
 
@@ -150,6 +153,9 @@ uint8_t gem_get_lmem_region_count(int fd)
 	uint8_t lmem_regions = 0;
 
 	query_info = gem_get_query_memory_regions(fd);
+	if (!query_info)
+		goto out;
+
 	num_regions = query_info->num_regions;
 
 	for (int i = 0; i < num_regions; i++) {
@@ -158,6 +164,7 @@ uint8_t gem_get_lmem_region_count(int fd)
 	}
 	free(query_info);
 
+out:
 	return lmem_regions;
 }
 
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
