Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045AC6E588
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2020 14:39:05 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 28 May 2020 19:56:52 +0530
Message-Id: <20200528142652.31504-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_content_protection: CP cleanup
 exit handler
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
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

Add HDCP content protection cleanup igt exit handler,
earlier it was done through igt_fixture which doesn't
trigger hdcp cleanup on igt abortion due to any signal.
This should avoid any HDCP content protection leak.

v2:
-  wrap up exit handler in igt_fixure only when it is
   running under sub-test block. [Petri]

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/kms_content_protection.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3b9cedcb..0f656bcf 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -651,12 +651,30 @@ static void test_content_protection_cleanup(void)
 	}
 }
 
+static void test_content_protection_exit_handler(int sig)
+{
+	/*
+	 * FIXME: igt_can_fail() is sometimes incorrect in exit handlers. Wrap
+	 * cleanup in igt_fixture if igt_core thinks we're not in a subtest.
+	 */
+	if (igt_subtest_name()) {
+		test_content_protection_cleanup();
+		igt_display_fini(&data.display);
+	} else {
+		igt_fixture {
+			test_content_protection_cleanup();
+			igt_display_fini(&data.display);
+		}
+	}
+}
+
 igt_main
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&data.display, data.drm_fd);
+		igt_install_exit_handler(test_content_protection_exit_handler);
 	}
 
 	igt_subtest("legacy") {
@@ -723,9 +741,4 @@ igt_main
 		igt_assert_f(ret, "SRM update failed");
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
-
-	igt_fixture {
-		test_content_protection_cleanup();
-		igt_display_fini(&data.display);
-	}
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
