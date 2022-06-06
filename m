Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED00411287A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 07:17:23 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com, Priyanka.Dandamudi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon,  6 Jun 2022 12:47:36 +0530
Message-Id: <20220606071737.1701633-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20220606071737.1701633-1-janga.rahul.kumar@intel.com>
References: <20220606071737.1701633-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/gem_tiled_fence_blits : Added
 subtests description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Added test description to all the available subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/i915/gem_tiled_fence_blits.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 0b69c0de..1c621d1e 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -46,6 +46,10 @@
 #include "igt.h"
 #include "igt_x86.h"
 
+IGT_TEST_DESCRIPTION("Tests fence management problems related to tiled blits by performing "
+		     "many blits on tiled buffer objects with fences enabled and with working "
+		     "set larger than the aperture size.");
+
 enum { width = 512, height = 512 };
 static uint32_t linear[width * height];
 static const int bo_size = sizeof(linear);
@@ -266,9 +270,11 @@ igt_main
 		count = (count + ncpus - 1) / ncpus;
 	}
 
+	igt_describe("Check basic functionality.");
 	igt_subtest("basic")
 		run_test(fd, 2, end);
 
+	igt_describe("Check with parallel execution.");
 	igt_subtest("normal") {
 		intel_allocator_multiprocess_start();
 		igt_fork(child, ncpus)
-- 
2.25.1
