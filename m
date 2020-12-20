Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A249B6E081
 for <igt-dev@lists.freedesktop.org>; Sun, 20 Dec 2020 10:46:39 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 20 Dec 2020 16:19:01 +0530
Message-Id: <20201220104901.332164-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_pread_after_blit: Add subtests
 description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for all subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_pread_after_blit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
index f5eba0d5..584a02db 100644
--- a/tests/i915/gem_pread_after_blit.c
+++ b/tests/i915/gem_pread_after_blit.c
@@ -229,14 +229,20 @@ igt_main
 	}
 
 	for (t = tests; t->name; t++) {
+		igt_describe_f("Verify the correctness of pread when reading freshly-written bo "
+		       "with %s caching mode", t->name);
 		igt_subtest_f("%s-normal", t->name)
 			do_test(bops, t->cache, src, start, dst, 1, no_hang);
 
+		igt_describe_f("Under interruptible conditions, verify the correctness of pread "
+		       "when reading freshly-written bo with %s caching mode", t->name);
 		igt_fork_signal_helper();
 		igt_subtest_f("%s-interruptible", t->name)
 			do_test(bops, t->cache, src, start, dst, 100, no_hang);
 		igt_stop_signal_helper();
 
+		igt_describe_f("Verify the correctness of pread when reading freshly-written bo "
+		       "with %s caching mode, by introducing engine hang between write and read", t->name);
 		igt_subtest_f("%s-hang", t->name)
 			do_test(bops, t->cache, src, start, dst, 1, bcs_hang);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
