Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF53889F31
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 03:43:29 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Tue, 12 Jan 2021 08:47:11 +0530
Message-Id: <20210112031711.3801-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/sysfs_defaults: Added test description
 for test case
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, katarzyna.dec@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/sysfs_defaults.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
index dda27a0a..a564cad2 100644
--- a/tests/i915/sysfs_defaults.c
+++ b/tests/i915/sysfs_defaults.c
@@ -34,6 +34,9 @@
 #include "i915/gem_engine_topology.h"
 #include "igt_sysfs.h"
 
+IGT_TEST_DESCRIPTION("Test checks .default/parameter for every writable parameter "
+		      "and .default should be read-only.");
+
 static bool may_write(int dir, const char *file)
 {
 	struct stat st;
@@ -99,7 +102,8 @@ igt_main
 
 		close(sys);
 	}
-
+	igt_describe("Test checks that every writable parameter have a "
+		     "default value and no default value is writable.");
 	igt_subtest_with_dynamic("readonly")
 		dyn_sysfs_engines(i915, engines, NULL, test_writable);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
