Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A089C55
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 06:42:09 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue, 30 Jun 2020 12:11:10 +0530
Message-Id: <20200630064110.4585-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_create: Added test
 description for test case
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description for test and to all 3 subtests.

Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_exec_create.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index ee7d4e5d..5236d477 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -42,6 +42,10 @@
 #include "i915/gem.h"
 #include "igt.h"
 
+IGT_TEST_DESCRIPTION("\n This test runs an uninterrupted loop within the specified timeouts"
+		" with different flags & ncpus combinations and checks if there are any"
+		" missed interrupts reported from the driver.");
+
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
@@ -133,12 +137,16 @@ igt_main
 
 		igt_fork_hang_detector(device);
 	}
-
+	igt_describe("Runs single uninterrupted loop for 2s.");
 	igt_subtest("basic")
 		all(device, 0, 2, 1);
+
+	igt_describe("Runs single uninterrupted loop for 20s.");
 	igt_subtest("forked")
 		all(device, 0, 20, ncpus);
 
+	igt_describe("Runs single uninterrupted loop with"
+			" different flag combination for 20s.");
 	igt_subtest("madvise")
 		all(device, LEAK, 20, 1);
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
