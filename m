Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7BE6E879
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Feb 2021 04:45:41 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Tue,  2 Feb 2021 09:47:30 +0530
Message-Id: <20210202041730.18130-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/debugfs_test: Added test description
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
 tests/debugfs_test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index 46ba0a8b..46f2fa31 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -29,6 +29,8 @@
 #include <sys/types.h>
 #include <dirent.h>
 
+IGT_TEST_DESCRIPTION("Test reads entries from debugfs and sysfs path.");
+
 static void read_and_discard_sysfs_entries(int path_fd, int indent)
 {
 	struct dirent *dirent;
@@ -166,11 +168,14 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 	}
 
+	igt_describe("Test reads all entries from sysfs path.");
 	igt_subtest("sysfs")
 		read_and_discard_sysfs_entries(sysfs, 0);
+	igt_describe("Test reads all entries from debugfs path.");
 	igt_subtest("read_all_entries")
 		read_and_discard_sysfs_entries(debugfs, 0);
 
+	igt_describe("Test reads all debugfs entries with display on/off.");
 	igt_subtest_group
 		kms_tests(fd, debugfs);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
