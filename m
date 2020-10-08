Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F4F6EA27
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2020 06:23:06 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu,  8 Oct 2020 11:41:18 +0530
Message-Id: <20201008061118.22868-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/core_auth: Added test description for
 test case
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the available subtests.

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/core_auth.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index 9c240fdb..955876d3 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -195,6 +195,7 @@ igt_main
 	int master;
 
 	/* root (which we run igt as) should always be authenticated */
+	igt_describe("Checks whether drm client is always authenticated or not.");
 	igt_subtest("getclient-simple") {
 		int fd = drm_open_driver(DRIVER_ANY);
 
@@ -203,6 +204,9 @@ igt_main
 		close(fd);
 	}
 
+	 igt_describe("Test tries to open two clients and checks if one of the drm client is"
+		      " authenticated or not also, checks the authentication"
+		      " for the same drm client by dropping the other one.");
 	igt_subtest("getclient-master-drop") {
 		int fd = drm_open_driver(DRIVER_ANY);
 		int fd2 = drm_open_driver(DRIVER_ANY);
@@ -220,11 +224,15 @@ igt_main
 	igt_subtest_group {
 		igt_fixture
 			master = drm_open_driver_master(DRIVER_ANY);
-
+		igt_describe("Test tries to retrieve magic for slave "
+			     "and checks if magic on master is authorised only once.");
 		igt_subtest("basic-auth")
 			test_basic_auth(master);
 
 		/* this must be last, we adjust the rlimit */
+		igt_describe("Tests tries to retrieve magic for maximum possible number of slaves"
+			     " and verifies if all the retrieved magic values are different."
+			     "It also checks if the magic values can be authorised by master.");
 		igt_subtest("many-magics")
 			test_many_magics(master);
 	}
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
