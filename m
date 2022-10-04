Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Oct 2022 16:25:47 +0100
Message-Id: <20221004152549.436801-3-matthew.auld@intel.com>
In-Reply-To: <20221004152549.436801-1-matthew.auld@intel.com>
References: <20221004152549.436801-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/5] tests/i915/query: stop checking
 rsvd0 in region info
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

No longer reserved, in the near future this will be the GTT alignment.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index b92d7593..4e43c7cd 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -581,8 +581,6 @@ static void test_query_regions_garbage_items(int fd)
 		struct drm_i915_memory_region_info info = regions->regions[i];
 		int j;
 
-		igt_assert_eq_u32(info.rsvd0, 0);
-
 		/*
 		 * rsvd1[0] : probed_cpu_visible_size
 		 * rsvd1[1] : unallocated_cpu_visible_size
-- 
2.37.3
