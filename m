Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF5710E85A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Dec 2021 18:12:26 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 13 Dec 2021 19:12:08 +0100
Message-Id: <20211213181208.159531-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: Handle
 -ENODEV path individually
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

As Ashutosh noticed I've handled errors from the kernel too wide
packing it to same error bag and returning system memory region in this
case. That's of course is wrong and can lead to return system memory on
discrete if invalid arguments would be passed to the query.

Return previous behavior of query memory regions handling -ENODEV path
individually. For this error lets assume we got kernel which doesn't
support this query yet so returning system memory region is a reasonable
choice because this region exists for all of i915 gens.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reported-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_memory_region.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 2263f1984..dfbb8acf0 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -124,10 +124,11 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
 	 * item.length, even though the ioctl might still return success.
 	 */
 
-	if (item.length < 0) {
+	if (item.length == -ENODEV) {
 		/*
-		 * If kernel supports query but not memory regions query
-		 * just return predefined system memory region only.
+		 * If kernel supports query but not memory regions and it
+		 * returns -ENODEV just return predefined system memory region
+		 * only.
 		 */
 		size_t sys_qi_size = offsetof(typeof(*query_info), regions[1]);
 
@@ -135,6 +136,11 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
 		query_info->num_regions = 1;
 		query_info->regions[0].region.memory_class = I915_MEMORY_CLASS_SYSTEM;
 		goto out;
+	} else if (item.length < 0) {
+		/* Any other error are critial so no fallback is possible */
+		igt_critical("DRM_I915_QUERY_MEMORY_REGIONS failed with %d\n",
+			     item.length);
+		goto out;
 	}
 
 	query_info = calloc(1, item.length);
-- 
2.32.0
