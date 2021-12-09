Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884D610E298
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 20:05:07 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu,  9 Dec 2021 21:04:53 +0100
Message-Id: <20211209200453.15885-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211209200453.15885-1-zbigniew.kempczynski@intel.com>
References: <20211209200453.15885-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/i915/intel_memory_region: Add
 fallback for creating gem bo
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

For stable kernels we get -ENODEV on integrated where gem_create_ext()
call tries to allocate bo in system memory. Instead of asserting this
case we can fallback to gem_create() as this allocation can be resolved
using legacy call.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/intel_memory_region.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index fd29eec90..2263f1984 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -197,8 +197,23 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 		.num_regions = num_regions,
 		.regions = to_user_pointer(mem_regions),
 	};
+	int ret;
 
-	return __gem_create_ext(fd, size, handle, &ext_regions.base);
+	ret = __gem_create_ext(fd, size, handle, &ext_regions.base);
+
+	/*
+	 * Provide fallback for stable kernels if region passed in the array
+	 * can be system memory. In this case we get -ENODEV but still
+	 * we're able to allocate gem bo in system memory using legacy call.
+	 */
+	if (ret == -ENODEV)
+		for (int i = 0; i < num_regions; i++)
+			if (mem_regions[i].memory_class == I915_MEMORY_CLASS_SYSTEM) {
+				ret = __gem_create(fd, size, handle);
+				break;
+			}
+
+	return ret;
 }
 
 /* gem_create_in_memory_region_list:
-- 
2.26.0
