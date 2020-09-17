Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B8C6EB8E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2020 09:29:37 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Thu, 17 Sep 2020 14:56:20 +0530
Message-Id: <20200917092620.30306-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/debugfs_test:Added igt_require check
 for sysfs and debugfs
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added igt_require check for sysfs and debugfs for subtests
using this path.Test would skip instead of failing.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/debugfs_test.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index f6cf1fa0..74e14f35 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -162,13 +162,26 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 	}
 
-	igt_subtest("sysfs")
-		read_and_discard_sysfs_entries(sysfs, 0);
-	igt_subtest("read_all_entries")
-		read_and_discard_sysfs_entries(debugfs, 0);
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(sysfs >= 0);
+		}
+
+		igt_subtest("sysfs")
+			read_and_discard_sysfs_entries(sysfs, 0);
+	}
 
-	igt_subtest_group
-		kms_tests(fd, debugfs);
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(debugfs >= 0);
+		}
+
+		igt_subtest("read_all_entries")
+			read_and_discard_sysfs_entries(debugfs, 0);
+
+		igt_subtest_group
+			kms_tests(fd, debugfs);
+	}
 
 	igt_fixture {
 		close(sysfs);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
