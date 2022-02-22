Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E407810E5D0
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 12:52:36 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Tue, 22 Feb 2022 18:15:36 +0530
Message-Id: <20220222124536.19369-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3] tests/debugfs_test: Added test description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

v2: rebase

v3: Updated test descriptions.

Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/debugfs_test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index e6535ccd..deb58f10 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -29,6 +29,8 @@
 #include <sys/types.h>
 #include <dirent.h>
 
+IGT_TEST_DESCRIPTION("Read entries from debugfs and sysfs paths.");
+
 static void read_and_discard_sysfs_entries(int path_fd, int indent)
 {
 	struct dirent *dirent;
@@ -187,11 +189,13 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 	}
 
+	igt_describe("Read all entries from sysfs path.");
 	igt_subtest("sysfs")
 		read_and_discard_sysfs_entries(sysfs, 0);
+	igt_describe("Read all entries from debugfs path.");
 	igt_subtest("read_all_entries")
 		read_and_discard_sysfs_entries(debugfs, 0);
-
+	igt_describe("Read all debugfs entries with display on/off.");
 	igt_subtest_group
 		kms_tests(fd, debugfs);
 
-- 
2.25.1
