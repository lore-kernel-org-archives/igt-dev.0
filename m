Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8BB8951B
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Nov 2020 12:12:18 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun,  1 Nov 2020 17:44:46 +0530
Message-Id: <20201101121446.57220-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_tiled_blits: Added description of
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_tiled_blits.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
index 36e96785..3ea4dcd7 100644
--- a/tests/i915/gem_tiled_blits.c
+++ b/tests/i915/gem_tiled_blits.c
@@ -189,15 +189,23 @@ igt_main
 		count = (count + ncpus - 1) / ncpus;
 	}
 
+	igt_describe("Validates the content of small number of tiled buffer objects "
+	       "after random tiled blits among each other");
 	igt_subtest("basic")
 		run_test(fd, 2);
 
+	igt_describe("Validates the content of large number of tiled buffer objects "
+	       "(working set larger than the aperture size) after random tiled blits among "
+	       "each other, performed on multiple parallel threads");
 	igt_subtest("normal") {
 		igt_fork(child, ncpus)
 			run_test(fd, count);
 		igt_waitchildren();
 	}
 
+	igt_describe("Validates the content of large number of tiled buffer objects "
+	       "(working set larger than the aperture size) after random tiled blits among "
+	       "each other, performed on multiple parallel threads in an interrupting environment");
 	igt_subtest("interruptible") {
 		igt_fork_signal_helper();
 		igt_fork(child, ncpus)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
