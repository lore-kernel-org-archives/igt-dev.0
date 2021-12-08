Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600EE6EC08
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 17:37:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed,  8 Dec 2021 18:24:15 +0100
Message-Id: <20211208172416.136412-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211208172416.136412-1-zbigniew.kempczynski@intel.com>
References: <20211208172416.136412-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915/intel_memory_region: Provide
 system memory region stub
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
List-ID: <igt-dev@lists.freedesktop.org>

For stable kernels we can currently get -ENODEV on integrated gens
when no CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM is set.

Provide system memory region stub to avoid failing on querying
kernel for memory regions.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_memory_region.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 058b273dc..668e39439 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -123,9 +123,18 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
 	 * Any DRM_I915_QUERY_MEMORY_REGIONS specific errors are encoded in the
 	 * item.length, even though the ioctl might still return success.
 	 */
+
 	if (item.length < 0) {
-		igt_critical("DRM_I915_QUERY_MEMORY_REGIONS failed with %d\n",
-			     item.length);
+		/*
+		 * If kernel supports query but not memory regions query
+		 * just return predefined system memory region only.
+		 */
+		size_t sys_qi_size =
+			(char *) &query_info->regions[1] - (char *) query_info;
+
+		query_info = calloc(1, sys_qi_size);
+		query_info->num_regions = 1;
+		query_info->regions[0].region.memory_class = I915_MEMORY_CLASS_SYSTEM;
 		goto out;
 	}
 
-- 
2.26.0
