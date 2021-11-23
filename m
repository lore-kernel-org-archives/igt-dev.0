Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D226EB67
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Nov 2021 08:42:06 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 23 Nov 2021 14:06:15 +0530
Message-Id: <20211123083615.3756632-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/gem_lmem_swapping: run only for
 discrete platform
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

Testsuit only meant to be run on discrete platforms and skip
with right reason on other platforms.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 3c1573b6..abf9d8a2 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -525,6 +525,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		regions = gem_get_query_memory_regions(i915);
 		igt_require(regions);
 
+		igt_require(gem_has_lmem(i915));
+
 		for_each_physical_engine(i915, e)
 			__num_engines__++;
 		igt_require(__num_engines__);
-- 
2.31.1
