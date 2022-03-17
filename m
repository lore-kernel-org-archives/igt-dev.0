Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5108A10EC32
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 05:11:58 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 sai.gowtham.ch@intel.com
Date: Thu, 17 Mar 2022 10:41:32 +0530
Message-Id: <20220317051133.27881-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220317051133.27881-1-sai.gowtham.ch@intel.com>
References: <20220317051133.27881-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_basic: Add test
 description to the subtest.
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

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Added test description to subtests that are available.

Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_exec_basic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 008a35d0..21062ba2 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -63,6 +63,8 @@ igt_main
 					    I915_DEVICE_MEMORY);
 	}
 
+	igt_describe("Check basic funtionality of GEM_EXECBUFFER2 ioctl on every"
+		     " ring and iterating over memory regions.");
 	igt_subtest_with_dynamic("basic") {
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
-- 
2.35.1
