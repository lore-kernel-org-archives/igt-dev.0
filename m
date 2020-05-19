Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853AB6E255
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 06:19:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 19 May 2020 11:40:28 +0530
Message-Id: <20200519061028.26699-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: CP cleanup
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
Cc: chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

Add HDCP content protection cleanup igt exit handler,
earlier it was done through igt_fixture which doesn't
trigger hdcp cleanup on igt abortion due to any signal.
This should avoid any HDCP content protection leak.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/kms_content_protection.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3b9cedcb..f3101b8a 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -651,12 +651,21 @@ static void test_content_protection_cleanup(void)
 	}
 }
 
+static void test_content_protection_exit_handler(int sig)
+{
+	igt_fixture {
+		test_content_protection_cleanup();
+		igt_display_fini(&data.display);
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
@@ -723,9 +732,4 @@ igt_main
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
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
