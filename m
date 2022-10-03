Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Oct 2022 18:24:54 +0100
Message-Id: <20221003172456.97522-2-matthew.auld@intel.com>
In-Reply-To: <20221003172456.97522-1-matthew.auld@intel.com>
References: <20221003172456.97522-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/i915/query: fix igt_assert_eq_u32
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

rsvd1 is u64 here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 2744421c..b92d7593 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -588,7 +588,7 @@ static void test_query_regions_garbage_items(int fd)
 		 * rsvd1[1] : unallocated_cpu_visible_size
 		 */
 		for (j = 2; j < ARRAY_SIZE(info.rsvd1); j++)
-			igt_assert_eq_u32(info.rsvd1[j], 0);
+			igt_assert_eq_u64(info.rsvd1[j], 0);
 	}
 
 	/* Bogus; kernel is meant to set this */
-- 
2.37.3
