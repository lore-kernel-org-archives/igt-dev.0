Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65A510E462
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 14:30:21 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Tue, 15 Feb 2022 19:53:04 +0530
Message-Id: <20220215142304.120586-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/debugfs_test: Added test description
 for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, katarzyna.dec@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

v2:rebase

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/debugfs_test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index e6535ccd..0aa312dc 100644
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
@@ -187,11 +189,13 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 	}
 
+	igt_describe("Test reads all entries from sysfs path.");
 	igt_subtest("sysfs")
 		read_and_discard_sysfs_entries(sysfs, 0);
+	igt_describe("Test reads all entries from debugfs path.");
 	igt_subtest("read_all_entries")
 		read_and_discard_sysfs_entries(debugfs, 0);
-
+	igt_describe("Test reads all debugfs entries with display on/off.");
 	igt_subtest_group
 		kms_tests(fd, debugfs);
 
-- 
2.25.1
