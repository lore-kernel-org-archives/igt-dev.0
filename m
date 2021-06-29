Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802886E88A
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jun 2021 12:32:07 +0000 (UTC)
From: sai.krishna.kuchi@intel.com
Date: Tue, 29 Jun 2021 18:02:03 +0530
Message-Id: <20210629123203.1839-1-sai.krishna.kuchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_caching: Added decriptions for the
 subtests
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
List-ID: <igt-dev@lists.freedesktop.org>

From: "Kuchi, Sai Krishna" <sai.krishna.kuchi@intel.com>

Cc: Melkaveri, Arjun<arjun.melkaveri@intel.com>
Cc: Gandi, Ramadevi<ramadevi.gandi@intel.com>

Signed-off-by: Kuchi, Sai Krishna<sai.krishna.kuchi@intel.com>
---
 tests/i915/gem_caching.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index 4e844952..0ff460ac 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -168,6 +168,7 @@ igt_main
 					       32, 0, I915_TILING_NONE, 0);
 	}
 
+	igt_describe_f("Checking the preads for random size of the buffer");
 	igt_subtest("reads") {
 		igt_require(flags & TEST_READ);
 
@@ -200,6 +201,7 @@ igt_main
 		intel_bb_destroy(ibb);
 	}
 
+	igt_describe_f("Checking the pwrites for random size of the buffer");
 	igt_subtest("writes") {
 		igt_require(flags & TEST_WRITE);
 
@@ -249,6 +251,7 @@ igt_main
 		intel_bb_destroy(ibb);
 	}
 
+	igt_describe_f("Checking the pwrites after preads for random size of the buffer");
 	igt_subtest("read-writes") {
 		igt_require((flags & TEST_BOTH) == TEST_BOTH);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
