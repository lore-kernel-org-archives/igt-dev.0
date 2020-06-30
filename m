Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DE28997E
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 06:03:30 +0000 (UTC)
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Date: Tue, 30 Jun 2020 06:03:24 +0000
Message-ID: <CA3CE573A55781488FA37084931071AB14F06602@BGSMSX105.gar.corp.intel.com>
References: <20200629125948.8734-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200629125948.8734-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_reg_read: Added
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
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


-----Original Message-----
From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com> 
Sent: Monday, June 29, 2020 6:30 PM
To: Melkaveri, Arjun <arjun.melkaveri@intel.com>; igt-dev@lists.freedesktop.org; Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
Subject: [PATCH] [PATCH i-g-t] i915/gem_reg_read: Added description for test case

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description for test and to all 3 subtests.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_reg_read.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c index 79facc1f..dfc2560e 100644
--- a/tests/i915/gem_reg_read.c
+++ b/tests/i915/gem_reg_read.c
@@ -32,6 +32,7 @@
 #include <sys/utsname.h>
 #include <time.h>
 
+IGT_TEST_DESCRIPTION("Test the basic register read ioctl.");
 
AMK:-  Can you add more information about type of registers this test would check in description.
 
 static bool is_x86_64;
 static bool has_proper_timestamp;
@@ -156,14 +157,19 @@ igt_main
 		has_proper_timestamp = check_timestamp(fd);
 	}
 
+	igt_describe("Verifies reading bad register result in error or not.");
 	igt_subtest("bad-register")
 		igt_assert_eq(read_register(fd, 0x12345678, &val), -EINVAL);
 
+	igt_describe("Checks whether the timestamp register is getting"
+		     " updated when any operation(noop) is being performed.");
 	igt_subtest("timestamp-moving") {
 		igt_skip_on(timer_query(fd, &val) != 0);
 		test_timestamp_moving(fd);
 	}
 
+	igt_describe("Checks whether timestamp is monotonic while performing"
+		     " an operation(noop) in a loop.");
 	igt_subtest("timestamp-monotonic") {
 		igt_skip_on(timer_query(fd, &val) != 0);
 		test_timestamp_monotonic(fd);
--
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
