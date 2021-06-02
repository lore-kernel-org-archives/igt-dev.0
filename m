Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07E96EE56
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jun 2021 19:54:17 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed,  2 Jun 2021 12:53:59 -0700
Message-Id: <20210602195400.11982-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: free
 query_info in gem_get_lmem_region_count
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
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

query_info calloc'd in gem_get_query_memory_regions should be freed in
gem_get_lmem_region_count.

Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Fixes: f32993a2ed ("lib/i915/intel_memory_region: Add new memory region lib")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_memory_region.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 983ac4df07..144ae12ca7 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -149,6 +149,7 @@ uint8_t gem_get_lmem_region_count(int fd)
 		if (query_info->regions[i].region.memory_class == I915_MEMORY_CLASS_DEVICE)
 			lmem_regions += 1;
 	}
+	free(query_info);
 
 	return lmem_regions;
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
