Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7870C894E7
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 07:56:03 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Wed,  1 Jul 2020 13:25:12 +0530
Message-Id: <20200701075512.32265-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_reg_read: Added
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
To: Arjun.Melkaveri@intel.com, igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description for test and to all 3 subtests.

v2:Added a detailed description for test and modified subtest
description.

Cc: Arjun Melkaveri  <Arjun.Melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_reg_read.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
index 79facc1f..137c4323 100644
--- a/tests/i915/gem_reg_read.c
+++ b/tests/i915/gem_reg_read.c
@@ -32,6 +32,9 @@
 #include <sys/utsname.h>
 #include <time.h>
 
+IGT_TEST_DESCRIPTION("Test the register read ioctl "
+		     "and register used in this test "
+		     "is render ring timestamp.");
 
 static bool is_x86_64;
 static bool has_proper_timestamp;
@@ -156,14 +159,19 @@ igt_main
 		has_proper_timestamp = check_timestamp(fd);
 	}
 
+	igt_describe("Verifies reading bad register result in error or not.");
 	igt_subtest("bad-register")
 		igt_assert_eq(read_register(fd, 0x12345678, &val), -EINVAL);
 
+	igt_describe("Test checks if the timestamp counter is moving and increasing."
+                     "It also uses (reg | 1) flag  to get a proper 36b timestamp. ");
 	igt_subtest("timestamp-moving") {
 		igt_skip_on(timer_query(fd, &val) != 0);
 		test_timestamp_moving(fd);
 	}
 
+	igt_describe("Test checks if the timestamp counter is monotonic"
+		     " by checking the counter value continously for 5sec.");
 	igt_subtest("timestamp-monotonic") {
 		igt_skip_on(timer_query(fd, &val) != 0);
 		test_timestamp_monotonic(fd);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
