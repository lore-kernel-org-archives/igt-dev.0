Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2656EB84
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 14:24:22 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 16 Sep 2021 19:42:27 +0530
Message-Id: <20210916141227.17554-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: Fix
 regression on 5.4 kernel
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
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Starting commit 8759c4a3020ce4 "Add intel_buf_init_in_region"
__intel_buf_init uses gem_create_in_memory_regions instead of
gem_create. Older kernels like 5.4 still dont have support for
I915_GEM_CREATE_EXT_MEMORY_REGIONS (i915_gem_create_ext_ioctl)
from kernel commit (https://patchwork.freedesktop.org/patch/431581/?series=89648&rev=1)
Due to this, the flip-vs-fences tests are failing on kernel 5.4
Patch add roll back to gem_create when __gem_create_in_memory_region_list fails.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 lib/i915/intel_memory_region.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 3de40549319b..323b96bad232 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -209,7 +209,9 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
 	uint32_t handle;
 	int ret = __gem_create_in_memory_region_list(fd, &handle, size,
 						     mem_regions, num_regions);
-	igt_assert_eq(ret, 0);
+	if (ret != 0)
+		handle = gem_create(fd, size);
+
 	return handle;
 }
 
-- 
2.33.0
